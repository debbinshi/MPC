#include <ros/ros.h>
#include <std_msgs/Float64.h>
#include <math.h>
#include <vector>
#include <iostream>
#include <Eigen/Dense>
#include <qpOASES.hpp>
#define pi 3.1415926
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
        	MPC(double ts_set, int N_sim_set,int Nu_set, int Nx_set, int Nc_set, double v_r_, double fai_r_, double a_r_, double delta_r_);

		~MPC();
		
		//void set_path_ref();        	
		void timer_callback(const ros::TimerEvent& event);
		
		int get_count();
		
		void get_mpc_optimized(double& a_delta_real_a, double& a_delta_real_delta);
		
		void set_car_pose(double x_real,double y_real, double theta_real, double v_real);

		void set_limit_a_delta(double a_min, double a_max, double delta_min, double delta_max); 

		void set_car_parameter(double l);

		void set_path_ref(vector<path_type>& path_ref);
	private:
        	double Ts;//sampling period

		//reference for states and control varables
        	double a_r;

        	double delta_r;//turning angle for reference

		double v_r;

		double fai_r;//pose angle for car
		
		//car parameter
        	double l;//车轮距

		//parameter for MPC
        	unsigned int N_sim;//perdicted number

        	unsigned int Nu;//number of control variables

        	unsigned int Nx;//number of state variables

		unsigned int Nc;//number of optimzed control period
		
		//path for planning
        	vector<path_type> path_ref;

		//Matrix
        	MatrixXd Q;
        	
		MatrixXd R;
        	
		MatrixXd A_cell;
        	
		MatrixXd B_cell;
		
		MatrixXd tmp;
		
		MatrixXd H;
		
		VectorXd f;

		//real_t for qpOASES
		real_t* H_real;
		
		real_t* g;
		
		real_t* lb;
		
		real_t* ub;
		
		real_t* a_delta;

		real_t* A_test;

		int nWSR;

		int count;
		
		//car pose
		Vector4d x_piao;
};
