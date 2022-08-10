// Auto-generated. Do not edit!

// (in-package trajecgenerator.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let c_trajec = require('./c_trajec.js');

//-----------------------------------------------------------

class c_trajec_vector {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.points = null;
    }
    else {
      if (initObj.hasOwnProperty('points')) {
        this.points = initObj.points
      }
      else {
        this.points = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type c_trajec_vector
    // Serialize message field [points]
    // Serialize the length for message field [points]
    bufferOffset = _serializer.uint32(obj.points.length, buffer, bufferOffset);
    obj.points.forEach((val) => {
      bufferOffset = c_trajec.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type c_trajec_vector
    let len;
    let data = new c_trajec_vector(null);
    // Deserialize message field [points]
    // Deserialize array length for message field [points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.points[i] = c_trajec.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 32 * object.points.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'trajecgenerator/c_trajec_vector';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd88f63147d96501d5ff38e0f76d36cc9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    c_trajec[] points
    
    ================================================================================
    MSG: trajecgenerator/c_trajec
    float32 x
    float32 y
    float32 dx
    float32 dy
    float32 ddx
    float32 ddy
    uint64 timestamp
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new c_trajec_vector(null);
    if (msg.points !== undefined) {
      resolved.points = new Array(msg.points.length);
      for (let i = 0; i < resolved.points.length; ++i) {
        resolved.points[i] = c_trajec.Resolve(msg.points[i]);
      }
    }
    else {
      resolved.points = []
    }

    return resolved;
    }
};

module.exports = c_trajec_vector;
