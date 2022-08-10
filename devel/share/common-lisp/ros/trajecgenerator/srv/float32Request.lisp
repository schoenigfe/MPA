; Auto-generated. Do not edit!


(cl:in-package trajecgenerator-srv)


;//! \htmlinclude float32Request-request.msg.html

(cl:defclass <float32Request-request> (roslisp-msg-protocol:ros-message)
  ((f
    :reader f
    :initarg :f
    :type cl:float
    :initform 0.0))
)

(cl:defclass float32Request-request (<float32Request-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <float32Request-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'float32Request-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name trajecgenerator-srv:<float32Request-request> is deprecated: use trajecgenerator-srv:float32Request-request instead.")))

(cl:ensure-generic-function 'f-val :lambda-list '(m))
(cl:defmethod f-val ((m <float32Request-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:f-val is deprecated.  Use trajecgenerator-srv:f instead.")
  (f m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <float32Request-request>) ostream)
  "Serializes a message object of type '<float32Request-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <float32Request-request>) istream)
  "Deserializes a message object of type '<float32Request-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<float32Request-request>)))
  "Returns string type for a service object of type '<float32Request-request>"
  "trajecgenerator/float32RequestRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'float32Request-request)))
  "Returns string type for a service object of type 'float32Request-request"
  "trajecgenerator/float32RequestRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<float32Request-request>)))
  "Returns md5sum for a message object of type '<float32Request-request>"
  "29e3b508ca3c2e2afe7cfe66d63c0a51")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'float32Request-request)))
  "Returns md5sum for a message object of type 'float32Request-request"
  "29e3b508ca3c2e2afe7cfe66d63c0a51")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<float32Request-request>)))
  "Returns full string definition for message of type '<float32Request-request>"
  (cl:format cl:nil "float32 f~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'float32Request-request)))
  "Returns full string definition for message of type 'float32Request-request"
  (cl:format cl:nil "float32 f~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <float32Request-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <float32Request-request>))
  "Converts a ROS message object to a list"
  (cl:list 'float32Request-request
    (cl:cons ':f (f msg))
))
;//! \htmlinclude float32Request-response.msg.html

(cl:defclass <float32Request-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass float32Request-response (<float32Request-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <float32Request-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'float32Request-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name trajecgenerator-srv:<float32Request-response> is deprecated: use trajecgenerator-srv:float32Request-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <float32Request-response>) ostream)
  "Serializes a message object of type '<float32Request-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <float32Request-response>) istream)
  "Deserializes a message object of type '<float32Request-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<float32Request-response>)))
  "Returns string type for a service object of type '<float32Request-response>"
  "trajecgenerator/float32RequestResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'float32Request-response)))
  "Returns string type for a service object of type 'float32Request-response"
  "trajecgenerator/float32RequestResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<float32Request-response>)))
  "Returns md5sum for a message object of type '<float32Request-response>"
  "29e3b508ca3c2e2afe7cfe66d63c0a51")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'float32Request-response)))
  "Returns md5sum for a message object of type 'float32Request-response"
  "29e3b508ca3c2e2afe7cfe66d63c0a51")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<float32Request-response>)))
  "Returns full string definition for message of type '<float32Request-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'float32Request-response)))
  "Returns full string definition for message of type 'float32Request-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <float32Request-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <float32Request-response>))
  "Converts a ROS message object to a list"
  (cl:list 'float32Request-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'float32Request)))
  'float32Request-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'float32Request)))
  'float32Request-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'float32Request)))
  "Returns string type for a service object of type '<float32Request>"
  "trajecgenerator/float32Request")