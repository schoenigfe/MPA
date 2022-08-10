#pragma once

#include "ros/ros.h"
#include "RosMsgs.h"
#include "Socket.h"
#include "msg_id.h"

#include <string>

/**
 * @brief The Subscriber class provides a template for the ros::Subscriber callback function.
 * This template deserializes the ROS message and sends it to the client.
 */
class Subscriber
{
    public:
        Subscriber(std::string topic, Socket* sock) : _topic{topic}, _sock{sock} {}

        /**
         * @brief Subscribe to the topic
         * T is the the message type provided by ROS, S is the abstraction in ROSMsgs.h
         * 
         * @param [in] topic
         * @param [in] node_handle
         */
        template <typename T, typename S> void subscribe(std::string const& topic, ros::NodeHandle* node_handle)
        {
            _sub = node_handle->subscribe(topic, 1, &Subscriber::_subscribtion_callback<T, S>, this);
        }

        /**
         * @brief Template for the ros::Subscriber callback function
         * T is the the message type provided by ROS, S is the abstraction in ROSMsgs.h
         * 
         * @param [in] msg
         */
        template <typename T, typename S> void _subscribtion_callback(T const& msg)
        {   
            S local_msg = static_cast<S>(msg);
            
            uint8_t* pkt_buffer = new uint8_t[2 + _topic.size() + local_msg.getSize()];
            
            int pkt_len = 0;

            pkt_buffer[0] = PUBLISH_ID;
            pkt_len++;
            
            memcpy(pkt_buffer + pkt_len, _topic.c_str(), _topic.size());
            pkt_len += _topic.size();

            pkt_buffer[pkt_len] = '\0';
            pkt_len++;
        
            local_msg.serialize(pkt_buffer + pkt_len);
            pkt_len += local_msg.getSize();
            
            _sock->socket_send(pkt_buffer, pkt_len);

            delete[] pkt_buffer;
        }

    private:
        std::string _topic;
        ros::Subscriber _sub;
        Socket* _sock;
};
