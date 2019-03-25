#include "mpc_improve.h"
#include <unsupported/Eigen/MatrixFunctions>

MPC_improve::MPC_improve(double dt, int np_set, int nc_set)
{
    dt_ = dt;
    l_ = 2.8498f;
    pn_ = np_set;
    cn_ = nc_set;
    total_cnt_ = 0;
    curr_cnt_ = 0;
    x_real_ = 0.0;
    y_real_ = 0.0;
    theta_real_ = 0.0;
    v_real_ = 0.0;
    
    Q_cell_ = MatrixXd::Identity(3 * pn_, 3 * pn_);
    for(int i = 0; i < 3 * pn_; i++) {
        if( i % 3 == 2)
            Q_cell_(i, i) = 0.1;
    }


    R_cell_ = MatrixXd::Identity(2 * cn_, 2 * cn_); 

    H_real = new double[2 * cn_ * 2 * cn_];
    g = new double[2 * cn_];
    A_test = new double[2 * cn_ * 2 * cn_];
    
    Alb = new double[cn_ * 2];
    Aub = new double[cn_ * 2];
    lb = new double[cn_ * 2];
    ub = new double[cn_ * 2];
    for(int i= 0; i < cn_ * 2; i++)
    {
        if(i % 2 == 0)
        {
            lb[i] = -5.0;
            ub[i] = 5.0;
        }
        else
        {
            lb[i] = -1.0;
            ub[i] = 1.0;
        }
    }
    A_delta = new double[cn_ * 2];
    update_ = false;
    solver_ = SQProblem(2 * cn_, 2 * cn_);

    error_sum_ = 0.0;
    delta_old_ = 0.0;
    delta_change_ = 0;
    while(!out_.is_open())
    {
        out_.open("record_mpc.txt");
    }
    out_ << "x_ref is "
         << "y_ref is "
         << "theta_ref is "
         << "x_real is "
         << "y_real is "
         << "theta_real is "
         << "a_optimized is, "
         << "delta       is, "
         << endl;
}

MPC_improve::~MPC_improve(){}

void MPC_improve::update()
{
#if 0
    double min_dis = 10000;
    int deta_cnt = 10;
    int begin_cnt = curr_cnt_ + 1;
    if((pow((traj_ref_.path_point_array[curr_cnt_].x - x_real_), 2) + pow((traj_ref_.path_point_array[curr_cnt_].y - y_real_), 2)) > 0.1)
        begin_cnt = curr_cnt_;
    int end_cnt = ((curr_cnt_ + deta_cnt) < traj_ref_.path_point_array.size())?(curr_cnt_ + deta_cnt):traj_ref_.path_point_array.size();
    for(int i = begin_cnt; i < end_cnt; i++)
    {
	    double temp = pow((x_real_ - traj_ref_.path_point_array[i].x),2) + pow((y_real_ - traj_ref_.path_point_array[i].y),2);
	    if(temp < min_dis)
	    {
	        min_dis = temp;
	        curr_cnt_ = i; 
	    }
    }
#endif

    int pt_cnt = traj_ref_.path_point_array.size() - 1;

    geometry_msgs::Pose2D pos_cur;
    pos_cur.x = x_real_;
    pos_cur.y = y_real_;
    pos_cur.theta = theta_real_;

    theta_real_ += M_PI_2;

    curr_cnt_ = get_nearest_index(pos_cur, traj_ref_.path_point_array, 0, pt_cnt);

    curr_cnt_ += 10;

    ROS_INFO("curr_cnt_ is %d",curr_cnt_);
    double ref_px = traj_ref_.path_point_array[curr_cnt_].x;
    double ref_py = traj_ref_.path_point_array[curr_cnt_].y;
    double ref_theta = traj_ref_.path_point_array[curr_cnt_].theta + M_PI_2;
    double ref_v = traj_ref_.vel_array[curr_cnt_];
    double ref_delta = 0.0;
    double ref_a = 0.0;

    cout << "the car reference is "<<endl;
    cout << ref_px << " "<< ref_py <<" "<<ref_theta<<" "<<ref_v<<" "<<ref_delta<<endl;
    cout << "the real car is in" << endl;
    cout << x_real_ << " " << y_real_ << " " << theta_real_ <<" "<< v_real_ << " " << endl;

    MatrixXd cur_delta(6, 1);
    cur_delta(0) = x_real_ - ref_px;
    cur_delta(1) = y_real_ - ref_py;
    cur_delta(2) = theta_real_ - ref_theta;
    cur_delta(3) = v_real_ - ref_v;
    cur_delta(4) = A_delta[0] - ref_a;
    cur_delta(5) = A_delta[1] - ref_delta;

    while(cur_delta(2) >= M_PI)
    {
        cur_delta(2) -= 2 * M_PI;
    }
    while(cur_delta(2) <= -M_PI)
    {
        cur_delta(2) += 2 * M_PI;
    }
 
    MatrixXd A = MatrixXd::Zero(6, 6);
    A(0, 0) = 1;
    A(0, 2) = -ref_v * dt_ * sin(ref_theta);
    A(0, 3) = dt_ * cos(ref_theta);
    A(1, 1) = 1;
    A(1, 2) = ref_v * dt_ * cos(ref_theta); 
    A(1, 3) = dt_ * sin(ref_theta);
    A(2, 2) = 1;
    A(2, 3) = dt_ * tan(ref_delta) / l_;
    A(3, 3) = 1;

    MatrixPower<MatrixXd> Apow(A);

    MatrixXd B = MatrixXd::Zero(6, 2);
    B(2, 1) = ref_v * dt_ / l_ / pow(cos(ref_delta), 2);
    B(3, 0) = dt_;
    B(4, 0) = 1.0;
    B(5, 1) = 1.0;
    A.block<6, 2>(0, 4) = B;

    MatrixXd C = MatrixXd::Zero(3, 6);
    C(0, 0) = 1.0;
    C(1, 1) = 1.0;
    C(2, 2) = 1.0;

    MatrixXd A_cell = MatrixXd::Zero(3 * pn_, 6);
    for(int i = 0; i < pn_; i++) {
        A_cell.block<3, 6>(i * 3, 0) = C * Apow(i + 1);
    }

    MatrixXd B_cell = MatrixXd::Zero(3 * pn_, 2 * cn_);
    for(int i = 0; i < pn_; i++) {
        for(int j = 0; j < cn_; j++) {
            if(j < i)
                B_cell.block<3, 2>(i * 3, j * 2) = A_cell.block<3, 6>((i - j - 1) * 3, 0) * B;
            else if(j == i)
                B_cell.block<3, 2>(i * 3, j * 2) = C * B;
        }
    }

    MatrixXd Yref = MatrixXd::Zero(3 * pn_, 1);
    for(int i = 0; i < pn_; i++){
        if((curr_cnt_ + i + 1) < pt_cnt){
            Yref(i * 3) = traj_ref_.path_point_array[curr_cnt_ + i + 1].x - ref_px;
            Yref(i * 3 + 1) = traj_ref_.path_point_array[curr_cnt_ + i + 1].y - ref_py;
            Yref(i * 3 + 2) = traj_ref_.path_point_array[curr_cnt_ + i + 1].theta + M_PI_2 - ref_theta;
        }
        else{
            ROS_WARN("ENDING!!!!");
            Yref(i * 3) = traj_ref_.path_point_array[pt_cnt].x - ref_px;
            Yref(i * 3 + 1) = traj_ref_.path_point_array[pt_cnt].y - ref_py;
            Yref(i * 3 + 2) = traj_ref_.path_point_array[pt_cnt].theta + M_PI_2 - ref_theta;
        }
    }

    MatrixXd E = A_cell * cur_delta - Yref;
    for(int i = 0; i < pn_; i ++){
        while(E(i * 3 + 2) >= M_PI)
        {
            E(i * 3 + 2) -= 2 * M_PI;
        }
        while(E(i * 3 + 2) <= -M_PI)
        {
            E(i * 3 + 2) += 2 * M_PI;
        }
    }

    MatrixXd H = 2 * (B_cell.transpose() * Q_cell_ * B_cell) + R_cell_;
    MatrixXd f = 2 * E.transpose() * Q_cell_ * B_cell;
    
    Map<MatrixXd>(H_real, H.rows(), H.cols()) = H;
    Map<MatrixXd>(g, f.rows(), f.cols()) = f;

    double deta_a_max = 0.5;
    double deta_delta_max = 0.02;
    double a_min = -5.0;
    double a_max = 5.0;
    double delta_min = -0.5;
    double delta_max = 0.5;

    int MAX_QP_CNT = 1000;

#if 0
    cout << "H is" << endl;
    cout << H << endl;
    cout << endl;
    cout << "f is" << endl;
    cout << f << endl;
#endif
    
    for(int i= 0; i < cn_ * 2; i++)
    {   
        if(i % 2 == 0)
        {
            lb[i] = -deta_a_max;
            ub[i] = deta_a_max;
        }
        else
        {
            lb[i] = -deta_delta_max;
            ub[i] = deta_delta_max;
        }
    }
    
    for(int i = 0; i < 2 * cn_; i++){
        if(i % 2 == 0){
            Alb[i] = a_min - A_delta[0];
            Aub[i] = a_max - A_delta[0];
        }
        else{
            Alb[i] = delta_min - A_delta[1];
            Aub[i] = delta_max - A_delta[1];
        }
    }
     
    MatrixXd A_test_matrix = MatrixXd::Zero(2 * cn_, 2 * cn_);
    for(int i = 0; i < cn_; i ++){
        for(int j = 0; j < cn_; j ++){
            if(i >= j)
                A_test_matrix.block<2, 2>(2 * i, 2 * j) = MatrixXd::Identity(2, 2);
        }
    }
//    Map<MatrixXd, RowMajor>(A_test, A_test_matrix.rows(), A_test_matrix.cols()) = A_test_matrix;
    for(int i = 0; i < A_test_matrix.rows(); i ++){
        for(int j = 0; j < A_test_matrix.cols(); j ++){
            A_test[i * A_test_matrix.rows() + j] = A_test_matrix(i, j);
        }
    }

    if(total_cnt_ == 0)
        solver_.init(H_real, g, A_test, lb, ub, Alb, Aub, MAX_QP_CNT, 0);
    else
    {
       solver_.hotstart(H_real, g, A_test, lb, ub, Alb, Aub, MAX_QP_CNT, 0);
    }
    solver_.getPrimalSolution(A_delta);
#if 0
    cout << "Alb, Aub = " << endl;
    for(int i = 0; i < 2 * cn_; i ++){
        cout << Alb[i] << " " << Aub[i] << endl;
    }
#endif
    cout << "deta_output is"<<endl;
    for(int i = 0; i < cn_; i ++){
        cout << A_delta[2 * i] << " " << A_delta[2 * i + 1] << endl;
    }
    A_delta[0] += ref_a + cur_delta(4);
    A_delta[1] += ref_delta + cur_delta(5);
    if(A_delta[0] > a_max)
        A_delta[0] = a_max;
    if(A_delta[0] < a_min)
        A_delta[0] = a_min;

    if(A_delta[1] > delta_max)
        A_delta[1] = delta_max;
    if(A_delta[1] < delta_min)
        A_delta[1] = delta_min;


    total_cnt_++;
    update_ = true;

#if 0
    MatrixXd detaU = MatrixXd::Zero(2 * cn_, 1);
    for(int i = 0; i < 2 * cn_; i++){
            detaU(i) = A_delta[i];
    }
    cout << "predict is" << endl;
    MatrixXd temp = A_cell * cur_delta + B_cell * detaU; 
    for(int i = 0 ; i < Yref.rows() / 3; i++){
        cout << temp(i * 3) << temp(i * 3 + 1) << temp(i * 3 + 2) << endl;
    }

    cout << "error is" << endl;
    MatrixXd temp1 = A_cell * cur_delta + B_cell * detaU - Yref; 
    for(int i = 0; i < Yref.rows() / 3; i++){
        cout << temp1(i * 3) << " "<< temp1(i * 3 + 1) << temp1(i * 3 + 2) << endl;
    }

    cout << "Yref is" << endl;
    for(int i = 0; i < Yref.rows() / 3; i++){
        cout << Yref(i * 3) << " " << Yref(i * 3 + 1) << " " << Yref( i * 3 + 2) << endl;
    }

    cout << "sum error is" << endl;
    MatrixXd sum_error = temp1.transpose() * Q_cell_;
    cout << sum_error << endl;
#endif

    if(abs(A_delta[1] - delta_old_) > 0.1)
    {
	    delta_change_ ++;	
    }
    delta_old_ = A_delta[1];
    
    out_ << ref_px <<", ";
    out_ << ref_py <<", ";
    out_ << ref_theta <<", ";

    out_ << x_real_ <<", ";
    out_ << y_real_ <<", ";
    out_ << theta_real_ <<", ";
    
    out_ << A_delta[0] <<", ";
    out_ << A_delta[1] <<", ";
    cout << "MPC result is" << A_delta[0]  << " " << A_delta[1] << endl;    
	error_sum_ += cur_delta(0) * cur_delta(0) + cur_delta(1) * cur_delta(1);
    out_ << endl;
    out_ << error_sum_ <<endl;
}


void MPC_improve::set_traj_ref(mvp_msgs::trajectory traj_ref)
{
    traj_ref_ = traj_ref;
}

int MPC_improve::get_count()
{
    return curr_cnt_;
}

void MPC_improve::get_MPC_result(double& a, double& delta, double& vel)
{
    a = A_delta[0];
    delta = A_delta[1];
    vel = traj_ref_.vel_array[curr_cnt_]; 
}

bool MPC_improve::get_update_state()
{
    return update_;
}

void MPC_improve::set_update_state(bool update)
{
    update_ = update;
}

void MPC_improve::set_car_state(double x_real, double y_real, double theta_real, double v_real)
{
    x_real_ = x_real;
    y_real_ = y_real;
    theta_real_ = theta_real;
    v_real_ = v_real;   
}
