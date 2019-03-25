/*
********************************************************************
 * Software License Agreement (BSD License)
 *
 *  Copyright (c) 2015-2017, Dataspeed Inc.
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above
 *     copyright notice, this list of conditions and the following
 *     disclaimer in the documentation and/or other materials provided
 *     with the distribution.
 *   * Neither the name of Dataspeed Inc. nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 *  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 *  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 *  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 *  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 *  POSSIBILITY OF SUCH DAMAGE.
 *********************************************************************/

#include "ControlBottomNode.h"
namespace control_bottom{
ControlBottomNode::ControlBottomNode(ros::NodeHandle &n, ros::NodeHandle &pn) : srv_(pn)
{
  lpf_fuel_.setParams(60.0, 0.1);
  accel_pid_.setRange(0.0, 1.0);

  // Dynamic reconfigure
  dynamic_reconfigure::Server<control_bottom::ControllerConfig>::CallbackType f;
  f = boost::bind(&ControlBottomNode::reconfig,this, _1, _2);  
  srv_.setCallback(f);

  // Control rate parameter
  double control_rate;
  pn.param("control_rate", control_rate, 50.0);
  control_period_ = 1.0 / control_rate;

  // Ackermann steering parameters
  acker_wheelbase_ = 2.8498; // 112.2 inches
  acker_track_ = 1.5824; // 62.3 inches
  steering_ratio_ = 14.8;
  pn.getParam("ackermann_wheelbase", acker_wheelbase_);
  pn.getParam("ackermann_track", acker_track_);
  pn.getParam("steering_ratio", steering_ratio_);

  // Subscribers
  sub_top_ = n.subscribe("control_top_result", 1, &ControlBottomNode::recvTop, this);
  sub_steering_ = n.subscribe("steering_report", 1, &ControlBottomNode::recvSteeringReport, this);
  sub_enable_ = n.subscribe("dbw_enabled", 1, &ControlBottomNode::recvEnable, this);
  sub_fuel_level_ = n.subscribe("fuel_level_report", 1, &ControlBottomNode::recvFuel, this);

  // Publishers
  pub_throttle_ = n.advertise<dbw_mkz_msgs::ThrottleCmd>("throttle_cmd", 1);
  pub_brake_ = n.advertise<dbw_mkz_msgs::BrakeCmd>("brake_cmd", 1);
  pub_steering_ = n.advertise<dbw_mkz_msgs::SteeringCmd>("steering_cmd", 1);
  pub_vel_ = n.advertise<std_msgs::Float64>("vel_current",10);
  pub_gear_ = n.advertise<dbw_mkz_msgs::GearCmd>("gear_cmd", 1);
  // Debug
  pub_accel_ = n.advertise<std_msgs::Float64>("filtered_accel", 1);
  pub_req_accel_ = n.advertise<std_msgs::Float64>("req_accel", 1);

  // Timers
  control_timer_ = n.createTimer(ros::Duration(control_period_), &ControlBottomNode::controlCallback, this);
}

void ControlBottomNode::controlCallback(const ros::TimerEvent& event)
{
  if ((event.current_real - cmd_stamp_).toSec() > (10.0 * control_period_)) {
    ayscel_pid_.resetIntegrator();
    return;
  }
  ROS_INFO("accel_pid is %lf, %lf",kp_, ki_);

  double vehicle_mass = cfg_.vehicle_mass + lpf_fuel_.get() / 100.0 * cfg_.fuel_capacity * GAS_DENSITY;

  double accel_cmd = result_top_.a;
  double vel_cmd = result_top_.vel;

  double accel_max = cfg_.accel_max > 0.0 ? cfg_.accel_max : 9.8;
  double decel_max = cfg_.decel_max > 0.0 ? cfg_.decel_max : 9.8;
  if( accel_cmd > accel_max)
    accel_cmd = accel_max;
  if(accel_cmd < -decel_max)
    accel_cmd = -decel_max;

  if (vel_cmd <= (double)1e-2) {
    accel_cmd = std::min(accel_cmd, -530 / vehicle_mass / cfg_.wheel_radius);
  } 

  std_msgs::Float64 accel_cmd_msg;
  accel_cmd_msg.data = accel_cmd;
  pub_req_accel_.publish(accel_cmd_msg);

  dbw_mkz_msgs::ThrottleCmd throttle_cmd;
  dbw_mkz_msgs::BrakeCmd brake_cmd;
  dbw_mkz_msgs::SteeringCmd steering_cmd;
  dbw_mkz_msgs::GearCmd gear_cmd;
  dbw_mkz_msgs::Gear gear_data;
  
  if (sys_enable_ && result_top_.start) {
    throttle_cmd.enable = true;
    throttle_cmd.pedal_cmd_type = dbw_mkz_msgs::ThrottleCmd::CMD_PERCENT;
    if (accel_cmd >= 0) {
      throttle_cmd.pedal_cmd = accel_pid_.step(accel_cmd - lpf_accel_.get(), control_period_);
    } else {
      accel_pid_.resetIntegrator();
      throttle_cmd.pedal_cmd = 0;
    }

    brake_cmd.enable = true;
    brake_cmd.pedal_cmd_type = dbw_mkz_msgs::BrakeCmd::CMD_TORQUE;
    if (accel_cmd < -cfg_.brake_deadband) {
      brake_cmd.pedal_cmd = -accel_cmd * vehicle_mass * cfg_.wheel_radius;
    } else {
      brake_cmd.pedal_cmd = 0;
    }

    steering_cmd.enable = true;
    if(result_top_.delta > cfg_.max_lat_accel)
      steering_cmd.steering_wheel_angle_cmd = cfg_.max_lat_accel;
    else if(result_top_.delta < -cfg_.max_lat_accel)
      steering_cmd.steering_wheel_angle_cmd = -cfg_.max_lat_accel;
    else
      steering_cmd.steering_wheel_angle_cmd = result_top_.delta;
 
    if (cfg_.pub_pedals) {
      pub_throttle_.publish(throttle_cmd);
      pub_brake_.publish(brake_cmd);
    }

    switch(gear_data)
    {
      case PARK:
        if(abs(vel_real) > vel_deta)
          gear_data = NEUTRUAL;
      break;
      case REVERSE:
        if(vel_real > -vel_deta)
          gear_data = NEUTRAL;
      break;
      case NEUTRAL:
        count_neutral_ ++;
        if(count_neutral_ >= 10)
        {
          if(vel_real > vel)
          {
            gear_data = DRIVE;
            count_neutral_ = 0;
          }
          else if(vel_cmd < -vel)
          {
            gear_data = REVERSE;
            count_neutral_ = 0;
          }
          else
          {
            gear_data = PARK;
            count_neutral_ = 0;
          }
        } 
      break;
      case DRIVE:
        if(v_real < vel_deta)
          gear_data = NEUTRAL; 
      break;
      default:
        gear_data = NEUTRAL;
      break;
    }
    gear_cmd.gear = gear_data;
    pub_gear.publish(gear_cmd);

    if (cfg_.pub_steering) {
      pub_steering_.publish(steering_cmd);
    }
  } else {
    accel_pid_.resetIntegrator();
    brake_cmd.pedal_cmd = 0;
    throttle_cmd.pedal_cmd = 0;
  }
}

void ControlBottomNode::reconfig(ControllerConfig& config, uint32_t level)
{
  kp_ = accel_kp;
  ki_ = accel_ki;

  ROS_INFO("accel_pid is %lf, %lf",cfg_.accel_kp, cfg_.accel_ki);
  cfg_ = config;
  cfg_.vehicle_mass -= cfg_.fuel_capacity * GAS_DENSITY; // Subtract weight of full gas tank
  cfg_.vehicle_mass += 150.0; // Account for some passengers

  accel_pid_.setGains(cfg_.accel_kp, cfg_.accel_ki, 0.0);
  lpf_accel_.setParams(cfg_.accel_tau, 0.02);
}

void ControlBottomNode::recvTop(const controller_msgs::result& msg)
{
  result_top_.a = msg.a;
  result_top_.delta = msg.delta;
  result_top_.vel = msg.vel;
  result_top_.start = msg.start;
}

void ControlBottomNode::recvFuel(const dbw_mkz_msgs::FuelLevelReport::ConstPtr& msg)
{
  lpf_fuel_.filt(msg->fuel_level);
}

void ControlBottomNode::recvSteeringReport(const dbw_mkz_msgs::SteeringReport::ConstPtr& msg)
{
  double raw_accel = 50.0 * (msg->speed - actual_.linear.x);
  lpf_accel_.filt(raw_accel);

  std_msgs::Float64 accel_msg;
  std_msgs::Float64 vel_msg;

  accel_msg.data = lpf_accel_.get();
  vel_msg.data = msg->speed;

  pub_accel_.publish(accel_msg);
  pub_vel_.publish(vel_msg);

  actual_.linear.x = msg->speed;
}


void ControlBottomNode::recvEnable(const std_msgs::Bool::ConstPtr& msg)
{
  sys_enable_ = msg->data;
}
}

