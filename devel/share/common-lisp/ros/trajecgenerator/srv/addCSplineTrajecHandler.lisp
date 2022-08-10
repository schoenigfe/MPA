; Auto-generated. Do not edit!


(cl:in-package trajecgenerator-srv)


;//! \htmlinclude addCSplineTrajecHandler-request.msg.html

(cl:defclass <addCSplineTrajecHandler-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (pointsX
    :reader pointsX
    :initarg :pointsX
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (pointsY
    :reader pointsY
    :initarg :pointsY
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (T
    :reader T
    :initarg :T
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0)
   (closed
    :reader closed
    :initarg :closed
    :type cl:boolean
    :initform cl:nil)
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

(cl:defclass addCSplineTrajecHandler-request (<addCSplineTrajecHandler-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <addCSplineTrajecHandler-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'addCSplineTrajecHandler-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name trajecgenerator-srv:<addCSplineTrajecHandler-request> is deprecated: use trajecgenerator-srv:addCSplineTrajecHandler-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <addCSplineTrajecHandler-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:name-val is deprecated.  Use trajecgenerator-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'pointsX-val :lambda-list '(m))
(cl:defmethod pointsX-val ((m <addCSplineTrajecHandler-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:pointsX-val is deprecated.  Use trajecgenerator-srv:pointsX instead.")
  (pointsX m))

(cl:ensure-generic-function 'pointsY-val :lambda-list '(m))
(cl:defmethod pointsY-val ((m <addCSplineTrajecHandler-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:pointsY-val is deprecated.  Use trajecgenerator-srv:pointsY instead.")
  (pointsY m))

(cl:ensure-generic-function 'T-val :lambda-list '(m))
(cl:defmethod T-val ((m <addCSplineTrajecHandler-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:T-val is deprecated.  Use trajecgenerator-srv:T instead.")
  (T m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <addCSplineTrajecHandler-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:type-val is deprecated.  Use trajecgenerator-srv:type instead.")
  (type m))

(cl:ensure-generic-function 'closed-val :lambda-list '(m))
(cl:defmethod closed-val ((m <addCSplineTrajecHandler-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:closed-val is deprecated.  Use trajecgenerator-srv:closed instead.")
  (closed m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <addCSplineTrajecHandler-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:time-val is deprecated.  Use trajecgenerator-srv:time instead.")
  (time m))

(cl:ensure-generic-function 'k-val :lambda-list '(m))
(cl:defmethod k-val ((m <addCSplineTrajecHandler-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:k-val is deprecated.  Use trajecgenerator-srv:k instead.")
  (k m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <addCSplineTrajecHandler-request>) ostream)
  "Serializes a message object of type '<addCSplineTrajecHandler-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pointsX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'pointsX))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pointsY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'pointsY))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'T))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'T))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'closed) 1 0)) ostream)
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <addCSplineTrajecHandler-request>) istream)
  "Deserializes a message object of type '<addCSplineTrajecHandler-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pointsX) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pointsX)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pointsY) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pointsY)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'T) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'T)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'closed) (cl:not (cl:zerop (cl:read-byte istream))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<addCSplineTrajecHandler-request>)))
  "Returns string type for a service object of type '<addCSplineTrajecHandler-request>"
  "trajecgenerator/addCSplineTrajecHandlerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addCSplineTrajecHandler-request)))
  "Returns string type for a service object of type 'addCSplineTrajecHandler-request"
  "trajecgenerator/addCSplineTrajecHandlerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<addCSplineTrajecHandler-request>)))
  "Returns md5sum for a message object of type '<addCSplineTrajecHandler-request>"
  "b8d56f785274552c60142c0b2c2c3c51")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'addCSplineTrajecHandler-request)))
  "Returns md5sum for a message object of type 'addCSplineTrajecHandler-request"
  "b8d56f785274552c60142c0b2c2c3c51")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<addCSplineTrajecHandler-request>)))
  "Returns full string definition for message of type '<addCSplineTrajecHandler-request>"
  (cl:format cl:nil "string name~%float32[] pointsX~%float32[] pointsY~%float32[] T~%uint8 type  #  0: cspline, 1: cspline_hermite, 2: linear~%bool closed~%float32 time~%float32 k~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'addCSplineTrajecHandler-request)))
  "Returns full string definition for message of type 'addCSplineTrajecHandler-request"
  (cl:format cl:nil "string name~%float32[] pointsX~%float32[] pointsY~%float32[] T~%uint8 type  #  0: cspline, 1: cspline_hermite, 2: linear~%bool closed~%float32 time~%float32 k~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <addCSplineTrajecHandler-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pointsX) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pointsY) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'T) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     1
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <addCSplineTrajecHandler-request>))
  "Converts a ROS message object to a list"
  (cl:list 'addCSplineTrajecHandler-request
    (cl:cons ':name (name msg))
    (cl:cons ':pointsX (pointsX msg))
    (cl:cons ':pointsY (pointsY msg))
    (cl:cons ':T (T msg))
    (cl:cons ':type (type msg))
    (cl:cons ':closed (closed msg))
    (cl:cons ':time (time msg))
    (cl:cons ':k (k msg))
))
;//! \htmlinclude addCSplineTrajecHandler-response.msg.html

(cl:defclass <addCSplineTrajecHandler-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass addCSplineTrajecHandler-response (<addCSplineTrajecHandler-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <addCSplineTrajecHandler-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'addCSplineTrajecHandler-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name trajecgenerator-srv:<addCSplineTrajecHandler-response> is deprecated: use trajecgenerator-srv:addCSplineTrajecHandler-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <addCSplineTrajecHandler-response>) ostream)
  "Serializes a message object of type '<addCSplineTrajecHandler-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <addCSplineTrajecHandler-response>) istream)
  "Deserializes a message object of type '<addCSplineTrajecHandler-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<addCSplineTrajecHandler-response>)))
  "Returns string type for a service object of type '<addCSplineTrajecHandler-response>"
  "trajecgenerator/addCSplineTrajecHandlerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addCSplineTrajecHandler-response)))
  "Returns string type for a service object of type 'addCSplineTrajecHandler-response"
  "trajecgenerator/addCSplineTrajecHandlerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<addCSplineTrajecHandler-response>)))
  "Returns md5sum for a message object of type '<addCSplineTrajecHandler-response>"
  "b8d56f785274552c60142c0b2c2c3c51")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'addCSplineTrajecHandler-response)))
  "Returns md5sum for a message object of type 'addCSplineTrajecHandler-response"
  "b8d56f785274552c60142c0b2c2c3c51")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<addCSplineTrajecHandler-response>)))
  "Returns full string definition for message of type '<addCSplineTrajecHandler-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'addCSplineTrajecHandler-response)))
  "Returns full string definition for message of type 'addCSplineTrajecHandler-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <addCSplineTrajecHandler-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <addCSplineTrajecHandler-response>))
  "Converts a ROS message object to a list"
  (cl:list 'addCSplineTrajecHandler-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'addCSplineTrajecHandler)))
  'addCSplineTrajecHandler-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'addCSplineTrajecHandler)))
  'addCSplineTrajecHandler-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addCSplineTrajecHandler)))
  "Returns string type for a service object of type '<addCSplineTrajecHandler>"
  "trajecgenerator/addCSplineTrajecHandler")