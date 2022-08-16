#pragma once

#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Int32.h"
#include "geometry_msgs/Pose2D.h"
#include "geometry_msgs/Point.h"
#include "geometry_msgs/Twist.h"
#include "geometry_msgs/Quaternion.h"
#include "sensor_msgs/Imu.h"
#include "turtlesim/Pose.h"
#include "trajecgenerator/c_trajec_vector.h"

#include "msg_id.h"

/**
 * @brief For every ROS Message Type which is communicated over the ROS Robot Bridge there has to be a ros_msgs::Type.
 * These classes inherit from their ROS equivalent and must additionaly provide the methods 
 * getSize(), allocateMemory(), getMsgType(), serialize() and deserialize().
 * There are two types of RosMsgs Standard and Array type (e.g. String, Trajectory).
 * For the Standard type message the allocateMemory() method can be left empty and
 * the getSize() method will always return the accumulated size of its members.
 * The Array type message uses the allocateMemory() method to allocate the required memory for the deserialization and
 * the getSize() method returns zero if the array is empty or array length in bytes + 4 bytes (for the serialization of array length).
 */
namespace ros_msgs
{
    struct String : public std_msgs::String
    {   
        public:
            String(std::string new_data) : std_msgs::String() 
            {
                data = new_data;
            }
            String() : std_msgs::String() {}
            String(std_msgs::String str) : std_msgs::String(str) {}

            size_t getSize() const
            { 
                if(data.empty() == true)
                    return 0; 
                
                return sizeof(int32_t) + data.size();
            }

            void allocateMemory(int32_t msg_len) 
            {
                data.reserve(msg_len);

                _reserved_bytes = msg_len;
            } 
            
            void serialize(uint8_t* buffer) const
            { 
                if(data.empty() == false)
                {
                    ((int32_t*)buffer)[0] = data.size();
                    memcpy(buffer + sizeof(int32_t), data.c_str(), data.size());
                    //buffer[sizeof(int32_t) + data.size()] = '\0';
                }
            }
            
            void deserialize(uint8_t* buffer)
            {
                data.assign((char*)buffer, _reserved_bytes);
            }
        
        private:
            int _reserved_bytes = 0;
    };

    struct Pose2D : public geometry_msgs::Pose2D
    {   
        public:
            Pose2D(double new_x, double new_y, double new_theta) : geometry_msgs::Pose2D()
            {
                x = new_x;
                y = new_y;
                theta = new_theta;
            }
            Pose2D() : geometry_msgs::Pose2D() {}
            Pose2D(geometry_msgs::Pose2D pose) : geometry_msgs::Pose2D(pose) {} 

            size_t getSize() const  
            { 
                return _msg_size; 
            }

            void allocateMemory(int32_t msg_len) {} 

            void serialize(uint8_t* buffer) const 
            { 
                double* buff = (double*)buffer;
                
                buff[0] = x;
                buff[1] = y;
                buff[2] = theta;
            }

            void deserialize(uint8_t* buffer) 
            {   
                double* buff = (double*)buffer;

                x = buff[0];
                y = buff[1];
                theta = buff[2];
            }

        private:
            static size_t const _msg_size;
    }; 
    
    struct Qual : public std_msgs::Int32
    {   
        public:
            Qual(int new_qual) :  std_msgs::Int32()
            {
                qual = new_qual;
            }
            Qual(std_msgs::Int32) {}
            //Qual(std_msgs::Int32 qual) : std_msgs::Int32(qual) {} 

            size_t getSize() const  
            { 
                return _msg_size; 
            }

            void allocateMemory(int32_t msg_len) {} 

            void serialize(uint8_t* buffer) const 
            { 
                double* buff = (double*)buffer;
                
                buff[0] = qual;
            }

            void deserialize(uint8_t* buffer) 
            {   
                double* buff = (double*)buffer;

                qual = buff[0];
            }

        private:
			int qual;
            static size_t const _msg_size;
    };
    
 struct Imu : public sensor_msgs::Imu, public geometry_msgs::Quaternion
  {   
        public:
            Imu(double new_quaternion_orientation_x, double new_quaternion_orientation_y, double new_quaternion_orientation_z, double new_quaternion_orientation_w, double new_angular_velocity_x, double new_angular_velocity_y, double new_angular_velocity_z, double new_linear_acceleration_x, double new_linear_acceleration_y, double new_linear_acceleration_z) : sensor_msgs::Imu()
            {   
                quaternion.x = new_quaternion_orientation_x;
                quaternion.y = new_quaternion_orientation_y;
                quaternion.z = new_quaternion_orientation_z;
                quaternion.w = new_quaternion_orientation_w;
                angular_velocity.x = new_angular_velocity_x;
                angular_velocity.y = new_angular_velocity_y;
                angular_velocity.z = new_angular_velocity_z;
                linear_acceleration.x = new_linear_acceleration_x;
                linear_acceleration.y = new_linear_acceleration_y;
                linear_acceleration.z = new_linear_acceleration_z;
                
            }
            Imu() : sensor_msgs::Imu() {}
            Imu(sensor_msgs::Imu imu) : sensor_msgs::Imu(imu) {} 

            size_t getSize() const  
            { 
                return _msg_size; 
            }

            void allocateMemory(int32_t msg_len) {} 

            void serialize(uint8_t* buffer) const 
            { 
                double* buff = (double*)buffer;
                
                buff[0] =  quaternion.x;
                buff[1] =  quaternion.y;
                buff[2] =  quaternion.z;
                buff[3] =  quaternion.w;
                buff[4] = angular_velocity.x;
                buff[5] = angular_velocity.y;
                buff[6] = angular_velocity.z;
                buff[7] = linear_acceleration.x;
                buff[8] = linear_acceleration.y;
                buff[9] = linear_acceleration.z;
                            
            }

            void deserialize(uint8_t* buffer) 
            {   
                double* buff = (double*)buffer;
                
               quaternion.x = buff[0];
               quaternion.x = buff[1];
               quaternion.x = buff[2];
               quaternion.x = buff[3];
               angular_velocity.x = buff[4];
               angular_velocity.y = buff[5];
               angular_velocity.z = buff[6];
               linear_acceleration.x = buff[7];
               linear_acceleration.y = buff[8];
               linear_acceleration.z = buff[9];
               
               
            }

        private:
            static size_t const _msg_size;
            geometry_msgs::Quaternion quaternion;
            geometry_msgs::Vector3 angular_velocity;
            geometry_msgs::Vector3 linear_acceleration;
            
    };

    struct Point2D : public geometry_msgs::Point
    {   
        public:
            Point2D(double new_x, double new_y) : geometry_msgs::Point()
            {
                x = new_x;
                y = new_y;
            }
            Point2D() : geometry_msgs::Point() {}
            Point2D(geometry_msgs::Point point) : geometry_msgs::Point(point) {} 

            size_t getSize() const
            { 
                return _msg_size; 
            }
            
            void allocateMemory(int32_t msg_len) {} 

            void serialize(uint8_t* buffer) const
            { 
                double* buff = (double*)buffer;
                buff[0] = x;
                buff[1] = y;
            }

            void deserialize(uint8_t* buffer)
            {
                double* buff = (double*)buffer;

                x = buff[0];
                y = buff[1];
            }

        private:
            static size_t const _msg_size;
    };

    struct Twist2D : public geometry_msgs::Twist
    {
        public:
            Twist2D(double x, double w) : geometry_msgs::Twist()
            {
                linear.x = x;
                angular.z = w;
            }
            Twist2D() : geometry_msgs::Twist() {}
            Twist2D(geometry_msgs::Twist vel_vector) : geometry_msgs::Twist(vel_vector) {}

            size_t getSize() const
            { 
                return _msg_size; 
            }

            void allocateMemory(int32_t msg_len) {} 

            void serialize(uint8_t* buffer) const
            { 
                double* buff = (double*)buffer;
                buff[0] = linear.x;
                buff[1] = angular.z;
            }

            void deserialize(uint8_t* buffer)
            {
                double* buff = (double*)buffer;

                linear.x = buff[0];
                angular.z = buff[1];
            }       

        private:
            static size_t const _msg_size;
    };

    struct Pose2DSim : public turtlesim::Pose
    {
        public:
            Pose2DSim(float new_x, float new_y, float new_theta) : turtlesim::Pose()
            {
                x = new_x;
                y = new_y;
                theta = new_theta;
            }
            Pose2DSim() : turtlesim::Pose() {}
            Pose2DSim(turtlesim::Pose pose) : turtlesim::Pose(pose) {}

            size_t getSize() const
            { 
                return _msg_size; 
            }

            void allocateMemory(int32_t msg_len) {} 

            void serialize(uint8_t* buffer) const
            { 
                float* buff = (float*)buffer;
                buff[0] = x;
                buff[1] = y;
                buff[2] = theta;
            }

            void deserialize(uint8_t* buffer)
            {
                float* buff = (float*)buffer;

                x = buff[0];
                y = buff[1];
                theta = buff[2];
            }       

        private:
            static size_t const _msg_size;
    };

    struct Trajectory : public trajecgenerator::c_trajec_vector
    {
        public:
            Trajectory() : trajecgenerator::c_trajec_vector() {}
            Trajectory(trajecgenerator::c_trajec_vector trajectory) : trajecgenerator::c_trajec_vector(trajectory) {}

            size_t getSize() const
            {
                if(_trajectory_points == 0)
                    return 0;

                return points.size() * _msg_size + sizeof(int32_t);
            }

            void allocateMemory(int32_t msg_len)
            {
                _trajectory_points = msg_len / _msg_size;

                points.reserve(_trajectory_points);
            }

            void serialize(uint8_t* buffer) const
            {   
                if(points.empty() == false)
                {
                    *reinterpret_cast<int32_t*>(buffer) = points.size() * _msg_size;
                    buffer += sizeof(int32_t);

                    for(auto i : points)
                    {
                        float* buff = reinterpret_cast<float*>(buffer);

                        buff[0] = i.x;
                        buff[1] = i.y;
                        buff[2] = i.dx;
                        buff[3] = i.dy;
                        buff[4] = i.ddx;
                        buff[5] = i.ddy;

                        *reinterpret_cast<uint64_t*>(&buff[6]) = i.timestamp;

                        buffer += _msg_size;
                    }
                }
            }

            void deserialize(uint8_t* buffer)
            {
                for(auto i : points)
                {
                    i.x = buffer[0];
                    i.y = buffer[1];
                    i.dx = buffer[2];
                    i.dy = buffer[3];
                    i.ddx = buffer[4];
                    i.ddy = buffer[5];
                    i.timestamp = *reinterpret_cast<uint64_t*>(&buffer[6]);

                    buffer += _msg_size;
                }
            }

        private:
            uint32_t _trajectory_points;
            static size_t const _msg_size;
    };
} 
