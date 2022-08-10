; Auto-generated. Do not edit!


(cl:in-package trajecgenerator-srv)


;//! \htmlinclude addCircleTrajecHandler-request.msg.html

(cl:defclass <addCircleTrajecHandler-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (mx
    :reader mx
    :initarg :mx
    :type cl:float
    :initform 0.0)
   (my
    :reader my
    :initarg :my
    :type cl:float
    :initform 0.0)
   (a
    :reader a
    :initarg :a
    :type cl:float
    :initform 0.0)
   (b
    :reader b
    :initarg :b
    :type cl:float
    :initform 0.0)
   (time
    :reader time
    :initarg :time
    :type cl:float
    :initform 0.0)
   (k
    :reader k
    :initarg :k
    :type cl:float
    :initform 0.0))
)

(cl:defclass addCircleTrajecHandler-request (<addCircleTrajecHandler-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <addCircleTrajecHandler-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'addCircleTrajecHandler-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name trajecgenerator-srv:<addCircleTrajecHandler-request> is deprecated: use trajecgenerator-srv:addCircleTrajecHandler-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <addCircleTrajecHandler-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:name-val is deprecated.  Use trajecgenerator-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'mx-val :lambda-list '(m))
(cl:defmethod mx-val ((m <addCircleTrajecHandler-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:mx-val is deprecated.  Use trajecgenerator-srv:mx instead.")
  (mx m))

(cl:ensure-generic-function 'my-val :lambda-list '(m))
(cl:defmethod my-val ((m <addCircleTrajecHandler-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:my-val is deprecated.  Use trajecgenerator-srv:my instead.")
  (my m))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <addCircleTrajecHandler-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:a-val is deprecated.  Use trajecgenerator-srv:a instead.")
  (a m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <addCircleTrajecHandler-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:b-val is deprecated.  Use trajecgenerator-srv:b instead.")
  (b m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <addCircleTrajecHandler-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:time-val is deprecated.  Use trajecgenerator-srv:time instead.")
  (time m))

(cl:ensure-generic-function 'k-val :lambda-list '(m))
(cl:defmethod k-val ((m <addCircleTrajecHandler-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:k-val is deprecated.  Use trajecgenerator-srv:k instead.")
  (k m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <addCircleTrajecHandler-request>) ostream)
  "Serializes a message object of type '<addCircleTrajecHandler-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'my))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'a))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'b))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'k))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <addCircleTrajecHandler-request>) istream)
  "Deserializes a message object of type '<addCircleTrajecHandler-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mx) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'my) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'a) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'b) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'k) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<addCircleTrajecHandler-request>)))
  "Returns string type for a service object of type '<addCircleTrajecHandler-request>"
  "trajecgenerator/addCircleTrajecHandlerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addCircleTrajecHandler-request)))
  "Returns string type for a service object of type 'addCircleTrajecHandler-request"
  "trajecgenerator/addCircleTrajecHandlerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<addCircleTrajecHandler-request>)))
  "Returns md5sum for a message object of type '<addCircleTrajecHandler-request>"
  "4a4faaf714cc18070417071d78411d73")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'addCircleTrajecHandler-request)))
  "Returns md5sum for a message object of type 'addCircleTrajecHandler-request"
  "4a4faaf714cc18070417071d78411d73")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<addCircleTrajecHandler-request>)))
  "Returns full string definition for message of type '<addCircleTrajecHandler-request>"
  (cl:format cl:nil "string name~%float32 mx~%float32 my~%float32 a~%float32 b~%float32 time~%float32 k~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'addCircleTrajecHandler-request)))
  "Returns full string definition for message of type 'addCircleTrajecHandler-request"
  (cl:format cl:nil "string name~%float32 mx~%float32 my~%float32 a~%float32 b~%float32 time~%float32 k~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <addCircleTrajecHandler-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <addCircleTrajecHandler-request>))
  "Converts a ROS message object to a list"
  (cl:list 'addCircleTrajecHandler-request
    (cl:cons ':name (name msg))
    (cl:cons ':mx (mx msg))
    (cl:cons ':my (my msg))
    (cl:cons ':a (a msg))
    (cl:cons ':b (b msg))
    (cl:cons ':time (time msg))
    (cl:cons ':k (k msg))
))
;//! \htmlinclude addCircleTrajecHandler-response.msg.html

(cl:defclass <addCircleTrajecHandler-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass addCircleTrajecHandler-response (<addCircleTrajecHandler-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <addCircleTrajecHandler-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'addCircleTrajecHandler-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name trajecgenerator-srv:<addCircleTrajecHandler-response> is deprecated: use trajecgenerator-srv:addCircleTrajecHandler-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <addCircleTrajecHandler-response>) ostream)
  "Serializes a message object of type '<addCircleTrajecHandler-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <addCircleTrajecHandler-response>) istream)
  "Deserializes a message object of type '<addCircleTrajecHandler-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<addCircleTrajecHandler-response>)))
  "Returns string type for a service object of type '<addCircleTrajecHandler-response>"
  "trajecgenerator/addCircleTrajecHandlerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addCircleTrajecHandler-response)))
  "Returns string type for a service object of type 'addCircleTrajecHandler-response"
  "trajecgenerator/addCircleTrajecHandlerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<addCircleTrajecHandler-response>)))
  "Returns md5sum for a message object of type '<addCircleTrajecHandler-response>"
  "4a4faaf714cc18070417071d78411d73")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'addCircleTrajecHandler-response)))
  "Returns md5sum for a message object of type 'addCircleTrajecHandler-response"
  "4a4faaf714cc18070417071d78411d73")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<addCircleTrajecHandler-response>)))
  "Returns full string definition for message of type '<addCircleTrajecHandler-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'addCircleTrajecHandler-response)))
  "Returns full string definition for message of type 'addCircleTrajecHandler-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <addCircleTrajecHandler-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <addCircleTrajecHandler-response>))
  "Converts a ROS message object to a list"
  (cl:list 'addCircleTrajecHandler-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'addCircleTrajecHandler)))
  'addCircleTrajecHandler-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'addCircleTrajecHandler)))
  'addCircleTrajecHandler-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addCircleTrajecHandler)))
  "Returns string type for a service object of type '<addCircleTrajecHandler>"
  "trajecgenerator/addCircleTrajecHandler")