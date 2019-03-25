; Auto-generated. Do not edit!


(cl:in-package sim_msgs-msg)


;//! \htmlinclude sim_line.msg.html

(cl:defclass <sim_line> (roslisp-msg-protocol:ros-message)
  ((pos_array
    :reader pos_array
    :initarg :pos_array
    :type (cl:vector geometry_msgs-msg:Point32)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point32 :initial-element (cl:make-instance 'geometry_msgs-msg:Point32)))
   (color
    :reader color
    :initarg :color
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass sim_line (<sim_line>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sim_line>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sim_line)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sim_msgs-msg:<sim_line> is deprecated: use sim_msgs-msg:sim_line instead.")))

(cl:ensure-generic-function 'pos_array-val :lambda-list '(m))
(cl:defmethod pos_array-val ((m <sim_line>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:pos_array-val is deprecated.  Use sim_msgs-msg:pos_array instead.")
  (pos_array m))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <sim_line>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:color-val is deprecated.  Use sim_msgs-msg:color instead.")
  (color m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sim_line>) ostream)
  "Serializes a message object of type '<sim_line>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pos_array))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'pos_array))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'color) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sim_line>) istream)
  "Deserializes a message object of type '<sim_line>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pos_array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pos_array)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point32))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'color) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sim_line>)))
  "Returns string type for a message object of type '<sim_line>"
  "sim_msgs/sim_line")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sim_line)))
  "Returns string type for a message object of type 'sim_line"
  "sim_msgs/sim_line")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sim_line>)))
  "Returns md5sum for a message object of type '<sim_line>"
  "08bb0bba13ec07969c1f6f6091bab7f9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sim_line)))
  "Returns md5sum for a message object of type 'sim_line"
  "08bb0bba13ec07969c1f6f6091bab7f9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sim_line>)))
  "Returns full string definition for message of type '<sim_line>"
  (cl:format cl:nil "geometry_msgs/Point32[] pos_array~%std_msgs/String color~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sim_line)))
  "Returns full string definition for message of type 'sim_line"
  (cl:format cl:nil "geometry_msgs/Point32[] pos_array~%std_msgs/String color~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sim_line>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pos_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'color))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sim_line>))
  "Converts a ROS message object to a list"
  (cl:list 'sim_line
    (cl:cons ':pos_array (pos_array msg))
    (cl:cons ':color (color msg))
))
