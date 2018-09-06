// Auto-generated. Do not edit!

// (in-package my_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class vel_ang_msgs {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vel = null;
      this.ang = null;
    }
    else {
      if (initObj.hasOwnProperty('vel')) {
        this.vel = initObj.vel
      }
      else {
        this.vel = 0.0;
      }
      if (initObj.hasOwnProperty('ang')) {
        this.ang = initObj.ang
      }
      else {
        this.ang = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type vel_ang_msgs
    // Serialize message field [vel]
    bufferOffset = _serializer.float32(obj.vel, buffer, bufferOffset);
    // Serialize message field [ang]
    bufferOffset = _serializer.float32(obj.ang, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type vel_ang_msgs
    let len;
    let data = new vel_ang_msgs(null);
    // Deserialize message field [vel]
    data.vel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ang]
    data.ang = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'my_control/vel_ang_msgs';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ed3a566fa16ba731db800e9b74c7bfe7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 vel
    float32 ang
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new vel_ang_msgs(null);
    if (msg.vel !== undefined) {
      resolved.vel = msg.vel;
    }
    else {
      resolved.vel = 0.0
    }

    if (msg.ang !== undefined) {
      resolved.ang = msg.ang;
    }
    else {
      resolved.ang = 0.0
    }

    return resolved;
    }
};

module.exports = vel_ang_msgs;
