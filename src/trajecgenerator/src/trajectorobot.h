#pragma once

#include <ros/ros.h>
#include <string>
#include "pos_d.h"
#include "trajecgenerator/c_trajec.h"
#include "trajecgenerator/c_trajec_vector.h"


class ToRobot 
{
public:
    ToRobot(std::string robot_name);
    ~ToRobot();
    void storeInTrajectory(pos_d trajectory_state);
    bool publish();

private:

    ///Publisher der custom Message der Trajektorie
    ros::Publisher c_trajecPub;
    
    ///node Handle für den Trajektorienhandler
    ros::NodeHandle nh;

    trajecgenerator::c_trajec_vector trajectory;
};


