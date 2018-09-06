#include "MPC.h"
SQProblem solver(2,1);
bool update = false;
bool start = false;
/*void publishposition()
{
        msg.x = msg.x+Ts*cos(msg.theta)*msg.v;
        msg.y = msg.y+Ts*sin(msg.theta)*msg.v;
        msg.theta = msg.theta + Ts*tan(a_delta_real[1])*msg.v/l;
        msg.v = msg.v+(a_delta_real[0])*Ts;
        cout<<"the car position is"<<endl;
        cout<<msg.x<<" "<<msg.y<<" "<<msg.theta<<" "<<msg.v<<endl;
   	controller.set_x_piao(msg.x, msg.y, msg.theta, msg.v);
        pub.publish(msg);
	cout<<"car position published"<<endl;
}*/
int main(int argc, char** argv)
{
    	ros::init(argc,argv,"my_control");
	MPC controller(0.1,10,2,4,1);
	double x_real = 0.0;
	double y_real = 0.0;
	double theta_real = 0.0;
	double v_real = 0.0;
	double Ts = 0.01;
	ros::NodeHandle n;
	ros::Timer timer = n.createTimer(ros::Duration(0.1), &MPC::timer_callback, &controller);
	ros::Publisher pub = n.advertise<my_control::car_position>("forsim",100);
	my_control::car_position msg;
	double a_delta_real[2] = {0.0,0.0};
	double l=1.0;
	
	ros::Rate loop_rate(1.0/Ts);
    	
	msg.x = 0.0;
	msg.y = 0.0;
	msg.theta = 0.0;
	msg.v = 0.0;

	while(ros::ok())
    	{
		ros::spinOnce();
		if(update == true)
		{
			start = true;
			update = false;
			controller.get_mpc_optimized(a_delta_real[0], a_delta_real[1]);
			if(controller.get_count()>=150)
                                break;
		}
		else if(start == true)
		{
			msg.x = msg.x+Ts*cos(msg.theta)*msg.v;
        		msg.y = msg.y+Ts*sin(msg.theta)*msg.v;
        		msg.theta = msg.theta + Ts*tan(a_delta_real[1])*msg.v/l;
        		msg.v = msg.v+(a_delta_real[0])*Ts;
        		cout<<"the car position is"<<endl;
        		cout<<msg.x<<" "<<msg.y<<" "<<msg.theta<<" "<<msg.v<<endl;
        		controller.set_x_piao(msg.x, msg.y, msg.theta, msg.v);
        		pub.publish(msg);
        		cout<<"car position published"<<endl;		

			loop_rate.sleep();
		}
		else
		{
			msg.x =0.0;
			msg.y = 0.0;
			msg.theta = 0.0;
			msg.v = 0.0;
			controller.set_x_piao(msg.x, msg.y, msg.theta, msg.v);
                        pub.publish(msg);
                        cout<<"car position published"<<endl;

                        loop_rate.sleep();

		}
    	}

    	return 0;
}
