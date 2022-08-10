;; Auto-generated. Do not edit!


(when (boundp 'trajecgenerator::float32Request)
  (if (not (find-package "TRAJECGENERATOR"))
    (make-package "TRAJECGENERATOR"))
  (shadow 'float32Request (find-package "TRAJECGENERATOR")))
(unless (find-package "TRAJECGENERATOR::FLOAT32REQUEST")
  (make-package "TRAJECGENERATOR::FLOAT32REQUEST"))
(unless (find-package "TRAJECGENERATOR::FLOAT32REQUESTREQUEST")
  (make-package "TRAJECGENERATOR::FLOAT32REQUESTREQUEST"))
(unless (find-package "TRAJECGENERATOR::FLOAT32REQUESTRESPONSE")
  (make-package "TRAJECGENERATOR::FLOAT32REQUESTRESPONSE"))

(in-package "ROS")





(defclass trajecgenerator::float32RequestRequest
  :super ros::object
  :slots (_f ))

(defmethod trajecgenerator::float32RequestRequest
  (:init
   (&key
    ((:f __f) 0.0)
    )
   (send-super :init)
   (setq _f (float __f))
   self)
  (:f
   (&optional __f)
   (if __f (setq _f __f)) _f)
  (:serialization-length
   ()
   (+
    ;; float32 _f
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _f
       (sys::poke _f (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _f
     (setq _f (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass trajecgenerator::float32RequestResponse
  :super ros::object
  :slots ())

(defmethod trajecgenerator::float32RequestResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass trajecgenerator::float32Request
  :super ros::object
  :slots ())

(setf (get trajecgenerator::float32Request :md5sum-) "29e3b508ca3c2e2afe7cfe66d63c0a51")
(setf (get trajecgenerator::float32Request :datatype-) "trajecgenerator/float32Request")
(setf (get trajecgenerator::float32Request :request) trajecgenerator::float32RequestRequest)
(setf (get trajecgenerator::float32Request :response) trajecgenerator::float32RequestResponse)

(defmethod trajecgenerator::float32RequestRequest
  (:response () (instance trajecgenerator::float32RequestResponse :init)))

(setf (get trajecgenerator::float32RequestRequest :md5sum-) "29e3b508ca3c2e2afe7cfe66d63c0a51")
(setf (get trajecgenerator::float32RequestRequest :datatype-) "trajecgenerator/float32RequestRequest")
(setf (get trajecgenerator::float32RequestRequest :definition-)
      "float32 f
---
")

(setf (get trajecgenerator::float32RequestResponse :md5sum-) "29e3b508ca3c2e2afe7cfe66d63c0a51")
(setf (get trajecgenerator::float32RequestResponse :datatype-) "trajecgenerator/float32RequestResponse")
(setf (get trajecgenerator::float32RequestResponse :definition-)
      "float32 f
---
")



(provide :trajecgenerator/float32Request "29e3b508ca3c2e2afe7cfe66d63c0a51")


