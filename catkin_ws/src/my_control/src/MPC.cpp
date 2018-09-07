#include "MPC.h"
#include "qpOASES.hpp"
extern SQProblem solver;
extern bool update;
MPC::MPC(double ts_set, int N_sim_set,int Nu_set, int Nx_set, int Nc_set, double v_r_, double fai_r_, double a_r_, double delta_r_)
{
	cout<<"MPC initialing"<<endl;
	delta_r = delta_r_;
	a_r = a_r_;
	fai_r = fai_r_;
	v_r = v_r_;
	Ts = ts_set;
	N_sim = N_sim_set;
	Nu = Nu_set;
	Nx = Nx_set;
	Nc = Nc_set;
	l = 1.0;
	count = 0;
        
	//构造planning path
	path_type path_ref_point(0.0,0.0,0.0,0.0);
        for(int i=0;i<1000;i++)
	{
		path_ref_point.x = i*Ts/10.0;
		path_ref_point.y = 10.0;
		path_ref_point.theta = fai_r;
		path_ref_point.v = v_r;
                path_ref.push_back(path_ref_point);
        }

	//初始位置0,0,pi/2,0
	set_car_pose(0.0, 0.0, pi/2.0, 0.0);
	
	//构造矩阵Q，R,A,B
        Q=MatrixXd::Identity(Nx*N_sim,Nx*N_sim);
        for(int k=0;k<Q.rows();k++)
        {
               	if((k%Nx == Nx-1)||(k%Nx == Nx-2))
                    	Q(k,k)=0.5;
        }
        R=MatrixXd::Identity(Nu*Nc,Nu*Nc);
	A_cell=MatrixXd::Zero(Nx*N_sim,Nx);
	B_cell=MatrixXd::Zero(Nx*N_sim,Nu*Nc);
	tmp=MatrixXd::Zero(Nx,Nu);
	tmp(3,0)=Ts;

	//real_t for qpOASES
	nWSR = 1000;	
	H_real = new double[Nc*Nu*Nc*Nu];
        g = new double[Nc*Nu];
	lb = new double[Nu*Nc];
	ub = new double[Nu*Nc];
	for(int i=0;i<Nu*Nc;i++)
	{
		if(i%2==0)
		{
			lb[i] = -1.0;
			ub[i] = 1.0;
		}
		else
		{
			lb[i] = -1.0;
			ub[i] = 1.0;
		}
			
	}
	a_delta = new double[Nu*Nc];
}

MPC::~MPC()
{
	cout<<"-------------------------deleted----------------------"<<endl;
	delete[] H_real;
	delete[] g;
	delete[] lb;
	delete[] ub;
	delete[] a_delta;
}

void MPC::timer_callback(const ros::TimerEvent& event)
{
        cout<<"mpc is being calculated"<<endl;
	
	nWSR=1000;
	v_r=path_ref[count].v;
	fai_r=path_ref[count].theta;
	
	tmp(2,1)=v_r*Ts/l/pow(cos(delta_r),2);
	
	for(int i=0;i<N_sim;i++)
	{
		A_cell(i*Nx,0)=1;
            	A_cell(i*Nx+1,1)=1;
            	A_cell(i*Nx+2,2)=1;
           	A_cell(i*Nx+3,3)=1;
            	A_cell(i*Nx,2)=-(i+1)*v_r*Ts*sin(fai_r);
            	A_cell(i*Nx,3)=(i+1)*Ts*cos(fai_r)-v_r*Ts*Ts*tan(delta_r)*sin(fai_r)*(i+1)*i/l/2;
            	A_cell(i*Nx+1,2)=(i+1)*v_r*Ts*cos(fai_r);
            	A_cell(i*Nx+1,3)=(i+1)*Ts*sin(fai_r)+v_r*Ts*Ts*cos(fai_r)*tan(delta_r)*(i+1)*i/l/2;
            	A_cell(i*Nx+2,3)=(i+1)*Ts*tan(delta_r)/l;
    	}
	cout<<"A_cell is esbalished~"<<endl;

        for(int i=0;i<N_sim;i++)
        {
           	for(int j=0;j<Nc;j++)
            	{
                	if(j<i)
                	{
                        	B_cell.block(i*Nx,j*Nu,Nx,Nu) = A_cell.block((i-j)*Nx,0,Nx,Nx)*tmp;
                	}
                	else if(j==i)
                	{
                        	B_cell.block(i*Nx,j*Nu,Nx,Nu) = tmp;
                	}
            	}
        }


        H = 2*(B_cell.transpose()*Q*B_cell+R);

        f = 2*B_cell.transpose()*Q*A_cell*x_piao;
	
        Map<MatrixXd>(H_real,H.rows(),H.cols())=H;
        
	Map<VectorXd>(g,f.rows(),f.cols())=f;

	if(count==0)
        	solver.init( H_real,g,A_test,lb,ub,0,0,nWSR,0 );
	else
		solver.hotstart(H_real,g,A_test,lb,ub,0,0,nWSR,0);
	
	cout<<"QP solver is calculated"<<endl;

        solver.getPrimalSolution( a_delta );

	cout<<"a_delta optimized is"<<a_delta[0]<<" "<<a_delta[1]<<endl;

	cout<<"running car model"<<endl;
        
	count++;
	
	update = true;
	
	cout<<"finished one MPC"<<endl;  
}
int MPC::get_count()
{
	cout<<"count is"<<count<<endl;
	return count;
}

void MPC::get_mpc_optimized(double& a_delta_real_a, double& a_delta_real_delta)
{
	a_delta_real_a = a_delta[0] + a_r;
	a_delta_real_delta = a_delta[1] + delta_r; 
	cout<<"a_delta_real is"<<a_delta_real_a<<" "<<a_delta_real_delta<<endl;
}

void MPC::set_car_pose(double x_real,double y_real, double theta_real, double v_real)
{
	x_piao(0) = x_real - path_ref[count].x;
        x_piao(1) = y_real - path_ref[count].y;
        x_piao(2) = theta_real - path_ref[count].theta;
        x_piao(3) = v_real - path_ref[count].v;
	cout<<"car_pose error is"<<endl;
	cout<<x_piao(0)<<" "<<x_piao(1)<<" "<<x_piao(2)<<" "<<x_piao(3)<<endl; 
}


void MPC::set_limit_a_delta(double a_min, double a_max, double delta_min, double delta_max)
{
	lb[0] = a_min;
	lb[1] = delta_min;
	ub[0] = a_max;
	ub[1] = delta_max;	
}

void MPC::set_car_parameter(double l)
{
	this->l = l;	
}

void MPC::set_path_ref(vector<path_type>& path_ref)
{
	this->path_ref = path_ref; 
}
