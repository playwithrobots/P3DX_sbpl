
(cl:in-package :asdf)

(defsystem "P3DX_sbpl-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "sonar_msg" :depends-on ("_package_sonar_msg"))
    (:file "_package_sonar_msg" :depends-on ("_package"))
    (:file "sbpl_msg" :depends-on ("_package_sbpl_msg"))
    (:file "_package_sbpl_msg" :depends-on ("_package"))
    (:file "start_msg" :depends-on ("_package_start_msg"))
    (:file "_package_start_msg" :depends-on ("_package"))
  ))