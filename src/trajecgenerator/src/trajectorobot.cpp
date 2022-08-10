#include "trajectorobot.h"


ToRobot::ToRobot(std::string robot_name) : nh(robot_name)
{
    c_trajecPub = nh.advertise<trajecgenerator::c_trajec_vector>("trajectory", 1);
}

ToRobot::~ToRobot() {}


void ToRobot::storeInTrajectory(pos_d trajectory_state)
{
    trajecgenerator::c_trajec trajectory_state_vector;

    trajectory_state_vector.x = trajectory_state.x;
    trajectory_state_vector.y = trajectory_state.y;
    trajectory_state_vector.dx = trajectory_state.dx;
    trajectory_state_vector.dy = trajectory_state.dy;
    trajectory_state_vector.ddx = trajectory_state.ddx;
    trajectory_state_vector.ddy = trajectory_state.ddy;
    trajectory_state_vector.timestamp = ros::Time::now().toNSec();

    trajectory.points.push_back(trajectory_state_vector);
}

bool ToRobot::publish()
{
    float dist = sqrt(pow(trajectory.points.front().x - trajectory.points.back().x, 2) + pow(trajectory.points.front().y - trajectory.points.back().y, 2));

    if(dist < 0.1 && trajectory.points.size() > 100)
    {
        c_trajecPub.publish(trajectory);
        trajectory.points.clear();

        return true;
    }

    return false;
}
