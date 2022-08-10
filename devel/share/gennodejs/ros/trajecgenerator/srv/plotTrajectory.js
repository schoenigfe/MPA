// Auto-generated. Do not edit!

// (in-package trajecgenerator.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class plotTrajectoryRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.title = null;
      this.maxT = null;
      this.dT = null;
      this.k = null;
      this.xrange = null;
      this.yrange = null;
    }
    else {
      if (initObj.hasOwnProperty('title')) {
        this.title = initObj.title
      }
      else {
        this.title = '';
      }
      if (initObj.hasOwnProperty('maxT')) {
        this.maxT = initObj.maxT
      }
      else {
        this.maxT = 0.0;
      }
      if (initObj.hasOwnProperty('dT')) {
        this.dT = initObj.dT
      }
      else {
        this.dT = 0.0;
      }
      if (initObj.hasOwnProperty('k')) {
        this.k = initObj.k
      }
      else {
        this.k = 0.0;
      }
      if (initObj.hasOwnProperty('xrange')) {
        this.xrange = initObj.xrange
      }
      else {
        this.xrange = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('yrange')) {
        this.yrange = initObj.yrange
      }
      else {
        this.yrange = new Array(2).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type plotTrajectoryRequest
    // Serialize message field [title]
    bufferOffset = _serializer.string(obj.title, buffer, bufferOffset);
    // Serialize message field [maxT]
    bufferOffset = _serializer.float32(obj.maxT, buffer, bufferOffset);
    // Serialize message field [dT]
    bufferOffset = _serializer.float32(obj.dT, buffer, bufferOffset);
    // Serialize message field [k]
    bufferOffset = _serializer.float32(obj.k, buffer, bufferOffset);
    // Check that the constant length array field [xrange] has the right length
    if (obj.xrange.length !== 2) {
      throw new Error('Unable to serialize array field xrange - length must be 2')
    }
    // Serialize message field [xrange]
    bufferOffset = _arraySerializer.float32(obj.xrange, buffer, bufferOffset, 2);
    // Check that the constant length array field [yrange] has the right length
    if (obj.yrange.length !== 2) {
      throw new Error('Unable to serialize array field yrange - length must be 2')
    }
    // Serialize message field [yrange]
    bufferOffset = _arraySerializer.float32(obj.yrange, buffer, bufferOffset, 2);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type plotTrajectoryRequest
    let len;
    let data = new plotTrajectoryRequest(null);
    // Deserialize message field [title]
    data.title = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [maxT]
    data.maxT = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [dT]
    data.dT = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [k]
    data.k = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [xrange]
    data.xrange = _arrayDeserializer.float32(buffer, bufferOffset, 2)
    // Deserialize message field [yrange]
    data.yrange = _arrayDeserializer.float32(buffer, bufferOffset, 2)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.title);
    return length + 32;
  }

  static datatype() {
    // Returns string type for a service object
    return 'trajecgenerator/plotTrajectoryRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2860cf7d8312d3024b3ab61f13528c56';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string title
    float32 maxT
    float32 dT
    float32 k
    float32[2] xrange
    float32[2] yrange
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new plotTrajectoryRequest(null);
    if (msg.title !== undefined) {
      resolved.title = msg.title;
    }
    else {
      resolved.title = ''
    }

    if (msg.maxT !== undefined) {
      resolved.maxT = msg.maxT;
    }
    else {
      resolved.maxT = 0.0
    }

    if (msg.dT !== undefined) {
      resolved.dT = msg.dT;
    }
    else {
      resolved.dT = 0.0
    }

    if (msg.k !== undefined) {
      resolved.k = msg.k;
    }
    else {
      resolved.k = 0.0
    }

    if (msg.xrange !== undefined) {
      resolved.xrange = msg.xrange;
    }
    else {
      resolved.xrange = new Array(2).fill(0)
    }

    if (msg.yrange !== undefined) {
      resolved.yrange = msg.yrange;
    }
    else {
      resolved.yrange = new Array(2).fill(0)
    }

    return resolved;
    }
};

class plotTrajectoryResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type plotTrajectoryResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type plotTrajectoryResponse
    let len;
    let data = new plotTrajectoryResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'trajecgenerator/plotTrajectoryResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new plotTrajectoryResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: plotTrajectoryRequest,
  Response: plotTrajectoryResponse,
  md5sum() { return '2860cf7d8312d3024b3ab61f13528c56'; },
  datatype() { return 'trajecgenerator/plotTrajectory'; }
};
