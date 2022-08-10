
(cl:in-package :asdf)

(defsystem "trajecgenerator-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "c_trajec" :depends-on ("_package_c_trajec"))
    (:file "_package_c_trajec" :depends-on ("_package"))
    (:file "c_trajec_vector" :depends-on ("_package_c_trajec_vector"))
    (:file "_package_c_trajec_vector" :depends-on ("_package"))
  ))