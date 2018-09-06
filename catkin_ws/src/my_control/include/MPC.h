#include <ros/ros.h>
#include <std_msgs/Float64.h>
#include "my_control/car_position.h"
#include <math.h>
#include <vector>
#include <iostream>
#include <Eigen/Dense>
#include <qpOASES.hpp>
using namespace std;
using namespace Eigen;
USING_NAMESPACE_QPOASES;

struct path_type
{
	double x;
	double y;
	double theta;
	double v;
	path_type(double x_init,double y_init,double theta_init,double v_init)
	{
		x=x_init;
		y=y_init;
		theta=theta_init;
		v=v_init;
	}
};
class MPC
{
	public:
        	MPC(double ts_set,double N_sim_set,double Nu_set,double Nx_set,double Nc_set);
        	/*{
            		Ts=1.0;
            		vd1=1.0;
            		vd2=0.0;
            		l=1.0;
            		N_sim=20;
            		Nu=2;
            		Nx=3;
            		pub = n.advertise<my_control::car_position>("for_sim",100);
            		//构造planning出来的参考
            		for(int i=0;i<99;i++)
            		{
                		path_type path_test(i*Ts,2.0,0.0,1.0);
                		posi_ref.push_back(path_test);
            		}
	    		path_type path_test(100*Ts,2.0,0.0,0.0);
			posi_ref.push_back(path_test);
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

	    		solver(Nu,1);
	    		nWSR = 1000;
	
        	}*/
		~MPC();
        	//void publishposition();
       	 	/*{
            		msg.x=msg.x+Ts*cos(msg.theta)*msg.v;
            		msg.y=msg.y+Ts*sin(msg.theta)*msg.v;
            		msg.theta=msg.theta+Ts*tan(a_delta[1]])*msg.v/l;
			msg.v=msg.v+(a_delta[0]+a_r)*Ts;
            		n.publish(msg);
        	}*/
        	void run();
        	void timer_callback(const ros::TimerEvent& event);
		int get_count();
		void get_mpc_optimized(double& a_delta_real_a, double& a_delta_real_delta);
		void set_x_piao(double x_real,double y_real, double theta_real, double v_real);
	private:
        	double Ts;//sampling period

        	double a_r;//accelaration for reference

        	double delta_r;//turning angle for reference

		double v_r;

		double fai_r;

		vector<double> v_r_;

        	double l;//车轮距

        	unsigned int N_sim;//perdicted number

        	unsigned int Nu;//number of control variables

        	unsigned int Nx;//number of state variables

		unsigned int Nc;//number of optimzed control period
		

        	vector<path_type> posi_ref;//path of planning

		//Matrix
        	MatrixXd Q;
        	MatrixXd R;
        	MatrixXd A_cell;
        	MatrixXd B_cell;
		MatrixXd tmp;
		MatrixXd H;
		VectorXd f;
		real_t* H_real;
		real_t* g;
		real_t* lb;
		real_t* ub;

		unsigned int num_ref;
		int count;

		real_t* a_delta;
		
		int nWSR;
		real_t* A_test;

		Vector4d x_piao;
};
