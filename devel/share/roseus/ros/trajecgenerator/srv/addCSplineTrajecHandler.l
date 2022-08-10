;; Auto-generated. Do not edit!


(when (boundp 'trajecgenerator::addCSplineTrajecHandler)
  (if (not (find-package "TRAJECGENERATOR"))
    (make-package "TRAJECGENERATOR"))
  (shadow 'addCSplineTrajecHandler (find-package "TRAJECGENERATOR")))
(unless (find-package "TRAJECGENERATOR::ADDCSPLINETRAJECHANDLER")
  (make-package "TRAJECGENERATOR::ADDCSPLINETRAJECHANDLER"))
(unless (find-package "TRAJECGENERATOR::ADDCSPLINETRAJECHANDLERREQUEST")
  (make-package "TRAJECGENERATOR::ADDCSPLINETRAJECHANDLERREQUEST"))
(unless (find-package "TRAJECGENERATOR::ADDCSPLINETRAJECHANDLERRESPONSE")
  (make-package "TRAJECGENERATOR::ADDCSPLINETRAJECHANDLERRESPONSE"))

(in-package "ROS")





(defclass trajecgenerator::addCSplineTrajecHandlerRequest
  :super ros::object
  :slots (_name _pointsX _pointsY _T _type _closed _time _k ))

(defmethod trajecgenerator::addCSplineTrajecHandlerRequest
  (:init
   (&key
    ((:name __name) "")
    ((:pointsX __pointsX) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pointsY __pointsY) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:T __T) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:type __type) 0)
    ((:closed __closed) nil)
    ((:time __time) 0.0)
    ((:k __k) 0.0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _pointsX __pointsX)
   (setq _pointsY __pointsY)
   (setq _T __T)
   (setq _type (round __type))
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
  (:T
   (&optional __T)
   (if __T (setq _T __T)) _T)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
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
    ;; float32[] _T
    (* 4    (length _T)) 4
    ;; uint8 _type
    1
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
     ;; float32[] _T
     (write-long (length _T) s)
     (dotimes (i (length _T))
       (sys::poke (elt _T i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; uint8 _type
       (write-byte _type s)
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
   ;; float32[] _T
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _T (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _T i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _closed
     (setq _closed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _time
     (setq _time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _k
     (setq _k (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass trajecgenerator::addCSplineTrajecHandlerResponse
  :super ros::object
  :slots ())

(defmethod trajecgenerator::addCSplineTrajecHandlerResponse
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

(defclass trajecgenerator::addCSplineTrajecHandler
  :super ros::object
  :slots ())

(setf (get trajecgenerator::addCSplineTrajecHandler :md5sum-) "b8d56f785274552c60142c0b2c2c3c51")
(setf (get trajecgenerator::addCSplineTrajecHandler :datatype-) "trajecgenerator/addCSplineTrajecHandler")
(setf (get trajecgenerator::addCSplineTrajecHandler :request) trajecgenerator::addCSplineTrajecHandlerRequest)
(setf (get trajecgenerator::addCSplineTrajecHandler :response) trajecgenerator::addCSplineTrajecHandlerResponse)

(defmethod trajecgenerator::addCSplineTrajecHandlerRequest
  (:response () (instance trajecgenerator::addCSplineTrajecHandlerResponse :init)))

(setf (get trajecgenerator::addCSplineTrajecHandlerRequest :md5sum-) "b8d56f785274552c60142c0b2c2c3c51")
(setf (get trajecgenerator::addCSplineTrajecHandlerRequest :datatype-) "trajecgenerator/addCSplineTrajecHandlerRequest")
(setf (get trajecgenerator::addCSplineTrajecHandlerRequest :definition-)
      "string name
float32[] pointsX
float32[] pointsY
float32[] T
uint8 type  #  0: cspline, 1: cspline_hermite, 2: linear
bool closed
float32 time
float32 k
---
")

(setf (get trajecgenerator::addCSplineTrajecHandlerResponse :md5sum-) "b8d56f785274552c60142c0b2c2c3c51")
(setf (get trajecgenerator::addCSplineTrajecHandlerResponse :datatype-) "trajecgenerator/addCSplineTrajecHandlerResponse")
(setf (get trajecgenerator::addCSplineTrajecHandlerResponse :definition-)
      "string name
float32[] pointsX
float32[] pointsY
float32[] T
uint8 type  #  0: cspline, 1: cspline_hermite, 2: linear
bool closed
float32 time
float32 k
---
")



(provide :trajecgenerator/addCSplineTrajecHandler "b8d56f785274552c60142c0b2c2c3c51")


