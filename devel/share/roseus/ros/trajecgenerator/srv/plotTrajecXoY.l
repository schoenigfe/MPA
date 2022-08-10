;; Auto-generated. Do not edit!


(when (boundp 'trajecgenerator::plotTrajecXoY)
  (if (not (find-package "TRAJECGENERATOR"))
    (make-package "TRAJECGENERATOR"))
  (shadow 'plotTrajecXoY (find-package "TRAJECGENERATOR")))
(unless (find-package "TRAJECGENERATOR::PLOTTRAJECXOY")
  (make-package "TRAJECGENERATOR::PLOTTRAJECXOY"))
(unless (find-package "TRAJECGENERATOR::PLOTTRAJECXOYREQUEST")
  (make-package "TRAJECGENERATOR::PLOTTRAJECXOYREQUEST"))
(unless (find-package "TRAJECGENERATOR::PLOTTRAJECXOYRESPONSE")
  (make-package "TRAJECGENERATOR::PLOTTRAJECXOYRESPONSE"))

(in-package "ROS")





(defclass trajecgenerator::plotTrajecXoYRequest
  :super ros::object
  :slots (_title _typeXoY _maxT _dT _k _xrange _yrange ))

(defmethod trajecgenerator::plotTrajecXoYRequest
  (:init
   (&key
    ((:title __title) "")
    ((:typeXoY __typeXoY) 0)
    ((:maxT __maxT) 0.0)
    ((:dT __dT) 0.0)
    ((:k __k) 0.0)
    ((:xrange __xrange) (make-array 2 :initial-element 0.0 :element-type :float))
    ((:yrange __yrange) (make-array 2 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _title (string __title))
   (setq _typeXoY (round __typeXoY))
   (setq _maxT (float __maxT))
   (setq _dT (float __dT))
   (setq _k (float __k))
   (setq _xrange __xrange)
   (setq _yrange __yrange)
   self)
  (:title
   (&optional __title)
   (if __title (setq _title __title)) _title)
  (:typeXoY
   (&optional __typeXoY)
   (if __typeXoY (setq _typeXoY __typeXoY)) _typeXoY)
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
    ;; uint8 _typeXoY
    1
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
     ;; uint8 _typeXoY
       (write-byte _typeXoY s)
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
   ;; uint8 _typeXoY
     (setq _typeXoY (sys::peek buf ptr- :char)) (incf ptr- 1)
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

(defclass trajecgenerator::plotTrajecXoYResponse
  :super ros::object
  :slots ())

(defmethod trajecgenerator::plotTrajecXoYResponse
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

(defclass trajecgenerator::plotTrajecXoY
  :super ros::object
  :slots ())

(setf (get trajecgenerator::plotTrajecXoY :md5sum-) "af80c98d097b90c478c238e3c9f71a07")
(setf (get trajecgenerator::plotTrajecXoY :datatype-) "trajecgenerator/plotTrajecXoY")
(setf (get trajecgenerator::plotTrajecXoY :request) trajecgenerator::plotTrajecXoYRequest)
(setf (get trajecgenerator::plotTrajecXoY :response) trajecgenerator::plotTrajecXoYResponse)

(defmethod trajecgenerator::plotTrajecXoYRequest
  (:response () (instance trajecgenerator::plotTrajecXoYResponse :init)))

(setf (get trajecgenerator::plotTrajecXoYRequest :md5sum-) "af80c98d097b90c478c238e3c9f71a07")
(setf (get trajecgenerator::plotTrajecXoYRequest :datatype-) "trajecgenerator/plotTrajecXoYRequest")
(setf (get trajecgenerator::plotTrajecXoYRequest :definition-)
      "string title
uint8 typeXoY   # 0 für x, 1 für y
float32 maxT
float32 dT
float32 k
float32[2] xrange
float32[2] yrange
---
")

(setf (get trajecgenerator::plotTrajecXoYResponse :md5sum-) "af80c98d097b90c478c238e3c9f71a07")
(setf (get trajecgenerator::plotTrajecXoYResponse :datatype-) "trajecgenerator/plotTrajecXoYResponse")
(setf (get trajecgenerator::plotTrajecXoYResponse :definition-)
      "string title
uint8 typeXoY   # 0 für x, 1 für y
float32 maxT
float32 dT
float32 k
float32[2] xrange
float32[2] yrange
---
")



(provide :trajecgenerator/plotTrajecXoY "af80c98d097b90c478c238e3c9f71a07")


