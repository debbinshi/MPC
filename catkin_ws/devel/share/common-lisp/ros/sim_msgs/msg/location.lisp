; Auto-generated. Do not edit!


(cl:in-package sim_msgs-msg)


;//! \htmlinclude location.msg.html

(cl:defclass <location> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (bExtractFeature
    :reader bExtractFeature
    :initarg :bExtractFeature
    :type cl:boolean
    :initform cl:nil)
   (dHDMapPoseX
    :reader dHDMapPoseX
    :initarg :dHDMapPoseX
    :type cl:float
    :initform 0.0)
   (dHDMapPoseY
    :reader dHDMapPoseY
    :initarg :dHDMapPoseY
    :type cl:float
    :initform 0.0)
   (dHDMapPoseZ
    :reader dHDMapPoseZ
    :initarg :dHDMapPoseZ
    :type cl:float
    :initform 0.0)
   (dHDMapPoseHeading
    :reader dHDMapPoseHeading
    :initarg :dHDMapPoseHeading
    :type cl:float
    :initform 0.0)
   (dHDMapPosePitch
    :reader dHDMapPosePitch
    :initarg :dHDMapPosePitch
    :type cl:float
    :initform 0.0)
   (dHDMapPoseRoll
    :reader dHDMapPoseRoll
    :initarg :dHDMapPoseRoll
    :type cl:float
    :initform 0.0)
   (dHDMapVelocityX
    :reader dHDMapVelocityX
    :initarg :dHDMapVelocityX
    :type cl:float
    :initform 0.0)
   (dHDMapVelocityY
    :reader dHDMapVelocityY
    :initarg :dHDMapVelocityY
    :type cl:float
    :initform 0.0)
   (dHDMapVelocityZ
    :reader dHDMapVelocityZ
    :initarg :dHDMapVelocityZ
    :type cl:float
    :initform 0.0)
   (fConfidence
    :reader fConfidence
    :initarg :fConfidence
    :type cl:float
    :initform 0.0)
   (cStatus
    :reader cStatus
    :initarg :cStatus
    :type cl:fixnum
    :initform 0)
   (cReserved
    :reader cReserved
    :initarg :cReserved
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 2 :element-type 'cl:fixnum :initial-element 0))
   (nReceivedMSGTimeFlags
    :reader nReceivedMSGTimeFlags
    :initarg :nReceivedMSGTimeFlags
    :type cl:integer
    :initform 0)
   (nSendMSGTimeFlags
    :reader nSendMSGTimeFlags
    :initarg :nSendMSGTimeFlags
    :type cl:integer
    :initform 0)
   (nImageTimeFlags
    :reader nImageTimeFlags
    :initarg :nImageTimeFlags
    :type cl:integer
    :initform 0)
   (nFrameNo
    :reader nFrameNo
    :initarg :nFrameNo
    :type cl:integer
    :initform 0))
)

(cl:defclass location (<location>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <location>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'location)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sim_msgs-msg:<location> is deprecated: use sim_msgs-msg:location instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:header-val is deprecated.  Use sim_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'bExtractFeature-val :lambda-list '(m))
(cl:defmethod bExtractFeature-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:bExtractFeature-val is deprecated.  Use sim_msgs-msg:bExtractFeature instead.")
  (bExtractFeature m))

(cl:ensure-generic-function 'dHDMapPoseX-val :lambda-list '(m))
(cl:defmethod dHDMapPoseX-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:dHDMapPoseX-val is deprecated.  Use sim_msgs-msg:dHDMapPoseX instead.")
  (dHDMapPoseX m))

(cl:ensure-generic-function 'dHDMapPoseY-val :lambda-list '(m))
(cl:defmethod dHDMapPoseY-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:dHDMapPoseY-val is deprecated.  Use sim_msgs-msg:dHDMapPoseY instead.")
  (dHDMapPoseY m))

(cl:ensure-generic-function 'dHDMapPoseZ-val :lambda-list '(m))
(cl:defmethod dHDMapPoseZ-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:dHDMapPoseZ-val is deprecated.  Use sim_msgs-msg:dHDMapPoseZ instead.")
  (dHDMapPoseZ m))

(cl:ensure-generic-function 'dHDMapPoseHeading-val :lambda-list '(m))
(cl:defmethod dHDMapPoseHeading-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:dHDMapPoseHeading-val is deprecated.  Use sim_msgs-msg:dHDMapPoseHeading instead.")
  (dHDMapPoseHeading m))

(cl:ensure-generic-function 'dHDMapPosePitch-val :lambda-list '(m))
(cl:defmethod dHDMapPosePitch-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:dHDMapPosePitch-val is deprecated.  Use sim_msgs-msg:dHDMapPosePitch instead.")
  (dHDMapPosePitch m))

(cl:ensure-generic-function 'dHDMapPoseRoll-val :lambda-list '(m))
(cl:defmethod dHDMapPoseRoll-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:dHDMapPoseRoll-val is deprecated.  Use sim_msgs-msg:dHDMapPoseRoll instead.")
  (dHDMapPoseRoll m))

(cl:ensure-generic-function 'dHDMapVelocityX-val :lambda-list '(m))
(cl:defmethod dHDMapVelocityX-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:dHDMapVelocityX-val is deprecated.  Use sim_msgs-msg:dHDMapVelocityX instead.")
  (dHDMapVelocityX m))

(cl:ensure-generic-function 'dHDMapVelocityY-val :lambda-list '(m))
(cl:defmethod dHDMapVelocityY-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:dHDMapVelocityY-val is deprecated.  Use sim_msgs-msg:dHDMapVelocityY instead.")
  (dHDMapVelocityY m))

(cl:ensure-generic-function 'dHDMapVelocityZ-val :lambda-list '(m))
(cl:defmethod dHDMapVelocityZ-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:dHDMapVelocityZ-val is deprecated.  Use sim_msgs-msg:dHDMapVelocityZ instead.")
  (dHDMapVelocityZ m))

(cl:ensure-generic-function 'fConfidence-val :lambda-list '(m))
(cl:defmethod fConfidence-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:fConfidence-val is deprecated.  Use sim_msgs-msg:fConfidence instead.")
  (fConfidence m))

(cl:ensure-generic-function 'cStatus-val :lambda-list '(m))
(cl:defmethod cStatus-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:cStatus-val is deprecated.  Use sim_msgs-msg:cStatus instead.")
  (cStatus m))

(cl:ensure-generic-function 'cReserved-val :lambda-list '(m))
(cl:defmethod cReserved-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:cReserved-val is deprecated.  Use sim_msgs-msg:cReserved instead.")
  (cReserved m))

(cl:ensure-generic-function 'nReceivedMSGTimeFlags-val :lambda-list '(m))
(cl:defmethod nReceivedMSGTimeFlags-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:nReceivedMSGTimeFlags-val is deprecated.  Use sim_msgs-msg:nReceivedMSGTimeFlags instead.")
  (nReceivedMSGTimeFlags m))

(cl:ensure-generic-function 'nSendMSGTimeFlags-val :lambda-list '(m))
(cl:defmethod nSendMSGTimeFlags-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:nSendMSGTimeFlags-val is deprecated.  Use sim_msgs-msg:nSendMSGTimeFlags instead.")
  (nSendMSGTimeFlags m))

(cl:ensure-generic-function 'nImageTimeFlags-val :lambda-list '(m))
(cl:defmethod nImageTimeFlags-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:nImageTimeFlags-val is deprecated.  Use sim_msgs-msg:nImageTimeFlags instead.")
  (nImageTimeFlags m))

(cl:ensure-generic-function 'nFrameNo-val :lambda-list '(m))
(cl:defmethod nFrameNo-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_msgs-msg:nFrameNo-val is deprecated.  Use sim_msgs-msg:nFrameNo instead.")
  (nFrameNo m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <location>) ostream)
  "Serializes a message object of type '<location>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'bExtractFeature) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'dHDMapPoseX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'dHDMapPoseY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'dHDMapPoseZ))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'dHDMapPoseHeading))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'dHDMapPosePitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'dHDMapPoseRoll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'dHDMapVelocityX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'dHDMapVelocityY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'dHDMapVelocityZ))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fConfidence))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cStatus)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'cReserved))
  (cl:let* ((signed (cl:slot-value msg 'nReceivedMSGTimeFlags)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'nSendMSGTimeFlags)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'nImageTimeFlags)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'nFrameNo)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <location>) istream)
  "Deserializes a message object of type '<location>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'bExtractFeature) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dHDMapPoseX) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dHDMapPoseY) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dHDMapPoseZ) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dHDMapPoseHeading) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dHDMapPosePitch) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dHDMapPoseRoll) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dHDMapVelocityX) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dHDMapVelocityY) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dHDMapVelocityZ) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fConfidence) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cStatus)) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'cReserved) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'cReserved)))
    (cl:dotimes (i 2)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nReceivedMSGTimeFlags) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nSendMSGTimeFlags) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nImageTimeFlags) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nFrameNo) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<location>)))
  "Returns string type for a message object of type '<location>"
  "sim_msgs/location")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'location)))
  "Returns string type for a message object of type 'location"
  "sim_msgs/location")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<location>)))
  "Returns md5sum for a message object of type '<location>"
  "7871a553d2e7882977b976bc07865f06")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'location)))
  "Returns md5sum for a message object of type 'location"
  "7871a553d2e7882977b976bc07865f06")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<location>)))
  "Returns full string definition for message of type '<location>"
  (cl:format cl:nil "Header header~%~%bool bExtractFeature~%~%#meter ~%float64 dHDMapPoseX~%float64 dHDMapPoseY~%float64 dHDMapPoseZ~%~%#degree~%float64 dHDMapPoseHeading~%float64 dHDMapPosePitch~%float64 dHDMapPoseRoll~%~%#quaternion sQuaternion~% ~%#m/s~%float64 dHDMapVelocityX~%float64 dHDMapVelocityY~%float64 dHDMapVelocityZ~% ~%#0.0 ~~ 1.0~%float32 fConfidence ~% ~%uint8 cStatus~% ~%uint8[2] cReserved~%~%int64 nReceivedMSGTimeFlags~%int64 nSendMSGTimeFlags~%int64 nImageTimeFlags~%~%int64 nFrameNo~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'location)))
  "Returns full string definition for message of type 'location"
  (cl:format cl:nil "Header header~%~%bool bExtractFeature~%~%#meter ~%float64 dHDMapPoseX~%float64 dHDMapPoseY~%float64 dHDMapPoseZ~%~%#degree~%float64 dHDMapPoseHeading~%float64 dHDMapPosePitch~%float64 dHDMapPoseRoll~%~%#quaternion sQuaternion~% ~%#m/s~%float64 dHDMapVelocityX~%float64 dHDMapVelocityY~%float64 dHDMapVelocityZ~% ~%#0.0 ~~ 1.0~%float32 fConfidence ~% ~%uint8 cStatus~% ~%uint8[2] cReserved~%~%int64 nReceivedMSGTimeFlags~%int64 nSendMSGTimeFlags~%int64 nImageTimeFlags~%~%int64 nFrameNo~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <location>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     8
     8
     8
     8
     8
     8
     8
     8
     8
     4
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'cReserved) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <location>))
  "Converts a ROS message object to a list"
  (cl:list 'location
    (cl:cons ':header (header msg))
    (cl:cons ':bExtractFeature (bExtractFeature msg))
    (cl:cons ':dHDMapPoseX (dHDMapPoseX msg))
    (cl:cons ':dHDMapPoseY (dHDMapPoseY msg))
    (cl:cons ':dHDMapPoseZ (dHDMapPoseZ msg))
    (cl:cons ':dHDMapPoseHeading (dHDMapPoseHeading msg))
    (cl:cons ':dHDMapPosePitch (dHDMapPosePitch msg))
    (cl:cons ':dHDMapPoseRoll (dHDMapPoseRoll msg))
    (cl:cons ':dHDMapVelocityX (dHDMapVelocityX msg))
    (cl:cons ':dHDMapVelocityY (dHDMapVelocityY msg))
    (cl:cons ':dHDMapVelocityZ (dHDMapVelocityZ msg))
    (cl:cons ':fConfidence (fConfidence msg))
    (cl:cons ':cStatus (cStatus msg))
    (cl:cons ':cReserved (cReserved msg))
    (cl:cons ':nReceivedMSGTimeFlags (nReceivedMSGTimeFlags msg))
    (cl:cons ':nSendMSGTimeFlags (nSendMSGTimeFlags msg))
    (cl:cons ':nImageTimeFlags (nImageTimeFlags msg))
    (cl:cons ':nFrameNo (nFrameNo msg))
))
