;; Auto-generated. Do not edit!


(when (boundp 'sim_msgs::location)
  (if (not (find-package "SIM_MSGS"))
    (make-package "SIM_MSGS"))
  (shadow 'location (find-package "SIM_MSGS")))
(unless (find-package "SIM_MSGS::LOCATION")
  (make-package "SIM_MSGS::LOCATION"))

(in-package "ROS")
;;//! \htmlinclude location.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sim_msgs::location
  :super ros::object
  :slots (_header _bExtractFeature _dHDMapPoseX _dHDMapPoseY _dHDMapPoseZ _dHDMapPoseHeading _dHDMapPosePitch _dHDMapPoseRoll _dHDMapVelocityX _dHDMapVelocityY _dHDMapVelocityZ _fConfidence _cStatus _cReserved _nReceivedMSGTimeFlags _nSendMSGTimeFlags _nImageTimeFlags _nFrameNo ))

(defmethod sim_msgs::location
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:bExtractFeature __bExtractFeature) nil)
    ((:dHDMapPoseX __dHDMapPoseX) 0.0)
    ((:dHDMapPoseY __dHDMapPoseY) 0.0)
    ((:dHDMapPoseZ __dHDMapPoseZ) 0.0)
    ((:dHDMapPoseHeading __dHDMapPoseHeading) 0.0)
    ((:dHDMapPosePitch __dHDMapPosePitch) 0.0)
    ((:dHDMapPoseRoll __dHDMapPoseRoll) 0.0)
    ((:dHDMapVelocityX __dHDMapVelocityX) 0.0)
    ((:dHDMapVelocityY __dHDMapVelocityY) 0.0)
    ((:dHDMapVelocityZ __dHDMapVelocityZ) 0.0)
    ((:fConfidence __fConfidence) 0.0)
    ((:cStatus __cStatus) 0)
    ((:cReserved __cReserved) (make-array 2 :initial-element 0 :element-type :char))
    ((:nReceivedMSGTimeFlags __nReceivedMSGTimeFlags) 0)
    ((:nSendMSGTimeFlags __nSendMSGTimeFlags) 0)
    ((:nImageTimeFlags __nImageTimeFlags) 0)
    ((:nFrameNo __nFrameNo) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _bExtractFeature __bExtractFeature)
   (setq _dHDMapPoseX (float __dHDMapPoseX))
   (setq _dHDMapPoseY (float __dHDMapPoseY))
   (setq _dHDMapPoseZ (float __dHDMapPoseZ))
   (setq _dHDMapPoseHeading (float __dHDMapPoseHeading))
   (setq _dHDMapPosePitch (float __dHDMapPosePitch))
   (setq _dHDMapPoseRoll (float __dHDMapPoseRoll))
   (setq _dHDMapVelocityX (float __dHDMapVelocityX))
   (setq _dHDMapVelocityY (float __dHDMapVelocityY))
   (setq _dHDMapVelocityZ (float __dHDMapVelocityZ))
   (setq _fConfidence (float __fConfidence))
   (setq _cStatus (round __cStatus))
   (setq _cReserved __cReserved)
   (setq _nReceivedMSGTimeFlags (round __nReceivedMSGTimeFlags))
   (setq _nSendMSGTimeFlags (round __nSendMSGTimeFlags))
   (setq _nImageTimeFlags (round __nImageTimeFlags))
   (setq _nFrameNo (round __nFrameNo))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:bExtractFeature
   (&optional __bExtractFeature)
   (if __bExtractFeature (setq _bExtractFeature __bExtractFeature)) _bExtractFeature)
  (:dHDMapPoseX
   (&optional __dHDMapPoseX)
   (if __dHDMapPoseX (setq _dHDMapPoseX __dHDMapPoseX)) _dHDMapPoseX)
  (:dHDMapPoseY
   (&optional __dHDMapPoseY)
   (if __dHDMapPoseY (setq _dHDMapPoseY __dHDMapPoseY)) _dHDMapPoseY)
  (:dHDMapPoseZ
   (&optional __dHDMapPoseZ)
   (if __dHDMapPoseZ (setq _dHDMapPoseZ __dHDMapPoseZ)) _dHDMapPoseZ)
  (:dHDMapPoseHeading
   (&optional __dHDMapPoseHeading)
   (if __dHDMapPoseHeading (setq _dHDMapPoseHeading __dHDMapPoseHeading)) _dHDMapPoseHeading)
  (:dHDMapPosePitch
   (&optional __dHDMapPosePitch)
   (if __dHDMapPosePitch (setq _dHDMapPosePitch __dHDMapPosePitch)) _dHDMapPosePitch)
  (:dHDMapPoseRoll
   (&optional __dHDMapPoseRoll)
   (if __dHDMapPoseRoll (setq _dHDMapPoseRoll __dHDMapPoseRoll)) _dHDMapPoseRoll)
  (:dHDMapVelocityX
   (&optional __dHDMapVelocityX)
   (if __dHDMapVelocityX (setq _dHDMapVelocityX __dHDMapVelocityX)) _dHDMapVelocityX)
  (:dHDMapVelocityY
   (&optional __dHDMapVelocityY)
   (if __dHDMapVelocityY (setq _dHDMapVelocityY __dHDMapVelocityY)) _dHDMapVelocityY)
  (:dHDMapVelocityZ
   (&optional __dHDMapVelocityZ)
   (if __dHDMapVelocityZ (setq _dHDMapVelocityZ __dHDMapVelocityZ)) _dHDMapVelocityZ)
  (:fConfidence
   (&optional __fConfidence)
   (if __fConfidence (setq _fConfidence __fConfidence)) _fConfidence)
  (:cStatus
   (&optional __cStatus)
   (if __cStatus (setq _cStatus __cStatus)) _cStatus)
  (:cReserved
   (&optional __cReserved)
   (if __cReserved (setq _cReserved __cReserved)) _cReserved)
  (:nReceivedMSGTimeFlags
   (&optional __nReceivedMSGTimeFlags)
   (if __nReceivedMSGTimeFlags (setq _nReceivedMSGTimeFlags __nReceivedMSGTimeFlags)) _nReceivedMSGTimeFlags)
  (:nSendMSGTimeFlags
   (&optional __nSendMSGTimeFlags)
   (if __nSendMSGTimeFlags (setq _nSendMSGTimeFlags __nSendMSGTimeFlags)) _nSendMSGTimeFlags)
  (:nImageTimeFlags
   (&optional __nImageTimeFlags)
   (if __nImageTimeFlags (setq _nImageTimeFlags __nImageTimeFlags)) _nImageTimeFlags)
  (:nFrameNo
   (&optional __nFrameNo)
   (if __nFrameNo (setq _nFrameNo __nFrameNo)) _nFrameNo)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _bExtractFeature
    1
    ;; float64 _dHDMapPoseX
    8
    ;; float64 _dHDMapPoseY
    8
    ;; float64 _dHDMapPoseZ
    8
    ;; float64 _dHDMapPoseHeading
    8
    ;; float64 _dHDMapPosePitch
    8
    ;; float64 _dHDMapPoseRoll
    8
    ;; float64 _dHDMapVelocityX
    8
    ;; float64 _dHDMapVelocityY
    8
    ;; float64 _dHDMapVelocityZ
    8
    ;; float32 _fConfidence
    4
    ;; uint8 _cStatus
    1
    ;; uint8[2] _cReserved
    (* 1    2)
    ;; int64 _nReceivedMSGTimeFlags
    8
    ;; int64 _nSendMSGTimeFlags
    8
    ;; int64 _nImageTimeFlags
    8
    ;; int64 _nFrameNo
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _bExtractFeature
       (if _bExtractFeature (write-byte -1 s) (write-byte 0 s))
     ;; float64 _dHDMapPoseX
       (sys::poke _dHDMapPoseX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _dHDMapPoseY
       (sys::poke _dHDMapPoseY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _dHDMapPoseZ
       (sys::poke _dHDMapPoseZ (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _dHDMapPoseHeading
       (sys::poke _dHDMapPoseHeading (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _dHDMapPosePitch
       (sys::poke _dHDMapPosePitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _dHDMapPoseRoll
       (sys::poke _dHDMapPoseRoll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _dHDMapVelocityX
       (sys::poke _dHDMapVelocityX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _dHDMapVelocityY
       (sys::poke _dHDMapVelocityY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _dHDMapVelocityZ
       (sys::poke _dHDMapVelocityZ (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _fConfidence
       (sys::poke _fConfidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _cStatus
       (write-byte _cStatus s)
     ;; uint8[2] _cReserved
     (princ _cReserved s)
     ;; int64 _nReceivedMSGTimeFlags
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _nReceivedMSGTimeFlags (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _nReceivedMSGTimeFlags) (= (length (_nReceivedMSGTimeFlags . bv)) 2)) ;; bignum
              (write-long (ash (elt (_nReceivedMSGTimeFlags . bv) 0) 0) s)
              (write-long (ash (elt (_nReceivedMSGTimeFlags . bv) 1) -1) s))
             ((and (class _nReceivedMSGTimeFlags) (= (length (_nReceivedMSGTimeFlags . bv)) 1)) ;; big1
              (write-long (elt (_nReceivedMSGTimeFlags . bv) 0) s)
              (write-long (if (>= _nReceivedMSGTimeFlags 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _nReceivedMSGTimeFlags s)(write-long (if (>= _nReceivedMSGTimeFlags 0) 0 #xffffffff) s)))
     ;; int64 _nSendMSGTimeFlags
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _nSendMSGTimeFlags (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _nSendMSGTimeFlags) (= (length (_nSendMSGTimeFlags . bv)) 2)) ;; bignum
              (write-long (ash (elt (_nSendMSGTimeFlags . bv) 0) 0) s)
              (write-long (ash (elt (_nSendMSGTimeFlags . bv) 1) -1) s))
             ((and (class _nSendMSGTimeFlags) (= (length (_nSendMSGTimeFlags . bv)) 1)) ;; big1
              (write-long (elt (_nSendMSGTimeFlags . bv) 0) s)
              (write-long (if (>= _nSendMSGTimeFlags 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _nSendMSGTimeFlags s)(write-long (if (>= _nSendMSGTimeFlags 0) 0 #xffffffff) s)))
     ;; int64 _nImageTimeFlags
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _nImageTimeFlags (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _nImageTimeFlags) (= (length (_nImageTimeFlags . bv)) 2)) ;; bignum
              (write-long (ash (elt (_nImageTimeFlags . bv) 0) 0) s)
              (write-long (ash (elt (_nImageTimeFlags . bv) 1) -1) s))
             ((and (class _nImageTimeFlags) (= (length (_nImageTimeFlags . bv)) 1)) ;; big1
              (write-long (elt (_nImageTimeFlags . bv) 0) s)
              (write-long (if (>= _nImageTimeFlags 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _nImageTimeFlags s)(write-long (if (>= _nImageTimeFlags 0) 0 #xffffffff) s)))
     ;; int64 _nFrameNo
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _nFrameNo (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _nFrameNo) (= (length (_nFrameNo . bv)) 2)) ;; bignum
              (write-long (ash (elt (_nFrameNo . bv) 0) 0) s)
              (write-long (ash (elt (_nFrameNo . bv) 1) -1) s))
             ((and (class _nFrameNo) (= (length (_nFrameNo . bv)) 1)) ;; big1
              (write-long (elt (_nFrameNo . bv) 0) s)
              (write-long (if (>= _nFrameNo 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _nFrameNo s)(write-long (if (>= _nFrameNo 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _bExtractFeature
     (setq _bExtractFeature (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _dHDMapPoseX
     (setq _dHDMapPoseX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _dHDMapPoseY
     (setq _dHDMapPoseY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _dHDMapPoseZ
     (setq _dHDMapPoseZ (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _dHDMapPoseHeading
     (setq _dHDMapPoseHeading (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _dHDMapPosePitch
     (setq _dHDMapPosePitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _dHDMapPoseRoll
     (setq _dHDMapPoseRoll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _dHDMapVelocityX
     (setq _dHDMapVelocityX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _dHDMapVelocityY
     (setq _dHDMapVelocityY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _dHDMapVelocityZ
     (setq _dHDMapVelocityZ (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _fConfidence
     (setq _fConfidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _cStatus
     (setq _cStatus (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8[2] _cReserved
   (setq _cReserved (make-array 2 :element-type :char))
   (replace _cReserved buf :start2 ptr-) (incf ptr- 2)
   ;; int64 _nReceivedMSGTimeFlags
#+(or :alpha :irix6 :x86_64)
      (setf _nReceivedMSGTimeFlags (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _nReceivedMSGTimeFlags (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _nSendMSGTimeFlags
#+(or :alpha :irix6 :x86_64)
      (setf _nSendMSGTimeFlags (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _nSendMSGTimeFlags (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _nImageTimeFlags
#+(or :alpha :irix6 :x86_64)
      (setf _nImageTimeFlags (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _nImageTimeFlags (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _nFrameNo
#+(or :alpha :irix6 :x86_64)
      (setf _nFrameNo (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _nFrameNo (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get sim_msgs::location :md5sum-) "7871a553d2e7882977b976bc07865f06")
(setf (get sim_msgs::location :datatype-) "sim_msgs/location")
(setf (get sim_msgs::location :definition-)
      "Header header

bool bExtractFeature

#meter 
float64 dHDMapPoseX
float64 dHDMapPoseY
float64 dHDMapPoseZ

#degree
float64 dHDMapPoseHeading
float64 dHDMapPosePitch
float64 dHDMapPoseRoll

#quaternion sQuaternion
 
#m/s
float64 dHDMapVelocityX
float64 dHDMapVelocityY
float64 dHDMapVelocityZ
 
#0.0 ~ 1.0
float32 fConfidence 
 
uint8 cStatus
 
uint8[2] cReserved

int64 nReceivedMSGTimeFlags
int64 nSendMSGTimeFlags
int64 nImageTimeFlags

int64 nFrameNo

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :sim_msgs/location "7871a553d2e7882977b976bc07865f06")


