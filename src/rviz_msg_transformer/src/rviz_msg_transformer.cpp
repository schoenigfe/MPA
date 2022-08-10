#include "ros/ros.h"

#include <functional>

#include "geometry_msgs/Point.h"
#include "geometry_msgs/Pose2D.h"
#include "geometry_msgs/PoseStamped.h"
#include "nav_msgs/Path.h"

#include "trajecgenerator/c_trajec_vector.h"

#include <tf/transform_broadcaster.h>

/**
 * @brief This node transforms the topics used by the robot to messages which can be used in Rviz.  
 * /move_base_simple/goal (Rviz) --> /robot_1/goal_point (Robot)
 * /robot_1/pose2D (Robot) --> tf Transform (Rviz)
 * /robot_1/trajectory (Robot) --> /robot_1/path (Rviz)
 */
class MsgTransformer : public ros::NodeHandle
{
    public:
        MsgTransformer()
        {
            _goal_point_transformer = subscribe("/move_base_simple/goal", 1, &MsgTransformer::_goal_point_transformer_callback, this);
            _actual_pose_transformer = subscribe("/robot_1/pose2D", 1, &MsgTransformer::_actual_pose_transformer_callback, this);
            _trajectory_transformer = subscribe("/robot_1/trajectory", 1, &MsgTransformer::_trajectory_transformer_callback, this);

            _goal_point_pub = advertise<geometry_msgs::Point>("/robot_1/goal_point", 1);
            _path_pub = advertise<nav_msgs::Path>("/robot_1/path", 1);
        }

    private:
        void _goal_point_transformer_callback(const geometry_msgs::PoseStamped& pose)
        {
            ROS_INFO("_goal_point_callback");

            geometry_msgs::Point point;

            point.x = pose.pose.position.x;
            point.y = pose.pose.position.y;


            _goal_point_pub.publish(point);
        }

        void _actual_pose_transformer_callback(const geometry_msgs::Pose2D& pose)
        {
            ROS_INFO("_actual_pose_callback");

            tf::Transform pose_tf;

            pose_tf.setOrigin(tf::Vector3(pose.x, pose.y, 0));

            tf::Quaternion q;
            q.setRPY(0, 0, pose.theta);
            pose_tf.setRotation(q);

            _actual_pose_pub.sendTransform(tf::StampedTransform(pose_tf, ros::Time::now(), "marvelmind", "robot_1"));
        }

        void _trajectory_transformer_callback(const trajecgenerator::c_trajec_vector trajectory)
        {
            ROS_INFO("_trajectory_callback");

            nav_msgs::Path path;
            path.header.frame_id = "marvelmind";
            path.header.stamp = ros::Time::now();

            for(auto i : trajectory.points)
            {
                geometry_msgs::PoseStamped pose;
                pose.header.frame_id = "marvelmind";

                pose.pose.position.x = i.x;
                pose.pose.position.y = i.y;

                path.poses.push_back(pose);
            }

            _path_pub.publish(path);
        }

        ros::Subscriber _goal_point_transformer;
        ros::Subscriber _actual_pose_transformer;
        ros::Subscriber _trajectory_transformer;

        ros::Publisher _goal_point_pub;
        ros::Publisher _path_pub;

        tf::TransformBroadcaster _actual_pose_pub;

};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "rviz_msg_transformer");

    ROS_INFO("Starting rviz_msg_tranformer!");

    MsgTransformer transformer;

    ros::spin();
    
    return 0;
}
