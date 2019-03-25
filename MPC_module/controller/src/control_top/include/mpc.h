#ifndef __MPC_H_
#define __MPC_H_

#include <qpOASES.hpp>
#include <Eigen/Dense>
#include <ros/ros.h>
#include <math.h>
#include <vector> 
#include <iostream>
#include <fstream>
#include <string>
#include <mvp_msgs/planning.h>
#include <pos.h> 
USING_NAMESPACE_QPOASES;
using namespace Eigen;
using namespace std;


class MPC {
public:
    MPC(double dt, int np_set, int nc_set);
    ~MPC();

    void update();
    void set_traj_ref(mvp_msgs::trajectory traj_ref);
    int get_count();
    void get_MPC_result(double& a, double& delta, double& vel);
    bool get_update_state();
    void set_update_state(bool update);
    void set_car_state(double x_real, double y_real, double theta_real, double v_real);
    ofstream out_;
    string text_;
    double error_sum_;
    int delta_change_;
	
private:

    double dt_;
    double l_;
    //int xn_;
    //int un_;
    int pn_;
    int cn_;

    int total_cnt_;
    int curr_cnt_;

    double x_real_;
    double y_real_;
    double theta_real_;
    double v_real_;

    MatrixXd Q_cell_;
    MatrixXd R_cell_;

    real_t* H_real;
    real_t* g;
    real_t* lb;
    real_t* ub;
    real_t* A_delta;
    real_t* A_test;

//tranjectory reference
    mvp_msgs::trajectory traj_ref_;

    bool update_;

    SQProblem solver_;
    double a_old;
    double delta_old_; 
   
};

#endif
