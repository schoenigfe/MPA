; Auto-generated. Do not edit!


(cl:in-package trajecgenerator-srv)


;//! \htmlinclude plotTrajecXoY-request.msg.html

(cl:defclass <plotTrajecXoY-request> (roslisp-msg-protocol:ros-message)
  ((title
    :reader title
    :initarg :title
    :type cl:string
    :initform "")
   (typeXoY
    :reader typeXoY
    :initarg :typeXoY
    :type cl:fixnum
    :initform 0)
   (maxT
    :reader maxT
    :initarg :maxT
    :type cl:float
    :initform 0.0)
   (dT
    :reader dT
    :initarg :dT
    :type cl:float
    :initform 0.0)
   (k
    :reader k
    :initarg :k
    :type cl:float
    :initform 0.0)
   (xrange
    :reader xrange
    :initarg :xrange
    :type (cl:vector cl:float)
   :initform (cl:make-array 2 :element-type 'cl:float :initial-element 0.0))
   (yrange
    :reader yrange
    :initarg :yrange
    :type (cl:vector cl:float)
   :initform (cl:make-array 2 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass plotTrajecXoY-request (<plotTrajecXoY-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <plotTrajecXoY-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'plotTrajecXoY-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name trajecgenerator-srv:<plotTrajecXoY-request> is deprecated: use trajecgenerator-srv:plotTrajecXoY-request instead.")))

(cl:ensure-generic-function 'title-val :lambda-list '(m))
(cl:defmethod title-val ((m <plotTrajecXoY-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:title-val is deprecated.  Use trajecgenerator-srv:title instead.")
  (title m))

(cl:ensure-generic-function 'typeXoY-val :lambda-list '(m))
(cl:defmethod typeXoY-val ((m <plotTrajecXoY-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:typeXoY-val is deprecated.  Use trajecgenerator-srv:typeXoY instead.")
  (typeXoY m))

(cl:ensure-generic-function 'maxT-val :lambda-list '(m))
(cl:defmethod maxT-val ((m <plotTrajecXoY-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:maxT-val is deprecated.  Use trajecgenerator-srv:maxT instead.")
  (maxT m))

(cl:ensure-generic-function 'dT-val :lambda-list '(m))
(cl:defmethod dT-val ((m <plotTrajecXoY-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:dT-val is deprecated.  Use trajecgenerator-srv:dT instead.")
  (dT m))

(cl:ensure-generic-function 'k-val :lambda-list '(m))
(cl:defmethod k-val ((m <plotTrajecXoY-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:k-val is deprecated.  Use trajecgenerator-srv:k instead.")
  (k m))

(cl:ensure-generic-function 'xrange-val :lambda-list '(m))
(cl:defmethod xrange-val ((m <plotTrajecXoY-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:xrange-val is deprecated.  Use trajecgenerator-srv:xrange instead.")
  (xrange m))

(cl:ensure-generic-function 'yrange-val :lambda-list '(m))
(cl:defmethod yrange-val ((m <plotTrajecXoY-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader trajecgenerator-srv:yrange-val is deprecated.  Use trajecgenerator-srv:yrange instead.")
  (yrange m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <plotTrajecXoY-request>) ostream)
  "Serializes a message object of type '<plotTrajecXoY-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'title))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'title))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'typeXoY)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'maxT))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dT))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'k))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'xrange))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'yrange))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <plotTrajecXoY-request>) istream)
  "Deserializes a message object of type '<plotTrajecXoY-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'title) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'title) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'typeXoY)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'maxT) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dT) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'k) (roslisp-utils:decode-single-float-bits bits)))
  (cl:setf (cl:slot-value msg 'xrange) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'xrange)))
    (cl:dotimes (i 2)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'yrange) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'yrange)))
    (cl:dotimes (i 2)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<plotTrajecXoY-request>)))
  "Returns string type for a service object of type '<plotTrajecXoY-request>"
  "trajecgenerator/plotTrajecXoYRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'plotTrajecXoY-request)))
  "Returns string type for a service object of type 'plotTrajecXoY-request"
  "trajecgenerator/plotTrajecXoYRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<plotTrajecXoY-request>)))
  "Returns md5sum for a message object of type '<plotTrajecXoY-request>"
  "af80c98d097b90c478c238e3c9f71a07")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'plotTrajecXoY-request)))
  "Returns md5sum for a message object of type 'plotTrajecXoY-request"
  "af80c98d097b90c478c238e3c9f71a07")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<plotTrajecXoY-request>)))
  "Returns full string definition for message of type '<plotTrajecXoY-request>"
  (cl:format cl:nil "string title~%uint8 typeXoY   # 0 für x, 1 für y~%float32 maxT~%float32 dT~%float32 k~%float32[2] xrange~%float32[2] yrange~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'plotTrajecXoY-request)))
  "Returns full string definition for message of type 'plotTrajecXoY-request"
  (cl:format cl:nil "string title~%uint8 typeXoY   # 0 für x, 1 für y~%float32 maxT~%float32 dT~%float32 k~%float32[2] xrange~%float32[2] yrange~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <plotTrajecXoY-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'title))
     1
     4
     4
     4
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'xrange) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'yrange) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <plotTrajecXoY-request>))
  "Converts a ROS message object to a list"
  (cl:list 'plotTrajecXoY-request
    (cl:cons ':title (title msg))
    (cl:cons ':typeXoY (typeXoY msg))
    (cl:cons ':maxT (maxT msg))
    (cl:cons ':dT (dT msg))
    (cl:cons ':k (k msg))
    (cl:cons ':xrange (xrange msg))
    (cl:cons ':yrange (yrange msg))
))
;//! \htmlinclude plotTrajecXoY-response.msg.html

(cl:defclass <plotTrajecXoY-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass plotTrajecXoY-response (<plotTrajecXoY-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <plotTrajecXoY-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'plotTrajecXoY-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name trajecgenerator-srv:<plotTrajecXoY-response> is deprecated: use trajecgenerator-srv:plotTrajecXoY-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <plotTrajecXoY-response>) ostream)
  "Serializes a message object of type '<plotTrajecXoY-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <plotTrajecXoY-response>) istream)
  "Deserializes a message object of type '<plotTrajecXoY-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<plotTrajecXoY-response>)))
  "Returns string type for a service object of type '<plotTrajecXoY-response>"
  "trajecgenerator/plotTrajecXoYResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'plotTrajecXoY-response)))
  "Returns string type for a service object of type 'plotTrajecXoY-response"
  "trajecgenerator/plotTrajecXoYResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<plotTrajecXoY-response>)))
  "Returns md5sum for a message object of type '<plotTrajecXoY-response>"
  "af80c98d097b90c478c238e3c9f71a07")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'plotTrajecXoY-response)))
  "Returns md5sum for a message object of type 'plotTrajecXoY-response"
  "af80c98d097b90c478c238e3c9f71a07")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<plotTrajecXoY-response>)))
  "Returns full string definition for message of type '<plotTrajecXoY-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'plotTrajecXoY-response)))
  "Returns full string definition for message of type 'plotTrajecXoY-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <plotTrajecXoY-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <plotTrajecXoY-response>))
  "Converts a ROS message object to a list"
  (cl:list 'plotTrajecXoY-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'plotTrajecXoY)))
  'plotTrajecXoY-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'plotTrajecXoY)))
  'plotTrajecXoY-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'plotTrajecXoY)))
  "Returns string type for a service object of type '<plotTrajecXoY>"
  "trajecgenerator/plotTrajecXoY")