;; Auto-generated. Do not edit!


(when (boundp 'trajecgenerator::removeTrajecHandler)
  (if (not (find-package "TRAJECGENERATOR"))
    (make-package "TRAJECGENERATOR"))
  (shadow 'removeTrajecHandler (find-package "TRAJECGENERATOR")))
(unless (find-package "TRAJECGENERATOR::REMOVETRAJECHANDLER")
  (make-package "TRAJECGENERATOR::REMOVETRAJECHANDLER"))
(unless (find-package "TRAJECGENERATOR::REMOVETRAJECHANDLERREQUEST")
  (make-package "TRAJECGENERATOR::REMOVETRAJECHANDLERREQUEST"))
(unless (find-package "TRAJECGENERATOR::REMOVETRAJECHANDLERRESPONSE")
  (make-package "TRAJECGENERATOR::REMOVETRAJECHANDLERRESPONSE"))

(in-package "ROS")





(defclass trajecgenerator::removeTrajecHandlerRequest
  :super ros::object
  :slots (_name ))

(defmethod trajecgenerator::removeTrajecHandlerRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass trajecgenerator::removeTrajecHandlerResponse
  :super ros::object
  :slots ())

(defmethod trajecgenerator::removeTrajecHandlerResponse
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

(defclass trajecgenerator::removeTrajecHandler
  :super ros::object
  :slots ())

(setf (get trajecgenerator::removeTrajecHandler :md5sum-) "c1f3d28f1b044c871e6eff2e9fc3c667")
(setf (get trajecgenerator::removeTrajecHandler :datatype-) "trajecgenerator/removeTrajecHandler")
(setf (get trajecgenerator::removeTrajecHandler :request) trajecgenerator::removeTrajecHandlerRequest)
(setf (get trajecgenerator::removeTrajecHandler :response) trajecgenerator::removeTrajecHandlerResponse)

(defmethod trajecgenerator::removeTrajecHandlerRequest
  (:response () (instance trajecgenerator::removeTrajecHandlerResponse :init)))

(setf (get trajecgenerator::removeTrajecHandlerRequest :md5sum-) "c1f3d28f1b044c871e6eff2e9fc3c667")
(setf (get trajecgenerator::removeTrajecHandlerRequest :datatype-) "trajecgenerator/removeTrajecHandlerRequest")
(setf (get trajecgenerator::removeTrajecHandlerRequest :definition-)
      "string name
---
")

(setf (get trajecgenerator::removeTrajecHandlerResponse :md5sum-) "c1f3d28f1b044c871e6eff2e9fc3c667")
(setf (get trajecgenerator::removeTrajecHandlerResponse :datatype-) "trajecgenerator/removeTrajecHandlerResponse")
(setf (get trajecgenerator::removeTrajecHandlerResponse :definition-)
      "string name
---
")



(provide :trajecgenerator/removeTrajecHandler "c1f3d28f1b044c871e6eff2e9fc3c667")


