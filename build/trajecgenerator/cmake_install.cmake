# Install script for directory: /home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/jansimon/catkin_ws/src/Roboterformation_ROS/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/trajecgenerator/msg" TYPE FILE FILES
    "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg"
    "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec_vector.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/trajecgenerator/srv" TYPE FILE FILES
    "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCircleTrajecHandler.srv"
    "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCrSplineTrajecHandler.srv"
    "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCSplineTrajecHandler.srv"
    "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/removeTrajecHandler.srv"
    "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/boolRequest.srv"
    "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/float32Request.srv"
    "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajectory.srv"
    "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajecXoY.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/trajecgenerator/cmake" TYPE FILE FILES "/home/jansimon/catkin_ws/src/Roboterformation_ROS/build/trajecgenerator/catkin_generated/installspace/trajecgenerator-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/jansimon/catkin_ws/src/Roboterformation_ROS/devel/include/trajecgenerator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/jansimon/catkin_ws/src/Roboterformation_ROS/devel/share/roseus/ros/trajecgenerator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/jansimon/catkin_ws/src/Roboterformation_ROS/devel/share/common-lisp/ros/trajecgenerator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/jansimon/catkin_ws/src/Roboterformation_ROS/devel/share/gennodejs/ros/trajecgenerator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/jansimon/catkin_ws/src/Roboterformation_ROS/devel/lib/python3/dist-packages/trajecgenerator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/jansimon/catkin_ws/src/Roboterformation_ROS/devel/lib/python3/dist-packages/trajecgenerator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/jansimon/catkin_ws/src/Roboterformation_ROS/build/trajecgenerator/catkin_generated/installspace/trajecgenerator.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/trajecgenerator/cmake" TYPE FILE FILES "/home/jansimon/catkin_ws/src/Roboterformation_ROS/build/trajecgenerator/catkin_generated/installspace/trajecgenerator-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/trajecgenerator/cmake" TYPE FILE FILES
    "/home/jansimon/catkin_ws/src/Roboterformation_ROS/build/trajecgenerator/catkin_generated/installspace/trajecgeneratorConfig.cmake"
    "/home/jansimon/catkin_ws/src/Roboterformation_ROS/build/trajecgenerator/catkin_generated/installspace/trajecgeneratorConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/trajecgenerator" TYPE FILE FILES "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/trajecgenerator" TYPE DIRECTORY FILES "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/include/trajecgenerator/" FILES_MATCHING REGEX "/[^/]*\\.h$" REGEX "/\\.svn$" EXCLUDE)
endif()

