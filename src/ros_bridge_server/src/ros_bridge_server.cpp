#include "ros/ros.h"

#include <cstring>

#include "CommunicationHandler.h"


int main(int argc, char **argv)
{
    ros::init(argc, argv, "ros_bridge_server");

    ros::start();

    ros::Rate loop_rate(100);

    Socket* sock = new Socket;

    while(ros::ok())
    {
        if(sock->accept_connection() != SOCKET_FAIL)
        {
            ROS_INFO("Accepted connection!");
            CommunicationHandler* new_communication = new CommunicationHandler(*sock);

            sock = new Socket;
        }
        
        ros::spinOnce();
        loop_rate.sleep();
    }

    ros::shutdown();

    return 0;
}