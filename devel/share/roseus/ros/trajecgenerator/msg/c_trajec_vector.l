;; Auto-generated. Do not edit!


(when (boundp 'trajecgenerator::c_trajec_vector)
  (if (not (find-package "TRAJECGENERATOR"))
    (make-package "TRAJECGENERATOR"))
  (shadow 'c_trajec_vector (find-package "TRAJECGENERATOR")))
(unless (find-package "TRAJECGENERATOR::C_TRAJEC_VECTOR")
  (make-package "TRAJECGENERATOR::C_TRAJEC_VECTOR"))

(in-package "ROS")
;;//! \htmlinclude c_trajec_vector.msg.html


(defclass trajecgenerator::c_trajec_vector
  :super ros::object
  :slots (_points ))

(defmethod trajecgenerator::c_trajec_vector
  (:init
   (&key
    ((:points __points) ())
    )
   (send-super :init)
   (setq _points __points)
   self)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:serialization-length
   ()
   (+
    ;; trajecgenerator/c_trajec[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; trajecgenerator/c_trajec[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; trajecgenerator/c_trajec[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance trajecgenerator::c_trajec :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get trajecgenerator::c_trajec_vector :md5sum-) "d88f63147d96501d5ff38e0f76d36cc9")
(setf (get trajecgenerator::c_trajec_vector :datatype-) "trajecgenerator/c_trajec_vector")
(setf (get trajecgenerator::c_trajec_vector :definition-)
      "c_trajec[] points

================================================================================
MSG: trajecgenerator/c_trajec
float32 x
float32 y
float32 dx
float32 dy
float32 ddx
float32 ddy
uint64 timestamp

")



(provide :trajecgenerator/c_trajec_vector "d88f63147d96501d5ff38e0f76d36cc9")


