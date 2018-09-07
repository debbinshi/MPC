
(cl:in-package :asdf)

(defsystem "sim_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "car_position" :depends-on ("_package_car_position"))
    (:file "_package_car_position" :depends-on ("_package"))
    (:file "location" :depends-on ("_package_location"))
    (:file "_package_location" :depends-on ("_package"))
    (:file "sim_draw" :depends-on ("_package_sim_draw"))
    (:file "_package_sim_draw" :depends-on ("_package"))
    (:file "sim_line" :depends-on ("_package_sim_line"))
    (:file "_package_sim_line" :depends-on ("_package"))
  ))