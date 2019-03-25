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
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class sim_line {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pos_array = null;
      this.color = null;
    }
    else {
      if (initObj.hasOwnProperty('pos_array')) {
        this.pos_array = initObj.pos_array
      }
      else {
        this.pos_array = [];
      }
      if (initObj.hasOwnProperty('color')) {
        this.color = initObj.color
      }
      else {
        this.color = new std_msgs.msg.String();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sim_line
    // Serialize message field [pos_array]
    // Serialize the length for message field [pos_array]
    bufferOffset = _serializer.uint32(obj.pos_array.length, buffer, bufferOffset);
    obj.pos_array.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point32.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [color]
    bufferOffset = std_msgs.msg.String.serialize(obj.color, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sim_line
    let len;
    let data = new sim_line(null);
    // Deserialize message field [pos_array]
    // Deserialize array length for message field [pos_array]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.pos_array = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.pos_array[i] = geometry_msgs.msg.Point32.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [color]
    data.color = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 12 * object.pos_array.length;
    length += std_msgs.msg.String.getMessageSize(object.color);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sim_msgs/sim_line';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '08bb0bba13ec07969c1f6f6091bab7f9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point32[] pos_array
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sim_line(null);
    if (msg.pos_array !== undefined) {
      resolved.pos_array = new Array(msg.pos_array.length);
      for (let i = 0; i < resolved.pos_array.length; ++i) {
        resolved.pos_array[i] = geometry_msgs.msg.Point32.Resolve(msg.pos_array[i]);
      }
    }
    else {
      resolved.pos_array = []
    }

    if (msg.color !== undefined) {
      resolved.color = std_msgs.msg.String.Resolve(msg.color)
    }
    else {
      resolved.color = new std_msgs.msg.String()
    }

    return resolved;
    }
};

module.exports = sim_line;
