; Auto-generated. Do not edit!


(cl:in-package trajecgenerator-msg)


;//! \htmlinclude c_trajec_vector.msg.html

(cl:defclass <c_trajec_vector> (roslisp-msg-protocol:ros-message)
  ((points
    :reader points
    :initarg :points
    :type (cl:vector trajecgenerator-msg:c_trajec)
   :initform (cl:make-array 0 :element-type 'trajecgenerator-msg:c_trajec :initial-element (cl:make-instance 'trajecgenerator-msg:c_trajec))))
)

(cl:defclass c_trajec_vector (<c_trajec_vector>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <c_trajec_vector>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'c_trajec_vector)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name trajecgenerator-msg:<c_trajec_vector> is deprecated: use trajecgenerator-msg:c_trajec_vector instead.")))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <c_trajec_vector>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-msg:points-val is deprecated.  Use trajecgenerator-msg:points instead.")
  (points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <c_trajec_vector>) ostream)
  "Serializes a message object of type '<c_trajec_vector>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <c_trajec_vector>) istream)
  "Deserializes a message object of type '<c_trajec_vector>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'trajecgenerator-msg:c_trajec))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<c_trajec_vector>)))
  "Returns string type for a message object of type '<c_trajec_vector>"
  "trajecgenerator/c_trajec_vector")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'c_trajec_vector)))
  "Returns string type for a message object of type 'c_trajec_vector"
  "trajecgenerator/c_trajec_vector")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<c_trajec_vector>)))
  "Returns md5sum for a message object of type '<c_trajec_vector>"
  "d88f63147d96501d5ff38e0f76d36cc9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'c_trajec_vector)))
  "Returns md5sum for a message object of type 'c_trajec_vector"
  "d88f63147d96501d5ff38e0f76d36cc9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<c_trajec_vector>)))
  "Returns full string definition for message of type '<c_trajec_vector>"
  (cl:format cl:nil "c_trajec[] points~%~%================================================================================~%MSG: trajecgenerator/c_trajec~%float32 x~%float32 y~%float32 dx~%float32 dy~%float32 ddx~%float32 ddy~%uint64 timestamp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'c_trajec_vector)))
  "Returns full string definition for message of type 'c_trajec_vector"
  (cl:format cl:nil "c_trajec[] points~%~%================================================================================~%MSG: trajecgenerator/c_trajec~%float32 x~%float32 y~%float32 dx~%float32 dy~%float32 ddx~%float32 ddy~%uint64 timestamp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <c_trajec_vector>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <c_trajec_vector>))
  "Converts a ROS message object to a list"
  (cl:list 'c_trajec_vector
    (cl:cons ':points (points msg))
))
