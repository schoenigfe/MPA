;; Auto-generated. Do not edit!


(when (boundp 'trajecgenerator::boolRequest)
  (if (not (find-package "TRAJECGENERATOR"))
    (make-package "TRAJECGENERATOR"))
  (shadow 'boolRequest (find-package "TRAJECGENERATOR")))
(unless (find-package "TRAJECGENERATOR::BOOLREQUEST")
  (make-package "TRAJECGENERATOR::BOOLREQUEST"))
(unless (find-package "TRAJECGENERATOR::BOOLREQUESTREQUEST")
  (make-package "TRAJECGENERATOR::BOOLREQUESTREQUEST"))
(unless (find-package "TRAJECGENERATOR::BOOLREQUESTRESPONSE")
  (make-package "TRAJECGENERATOR::BOOLREQUESTRESPONSE"))

(in-package "ROS")





(defclass trajecgenerator::boolRequestRequest
  :super ros::object
  :slots (_b ))

(defmethod trajecgenerator::boolRequestRequest
  (:init
   (&key
    ((:b __b) nil)
    )
   (send-super :init)
   (setq _b __b)
   self)
  (:b
   (&optional (__b :null))
   (if (not (eq __b :null)) (setq _b __b)) _b)
  (:serialization-length
   ()
   (+
    ;; bool _b
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _b
       (if _b (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _b
     (setq _b (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass trajecgenerator::boolRequestResponse
  :super ros::object
  :slots ())

(defmethod trajecgenerator::boolRequestResponse
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

(defclass trajecgenerator::boolRequest
  :super ros::object
  :slots ())

(setf (get trajecgenerator::boolRequest :md5sum-) "88c93a4e354c9b18b18fde29f72f94c2")
(setf (get trajecgenerator::boolRequest :datatype-) "trajecgenerator/boolRequest")
(setf (get trajecgenerator::boolRequest :request) trajecgenerator::boolRequestRequest)
(setf (get trajecgenerator::boolRequest :response) trajecgenerator::boolRequestResponse)

(defmethod trajecgenerator::boolRequestRequest
  (:response () (instance trajecgenerator::boolRequestResponse :init)))

(setf (get trajecgenerator::boolRequestRequest :md5sum-) "88c93a4e354c9b18b18fde29f72f94c2")
(setf (get trajecgenerator::boolRequestRequest :datatype-) "trajecgenerator/boolRequestRequest")
(setf (get trajecgenerator::boolRequestRequest :definition-)
      "bool b
---
")

(setf (get trajecgenerator::boolRequestResponse :md5sum-) "88c93a4e354c9b18b18fde29f72f94c2")
(setf (get trajecgenerator::boolRequestResponse :datatype-) "trajecgenerator/boolRequestResponse")
(setf (get trajecgenerator::boolRequestResponse :definition-)
      "bool b
---
")



(provide :trajecgenerator/boolRequest "88c93a4e354c9b18b18fde29f72f94c2")


