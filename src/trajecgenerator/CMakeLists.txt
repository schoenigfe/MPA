cmake_minimum_required(VERSION 3.0.2)
project(trajecgenerator)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  message_generation
  std_srvs
)

#cpp Version 17 verwenden:
add_compile_options(-std=c++17)



## Generate messages in the 'msg' folder
 add_message_files(
   FILES
   c_trajec.msg
   c_trajec_vector.msg
 )

## Generate services in the 'srv' folder
 add_service_files(DIRECTORY srv FILES
                  addCircleTrajecHandler.srv
                  addCrSplineTrajecHandler.srv
                  addCSplineTrajecHandler.srv
                  removeTrajecHandler.srv
                  boolRequest.srv
                  float32Request.srv
                  plotTrajectory.srv
                  plotTrajecXoY.srv
                  )


## Generate added messages and services with any dependencies listed here
 generate_messages(
   DEPENDENCIES
   std_msgs
   std_srvs
 )


catkin_package(
#  LIBRARIES trajecgenerator
  CATKIN_DEPENDS roscpp std_msgs
#  DEPENDS system_lib
)


###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

#set(trajecgenerator_node_SRCS_1
#  src/spline.cpp
#  src/trajecgenerator.cpp
#  src/crspline.cpp
#  src/trajectory.cpp
#  src/circletrajectory.cpp
#  src/crsplinetrajectory.cpp
#  src/csplinetrajectory.cpp
#  src/trajechandler.cpp
#  src/trajecmaster.cpp
#)

#add_executable(trajecgenerator_node_1 ${trajecgenerator_node_SRCS_1})

#arget_link_libraries(trajecgenerator_node_1
#  ${catkin_LIBRARIES}
#  -lboost_iostreams
#)

set(trajecgenerator_node_SRCS
  src/spline.cpp
  src/main.cpp
  src/trajechandler.cpp
  src/trajecmaster.cpp
  src/trajectory.cpp
  src/circletrajectory.cpp
  src/crsplinetrajectory.cpp
  src/csplinetrajectory.cpp
  src/trajectorobot.cpp
)
add_executable(trajecgenerator_node ${trajecgenerator_node_SRCS})

target_link_libraries(trajecgenerator_node
  ${catkin_LIBRARIES}
  -lboost_iostreams
)

add_dependencies(trajecgenerator_node trajecgenerator_gencpp)

## Mark cpp header files for installation
 install(DIRECTORY include/${PROJECT_NAME}/
   DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
   FILES_MATCHING PATTERN "*.h"
   PATTERN ".svn" EXCLUDE
 )
