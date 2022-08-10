# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "trajecgenerator: 2 messages, 8 services")

set(MSG_I_FLAGS "-Itrajecgenerator:/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(trajecgenerator_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg" NAME_WE)
add_custom_target(_trajecgenerator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "trajecgenerator" "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg" ""
)

get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec_vector.msg" NAME_WE)
add_custom_target(_trajecgenerator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "trajecgenerator" "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec_vector.msg" "trajecgenerator/c_trajec"
)

get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCircleTrajecHandler.srv" NAME_WE)
add_custom_target(_trajecgenerator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "trajecgenerator" "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCircleTrajecHandler.srv" ""
)

get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCrSplineTrajecHandler.srv" NAME_WE)
add_custom_target(_trajecgenerator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "trajecgenerator" "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCrSplineTrajecHandler.srv" ""
)

get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCSplineTrajecHandler.srv" NAME_WE)
add_custom_target(_trajecgenerator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "trajecgenerator" "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCSplineTrajecHandler.srv" ""
)

get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/removeTrajecHandler.srv" NAME_WE)
add_custom_target(_trajecgenerator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "trajecgenerator" "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/removeTrajecHandler.srv" ""
)

get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/boolRequest.srv" NAME_WE)
add_custom_target(_trajecgenerator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "trajecgenerator" "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/boolRequest.srv" ""
)

get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/float32Request.srv" NAME_WE)
add_custom_target(_trajecgenerator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "trajecgenerator" "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/float32Request.srv" ""
)

get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajectory.srv" NAME_WE)
add_custom_target(_trajecgenerator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "trajecgenerator" "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajectory.srv" ""
)

get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajecXoY.srv" NAME_WE)
add_custom_target(_trajecgenerator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "trajecgenerator" "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajecXoY.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/trajecgenerator
)
_generate_msg_cpp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec_vector.msg"
  "${MSG_I_FLAGS}"
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/trajecgenerator
)

### Generating Services
_generate_srv_cpp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCircleTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/trajecgenerator
)
_generate_srv_cpp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCrSplineTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/trajecgenerator
)
_generate_srv_cpp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCSplineTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/trajecgenerator
)
_generate_srv_cpp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/removeTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/trajecgenerator
)
_generate_srv_cpp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/boolRequest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/trajecgenerator
)
_generate_srv_cpp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/float32Request.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/trajecgenerator
)
_generate_srv_cpp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/trajecgenerator
)
_generate_srv_cpp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajecXoY.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/trajecgenerator
)

### Generating Module File
_generate_module_cpp(trajecgenerator
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/trajecgenerator
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(trajecgenerator_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(trajecgenerator_generate_messages trajecgenerator_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_cpp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec_vector.msg" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_cpp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCircleTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_cpp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCrSplineTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_cpp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCSplineTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_cpp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/removeTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_cpp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/boolRequest.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_cpp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/float32Request.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_cpp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajectory.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_cpp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajecXoY.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_cpp _trajecgenerator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(trajecgenerator_gencpp)
add_dependencies(trajecgenerator_gencpp trajecgenerator_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS trajecgenerator_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/trajecgenerator
)
_generate_msg_eus(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec_vector.msg"
  "${MSG_I_FLAGS}"
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/trajecgenerator
)

### Generating Services
_generate_srv_eus(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCircleTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/trajecgenerator
)
_generate_srv_eus(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCrSplineTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/trajecgenerator
)
_generate_srv_eus(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCSplineTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/trajecgenerator
)
_generate_srv_eus(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/removeTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/trajecgenerator
)
_generate_srv_eus(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/boolRequest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/trajecgenerator
)
_generate_srv_eus(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/float32Request.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/trajecgenerator
)
_generate_srv_eus(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/trajecgenerator
)
_generate_srv_eus(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajecXoY.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/trajecgenerator
)

### Generating Module File
_generate_module_eus(trajecgenerator
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/trajecgenerator
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(trajecgenerator_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(trajecgenerator_generate_messages trajecgenerator_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_eus _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec_vector.msg" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_eus _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCircleTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_eus _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCrSplineTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_eus _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCSplineTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_eus _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/removeTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_eus _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/boolRequest.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_eus _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/float32Request.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_eus _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajectory.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_eus _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajecXoY.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_eus _trajecgenerator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(trajecgenerator_geneus)
add_dependencies(trajecgenerator_geneus trajecgenerator_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS trajecgenerator_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/trajecgenerator
)
_generate_msg_lisp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec_vector.msg"
  "${MSG_I_FLAGS}"
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/trajecgenerator
)

### Generating Services
_generate_srv_lisp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCircleTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/trajecgenerator
)
_generate_srv_lisp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCrSplineTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/trajecgenerator
)
_generate_srv_lisp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCSplineTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/trajecgenerator
)
_generate_srv_lisp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/removeTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/trajecgenerator
)
_generate_srv_lisp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/boolRequest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/trajecgenerator
)
_generate_srv_lisp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/float32Request.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/trajecgenerator
)
_generate_srv_lisp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/trajecgenerator
)
_generate_srv_lisp(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajecXoY.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/trajecgenerator
)

### Generating Module File
_generate_module_lisp(trajecgenerator
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/trajecgenerator
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(trajecgenerator_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(trajecgenerator_generate_messages trajecgenerator_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_lisp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec_vector.msg" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_lisp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCircleTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_lisp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCrSplineTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_lisp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCSplineTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_lisp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/removeTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_lisp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/boolRequest.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_lisp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/float32Request.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_lisp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajectory.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_lisp _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajecXoY.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_lisp _trajecgenerator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(trajecgenerator_genlisp)
add_dependencies(trajecgenerator_genlisp trajecgenerator_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS trajecgenerator_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/trajecgenerator
)
_generate_msg_nodejs(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec_vector.msg"
  "${MSG_I_FLAGS}"
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/trajecgenerator
)

### Generating Services
_generate_srv_nodejs(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCircleTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/trajecgenerator
)
_generate_srv_nodejs(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCrSplineTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/trajecgenerator
)
_generate_srv_nodejs(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCSplineTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/trajecgenerator
)
_generate_srv_nodejs(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/removeTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/trajecgenerator
)
_generate_srv_nodejs(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/boolRequest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/trajecgenerator
)
_generate_srv_nodejs(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/float32Request.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/trajecgenerator
)
_generate_srv_nodejs(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/trajecgenerator
)
_generate_srv_nodejs(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajecXoY.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/trajecgenerator
)

### Generating Module File
_generate_module_nodejs(trajecgenerator
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/trajecgenerator
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(trajecgenerator_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(trajecgenerator_generate_messages trajecgenerator_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_nodejs _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec_vector.msg" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_nodejs _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCircleTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_nodejs _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCrSplineTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_nodejs _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCSplineTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_nodejs _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/removeTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_nodejs _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/boolRequest.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_nodejs _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/float32Request.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_nodejs _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajectory.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_nodejs _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajecXoY.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_nodejs _trajecgenerator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(trajecgenerator_gennodejs)
add_dependencies(trajecgenerator_gennodejs trajecgenerator_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS trajecgenerator_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/trajecgenerator
)
_generate_msg_py(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec_vector.msg"
  "${MSG_I_FLAGS}"
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/trajecgenerator
)

### Generating Services
_generate_srv_py(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCircleTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/trajecgenerator
)
_generate_srv_py(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCrSplineTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/trajecgenerator
)
_generate_srv_py(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCSplineTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/trajecgenerator
)
_generate_srv_py(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/removeTrajecHandler.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/trajecgenerator
)
_generate_srv_py(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/boolRequest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/trajecgenerator
)
_generate_srv_py(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/float32Request.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/trajecgenerator
)
_generate_srv_py(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/trajecgenerator
)
_generate_srv_py(trajecgenerator
  "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajecXoY.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/trajecgenerator
)

### Generating Module File
_generate_module_py(trajecgenerator
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/trajecgenerator
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(trajecgenerator_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(trajecgenerator_generate_messages trajecgenerator_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec.msg" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_py _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/msg/c_trajec_vector.msg" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_py _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCircleTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_py _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCrSplineTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_py _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/addCSplineTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_py _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/removeTrajecHandler.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_py _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/boolRequest.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_py _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/float32Request.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_py _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajectory.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_py _trajecgenerator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jansimon/catkin_ws/src/Roboterformation_ROS/src/trajecgenerator/srv/plotTrajecXoY.srv" NAME_WE)
add_dependencies(trajecgenerator_generate_messages_py _trajecgenerator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(trajecgenerator_genpy)
add_dependencies(trajecgenerator_genpy trajecgenerator_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS trajecgenerator_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/trajecgenerator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/trajecgenerator
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(trajecgenerator_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET std_srvs_generate_messages_cpp)
  add_dependencies(trajecgenerator_generate_messages_cpp std_srvs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/trajecgenerator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/trajecgenerator
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(trajecgenerator_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET std_srvs_generate_messages_eus)
  add_dependencies(trajecgenerator_generate_messages_eus std_srvs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/trajecgenerator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/trajecgenerator
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(trajecgenerator_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET std_srvs_generate_messages_lisp)
  add_dependencies(trajecgenerator_generate_messages_lisp std_srvs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/trajecgenerator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/trajecgenerator
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(trajecgenerator_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET std_srvs_generate_messages_nodejs)
  add_dependencies(trajecgenerator_generate_messages_nodejs std_srvs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/trajecgenerator)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/trajecgenerator\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/trajecgenerator
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(trajecgenerator_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET std_srvs_generate_messages_py)
  add_dependencies(trajecgenerator_generate_messages_py std_srvs_generate_messages_py)
endif()
