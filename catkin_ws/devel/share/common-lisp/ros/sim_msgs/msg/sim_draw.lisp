; Auto-generated. Do not edit!


(cl:in-package sim_msgs-msg)


;//! \htmlinclude sim_draw.msg.html

(cl:defclass <sim_draw> (roslisp-msg-protocol:ros-message)
  ((block_width
    :reader block_width
    :initarg :block_width
    :type cl:float
    :initform 0.0)
   (block
    :reader block
    :initarg :block
    :type (cl:vector geometry_msgs-msg:Point32)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point32 :initial-element (cl:make-instance 'geometry_msgs-msg:Point32)))
   (line_ego
    :reader line_ego
    :initarg :line_ego
    :type (cl:vector sim_msgs-msg:sim_line)
   :initform (cl:make-array 0 :element-type 'sim_msgs-msg:sim_line :initial-element (cl:make-instance 'sim_msgs-msg:sim_line)))
   (line_map
    :reader line_map
    :initarg :line_map
    :type (cl:vector sim_msgs-msg:sim_line)
   :initform (cl:make-array 0 :element-type 'sim_msgs-msg:sim_line :initial-element (cl:make-instance 'sim_msgs-msg:sim_line))))
)

(cl:defclass sim_draw (<sim_draw>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sim_draw>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sim_draw)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sim_msgs-msg:<sim_draw> is deprecated: use sim_msgs-msg:sim_draw instead.")))

(cl:ensure-generic-function 'block_width-val :lambda-list '(m))
(cl:defmethod block_width-val ((m <sim_draw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:block_width-val is deprecated.  Use sim_msgs-msg:block_width instead.")
  (block_width m))

(cl:ensure-generic-function 'block-val :lambda-list '(m))
(cl:defmethod block-val ((m <sim_draw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:block-val is deprecated.  Use sim_msgs-msg:block instead.")
  (block m))

(cl:ensure-generic-function 'line_ego-val :lambda-list '(m))
(cl:defmethod line_ego-val ((m <sim_draw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:line_ego-val is deprecated.  Use sim_msgs-msg:line_ego instead.")
  (line_ego m))

(cl:ensure-generic-function 'line_map-val :lambda-list '(m))
(cl:defmethod line_map-val ((m <sim_draw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:line_map-val is deprecated.  Use sim_msgs-msg:line_map instead.")
  (line_map m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sim_draw>) ostream)
  "Serializes a message object of type '<sim_draw>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'block_width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'block))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'block))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'line_ego))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'line_ego))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'line_map))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'line_map))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sim_draw>) istream)
  "Deserializes a message object of type '<sim_draw>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'block_width) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'block) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'block)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point32))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'line_ego) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'line_ego)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sim_msgs-msg:sim_line))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'line_map) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'line_map)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sim_msgs-msg:sim_line))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sim_draw>)))
  "Returns string type for a message object of type '<sim_draw>"
  "sim_msgs/sim_draw")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sim_draw)))
  "Returns string type for a message object of type 'sim_draw"
  "sim_msgs/sim_draw")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sim_draw>)))
  "Returns md5sum for a message object of type '<sim_draw>"
  "1ed2f3f92c3262f669836ba521b6909d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sim_draw)))
  "Returns md5sum for a message object of type 'sim_draw"
  "1ed2f3f92c3262f669836ba521b6909d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sim_draw>)))
  "Returns full string definition for message of type '<sim_draw>"
  (cl:format cl:nil "float32 block_width~%~%geometry_msgs/Point32[] block~%sim_msgs/sim_line[] line_ego~%sim_msgs/sim_line[] line_map~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%================================================================================~%MSG: sim_msgs/sim_line~%geometry_msgs/Point32[] pos_array~%std_msgs/String color~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sim_draw)))
  "Returns full string definition for message of type 'sim_draw"
  (cl:format cl:nil "float32 block_width~%~%geometry_msgs/Point32[] block~%sim_msgs/sim_line[] line_ego~%sim_msgs/sim_line[] line_map~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%================================================================================~%MSG: sim_msgs/sim_line~%geometry_msgs/Point32[] pos_array~%std_msgs/String color~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sim_draw>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'block) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'line_ego) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'line_map) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sim_draw>))
  "Converts a ROS message object to a list"
  (cl:list 'sim_draw
    (cl:cons ':block_width (block_width msg))
    (cl:cons ':block (block msg))
    (cl:cons ':line_ego (line_ego msg))
    (cl:cons ':line_map (line_map msg))
))
