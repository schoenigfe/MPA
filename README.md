# Roboterformation ROS Repository
__Roboterformation__ is a student project aiming to create a system of multiple mobile robots, which are able to drive in formation.

## Getting Started
* Follow the ROS Noetic [Installation Instruction](http://wiki.ros.org/noetic/Installation)
* Clone the Roboterformation ROS workspace with `git clone`
* run `catkin_make` to build the packages
* make sure the workspace is sourced with `. devel/setup.bash`
* start the rosmaster with `roscore`
* start the nodes with `rosrun <package_name> <node_name>`

## Ros Robot Bridge
This nodes acts as a TCP server for the ROS <--> Robot communication. It accepts connections from clients on port 2888.  

``rosrun ros_bridge_server ros_bridge_server``


## Trajectorygenerator
The Trajectorygenerator node is responsible for creating Circle/Ellipse-, CrSpline- and CSplinetrajectories.
This node was written by a previous student group, but adapted to publish custom __c_trajec_vector__ messages.


``rosrun trajecgenerator trajecgenerator_node`` 

The node will continuously publish trajectories and can be started by calling following services: 
* `rosservice call /m1/addCircleTrajecHandler`
* `rosservice call /m1/addCrSplineTrajecHandler`
* `rosservice call /m1/addCSplineTrajecHandler`
* `rosservice call /m1/removeTrajecHandler` to stop trajectory generation

Check the documentation of the previous student group for the meaning of the different Service parameters.  
**Note:** Set the __name__ parameter to the robot/namespace name. Because only continuous publishing is possible the __closed__ parameter of the Spline Service must be set to __true__.

## Rviz Message Transformer
This node transforms the topics used by the robot to messages which can be used in Rviz.  
* /move_base_simple/goal (Rviz) --> /robot_1/goal_point (Robot)
* /robot_1/pose2D (Robot) --> tf Transform (Rviz)
* /robot_1/trajectory (Robot) --> /robot_1/path (Rviz)

``rosrun rviz_msg_tranformer rviz_msg_transformer``

Start Rviz with the command `rviz` and load the configuration file located in the rviz folder.
A Goal Point can be puslished with the 2D Nav Goal option.

## Data Logger
This node is the endpoint to the DataLogger component in the Roboterformation ESP-IDF repository.
Without using the __data_logger__ node logging can be started by publishing a logging time (in seconds) to the topic `/robot_*/start_log`. The log data will then be published on the topic `/robot_*/data_log` for the specified time.

``rosrun data_logger data_logger``

This node will automatically start the logging and accumulate the data in a __.csv__ file.
The behaviour can be customized with the ROS parameters: __robot_name__, __logging_mode__, __log_time__, __log_file__.

