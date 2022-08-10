; Auto-generated. Do not edit!


(cl:in-package trajecgenerator-srv)


;//! \htmlinclude boolRequest-request.msg.html

(cl:defclass <boolRequest-request> (roslisp-msg-protocol:ros-message)
  ((b
    :reader b
    :initarg :b
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass boolRequest-request (<boolRequest-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <boolRequest-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'boolRequest-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name trajecgenerator-srv:<boolRequest-request> is deprecated: use trajecgenerator-srv:boolRequest-request instead.")))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <boolRequest-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:b-val is deprecated.  Use trajecgenerator-srv:b instead.")
  (b m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <boolRequest-request>) ostream)
  "Serializes a message object of type '<boolRequest-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'b) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <boolRequest-request>) istream)
  "Deserializes a message object of type '<boolRequest-request>"
    (cl:setf (cl:slot-value msg 'b) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<boolRequest-request>)))
  "Returns string type for a service object of type '<boolRequest-request>"
  "trajecgenerator/boolRequestRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'boolRequest-request)))
  "Returns string type for a service object of type 'boolRequest-request"
  "trajecgenerator/boolRequestRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<boolRequest-request>)))
  "Returns md5sum for a message object of type '<boolRequest-request>"
  "88c93a4e354c9b18b18fde29f72f94c2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'boolRequest-request)))
  "Returns md5sum for a message object of type 'boolRequest-request"
  "88c93a4e354c9b18b18fde29f72f94c2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<boolRequest-request>)))
  "Returns full string definition for message of type '<boolRequest-request>"
  (cl:format cl:nil "bool b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'boolRequest-request)))
  "Returns full string definition for message of type 'boolRequest-request"
  (cl:format cl:nil "bool b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <boolRequest-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <boolRequest-request>))
  "Converts a ROS message object to a list"
  (cl:list 'boolRequest-request
    (cl:cons ':b (b msg))
))
;//! \htmlinclude boolRequest-response.msg.html

(cl:defclass <boolRequest-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass boolRequest-response (<boolRequest-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <boolRequest-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'boolRequest-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name trajecgenerator-srv:<boolRequest-response> is deprecated: use trajecgenerator-srv:boolRequest-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <boolRequest-response>) ostream)
  "Serializes a message object of type '<boolRequest-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <boolRequest-response>) istream)
  "Deserializes a message object of type '<boolRequest-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<boolRequest-response>)))
  "Returns string type for a service object of type '<boolRequest-response>"
  "trajecgenerator/boolRequestResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'boolRequest-response)))
  "Returns string type for a service object of type 'boolRequest-response"
  "trajecgenerator/boolRequestResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<boolRequest-response>)))
  "Returns md5sum for a message object of type '<boolRequest-response>"
  "88c93a4e354c9b18b18fde29f72f94c2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'boolRequest-response)))
  "Returns md5sum for a message object of type 'boolRequest-response"
  "88c93a4e354c9b18b18fde29f72f94c2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<boolRequest-response>)))
  "Returns full string definition for message of type '<boolRequest-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'boolRequest-response)))
  "Returns full string definition for message of type 'boolRequest-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <boolRequest-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <boolRequest-response>))
  "Converts a ROS message object to a list"
  (cl:list 'boolRequest-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'boolRequest)))
  'boolRequest-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'boolRequest)))
  'boolRequest-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'boolRequest)))
  "Returns string type for a service object of type '<boolRequest>"
  "trajecgenerator/boolRequest")