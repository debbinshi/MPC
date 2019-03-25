#include "MPC.h"
#include <unsupported/Eigen/MatrixFunctions>

MPC::MPC(double dt, int np_set, int nc_set)
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
        if( i % pn_ == 2)
            Q_cell_(i, i) = 0.1;
    }

    R_cell_ = MatrixXd::Identity(2 * cn_, 2 * cn_); 

    H_real = new double[2 * cn_ * 2 * cn_];
    g = new double[2 * cn_];
    A_test = new double[2 * cn_ * 2 * cn_];
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
    A_delta = new double[cn_ * 2 * cn_ *2];
    update_ = false;
    solver_ = SQProblem(2 * cn_, 2 * cn_);

    error_sum_ = 0.0;
    delta_old_ = 0.0;
    delta_change_ = 0;
    if(!out_.is_open())
    {
        out_.open("2.txt");
    }
    out_ << "x_error is, "
         << "y_error is, "
         << "theta_error is, "
         << "v_error is, "
         << "a_optimized is, "
         << "delta       is, "
         << endl;
}

MPC::~MPC(){}

void MPC::update(double cur_px, double cur_py, double cur_theta, double cur_v)
{
    double min_dis = 10000;
    int deta_cnt = 10;
    int begin_cnt = curr_cnt_ + 1;
    if((pow((traj_ref_[curr_cnt_].x - cur_px), 2) + pow((traj_ref_[curr_cnt_].y - cur_py), 2)) > 0.1)
        begin_cnt = curr_cnt_;
    int end_cnt = ((curr_cnt_ + deta_cnt) < traj_ref_.size())?(curr_cnt_ + deta_cnt):traj_ref_.size();
    for(int i = begin_cnt; i < end_cnt; i++)
    {
	    double temp = pow((cur_px - traj_ref_[i].x),2) + pow((cur_py - traj_ref_[i].y),2);
	    if(temp < min_dis)
	    {
	        min_dis = temp;
	        curr_cnt_ = i; 
	    }
    }
    ROS_INFO("curr_cnt_ is %d",curr_cnt_);
    double ref_px = traj_ref_[curr_cnt_].x;
    double ref_py = traj_ref_[curr_cnt_].y;
    double ref_theta = traj_ref_[curr_cnt_].theta;
    double ref_v = traj_ref_[curr_cnt_].v;
    double ref_delta = 0.0;
    double ref_a = 0.0;
    cout << "the car reference is "<<endl;
    cout << ref_px << " "<< ref_py <<" "<<ref_theta<<" "<<ref_v<<" "<<ref_delta<<" ";

    MatrixXd cur_delta(4, 1);
    cur_delta(0) = cur_px - ref_px;
    cur_delta(1) = cur_py - ref_py;
    cur_delta(2) = cur_theta - ref_theta;
    cur_delta(3) = cur_v - ref_v;

    while(cur_delta(2) >= M_PI)
    {
        cur_delta(2) -= 2 * M_PI;
    }
    while(cur_delta(2) <= -M_PI)
    {
        cur_delta(2) += 2 * M_PI;
    }
 
    MatrixXd A = MatrixXd::Zero(4, 4);
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

    MatrixXd B = MatrixXd::Zero(4, 2);
    B(2, 1) = ref_v * dt_ / l_ / pow(cos(ref_delta), 2);
    B(3, 0) = dt_;

    MatrixXd C = MatrixXd::Zero(3, 4);
    C(0, 0) = 1.0;
    C(1, 1) = 1.0;
    C(2, 2) = 1.0;

    MatrixXd A_cell = MatrixXd::Zero(3 * pn_, 4);
    for(int i = 0; i < pn_; i++) {
        A_cell.block<3, 4>(i * 3, 0) = C * Apow(i + 1);
    }

    MatrixXd B_cell = MatrixXd::Zero(3 * pn_, 2 * cn_);
    for(int i = 0; i < pn_; i++) {
        for(int j = 0; j < cn_; j++) {
            if(i < cn_)
            {
                if(j < i)
                    B_cell.block<3, 2>(i * 3, j * 2) = A_cell.block<3, 4>((i - j - 1) * 3, 0) * B;
                else if(j == i)
                    B_cell.block<3, 2>(i * 3, j * 2) = C * B;
            }
            else
            {
                    if(j == cn_ - 1)
                    {
                        for(int k = 0; k < i - j; k++)
                        {
                            B_cell.block<3, 2>(i * 3, j * 2) += A_cell.block<3, 4>(k * 3, 0) * B;
                        }
                            B_cell.block<3, 2>(i * 3, j * 2) += C * B;
                    }
                    else
                    {
                        B_cell.block<3, 2>(i * 3, j * 2) = A_cell.block<3, 4>((i - j - 1) * 3, 0) * B;
                    }
            }
        }
    }
     
    MatrixXd H = 2 * (B_cell.transpose() * Q_cell_ * B_cell + R_cell_);
    MatrixXd f = 2 * cur_delta.transpose() * A_cell.transpose() * Q_cell_ * B_cell;
    
    Map<MatrixXd>(H_real, H.rows(), H.cols()) = H;
    Map<MatrixXd>(g, f.rows(), f.cols()) = f;

    double deta_a_max = 0.5;
    double deta_delta_max = 0.2;
    int MAX_QP_CNT = 1000;
    if(total_cnt_ == 0)
        solver_.init(H_real, g, A_test, lb, ub, 0, 0, MAX_QP_CNT, 0);
    else
    {
 
        for(int i= 0; i < cn_ * 2; i++)
        {   
            if(i % 2 == 0)
            {
                lb[i] = ((A_delta[0] - deta_a_max) > -5.0)? (A_delta[0] - deta_a_max):-5.0 ;
                ub[i] = ((A_delta[0] + deta_a_max) < 5.0)? (A_delta[0] + deta_a_max):5.0 ;
            }
            else
            {
                lb[i] = ((A_delta[1] - deta_delta_max) > -1.0)? (A_delta[1] - deta_delta_max):-1.0;
                ub[i] = ((A_delta[1] + deta_delta_max) < 1.0)? (A_delta[1] + deta_delta_max):1.0;
            }
        }
        solver_.hotstart(H_real, g, A_test, lb, ub, 0, 0, MAX_QP_CNT, 0);
    }
    solver_.getPrimalSolution(A_delta);
    A_delta[0] += ref_a;
    A_delta[1] += ref_delta;
    total_cnt_++;
    update_ = true;

    if(abs(A_delta[1] - delta_old_) > 0.1)
    {
	    delta_change_ ++;	
    }
    delta_old_ = A_delta[1];
    
    for(int i = 0; i < 4; i++)
    {
        out_ << cur_delta(i) <<", ";
    }
    out_ << A_delta[0] <<", ";
    out_ << A_delta[1] <<", ";
        
	error_sum_ += cur_delta(0) * cur_delta(0) + cur_delta(1) * cur_delta(1);
    out_ << endl;
    out_ << error_sum_ <<endl;
}


void MPC::set_traj_ref(vector<traj_type>& traj_ref)
{
    traj_ref_ = traj_ref;
}

int MPC::get_count()
{
    return curr_cnt_;
}

void MPC::get_MPC_result(double& a, double& delta, double& vel)
{
    a = A_delta[0];
    delta = A_delta[1];
    vel = traj_ref_[curr_cnt_].v; 
}

bool MPC::get_update_state()
{
    return update_;
}

void MPC::set_update_state(bool update)
{
    update_ = update;
}

void MPC::set_car_state(double x_real, double y_real, double theta_real, double v_real)
{
    x_real_ = x_real;
    y_real_ = y_real;
    theta_real_ = theta_real;
    v_real_ = v_real;   
}
void MPC::timer_callback(const ros::TimerEvent& event)
{ 
    update(x_real_, y_real_, theta_real_, v_real_);
}
