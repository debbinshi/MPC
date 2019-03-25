// Auto-generated. Do not edit!

// (in-package sim_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class location {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.bExtractFeature = null;
      this.dHDMapPoseX = null;
      this.dHDMapPoseY = null;
      this.dHDMapPoseZ = null;
      this.dHDMapPoseHeading = null;
      this.dHDMapPosePitch = null;
      this.dHDMapPoseRoll = null;
      this.dHDMapVelocityX = null;
      this.dHDMapVelocityY = null;
      this.dHDMapVelocityZ = null;
      this.fConfidence = null;
      this.cStatus = null;
      this.cReserved = null;
      this.nReceivedMSGTimeFlags = null;
      this.nSendMSGTimeFlags = null;
      this.nImageTimeFlags = null;
      this.nFrameNo = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('bExtractFeature')) {
        this.bExtractFeature = initObj.bExtractFeature
      }
      else {
        this.bExtractFeature = false;
      }
      if (initObj.hasOwnProperty('dHDMapPoseX')) {
        this.dHDMapPoseX = initObj.dHDMapPoseX
      }
      else {
        this.dHDMapPoseX = 0.0;
      }
      if (initObj.hasOwnProperty('dHDMapPoseY')) {
        this.dHDMapPoseY = initObj.dHDMapPoseY
      }
      else {
        this.dHDMapPoseY = 0.0;
      }
      if (initObj.hasOwnProperty('dHDMapPoseZ')) {
        this.dHDMapPoseZ = initObj.dHDMapPoseZ
      }
      else {
        this.dHDMapPoseZ = 0.0;
      }
      if (initObj.hasOwnProperty('dHDMapPoseHeading')) {
        this.dHDMapPoseHeading = initObj.dHDMapPoseHeading
      }
      else {
        this.dHDMapPoseHeading = 0.0;
      }
      if (initObj.hasOwnProperty('dHDMapPosePitch')) {
        this.dHDMapPosePitch = initObj.dHDMapPosePitch
      }
      else {
        this.dHDMapPosePitch = 0.0;
      }
      if (initObj.hasOwnProperty('dHDMapPoseRoll')) {
        this.dHDMapPoseRoll = initObj.dHDMapPoseRoll
      }
      else {
        this.dHDMapPoseRoll = 0.0;
      }
      if (initObj.hasOwnProperty('dHDMapVelocityX')) {
        this.dHDMapVelocityX = initObj.dHDMapVelocityX
      }
      else {
        this.dHDMapVelocityX = 0.0;
      }
      if (initObj.hasOwnProperty('dHDMapVelocityY')) {
        this.dHDMapVelocityY = initObj.dHDMapVelocityY
      }
      else {
        this.dHDMapVelocityY = 0.0;
      }
      if (initObj.hasOwnProperty('dHDMapVelocityZ')) {
        this.dHDMapVelocityZ = initObj.dHDMapVelocityZ
      }
      else {
        this.dHDMapVelocityZ = 0.0;
      }
      if (initObj.hasOwnProperty('fConfidence')) {
        this.fConfidence = initObj.fConfidence
      }
      else {
        this.fConfidence = 0.0;
      }
      if (initObj.hasOwnProperty('cStatus')) {
        this.cStatus = initObj.cStatus
      }
      else {
        this.cStatus = 0;
      }
      if (initObj.hasOwnProperty('cReserved')) {
        this.cReserved = initObj.cReserved
      }
      else {
        this.cReserved = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('nReceivedMSGTimeFlags')) {
        this.nReceivedMSGTimeFlags = initObj.nReceivedMSGTimeFlags
      }
      else {
        this.nReceivedMSGTimeFlags = 0;
      }
      if (initObj.hasOwnProperty('nSendMSGTimeFlags')) {
        this.nSendMSGTimeFlags = initObj.nSendMSGTimeFlags
      }
      else {
        this.nSendMSGTimeFlags = 0;
      }
      if (initObj.hasOwnProperty('nImageTimeFlags')) {
        this.nImageTimeFlags = initObj.nImageTimeFlags
      }
      else {
        this.nImageTimeFlags = 0;
      }
      if (initObj.hasOwnProperty('nFrameNo')) {
        this.nFrameNo = initObj.nFrameNo
      }
      else {
        this.nFrameNo = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type location
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [bExtractFeature]
    bufferOffset = _serializer.bool(obj.bExtractFeature, buffer, bufferOffset);
    // Serialize message field [dHDMapPoseX]
    bufferOffset = _serializer.float64(obj.dHDMapPoseX, buffer, bufferOffset);
    // Serialize message field [dHDMapPoseY]
    bufferOffset = _serializer.float64(obj.dHDMapPoseY, buffer, bufferOffset);
    // Serialize message field [dHDMapPoseZ]
    bufferOffset = _serializer.float64(obj.dHDMapPoseZ, buffer, bufferOffset);
    // Serialize message field [dHDMapPoseHeading]
    bufferOffset = _serializer.float64(obj.dHDMapPoseHeading, buffer, bufferOffset);
    // Serialize message field [dHDMapPosePitch]
    bufferOffset = _serializer.float64(obj.dHDMapPosePitch, buffer, bufferOffset);
    // Serialize message field [dHDMapPoseRoll]
    bufferOffset = _serializer.float64(obj.dHDMapPoseRoll, buffer, bufferOffset);
    // Serialize message field [dHDMapVelocityX]
    bufferOffset = _serializer.float64(obj.dHDMapVelocityX, buffer, bufferOffset);
    // Serialize message field [dHDMapVelocityY]
    bufferOffset = _serializer.float64(obj.dHDMapVelocityY, buffer, bufferOffset);
    // Serialize message field [dHDMapVelocityZ]
    bufferOffset = _serializer.float64(obj.dHDMapVelocityZ, buffer, bufferOffset);
    // Serialize message field [fConfidence]
    bufferOffset = _serializer.float32(obj.fConfidence, buffer, bufferOffset);
    // Serialize message field [cStatus]
    bufferOffset = _serializer.uint8(obj.cStatus, buffer, bufferOffset);
    // Check that the constant length array field [cReserved] has the right length
    if (obj.cReserved.length !== 2) {
      throw new Error('Unable to serialize array field cReserved - length must be 2')
    }
    // Serialize message field [cReserved]
    bufferOffset = _arraySerializer.uint8(obj.cReserved, buffer, bufferOffset, 2);
    // Serialize message field [nReceivedMSGTimeFlags]
    bufferOffset = _serializer.int64(obj.nReceivedMSGTimeFlags, buffer, bufferOffset);
    // Serialize message field [nSendMSGTimeFlags]
    bufferOffset = _serializer.int64(obj.nSendMSGTimeFlags, buffer, bufferOffset);
    // Serialize message field [nImageTimeFlags]
    bufferOffset = _serializer.int64(obj.nImageTimeFlags, buffer, bufferOffset);
    // Serialize message field [nFrameNo]
    bufferOffset = _serializer.int64(obj.nFrameNo, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type location
    let len;
    let data = new location(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [bExtractFeature]
    data.bExtractFeature = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [dHDMapPoseX]
    data.dHDMapPoseX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [dHDMapPoseY]
    data.dHDMapPoseY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [dHDMapPoseZ]
    data.dHDMapPoseZ = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [dHDMapPoseHeading]
    data.dHDMapPoseHeading = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [dHDMapPosePitch]
    data.dHDMapPosePitch = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [dHDMapPoseRoll]
    data.dHDMapPoseRoll = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [dHDMapVelocityX]
    data.dHDMapVelocityX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [dHDMapVelocityY]
    data.dHDMapVelocityY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [dHDMapVelocityZ]
    data.dHDMapVelocityZ = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [fConfidence]
    data.fConfidence = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [cStatus]
    data.cStatus = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [cReserved]
    data.cReserved = _arrayDeserializer.uint8(buffer, bufferOffset, 2)
    // Deserialize message field [nReceivedMSGTimeFlags]
    data.nReceivedMSGTimeFlags = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [nSendMSGTimeFlags]
    data.nSendMSGTimeFlags = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [nImageTimeFlags]
    data.nImageTimeFlags = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [nFrameNo]
    data.nFrameNo = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 112;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sim_msgs/location';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7871a553d2e7882977b976bc07865f06';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new location(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.bExtractFeature !== undefined) {
      resolved.bExtractFeature = msg.bExtractFeature;
    }
    else {
      resolved.bExtractFeature = false
    }

    if (msg.dHDMapPoseX !== undefined) {
      resolved.dHDMapPoseX = msg.dHDMapPoseX;
    }
    else {
      resolved.dHDMapPoseX = 0.0
    }

    if (msg.dHDMapPoseY !== undefined) {
      resolved.dHDMapPoseY = msg.dHDMapPoseY;
    }
    else {
      resolved.dHDMapPoseY = 0.0
    }

    if (msg.dHDMapPoseZ !== undefined) {
      resolved.dHDMapPoseZ = msg.dHDMapPoseZ;
    }
    else {
      resolved.dHDMapPoseZ = 0.0
    }

    if (msg.dHDMapPoseHeading !== undefined) {
      resolved.dHDMapPoseHeading = msg.dHDMapPoseHeading;
    }
    else {
      resolved.dHDMapPoseHeading = 0.0
    }

    if (msg.dHDMapPosePitch !== undefined) {
      resolved.dHDMapPosePitch = msg.dHDMapPosePitch;
    }
    else {
      resolved.dHDMapPosePitch = 0.0
    }

    if (msg.dHDMapPoseRoll !== undefined) {
      resolved.dHDMapPoseRoll = msg.dHDMapPoseRoll;
    }
    else {
      resolved.dHDMapPoseRoll = 0.0
    }

    if (msg.dHDMapVelocityX !== undefined) {
      resolved.dHDMapVelocityX = msg.dHDMapVelocityX;
    }
    else {
      resolved.dHDMapVelocityX = 0.0
    }

    if (msg.dHDMapVelocityY !== undefined) {
      resolved.dHDMapVelocityY = msg.dHDMapVelocityY;
    }
    else {
      resolved.dHDMapVelocityY = 0.0
    }

    if (msg.dHDMapVelocityZ !== undefined) {
      resolved.dHDMapVelocityZ = msg.dHDMapVelocityZ;
    }
    else {
      resolved.dHDMapVelocityZ = 0.0
    }

    if (msg.fConfidence !== undefined) {
      resolved.fConfidence = msg.fConfidence;
    }
    else {
      resolved.fConfidence = 0.0
    }

    if (msg.cStatus !== undefined) {
      resolved.cStatus = msg.cStatus;
    }
    else {
      resolved.cStatus = 0
    }

    if (msg.cReserved !== undefined) {
      resolved.cReserved = msg.cReserved;
    }
    else {
      resolved.cReserved = new Array(2).fill(0)
    }

    if (msg.nReceivedMSGTimeFlags !== undefined) {
      resolved.nReceivedMSGTimeFlags = msg.nReceivedMSGTimeFlags;
    }
    else {
      resolved.nReceivedMSGTimeFlags = 0
    }

    if (msg.nSendMSGTimeFlags !== undefined) {
      resolved.nSendMSGTimeFlags = msg.nSendMSGTimeFlags;
    }
    else {
      resolved.nSendMSGTimeFlags = 0
    }

    if (msg.nImageTimeFlags !== undefined) {
      resolved.nImageTimeFlags = msg.nImageTimeFlags;
    }
    else {
      resolved.nImageTimeFlags = 0
    }

    if (msg.nFrameNo !== undefined) {
      resolved.nFrameNo = msg.nFrameNo;
    }
    else {
      resolved.nFrameNo = 0
    }

    return resolved;
    }
};

module.exports = location;
