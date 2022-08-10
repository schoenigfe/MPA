;; Auto-generated. Do not edit!


(when (boundp 'trajecgenerator::c_trajec)
  (if (not (find-package "TRAJECGENERATOR"))
    (make-package "TRAJECGENERATOR"))
  (shadow 'c_trajec (find-package "TRAJECGENERATOR")))
(unless (find-package "TRAJECGENERATOR::C_TRAJEC")
  (make-package "TRAJECGENERATOR::C_TRAJEC"))

(in-package "ROS")
;;//! \htmlinclude c_trajec.msg.html


(defclass trajecgenerator::c_trajec
  :super ros::object
  :slots (_x _y _dx _dy _ddx _ddy _timestamp ))

(defmethod trajecgenerator::c_trajec
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:dx __dx) 0.0)
    ((:dy __dy) 0.0)
    ((:ddx __ddx) 0.0)
    ((:ddy __ddy) 0.0)
    ((:timestamp __timestamp) 0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _dx (float __dx))
   (setq _dy (float __dy))
   (setq _ddx (float __ddx))
   (setq _ddy (float __ddy))
   (setq _timestamp (round __timestamp))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:dx
   (&optional __dx)
   (if __dx (setq _dx __dx)) _dx)
  (:dy
   (&optional __dy)
   (if __dy (setq _dy __dy)) _dy)
  (:ddx
   (&optional __ddx)
   (if __ddx (setq _ddx __ddx)) _ddx)
  (:ddy
   (&optional __ddy)
   (if __ddy (setq _ddy __ddy)) _ddy)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _dx
    4
    ;; float32 _dy
    4
    ;; float32 _ddx
    4
    ;; float32 _ddy
    4
    ;; uint64 _timestamp
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _dx
       (sys::poke _dx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _dy
       (sys::poke _dy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ddx
       (sys::poke _ddx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ddy
       (sys::poke _ddy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint64 _timestamp
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _timestamp (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _timestamp) (= (length (_timestamp . bv)) 2)) ;; bignum
              (write-long (ash (elt (_timestamp . bv) 0) 0) s)
              (write-long (ash (elt (_timestamp . bv) 1) -1) s))
             ((and (class _timestamp) (= (length (_timestamp . bv)) 1)) ;; big1
              (write-long (elt (_timestamp . bv) 0) s)
              (write-long (if (>= _timestamp 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _timestamp s)(write-long (if (>= _timestamp 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _dx
     (setq _dx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _dy
     (setq _dy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ddx
     (setq _ddx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ddy
     (setq _ddy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint64 _timestamp
     
#+(or :alpha :irix6 :x86_64)
      (setf _timestamp (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _timestamp (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get trajecgenerator::c_trajec :md5sum-) "4f8f0800921be74c12ef659643444bbd")
(setf (get trajecgenerator::c_trajec :datatype-) "trajecgenerator/c_trajec")
(setf (get trajecgenerator::c_trajec :definition-)
      "float32 x
float32 y
float32 dx
float32 dy
float32 ddx
float32 ddy
uint64 timestamp

")



(provide :trajecgenerator/c_trajec "4f8f0800921be74c12ef659643444bbd")


