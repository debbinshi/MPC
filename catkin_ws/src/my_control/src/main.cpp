#include "MPC.h"
#include "sim_msgs/car_position.h"
#include "sim_msgs/sim_line.h"
#include "sim_msgs/sim_draw.h"
#include "geometry_msgs/Point32.h"
#include "sim_msgs/location.h"
SQProblem solver(2,1);
bool update = false;
bool start = false;

double theta_trans(double theta_before)
{
	double theta_tmp = pi/2.0 - theta_before;
	if(theta_tmp < -pi)
		return (theta_tmp + 2*pi)/pi*180.0;
	else
		return theta_tmp/pi*180.0; 
}

int main(int argc, char** argv)
{
    	ros::init(argc,argv,"my_control");

	double a_delta_real[2] = {0.0,0.0};

	double Ts = 0.1;

	double T_cal = 1;
	int N_sim = 20;
	int Nx = 4;
	int Nu = 2;
	int Nc = 1;
	double v_r_ = 5.0;
	double fai_r_ = 0.0;
	double a_r_ = 0.0;
	double delta_r_ = 0.0; 

	MPC controller(T_cal,N_sim,Nu,Nx,Nc,v_r_,fai_r_,a_r_,delta_r_);
       
	double l = 1.0;
	controller.set_car_parameter(l);

	double x_real = 0.0;
	double y_real = 0.0;
	double theta_real = pi/2.0;
	double v_real = 0.0;
	controller.set_car_pose(x_real,y_real,theta_real,v_real);

	ros::NodeHandle n;

	ros::Timer timer = n.createTimer(ros::Duration(T_cal), &MPC::timer_callback, &controller);
	
	ros::Publisher pub = n.advertise<sim_msgs::sim_draw>("mvp/sim_draw",10);

	ros::Publisher pub2 = n.advertise<sim_msgs::location>("tools/mvp_msgs/location",10);

	sim_msgs::sim_draw draw;	
	sim_msgs::sim_line line;
	geometry_msgs::Point32 pose;
	line.color.data = "0x11CC11";
	sim_msgs::location car;
	car.dHDMapPoseX = x_real;
	car.dHDMapPoseY = y_real;
	car.dHDMapPoseZ = 0.0;
	car.dHDMapPoseHeading = theta_trans(theta_real);
	
	ros::Rate loop_rate(1.0/Ts);

	vector<path_type> path_ref;
	double tmp_x = 0.0;
	double tmp_y = 0.0;
	path_type path_ref_point(0.0,0.0,0.0,0.0);
	for(int i=0;i<100;i++)
	{
		path_ref_point.x = (i+1)*T_cal;
		path_ref_point.y = (path_ref_point.y < 50)?(i+1)*T_cal:50;
		path_ref_point.theta = atan(path_ref_point.y/path_ref_point.x);
		path_ref_point.v =  1.0;
		path_ref.push_back(path_ref_point);
	}
	controller.set_path_ref(path_ref);

	while(ros::ok())
    	{
		ros::spinOnce();
		if(update == true)
		{
			start = true;
			update = false;
			cout<<"MPC updated!"<<endl;
			controller.get_mpc_optimized(a_delta_real[0], a_delta_real[1]);
			if(controller.get_count()>=90)
                                break;
		}
		else if(start == true)
		{
			cout<<"running!!!"<<endl;
			x_real += Ts*cos(theta_real)*v_real;
        		y_real += Ts*sin(theta_real)*v_real;
        		theta_real += Ts*tan(a_delta_real[1])*v_real/l;
        		v_real += (a_delta_real[0])*Ts;
        		while(theta_real >= 2*pi)
				theta_real -= 2*pi;
			cout<<"the car position is"<<endl;
        		cout<< x_real <<" "<< y_real <<" "<< theta_real << " "<< v_real <<endl;
        		
			controller.set_car_pose(x_real, y_real, theta_real, v_real);
        		
			pose.x = x_real;
                        pose.y = y_real;
                        pose.z = 0.0;
                        line.pos_array.push_back(pose);
                        draw.line_map.push_back(line);
                        pub.publish(draw);
			
						
			car.dHDMapPoseX = x_real;
			car.dHDMapPoseHeading = theta_trans(theta_real);
			car.dHDMapPoseY = y_real;
			pub2.publish(car);
                        cout<<"the sim car position is"<<endl;
			cout<<car.dHDMapPoseX<<" "<<car.dHDMapPoseY<<endl;
			cout<<car.dHDMapPoseHeading<<endl;
			cout<<"car position published"<<endl;

                        loop_rate.sleep();
		}
		else
		{
                        cout<<"the car position is"<<endl;
			cout<<x_real<<" "<<y_real<<" "<<theta_real<<" "<<v_real<<endl;
			cout<<"not started yet"<<endl;
			
                        loop_rate.sleep();
		}
    	}

    	return 0;
}
