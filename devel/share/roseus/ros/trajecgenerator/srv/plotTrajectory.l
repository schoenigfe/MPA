;; Auto-generated. Do not edit!


(when (boundp 'trajecgenerator::plotTrajectory)
  (if (not (find-package "TRAJECGENERATOR"))
    (make-package "TRAJECGENERATOR"))
  (shadow 'plotTrajectory (find-package "TRAJECGENERATOR")))
(unless (find-package "TRAJECGENERATOR::PLOTTRAJECTORY")
  (make-package "TRAJECGENERATOR::PLOTTRAJECTORY"))
(unless (find-package "TRAJECGENERATOR::PLOTTRAJECTORYREQUEST")
  (make-package "TRAJECGENERATOR::PLOTTRAJECTORYREQUEST"))
(unless (find-package "TRAJECGENERATOR::PLOTTRAJECTORYRESPONSE")
  (make-package "TRAJECGENERATOR::PLOTTRAJECTORYRESPONSE"))

(in-package "ROS")





(defclass trajecgenerator::plotTrajectoryRequest
  :super ros::object
  :slots (_title _maxT _dT _k _xrange _yrange ))

(defmethod trajecgenerator::plotTrajectoryRequest
  (:init
   (&key
    ((:title __title) "")
    ((:maxT __maxT) 0.0)
    ((:dT __dT) 0.0)
    ((:k __k) 0.0)
    ((:xrange __xrange) (make-array 2 :initial-element 0.0 :element-type :float))
    ((:yrange __yrange) (make-array 2 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _title (string __title))
   (setq _maxT (float __maxT))
   (setq _dT (float __dT))
   (setq _k (float __k))
   (setq _xrange __xrange)
   (setq _yrange __yrange)
   self)
  (:title
   (&optional __title)
   (if __title (setq _title __title)) _title)
  (:maxT
   (&optional __maxT)
   (if __maxT (setq _maxT __maxT)) _maxT)
  (:dT
   (&optional __dT)
   (if __dT (setq _dT __dT)) _dT)
  (:k
   (&optional __k)
   (if __k (setq _k __k)) _k)
  (:xrange
   (&optional __xrange)
   (if __xrange (setq _xrange __xrange)) _xrange)
  (:yrange
   (&optional __yrange)
   (if __yrange (setq _yrange __yrange)) _yrange)
  (:serialization-length
   ()
   (+
    ;; string _title
    4 (length _title)
    ;; float32 _maxT
    4
    ;; float32 _dT
    4
    ;; float32 _k
    4
    ;; float32[2] _xrange
    (* 4    2)
    ;; float32[2] _yrange
    (* 4    2)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _title
       (write-long (length _title) s) (princ _title s)
     ;; float32 _maxT
       (sys::poke _maxT (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _dT
       (sys::poke _dT (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _k
       (sys::poke _k (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[2] _xrange
     (dotimes (i 2)
       (sys::poke (elt _xrange i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[2] _yrange
     (dotimes (i 2)
       (sys::poke (elt _yrange i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _title
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _title (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _maxT
     (setq _maxT (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _dT
     (setq _dT (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _k
     (setq _k (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[2] _xrange
   (dotimes (i (length _xrange))
     (setf (elt _xrange i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[2] _yrange
   (dotimes (i (length _yrange))
     (setf (elt _yrange i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(defclass trajecgenerator::plotTrajectoryResponse
  :super ros::object
  :slots ())

(defmethod trajecgenerator::plotTrajectoryResponse
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

(defclass trajecgenerator::plotTrajectory
  :super ros::object
  :slots ())

(setf (get trajecgenerator::plotTrajectory :md5sum-) "2860cf7d8312d3024b3ab61f13528c56")
(setf (get trajecgenerator::plotTrajectory :datatype-) "trajecgenerator/plotTrajectory")
(setf (get trajecgenerator::plotTrajectory :request) trajecgenerator::plotTrajectoryRequest)
(setf (get trajecgenerator::plotTrajectory :response) trajecgenerator::plotTrajectoryResponse)

(defmethod trajecgenerator::plotTrajectoryRequest
  (:response () (instance trajecgenerator::plotTrajectoryResponse :init)))

(setf (get trajecgenerator::plotTrajectoryRequest :md5sum-) "2860cf7d8312d3024b3ab61f13528c56")
(setf (get trajecgenerator::plotTrajectoryRequest :datatype-) "trajecgenerator/plotTrajectoryRequest")
(setf (get trajecgenerator::plotTrajectoryRequest :definition-)
      "string title
float32 maxT
float32 dT
float32 k
float32[2] xrange
float32[2] yrange
---
")

(setf (get trajecgenerator::plotTrajectoryResponse :md5sum-) "2860cf7d8312d3024b3ab61f13528c56")
(setf (get trajecgenerator::plotTrajectoryResponse :datatype-) "trajecgenerator/plotTrajectoryResponse")
(setf (get trajecgenerator::plotTrajectoryResponse :definition-)
      "string title
float32 maxT
float32 dT
float32 k
float32[2] xrange
float32[2] yrange
---
")



(provide :trajecgenerator/plotTrajectory "2860cf7d8312d3024b3ab61f13528c56")


