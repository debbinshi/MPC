;; Auto-generated. Do not edit!


(when (boundp 'sim_msgs::sim_draw)
  (if (not (find-package "SIM_MSGS"))
    (make-package "SIM_MSGS"))
  (shadow 'sim_draw (find-package "SIM_MSGS")))
(unless (find-package "SIM_MSGS::SIM_DRAW")
  (make-package "SIM_MSGS::SIM_DRAW"))

(in-package "ROS")
;;//! \htmlinclude sim_draw.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass sim_msgs::sim_draw
  :super ros::object
  :slots (_block_width _block _line_ego _line_map ))

(defmethod sim_msgs::sim_draw
  (:init
   (&key
    ((:block_width __block_width) 0.0)
    ((:block __block) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point32 :init) r)) r))
    ((:line_ego __line_ego) (let (r) (dotimes (i 0) (push (instance sim_msgs::sim_line :init) r)) r))
    ((:line_map __line_map) (let (r) (dotimes (i 0) (push (instance sim_msgs::sim_line :init) r)) r))
    )
   (send-super :init)
   (setq _block_width (float __block_width))
   (setq _block __block)
   (setq _line_ego __line_ego)
   (setq _line_map __line_map)
   self)
  (:block_width
   (&optional __block_width)
   (if __block_width (setq _block_width __block_width)) _block_width)
  (:block
   (&rest __block)
   (if (keywordp (car __block))
       (send* _block __block)
     (progn
       (if __block (setq _block (car __block)))
       _block)))
  (:line_ego
   (&rest __line_ego)
   (if (keywordp (car __line_ego))
       (send* _line_ego __line_ego)
     (progn
       (if __line_ego (setq _line_ego (car __line_ego)))
       _line_ego)))
  (:line_map
   (&rest __line_map)
   (if (keywordp (car __line_map))
       (send* _line_map __line_map)
     (progn
       (if __line_map (setq _line_map (car __line_map)))
       _line_map)))
  (:serialization-length
   ()
   (+
    ;; float32 _block_width
    4
    ;; geometry_msgs/Point32[] _block
    (apply #'+ (send-all _block :serialization-length)) 4
    ;; sim_msgs/sim_line[] _line_ego
    (apply #'+ (send-all _line_ego :serialization-length)) 4
    ;; sim_msgs/sim_line[] _line_map
    (apply #'+ (send-all _line_map :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _block_width
       (sys::poke _block_width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Point32[] _block
     (write-long (length _block) s)
     (dolist (elem _block)
       (send elem :serialize s)
       )
     ;; sim_msgs/sim_line[] _line_ego
     (write-long (length _line_ego) s)
     (dolist (elem _line_ego)
       (send elem :serialize s)
       )
     ;; sim_msgs/sim_line[] _line_map
     (write-long (length _line_map) s)
     (dolist (elem _line_map)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _block_width
     (setq _block_width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Point32[] _block
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _block (let (r) (dotimes (i n) (push (instance geometry_msgs::Point32 :init) r)) r))
     (dolist (elem- _block)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; sim_msgs/sim_line[] _line_ego
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _line_ego (let (r) (dotimes (i n) (push (instance sim_msgs::sim_line :init) r)) r))
     (dolist (elem- _line_ego)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; sim_msgs/sim_line[] _line_map
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _line_map (let (r) (dotimes (i n) (push (instance sim_msgs::sim_line :init) r)) r))
     (dolist (elem- _line_map)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get sim_msgs::sim_draw :md5sum-) "1ed2f3f92c3262f669836ba521b6909d")
(setf (get sim_msgs::sim_draw :datatype-) "sim_msgs/sim_draw")
(setf (get sim_msgs::sim_draw :definition-)
      "float32 block_width

geometry_msgs/Point32[] block
sim_msgs/sim_line[] line_ego
sim_msgs/sim_line[] line_map

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
MSG: sim_msgs/sim_line
geometry_msgs/Point32[] pos_array
std_msgs/String color

================================================================================
MSG: std_msgs/String
string data

")



(provide :sim_msgs/sim_draw "1ed2f3f92c3262f669836ba521b6909d")


