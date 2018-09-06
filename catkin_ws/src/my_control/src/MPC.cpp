#include "MPC.h"
#include "qpOASES.hpp"

extern SQProblem solver;
extern bool update;
MPC::MPC(double ts_set,double N_sim_set,double Nu_set,double Nx_set,double Nc_set)
{
	cout<<"MPC initialing"<<endl;
	delta_r=0.0;
	a_r=0.0;
	fai_r=0.0;
	v_r=1.0;
	Ts=ts_set;
	l=1.0;
	N_sim=N_sim_set;
	Nu=Nu_set;
	Nx=Nx_set;
	count=0;
	Nc=Nc_set;
        //构造planning出来的参考
	path_type path_test(0.0,0.0,0.0,0.0);
        for(int i=0;i<200;i++)
	{
		path_test.x=i*Ts;
		path_test.y=2.0;
		path_test.theta=0.0;

		path_test.v=1.0;
                posi_ref.push_back(path_test);
        }
	x_piao(0)=posi_ref[0].x;
        x_piao(1)=posi_ref[0].y;
	x_piao(2)=posi_ref[0].theta;
	x_piao(3)=posi_ref[0].v;
	//构造矩阵Q，R,A,B
        Q=MatrixXd::Identity(Nx*N_sim,Nx*N_sim);
        for(int k=0;k<Q.rows();k++)
        {
               	if(k%Nx == Nx-1)
                    	Q(k,k)=0.5;
        }
        R=MatrixXd::Identity(Nu*Nc,Nu*Nc);
	A_cell=MatrixXd::Zero(Nx*N_sim,Nx);
	B_cell=MatrixXd::Zero(Nx*N_sim,Nu*Nc);
	tmp=MatrixXd::Zero(Nx,Nu);
	tmp(3,0)=Ts;

	nWSR = 1000;
	
	H_real = new double[Nc*Nu*Nc*Nu];

        g = new double[Nc*Nu];

	lb = new double[Nu*Nc];
	ub = new double[Nu*Nc];
	lb[0] = -1.0;
	lb[1] = -1.0;
	ub[0] = 1.0;
	ub[1] = 1.0;
	a_delta = new double[Nu*Nc];
}

MPC::~MPC()
{
	cout<<"-------------------------deleted----------------------"<<endl;
	delete[] H_real;
	delete[] g;
	delete[] lb;
	delete[] ub;
	//delete[] a_delta;
}

void MPC::run()
{
	//ros::Timer timer = n.createTimer(ros::Duration(Ts), &timer_callback, );
	//while(ros::ok())
	//{	
	//	if(count>=100)
	//		break;
	//}
}

void MPC::timer_callback(const ros::TimerEvent& event)
{
        cout<<"mpc is being calculated"<<endl;
	cout<<"nwsr is"<<nWSR<<endl;
	nWSR=1000;
	v_r=posi_ref[count].v;
	fai_r=posi_ref[count].theta;
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


        cout<<"B_cell"<<B_cell.rows()<<B_cell.cols()<<"is esbalished"<<endl;
        cout<<"Q is"<<Q.rows()<<Q.cols()<<endl;
	cout<<"R is"<<R.rows()<<R.cols()<<endl;
        H = 2*(B_cell.transpose()*Q*B_cell+R);

        cout<<"Matrix H is esbalished"<<endl;

        f = 2*B_cell.transpose()*Q*A_cell*x_piao;
        cout<<"vector f is esbalished"<<endl;
	cout<<f[0]<<" "<<f[1]<<endl;
	cout<<"x_piao is"<<endl;
	cout<<x_piao(0)<<" "<<x_piao(1)<<" "<<x_piao(2)<<" "<<x_piao(3)<<endl;
	
        Map<MatrixXd>(H_real,H.rows(),H.cols())=H;
        Map<VectorXd>(g,f.rows(),f.cols())=f;
	cout<<"H,g for QP solver is esbaliashed"<<endl;
	cout<<"QP solver is being calculated"<<endl;

	cout<<"H_real is"<<endl;
	cout<< H_real[0]<<" "<<H_real[1]<<" "<<H_real[2]<<" "<<H_real[3]<<endl;
	cout<<"g is"<<endl;
	cout<< g[0]<<" "<<g[1]<<endl;
	cout<<"lb is"<<endl;
	cout<<lb[0]<<" "<<lb[1]<<endl;
	cout<<"ub is"<<endl;
	cout<<ub[0]<<" "<<ub[1]<<endl;
	cout<<"nwsr is"<<nWSR<<endl;
	//int result;
	if(count==0)
        	solver.init( H_real,g,A_test,lb,ub,0,0,nWSR,0 );
	else
		solver.hotstart(H_real,g,A_test,lb,ub,0,0,nWSR,0);
		//solver.init( H_real,g,A_test,lb,ub,0,0, nWSR,0 );
  	//cout<<"return value is"<<result<<endl;
	cout<<"QP solver is calculated"<<endl;
	cout<<"nwsr is"<<nWSR<<endl;
        solver.getPrimalSolution( a_delta );
	cout<<"a_delta optimized is"<<a_delta[0]<<" "<<a_delta[1]<<endl;
	cout<<"running car model"<<endl;
	cout<<"nwsr is"<<nWSR<<endl;
        
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

void MPC::set_x_piao(double x_real,double y_real, double theta_real, double v_real)
{
	x_piao(0) = x_real - posi_ref[count].x;
        x_piao(1) = y_real - posi_ref[count].y;
        x_piao(2) = theta_real - posi_ref[count].theta;
        x_piao(3) = v_real - posi_ref[count].v;

}
