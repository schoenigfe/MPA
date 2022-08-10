#include "ros/ros.h"

#include "std_msgs/String.h"
#include "geometry_msgs/Twist.h"

#include <cstdio>


FILE* file;

void data_log_callback(const std_msgs::String& data_log)
{
    fprintf(file, "%s", data_log.data.c_str());
}


/**
 * @brief The purpose of the data_logger node is to simplify the logging of certain "actions" for example recording a step response... 
 * The user can select the action type, logging time, output file and robot name through the specified parameters.
 * 
 * @note To log the different actions the user must define DATA_LOGGING in the corresponding component in the ESP code
 * and log the action with the macro LOG_DATA().
 */
int main(int argc, char **argv)
{
    ros::init(argc, argv, "data_logger");

    std::string robot_name;
    std::string logging_mode;
    float log_time;
    std::string log_file;

    ros::NodeHandle node_handle;
    node_handle.param<std::string>("robot_name", robot_name, "robot_1");
    node_handle.param<std::string>("logging_mode", logging_mode, "vel_step");
    node_handle.param<float>("log_time", log_time, 10.);
    node_handle.param<std::string>("log_file", log_file, "data.csv");

    ROS_INFO("Start logging of %s in logging mode %s for %.2f to %s", robot_name.c_str(), logging_mode.c_str(), log_time, log_file.c_str());

    file = fopen(log_file.c_str(), "w");

    ros::Subscriber recv_log = node_handle.subscribe(robot_name + "/data_log", 10, data_log_callback);
    ros::Publisher start_logging = node_handle.advertise<std_msgs::String>(robot_name + "/start_log", 1);
    ros::Publisher action_pub = node_handle.advertise<geometry_msgs::Twist>(robot_name + "/vel", 1);

    //Wait for some reason doesn't work without!!!
    ros::Rate loop_rate(1);
    loop_rate.sleep();

    //notify robot to start logging 
    std_msgs::String start_logging_msg;
    start_logging_msg.data = std::to_string(log_time);
    start_logging.publish(start_logging_msg);

    geometry_msgs::Twist velocity_step;

    //start action
    if(logging_mode == "vel_step")
    {
        velocity_step.linear.x = 1;
        action_pub.publish(velocity_step);
    }


    //program needs time to execute action plus extra time to execute callbacks from received log packets
    loop_rate = 40;
    ros::Time start_time = ros::Time::now();
    while(ros::ok() && (ros::Time::now() - start_time).toSec() < 2 + (int)log_time)
    {
        ros::spinOnce();
        loop_rate.sleep();
    }

    //terminate action
    if(logging_mode == "vel_step")
    {
        velocity_step.linear.x = 0;
        action_pub.publish(velocity_step);
    }

    ROS_INFO("Finished logging!");


    fclose(file);

    ros::spin();
    
    return 0;
}
