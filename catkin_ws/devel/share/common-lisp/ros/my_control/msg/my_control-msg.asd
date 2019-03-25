
(cl:in-package :asdf)

(defsystem "my_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "car_position" :depends-on ("_package_car_position"))
    (:file "_package_car_position" :depends-on ("_package"))
  ))