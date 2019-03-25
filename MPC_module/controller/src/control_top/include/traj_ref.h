#ifndef __trajref_H_
#define __trajref_H_

struct traj_type
{
	double x;
	double y;
	double theta;
	double v;
	traj_type(double x_init,double y_init,double theta_init,double v_init)
	{
		x=x_init;
		y=y_init;
		theta=theta_init;
		v=v_init;
	}
};


#endif
