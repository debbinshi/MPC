; Auto-generated. Do not edit!


(cl:in-package my_control-msg)


;//! \htmlinclude vel_ang_msgs.msg.html

(cl:defclass <vel_ang_msgs> (roslisp-msg-protocol:ros-message)
  ((vel
    :reader vel
    :initarg :vel
    :type cl:float
    :initform 0.0)
   (ang
    :reader ang
    :initarg :ang
    :type cl:float
    :initform 0.0))
)

(cl:defclass vel_ang_msgs (<vel_ang_msgs>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <vel_ang_msgs>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'vel_ang_msgs)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_control-msg:<vel_ang_msgs> is deprecated: use my_control-msg:vel_ang_msgs instead.")))

(cl:ensure-generic-function 'vel-val :lambda-list '(m))
(cl:defmethod vel-val ((m <vel_ang_msgs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_control-msg:vel-val is deprecated.  Use my_control-msg:vel instead.")
  (vel m))

(cl:ensure-generic-function 'ang-val :lambda-list '(m))
(cl:defmethod ang-val ((m <vel_ang_msgs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_control-msg:ang-val is deprecated.  Use my_control-msg:ang instead.")
  (ang m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <vel_ang_msgs>) ostream)
  "Serializes a message object of type '<vel_ang_msgs>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ang))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <vel_ang_msgs>) istream)
  "Deserializes a message object of type '<vel_ang_msgs>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ang) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<vel_ang_msgs>)))
  "Returns string type for a message object of type '<vel_ang_msgs>"
  "my_control/vel_ang_msgs")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'vel_ang_msgs)))
  "Returns string type for a message object of type 'vel_ang_msgs"
  "my_control/vel_ang_msgs")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<vel_ang_msgs>)))
  "Returns md5sum for a message object of type '<vel_ang_msgs>"
  "ed3a566fa16ba731db800e9b74c7bfe7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'vel_ang_msgs)))
  "Returns md5sum for a message object of type 'vel_ang_msgs"
  "ed3a566fa16ba731db800e9b74c7bfe7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<vel_ang_msgs>)))
  "Returns full string definition for message of type '<vel_ang_msgs>"
  (cl:format cl:nil "float32 vel~%float32 ang~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'vel_ang_msgs)))
  "Returns full string definition for message of type 'vel_ang_msgs"
  (cl:format cl:nil "float32 vel~%float32 ang~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <vel_ang_msgs>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <vel_ang_msgs>))
  "Converts a ROS message object to a list"
  (cl:list 'vel_ang_msgs
    (cl:cons ':vel (vel msg))
    (cl:cons ':ang (ang msg))
))
