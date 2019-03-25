;; Auto-generated. Do not edit!


(when (boundp 'sim_msgs::car_position)
  (if (not (find-package "SIM_MSGS"))
    (make-package "SIM_MSGS"))
  (shadow 'car_position (find-package "SIM_MSGS")))
(unless (find-package "SIM_MSGS::CAR_POSITION")
  (make-package "SIM_MSGS::CAR_POSITION"))

(in-package "ROS")
;;//! \htmlinclude car_position.msg.html


(defclass sim_msgs::car_position
  :super ros::object
  :slots (_x _y _theta _v ))

(defmethod sim_msgs::car_position
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    ((:v __v) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   (setq _v (float __v))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:v
   (&optional __v)
   (if __v (setq _v __v)) _v)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _theta
    8
    ;; float64 _v
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _v
       (sys::poke _v (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta
     (setq _theta (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _v
     (setq _v (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get sim_msgs::car_position :md5sum-) "c8747f26ff3e8f9104802fd3f6b0900c")
(setf (get sim_msgs::car_position :datatype-) "sim_msgs/car_position")
(setf (get sim_msgs::car_position :definition-)
      "float64 x
float64 y
float64 theta
float64 v

")



(provide :sim_msgs/car_position "c8747f26ff3e8f9104802fd3f6b0900c")


