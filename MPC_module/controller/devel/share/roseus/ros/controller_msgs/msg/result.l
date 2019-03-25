;; Auto-generated. Do not edit!


(when (boundp 'controller_msgs::result)
  (if (not (find-package "CONTROLLER_MSGS"))
    (make-package "CONTROLLER_MSGS"))
  (shadow 'result (find-package "CONTROLLER_MSGS")))
(unless (find-package "CONTROLLER_MSGS::RESULT")
  (make-package "CONTROLLER_MSGS::RESULT"))

(in-package "ROS")
;;//! \htmlinclude result.msg.html


(defclass controller_msgs::result
  :super ros::object
  :slots (_a _delta _vel _start ))

(defmethod controller_msgs::result
  (:init
   (&key
    ((:a __a) 0.0)
    ((:delta __delta) 0.0)
    ((:vel __vel) 0.0)
    ((:start __start) nil)
    )
   (send-super :init)
   (setq _a (float __a))
   (setq _delta (float __delta))
   (setq _vel (float __vel))
   (setq _start __start)
   self)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:delta
   (&optional __delta)
   (if __delta (setq _delta __delta)) _delta)
  (:vel
   (&optional __vel)
   (if __vel (setq _vel __vel)) _vel)
  (:start
   (&optional __start)
   (if __start (setq _start __start)) _start)
  (:serialization-length
   ()
   (+
    ;; float64 _a
    8
    ;; float64 _delta
    8
    ;; float64 _vel
    8
    ;; bool _start
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _a
       (sys::poke _a (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _delta
       (sys::poke _delta (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vel
       (sys::poke _vel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _start
       (if _start (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _a
     (setq _a (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _delta
     (setq _delta (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vel
     (setq _vel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _start
     (setq _start (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get controller_msgs::result :md5sum-) "4aabb18a1dde1b430e398f92b037e614")
(setf (get controller_msgs::result :datatype-) "controller_msgs/result")
(setf (get controller_msgs::result :definition-)
      "float64 a
float64 delta
float64 vel
bool start

")



(provide :controller_msgs/result "4aabb18a1dde1b430e398f92b037e614")


