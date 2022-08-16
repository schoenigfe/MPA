#pragma once

#include "Socket.h" 
#include "RosMsgs.h"
#include "Subscriber.h"
#include "Publisher.h"
#include "msg_id.h"

#include <thread>
#include <string>
#include <vector>

#include "ros/ros.h"
#include "geometry_msgs/Pose2D.h"
#include "std_msgs/Int32.h"
#include "turtlesim/Pose.h"

/**
 * @brief The CommunicationHandler is the counterpart of the NodeHandle in the Roboterformation ESP-IDF repository.
 * After the TCP connection with the client is established, the CommunicationHandler object is created and
 * waits for the Initialize message from the client. 
 * The Initialize message contains the ROS node name, which gets created when receiving this message.
 * Now the client sends the topics which the CommunicationHandler subscribes and advertises in ROS.
 * It then translates the Publish messages from the client to ROS messages and vice versa.
 * To maintain active connection a KeepAlive message is sent every 500ms.
 * If the CommunicationHandler does not receive a KeepAlive for a specified amount of time or the TCP socket fails,
 * the socket gets closed and the CommunicationHandler object deleted.
 */
class CommunicationHandler
{
    public:
        CommunicationHandler(Socket& sock);
        ~CommunicationHandler();

    private:
        /**
         * @brief std::thread to handle the communication with the client
         * 
         * @param [in] conn_handle pointer to ConnectionHandler object
         */
        static void _communication_handler(CommunicationHandler *conn_handle);

        /**
         * @brief Poll the TCP socket for new data.
         * Interpret new data according to the received msg_id (first byte in message).
         */
        int _interpret_receive();

        /**
         * @brief Send a Keep Alive message to the ROS Bridge Server.
         */
        void _send_keep_alive();

        /** 
         * @brief Returns a pointer to the publisher object of the provided topic
         * 
         * @param [in] topic 
         * @return Pointer to Subscriber object, nullptr if topic does not exist
         */
        Publisher* _getPublisher(const std::string& topic);

        /** 
         * @brief This function creates a new Publisher of the provided message_type.
         * 
         * @param [in] topic topic name
         * @param [in] message_type message type
         */
        void _advertise(std::string const& topic, std::string const& message_type);

        /**
         * @brief This function creates a Subscriber of the provided message type.
         * 
         * @param [in] topic topic name
         * @param [in] message_type message type
         */
        void _subscribe(std::string const& topic, std::string const& message_type);

        Socket& _sock;
        ros::NodeHandle *_node_handle = nullptr;
        std::string _namespace;

        uint64_t _robot_time_difference_us;
        uint64_t _keep_alive_time_us;
        uint64_t _last_send_keep_alive_us;

        bool _communication_initialized = false;

        std::thread _communication_handler_thread;

        std::vector<Publisher*> _publisher;
        std::vector<Subscriber*> _subscriber;
};
