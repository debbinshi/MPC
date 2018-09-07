// Auto-generated. Do not edit!

// (in-package sim_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sim_line = require('./sim_line.js');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class sim_draw {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.block_width = null;
      this.block = null;
      this.line_ego = null;
      this.line_map = null;
    }
    else {
      if (initObj.hasOwnProperty('block_width')) {
        this.block_width = initObj.block_width
      }
      else {
        this.block_width = 0.0;
      }
      if (initObj.hasOwnProperty('block')) {
        this.block = initObj.block
      }
      else {
        this.block = [];
      }
      if (initObj.hasOwnProperty('line_ego')) {
        this.line_ego = initObj.line_ego
      }
      else {
        this.line_ego = [];
      }
      if (initObj.hasOwnProperty('line_map')) {
        this.line_map = initObj.line_map
      }
      else {
        this.line_map = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sim_draw
    // Serialize message field [block_width]
    bufferOffset = _serializer.float32(obj.block_width, buffer, bufferOffset);
    // Serialize message field [block]
    // Serialize the length for message field [block]
    bufferOffset = _serializer.uint32(obj.block.length, buffer, bufferOffset);
    obj.block.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point32.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [line_ego]
    // Serialize the length for message field [line_ego]
    bufferOffset = _serializer.uint32(obj.line_ego.length, buffer, bufferOffset);
    obj.line_ego.forEach((val) => {
      bufferOffset = sim_line.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [line_map]
    // Serialize the length for message field [line_map]
    bufferOffset = _serializer.uint32(obj.line_map.length, buffer, bufferOffset);
    obj.line_map.forEach((val) => {
      bufferOffset = sim_line.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sim_draw
    let len;
    let data = new sim_draw(null);
    // Deserialize message field [block_width]
    data.block_width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [block]
    // Deserialize array length for message field [block]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.block = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.block[i] = geometry_msgs.msg.Point32.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [line_ego]
    // Deserialize array length for message field [line_ego]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.line_ego = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.line_ego[i] = sim_line.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [line_map]
    // Deserialize array length for message field [line_map]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.line_map = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.line_map[i] = sim_line.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 12 * object.block.length;
    object.line_ego.forEach((val) => {
      length += sim_line.getMessageSize(val);
    });
    object.line_map.forEach((val) => {
      length += sim_line.getMessageSize(val);
    });
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sim_msgs/sim_draw';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1ed2f3f92c3262f669836ba521b6909d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 block_width
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sim_draw(null);
    if (msg.block_width !== undefined) {
      resolved.block_width = msg.block_width;
    }
    else {
      resolved.block_width = 0.0
    }

    if (msg.block !== undefined) {
      resolved.block = new Array(msg.block.length);
      for (let i = 0; i < resolved.block.length; ++i) {
        resolved.block[i] = geometry_msgs.msg.Point32.Resolve(msg.block[i]);
      }
    }
    else {
      resolved.block = []
    }

    if (msg.line_ego !== undefined) {
      resolved.line_ego = new Array(msg.line_ego.length);
      for (let i = 0; i < resolved.line_ego.length; ++i) {
        resolved.line_ego[i] = sim_line.Resolve(msg.line_ego[i]);
      }
    }
    else {
      resolved.line_ego = []
    }

    if (msg.line_map !== undefined) {
      resolved.line_map = new Array(msg.line_map.length);
      for (let i = 0; i < resolved.line_map.length; ++i) {
        resolved.line_map[i] = sim_line.Resolve(msg.line_map[i]);
      }
    }
    else {
      resolved.line_map = []
    }

    return resolved;
    }
};

module.exports = sim_draw;
