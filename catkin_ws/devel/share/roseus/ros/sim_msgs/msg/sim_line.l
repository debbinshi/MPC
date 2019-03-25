;; Auto-generated. Do not edit!


(when (boundp 'sim_msgs::sim_line)
  (if (not (find-package "SIM_MSGS"))
    (make-package "SIM_MSGS"))
  (shadow 'sim_line (find-package "SIM_MSGS")))
(unless (find-package "SIM_MSGS::SIM_LINE")
  (make-package "SIM_MSGS::SIM_LINE"))

(in-package "ROS")
;;//! \htmlinclude sim_line.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sim_msgs::sim_line
  :super ros::object
  :slots (_pos_array _color ))

(defmethod sim_msgs::sim_line
  (:init
   (&key
    ((:pos_array __pos_array) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point32 :init) r)) r))
    ((:color __color) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _pos_array __pos_array)
   (setq _color __color)
   self)
  (:pos_array
   (&rest __pos_array)
   (if (keywordp (car __pos_array))
       (send* _pos_array __pos_array)
     (progn
       (if __pos_array (setq _pos_array (car __pos_array)))
       _pos_array)))
  (:color
   (&rest __color)
   (if (keywordp (car __color))
       (send* _color __color)
     (progn
       (if __color (setq _color (car __color)))
       _color)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point32[] _pos_array
    (apply #'+ (send-all _pos_array :serialization-length)) 4
    ;; std_msgs/String _color
    (send _color :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point32[] _pos_array
     (write-long (length _pos_array) s)
     (dolist (elem _pos_array)
       (send elem :serialize s)
       )
     ;; std_msgs/String _color
       (send _color :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point32[] _pos_array
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pos_array (let (r) (dotimes (i n) (push (instance geometry_msgs::Point32 :init) r)) r))
     (dolist (elem- _pos_array)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; std_msgs/String _color
     (send _color :deserialize buf ptr-) (incf ptr- (send _color :serialization-length))
   ;;
   self)
  )

(setf (get sim_msgs::sim_line :md5sum-) "08bb0bba13ec07969c1f6f6091bab7f9")
(setf (get sim_msgs::sim_line :datatype-) "sim_msgs/sim_line")
(setf (get sim_msgs::sim_line :definition-)
      "geometry_msgs/Point32[] pos_array
std_msgs/String color

================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
float32 z
================================================================================
MSG: std_msgs/String
string data

")



(provide :sim_msgs/sim_line "08bb0bba13ec07969c1f6f6091bab7f9")


