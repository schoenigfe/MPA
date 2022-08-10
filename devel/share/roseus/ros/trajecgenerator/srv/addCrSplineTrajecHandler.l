;; Auto-generated. Do not edit!


(when (boundp 'trajecgenerator::addCrSplineTrajecHandler)
  (if (not (find-package "TRAJECGENERATOR"))
    (make-package "TRAJECGENERATOR"))
  (shadow 'addCrSplineTrajecHandler (find-package "TRAJECGENERATOR")))
(unless (find-package "TRAJECGENERATOR::ADDCRSPLINETRAJECHANDLER")
  (make-package "TRAJECGENERATOR::ADDCRSPLINETRAJECHANDLER"))
(unless (find-package "TRAJECGENERATOR::ADDCRSPLINETRAJECHANDLERREQUEST")
  (make-package "TRAJECGENERATOR::ADDCRSPLINETRAJECHANDLERREQUEST"))
(unless (find-package "TRAJECGENERATOR::ADDCRSPLINETRAJECHANDLERRESPONSE")
  (make-package "TRAJECGENERATOR::ADDCRSPLINETRAJECHANDLERRESPONSE"))

(in-package "ROS")





(defclass trajecgenerator::addCrSplineTrajecHandlerRequest
  :super ros::object
  :slots (_name _pointsX _pointsY _closed _time _k ))

(defmethod trajecgenerator::addCrSplineTrajecHandlerRequest
  (:init
   (&key
    ((:name __name) "")
    ((:pointsX __pointsX) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pointsY __pointsY) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:closed __closed) nil)
    ((:time __time) 0.0)
    ((:k __k) 0.0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _pointsX __pointsX)
   (setq _pointsY __pointsY)
   (setq _closed __closed)
   (setq _time (float __time))
   (setq _k (float __k))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:pointsX
   (&optional __pointsX)
   (if __pointsX (setq _pointsX __pointsX)) _pointsX)
  (:pointsY
   (&optional __pointsY)
   (if __pointsY (setq _pointsY __pointsY)) _pointsY)
  (:closed
   (&optional (__closed :null))
   (if (not (eq __closed :null)) (setq _closed __closed)) _closed)
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
    ;; float32[] _pointsX
    (* 4    (length _pointsX)) 4
    ;; float32[] _pointsY
    (* 4    (length _pointsY)) 4
    ;; bool _closed
    1
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
     ;; float32[] _pointsX
     (write-long (length _pointsX) s)
     (dotimes (i (length _pointsX))
       (sys::poke (elt _pointsX i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _pointsY
     (write-long (length _pointsY) s)
     (dotimes (i (length _pointsY))
       (sys::poke (elt _pointsY i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; bool _closed
       (if _closed (write-byte -1 s) (write-byte 0 s))
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
   ;; float32[] _pointsX
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pointsX (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pointsX i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _pointsY
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pointsY (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pointsY i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; bool _closed
     (setq _closed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _time
     (setq _time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _k
     (setq _k (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass trajecgenerator::addCrSplineTrajecHandlerResponse
  :super ros::object
  :slots ())

(defmethod trajecgenerator::addCrSplineTrajecHandlerResponse
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

(defclass trajecgenerator::addCrSplineTrajecHandler
  :super ros::object
  :slots ())

(setf (get trajecgenerator::addCrSplineTrajecHandler :md5sum-) "a67c4c6881252e2b649960aef205c15e")
(setf (get trajecgenerator::addCrSplineTrajecHandler :datatype-) "trajecgenerator/addCrSplineTrajecHandler")
(setf (get trajecgenerator::addCrSplineTrajecHandler :request) trajecgenerator::addCrSplineTrajecHandlerRequest)
(setf (get trajecgenerator::addCrSplineTrajecHandler :response) trajecgenerator::addCrSplineTrajecHandlerResponse)

(defmethod trajecgenerator::addCrSplineTrajecHandlerRequest
  (:response () (instance trajecgenerator::addCrSplineTrajecHandlerResponse :init)))

(setf (get trajecgenerator::addCrSplineTrajecHandlerRequest :md5sum-) "a67c4c6881252e2b649960aef205c15e")
(setf (get trajecgenerator::addCrSplineTrajecHandlerRequest :datatype-) "trajecgenerator/addCrSplineTrajecHandlerRequest")
(setf (get trajecgenerator::addCrSplineTrajecHandlerRequest :definition-)
      "string name
float32[] pointsX
float32[] pointsY
bool closed
float32 time
float32 k
---
")

(setf (get trajecgenerator::addCrSplineTrajecHandlerResponse :md5sum-) "a67c4c6881252e2b649960aef205c15e")
(setf (get trajecgenerator::addCrSplineTrajecHandlerResponse :datatype-) "trajecgenerator/addCrSplineTrajecHandlerResponse")
(setf (get trajecgenerator::addCrSplineTrajecHandlerResponse :definition-)
      "string name
float32[] pointsX
float32[] pointsY
bool closed
float32 time
float32 k
---
")



(provide :trajecgenerator/addCrSplineTrajecHandler "a67c4c6881252e2b649960aef205c15e")


