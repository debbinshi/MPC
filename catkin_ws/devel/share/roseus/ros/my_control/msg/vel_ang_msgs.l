;; Auto-generated. Do not edit!


(when (boundp 'my_control::vel_ang_msgs)
  (if (not (find-package "MY_CONTROL"))
    (make-package "MY_CONTROL"))
  (shadow 'vel_ang_msgs (find-package "MY_CONTROL")))
(unless (find-package "MY_CONTROL::VEL_ANG_MSGS")
  (make-package "MY_CONTROL::VEL_ANG_MSGS"))

(in-package "ROS")
;;//! \htmlinclude vel_ang_msgs.msg.html


(defclass my_control::vel_ang_msgs
  :super ros::object
  :slots (_vel _ang ))

(defmethod my_control::vel_ang_msgs
  (:init
   (&key
    ((:vel __vel) 0.0)
    ((:ang __ang) 0.0)
    )
   (send-super :init)
   (setq _vel (float __vel))
   (setq _ang (float __ang))
   self)
  (:vel
   (&optional __vel)
   (if __vel (setq _vel __vel)) _vel)
  (:ang
   (&optional __ang)
   (if __ang (setq _ang __ang)) _ang)
  (:serialization-length
   ()
   (+
    ;; float32 _vel
    4
    ;; float32 _ang
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _vel
       (sys::poke _vel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ang
       (sys::poke _ang (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _vel
     (setq _vel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ang
     (setq _ang (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get my_control::vel_ang_msgs :md5sum-) "ed3a566fa16ba731db800e9b74c7bfe7")
(setf (get my_control::vel_ang_msgs :datatype-) "my_control/vel_ang_msgs")
(setf (get my_control::vel_ang_msgs :definition-)
      "float32 vel
float32 ang

")



(provide :my_control/vel_ang_msgs "ed3a566fa16ba731db800e9b74c7bfe7")


