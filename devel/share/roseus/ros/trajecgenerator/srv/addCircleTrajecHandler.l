;; Auto-generated. Do not edit!


(when (boundp 'trajecgenerator::addCircleTrajecHandler)
  (if (not (find-package "TRAJECGENERATOR"))
    (make-package "TRAJECGENERATOR"))
  (shadow 'addCircleTrajecHandler (find-package "TRAJECGENERATOR")))
(unless (find-package "TRAJECGENERATOR::ADDCIRCLETRAJECHANDLER")
  (make-package "TRAJECGENERATOR::ADDCIRCLETRAJECHANDLER"))
(unless (find-package "TRAJECGENERATOR::ADDCIRCLETRAJECHANDLERREQUEST")
  (make-package "TRAJECGENERATOR::ADDCIRCLETRAJECHANDLERREQUEST"))
(unless (find-package "TRAJECGENERATOR::ADDCIRCLETRAJECHANDLERRESPONSE")
  (make-package "TRAJECGENERATOR::ADDCIRCLETRAJECHANDLERRESPONSE"))

(in-package "ROS")





(defclass trajecgenerator::addCircleTrajecHandlerRequest
  :super ros::object
  :slots (_name _mx _my _a _b _time _k ))

(defmethod trajecgenerator::addCircleTrajecHandlerRequest
  (:init
   (&key
    ((:name __name) "")
    ((:mx __mx) 0.0)
    ((:my __my) 0.0)
    ((:a __a) 0.0)
    ((:b __b) 0.0)
    ((:time __time) 0.0)
    ((:k __k) 0.0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _mx (float __mx))
   (setq _my (float __my))
   (setq _a (float __a))
   (setq _b (float __b))
   (setq _time (float __time))
   (setq _k (float __k))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:mx
   (&optional __mx)
   (if __mx (setq _mx __mx)) _mx)
  (:my
   (&optional __my)
   (if __my (setq _my __my)) _my)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:k
   (&optional __k)
   (if __k (setq _k __k)) _k)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; float32 _mx
    4
    ;; float32 _my
    4
    ;; float32 _a
    4
    ;; float32 _b
    4
    ;; float32 _time
    4
    ;; float32 _k
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float32 _mx
       (sys::poke _mx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _my
       (sys::poke _my (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _a
       (sys::poke _a (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _b
       (sys::poke _b (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _time
       (sys::poke _time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _k
       (sys::poke _k (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _mx
     (setq _mx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _my
     (setq _my (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _a
     (setq _a (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _b
     (setq _b (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _time
     (setq _time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _k
     (setq _k (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass trajecgenerator::addCircleTrajecHandlerResponse
  :super ros::object
  :slots ())

(defmethod trajecgenerator::addCircleTrajecHandlerResponse
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

(defclass trajecgenerator::addCircleTrajecHandler
  :super ros::object
  :slots ())

(setf (get trajecgenerator::addCircleTrajecHandler :md5sum-) "4a4faaf714cc18070417071d78411d73")
(setf (get trajecgenerator::addCircleTrajecHandler :datatype-) "trajecgenerator/addCircleTrajecHandler")
(setf (get trajecgenerator::addCircleTrajecHandler :request) trajecgenerator::addCircleTrajecHandlerRequest)
(setf (get trajecgenerator::addCircleTrajecHandler :response) trajecgenerator::addCircleTrajecHandlerResponse)

(defmethod trajecgenerator::addCircleTrajecHandlerRequest
  (:response () (instance trajecgenerator::addCircleTrajecHandlerResponse :init)))

(setf (get trajecgenerator::addCircleTrajecHandlerRequest :md5sum-) "4a4faaf714cc18070417071d78411d73")
(setf (get trajecgenerator::addCircleTrajecHandlerRequest :datatype-) "trajecgenerator/addCircleTrajecHandlerRequest")
(setf (get trajecgenerator::addCircleTrajecHandlerRequest :definition-)
      "string name
float32 mx
float32 my
float32 a
float32 b
float32 time
float32 k
---
")

(setf (get trajecgenerator::addCircleTrajecHandlerResponse :md5sum-) "4a4faaf714cc18070417071d78411d73")
(setf (get trajecgenerator::addCircleTrajecHandlerResponse :datatype-) "trajecgenerator/addCircleTrajecHandlerResponse")
(setf (get trajecgenerator::addCircleTrajecHandlerResponse :definition-)
      "string name
float32 mx
float32 my
float32 a
float32 b
float32 time
float32 k
---
")



(provide :trajecgenerator/addCircleTrajecHandler "4a4faaf714cc18070417071d78411d73")


