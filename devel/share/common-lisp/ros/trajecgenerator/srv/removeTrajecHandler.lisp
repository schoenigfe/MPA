; Auto-generated. Do not edit!


(cl:in-package trajecgenerator-srv)


;//! \htmlinclude removeTrajecHandler-request.msg.html

(cl:defclass <removeTrajecHandler-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass removeTrajecHandler-request (<removeTrajecHandler-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <removeTrajecHandler-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'removeTrajecHandler-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name trajecgenerator-srv:<removeTrajecHandler-request> is deprecated: use trajecgenerator-srv:removeTrajecHandler-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <removeTrajecHandler-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:name-val is deprecated.  Use trajecgenerator-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <removeTrajecHandler-request>) ostream)
  "Serializes a message object of type '<removeTrajecHandler-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <removeTrajecHandler-request>) istream)
  "Deserializes a message object of type '<removeTrajecHandler-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<removeTrajecHandler-request>)))
  "Returns string type for a service object of type '<removeTrajecHandler-request>"
  "trajecgenerator/removeTrajecHandlerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'removeTrajecHandler-request)))
  "Returns string type for a service object of type 'removeTrajecHandler-request"
  "trajecgenerator/removeTrajecHandlerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<removeTrajecHandler-request>)))
  "Returns md5sum for a message object of type '<removeTrajecHandler-request>"
  "c1f3d28f1b044c871e6eff2e9fc3c667")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'removeTrajecHandler-request)))
  "Returns md5sum for a message object of type 'removeTrajecHandler-request"
  "c1f3d28f1b044c871e6eff2e9fc3c667")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<removeTrajecHandler-request>)))
  "Returns full string definition for message of type '<removeTrajecHandler-request>"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'removeTrajecHandler-request)))
  "Returns full string definition for message of type 'removeTrajecHandler-request"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <removeTrajecHandler-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <removeTrajecHandler-request>))
  "Converts a ROS message object to a list"
  (cl:list 'removeTrajecHandler-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude removeTrajecHandler-response.msg.html

(cl:defclass <removeTrajecHandler-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass removeTrajecHandler-response (<removeTrajecHandler-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <removeTrajecHandler-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'removeTrajecHandler-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name trajecgenerator-srv:<removeTrajecHandler-response> is deprecated: use trajecgenerator-srv:removeTrajecHandler-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <removeTrajecHandler-response>) ostream)
  "Serializes a message object of type '<removeTrajecHandler-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <removeTrajecHandler-response>) istream)
  "Deserializes a message object of type '<removeTrajecHandler-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<removeTrajecHandler-response>)))
  "Returns string type for a service object of type '<removeTrajecHandler-response>"
  "trajecgenerator/removeTrajecHandlerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'removeTrajecHandler-response)))
  "Returns string type for a service object of type 'removeTrajecHandler-response"
  "trajecgenerator/removeTrajecHandlerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<removeTrajecHandler-response>)))
  "Returns md5sum for a message object of type '<removeTrajecHandler-response>"
  "c1f3d28f1b044c871e6eff2e9fc3c667")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'removeTrajecHandler-response)))
  "Returns md5sum for a message object of type 'removeTrajecHandler-response"
  "c1f3d28f1b044c871e6eff2e9fc3c667")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<removeTrajecHandler-response>)))
  "Returns full string definition for message of type '<removeTrajecHandler-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'removeTrajecHandler-response)))
  "Returns full string definition for message of type 'removeTrajecHandler-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <removeTrajecHandler-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <removeTrajecHandler-response>))
  "Converts a ROS message object to a list"
  (cl:list 'removeTrajecHandler-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'removeTrajecHandler)))
  'removeTrajecHandler-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'removeTrajecHandler)))
  'removeTrajecHandler-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'removeTrajecHandler)))
  "Returns string type for a service object of type '<removeTrajecHandler>"
  "trajecgenerator/removeTrajecHandler")