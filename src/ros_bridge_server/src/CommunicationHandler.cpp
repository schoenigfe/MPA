#include "CommunicationHandler.h"

CommunicationHandler::CommunicationHandler(Socket& sock) : _sock{sock}, _communication_handler_thread(_communication_handler, this)
{
        _communication_handler_thread.detach();

        _keep_alive_time_us = ros::Time::now().toNSec() / 1000;
        _last_send_keep_alive_us = ros::Time::now().toNSec() / 1000;
}

CommunicationHandler::~CommunicationHandler()  
{   

    ROS_INFO("%s: Destruct Connection Handler", _namespace.c_str());
    
    for(auto i : _publisher)
        delete i;

    for(auto i : _subscriber)
        delete i;

    if(_node_handle != nullptr)
    {
        _node_handle->shutdown();
        delete _node_handle;
    }

    _sock.close_connection();
    
    delete &_sock;
}

void CommunicationHandler::_communication_handler(CommunicationHandler *conn_handle)
{   
    ros::Rate loop_rate(20);

    while(ros::ok())
    {   
        conn_handle->_send_keep_alive();

        if(conn_handle->_interpret_receive() == SOCKET_FAIL)
        {
            ROS_ERROR("%s: Interpret Receive failed!", conn_handle->_namespace.c_str());
            break;
        }

        if((ros::Time::now().toNSec() / 1000 - conn_handle->_keep_alive_time_us) / 1000 > MAX_KEEP_ALIVE_TIMOUT_MS)
        {
            ROS_ERROR("%s: Check Keep Alive Timout!", conn_handle->_namespace.c_str());
            ROS_ERROR("%s: Current Time: %ld, Last Keep_Alive: %ld", conn_handle->_namespace.c_str(), ros::Time::now().toNSec() / 1000, conn_handle->_keep_alive_time_us);
            break;
        }
    
        loop_rate.sleep();
    }

    ROS_INFO("%s: Shutting down communication_handler_thread!", conn_handle->_namespace.c_str());

    delete conn_handle;
}

int CommunicationHandler::_interpret_receive()
{   
    int status_error = 0;

    while(1)
    {

        uint8_t msg_id;

        status_error = _sock.socket_receive_nonblock(&msg_id, 1);

        if(status_error == SOCKET_FAIL)
        {
            ROS_ERROR("%s: Error while receiving MSG ID (errno: %d)", _namespace.c_str(), errno);
            break;
        }

        //Break while loop if socket buffer is empty
        else if (status_error == 0)
        {
            status_error = SOCKET_OK;
            break;
        }


        //Guarantees that the first message is the initialize packet
        if(_communication_initialized == false && msg_id != INIT_ID)
        {
            status_error = SOCKET_FAIL;
            break;
        }
            


        switch(msg_id)
        {   
            case INIT_ID:
            {
                status_error = _sock.socket_receive_string(_namespace, MAX_TOPIC_LENGTH);

                if(status_error == SOCKET_FAIL)
                    break;

                _communication_initialized = true;

                ROS_INFO("%s: Received Initialize message!", _namespace.c_str());

                _node_handle = new ros::NodeHandle(_namespace);

                break;
            }
            case KEEP_ALIVE_ID:
            {   
                uint64_t robot_time;
                status_error = _sock.socket_receive((uint8_t*)&robot_time, sizeof(robot_time));

                if(status_error == SOCKET_FAIL)
                    break;

                _keep_alive_time_us = ros::Time::now().toNSec() / 1000;

                _robot_time_difference_us = _keep_alive_time_us - robot_time;

                ROS_INFO("%s: Keep Alive! Robot Time: %ld", _namespace.c_str(), robot_time);

                break;
            }
            case ADVERTISE_ID:
            {
                std::string topic;
                status_error = _sock.socket_receive_string(topic, MAX_TOPIC_LENGTH);

                if(status_error == SOCKET_FAIL)
                    break;

                std::string msg_type;
                status_error = _sock.socket_receive_string(msg_type, MAX_MSG_TYPE_LENGTH);

                if(status_error == SOCKET_FAIL)
                    break;

                ROS_INFO("%s: advertised Topic: %s, with Message Type: %s", _namespace.c_str(), topic.c_str(), msg_type.c_str());

                _advertise(topic, msg_type);

                break;
            }
            case SUBSCRIBE_ID:
            {
                std::string topic;
                status_error = _sock.socket_receive_string(topic, MAX_TOPIC_LENGTH);

                if(status_error == SOCKET_FAIL)
                    break;

                std::string msg_type;
                status_error = _sock.socket_receive_string(msg_type, MAX_MSG_TYPE_LENGTH);

                if(status_error == SOCKET_FAIL)
                    break;

                ROS_INFO("%s: subcribed to Topic: %s, with Message Type: %s", _namespace.c_str(), topic.c_str(), msg_type.c_str());

                _subscribe(topic, msg_type);

                break;
            }
            case PUBLISH_ID:
            {   
                std::string topic;
                status_error = _sock.socket_receive_string(topic, MAX_TOPIC_LENGTH);

                if(status_error == SOCKET_FAIL)
                    break;

                //ROS_INFO("%s: Received topic: %s", _namespace.c_str(), topic.c_str());
                
                Publisher* pub = _getPublisher(topic);

                if(pub != nullptr)
                    {
                        if(pub->recvMessage() == false)
                            status_error = SOCKET_FAIL;
                    }
                    else
                        status_error = SOCKET_FAIL;

                break;
            }
            default:
                ROS_ERROR("%s: ID not found: %d", _namespace.c_str(), msg_id);
                status_error = SOCKET_FAIL;
                break;
        }


        if(status_error == SOCKET_FAIL)
            break;
    }

    return status_error;
}

void CommunicationHandler::_send_keep_alive()
{   
    uint64_t time_now_us = ros::Time::now().toNSec() / 1000;

    if((time_now_us - _last_send_keep_alive_us) / 1000 > KEEP_ALIVE_SEND_PERIOD_MS)
    {
        uint8_t pkt_buffer[1 + sizeof(uint64_t)];
        int pkt_len = 0;

        pkt_buffer[0] = KEEP_ALIVE_ID;
        pkt_len++;  

        *(uint64_t*)(pkt_buffer + pkt_len) = time_now_us;

        pkt_len += sizeof(uint64_t);

        _last_send_keep_alive_us = time_now_us;

        _sock.socket_send(pkt_buffer, pkt_len);
    }
}

Publisher* CommunicationHandler::_getPublisher(std::string const& topic)
{
    std::string full_topic_name = _node_handle->getNamespace() + "/" + topic; 

    for(auto i : _publisher)
    {
        if(i->compareTopic(topic))
                return i;
    }

    return nullptr;
}

void CommunicationHandler::_advertise(std::string const& topic, std::string const& message_type)
{   
    Publisher* new_pub = nullptr;

    if(message_type == "geometry_msgs/Pose2D")
        new_pub = new PublisherImpl<geometry_msgs::Pose2D, ros_msgs::Pose2D>(*_node_handle, topic, _sock);
    else if (message_type == "geometry_msgs/Twist")
        new_pub = new PublisherImpl<geometry_msgs::Twist, ros_msgs::Twist2D>(*_node_handle, topic, _sock);
    else if (message_type == "geometry_msgs/Point")
        new_pub = new PublisherImpl<geometry_msgs::Point, ros_msgs::Point2D>(*_node_handle, topic, _sock);
    else if (message_type == "std_msgs/String")
        new_pub = new PublisherImpl<std_msgs::String, ros_msgs::String>(*_node_handle, topic, _sock);
    else if (message_type == "trajecgenerator/c_trajec_vector")
        new_pub = new PublisherImpl<trajecgenerator::c_trajec_vector, ros_msgs::Trajectory>(*_node_handle, topic, _sock); 
    else if (message_type == "sensor_msgs/Imu")
        new_pub = new PublisherImpl<sensor_msgs::Imu, ros_msgs::Imu>(*_node_handle, topic, _sock);
    if(new_pub != nullptr)
        _publisher.push_back(new_pub);
}

void CommunicationHandler::_subscribe(std::string const& topic, std::string const& message_type)
{
    Subscriber *new_sub = new Subscriber(topic, &_sock);

    if(message_type == "geometry_msgs/Pose2D")
        new_sub->subscribe<geometry_msgs::Pose2D, ros_msgs::Pose2D>(topic, _node_handle);
    else if(message_type == "geometry_msgs/Twist")
        new_sub->subscribe<geometry_msgs::Twist, ros_msgs::Twist2D>(topic, _node_handle);
    else if(message_type == "geometry_msgs/Point")
        new_sub->subscribe<geometry_msgs::Point, ros_msgs::Point2D>(topic, _node_handle);
    else if(message_type == "std_msgs/String")
        new_sub->subscribe<std_msgs::String, ros_msgs::String>(topic, _node_handle);
    else if(message_type == "turtlesim/Pose")
        new_sub->subscribe<turtlesim::Pose, ros_msgs::Pose2DSim>(topic, _node_handle);
    else if(message_type == "trajecgenerator/c_trajec_vector")
        new_sub->subscribe<trajecgenerator::c_trajec_vector, ros_msgs::Trajectory>(topic, _node_handle);
    else if(message_type == "sensor_msgs/Imu")
        new_sub->subscribe<sensor_msgs::Imu, ros_msgs::Imu>(topic, _node_handle);
    else
    {
        delete new_sub;
        new_sub = nullptr;
    }

    if(new_sub != nullptr)
        _subscriber.push_back(new_sub);
}

