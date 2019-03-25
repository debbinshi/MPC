#include "mpc.h"
#include "mpc_improve.h"
#include "std_msgs/Float64.h"
#include "controller_msgs/car_location.h"
#include "controller_msgs/result.h"
#include "traj_ref.h"
#include "stdlib.h"

bool start = false;
int np_set = 10;
int nc_set = 3;
double x_real = 0.0;
double y_real = 0.0;
double theta_real = M_PI / 2.0;
double v_real = 0.0;

double theta_trans(double theta_before)
{
    double theta_tmp = M_PI/2.0 - theta_before;
    if(theta_tmp < -M_PI)
	    return (theta_tmp + 2*M_PI);
    else
	    return theta_tmp; 
}

void vel_callback(const std_msgs::Float64 msgs)
{
    v_real = msgs.data;
}

void location_callback(const controller_msgs::car_location& location)
{
    x_real = location.x;
    y_real = location.y;
    theta_real = location.theta;
//    v_real = location.v;
}

int main(int argc, char** argv)
{
    ros::init(argc,argv,"control_top");
    //dynamic_reconfigure::Client<my_control::MPC_paraConfig> client("MPC_para_server", MPC_para_set);
    if(argc == 2)
    {
        np_set = atoi(argv[1]);
    }
    else if(argc == 3)
    {
        np_set = atoi(argv[1]);
        nc_set = atoi(argv[2]);
    }

    double a_delta_real[3] = {0.0, 0.0, 0.0};
    double Ts = 0.1;
    double T_cal = 0.1; 
    double l = 2.8498f;

    ros::NodeHandle n;
    ros::Timer timer;
    
    ros::Publisher result_pub = n.advertise<controller_msgs::result>("control_top_result",10);
    ros::Subscriber vel_sub = n.subscribe("control_bottom/vel_current",1,vel_callback);
    ros::Subscriber location_sub = n.subscribe("location/car_location",1,location_callback);

    MPC controller(T_cal, np_set, nc_set);
//    MPC_improve controller(T_cal, np_set, nc_set);
    
    timer = n.createTimer(ros::Duration(T_cal), &MPC::timer_callback, &controller);

    controller_msgs::result MPC_result;
   
    ros::Rate loop_rate(1.0/Ts);

    vector<traj_type> traj_ref;
    traj_type traj_ref_point(0.0,0.0,0.0,0.0);
    double r = 50.0;
    for(int i=0; i<100/T_cal; i++)
    {
	    //traj_ref_point.x = (traj_ref_point.y < 50)?0:((i-500)*T_cal);
	    //traj_ref_point.y = (traj_ref_point.y < 50)?((i+1)*T_cal):50;
        traj_ref_point.x = r - r*cos(2 * M_PI /(100 / T_cal) * (i + 1));
        traj_ref_point.y = r * sin(2 * M_PI / (100 / T_cal) * (i + 1));
        
/*        if(i > 500)
        {
            traj_ref_point.x = (i-500)*T_cal;
	        traj_ref_point.y = 50 - traj_ref_point.x;
            
        } 
        else
        {
            traj_ref_point.x = 0.0;
            traj_ref_point.y = (i + 1) * T_cal;
        }
*/
        if(i == 0)
        {
	        traj_ref_point.theta = atan2(traj_ref_point.y , traj_ref_point.x);
            traj_ref_point.v = sqrt(traj_ref_point.x * traj_ref_point.x + traj_ref_point.y * traj_ref_point.y) / T_cal;
        }
    	else
        {
            traj_ref_point.theta = atan2((traj_ref_point.y - traj_ref[i - 1].y), (traj_ref_point.x - traj_ref[i - 1].x));
            traj_ref_point.v = sqrt((traj_ref_point.x - traj_ref[i - 1].x)*(traj_ref_point.x - traj_ref[i - 1].x) + (traj_ref_point.y - traj_ref[i - 1].y) * (traj_ref_point.y - traj_ref[i - 1].y)) / T_cal;
        }

        traj_ref.push_back(traj_ref_point);
    }
    
    controller.set_traj_ref(traj_ref);
    controller.set_car_state(0.0, 0.0, M_PI / 2.0, 0.0);
    
    while(ros::ok())
    {
	    ros::spinOnce();
	    if(controller.get_update_state() == true)
	    {
            MPC_result.start = true;
	        
            controller.set_update_state(false);
	        controller.get_MPC_result(a_delta_real[0], a_delta_real[1], a_delta_real[2]);
	    
	        MPC_result.a = a_delta_real[0];
	        MPC_result.delta = a_delta_real[1];
            MPC_result.vel = a_delta_real[2];

	        if(controller.get_count() >= 999)
	        {
		        MPC_result.start = false;
	   	        result_pub.publish(MPC_result);
                    break;
	        }
	        else
	        {
	   	        result_pub.publish(MPC_result);
	        }
        }
        cout<< x_real <<" "<< y_real <<" "<< theta_real << " "<< v_real <<endl;
        controller.set_car_state(x_real, y_real, theta_real, v_real);        		
    
        loop_rate.sleep();    
    }
    while(ros::ok())
    {
        result_pub.publish(MPC_result);
    }

    controller.out_ << "np is, "
		    << "nc is, "
		    << "delta change largely"
		    << "final avarage error is" << endl;
    controller.out_ << np_set <<",  "
		    << nc_set <<",  "
		    << controller.delta_change_<<", "
		    << sqrt(controller.error_sum_ / 999.0) << endl;
    controller.out_.close();
    return 0;
}
