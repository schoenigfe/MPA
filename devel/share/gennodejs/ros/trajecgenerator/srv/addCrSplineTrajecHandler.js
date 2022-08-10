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

class addCrSplineTrajecHandlerRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.pointsX = null;
      this.pointsY = null;
      this.closed = null;
      this.time = null;
      this.k = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('pointsX')) {
        this.pointsX = initObj.pointsX
      }
      else {
        this.pointsX = [];
      }
      if (initObj.hasOwnProperty('pointsY')) {
        this.pointsY = initObj.pointsY
      }
      else {
        this.pointsY = [];
      }
      if (initObj.hasOwnProperty('closed')) {
        this.closed = initObj.closed
      }
      else {
        this.closed = false;
      }
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = 0.0;
      }
      if (initObj.hasOwnProperty('k')) {
        this.k = initObj.k
      }
      else {
        this.k = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type addCrSplineTrajecHandlerRequest
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [pointsX]
    bufferOffset = _arraySerializer.float32(obj.pointsX, buffer, bufferOffset, null);
    // Serialize message field [pointsY]
    bufferOffset = _arraySerializer.float32(obj.pointsY, buffer, bufferOffset, null);
    // Serialize message field [closed]
    bufferOffset = _serializer.bool(obj.closed, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = _serializer.float32(obj.time, buffer, bufferOffset);
    // Serialize message field [k]
    bufferOffset = _serializer.float32(obj.k, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type addCrSplineTrajecHandlerRequest
    let len;
    let data = new addCrSplineTrajecHandlerRequest(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [pointsX]
    data.pointsX = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [pointsY]
    data.pointsY = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [closed]
    data.closed = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [k]
    data.k = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.name);
    length += 4 * object.pointsX.length;
    length += 4 * object.pointsY.length;
    return length + 21;
  }

  static datatype() {
    // Returns string type for a service object
    return 'trajecgenerator/addCrSplineTrajecHandlerRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a67c4c6881252e2b649960aef205c15e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
    float32[] pointsX
    float32[] pointsY
    bool closed
    float32 time
    float32 k
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new addCrSplineTrajecHandlerRequest(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.pointsX !== undefined) {
      resolved.pointsX = msg.pointsX;
    }
    else {
      resolved.pointsX = []
    }

    if (msg.pointsY !== undefined) {
      resolved.pointsY = msg.pointsY;
    }
    else {
      resolved.pointsY = []
    }

    if (msg.closed !== undefined) {
      resolved.closed = msg.closed;
    }
    else {
      resolved.closed = false
    }

    if (msg.time !== undefined) {
      resolved.time = msg.time;
    }
    else {
      resolved.time = 0.0
    }

    if (msg.k !== undefined) {
      resolved.k = msg.k;
    }
    else {
      resolved.k = 0.0
    }

    return resolved;
    }
};

class addCrSplineTrajecHandlerResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type addCrSplineTrajecHandlerResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type addCrSplineTrajecHandlerResponse
    let len;
    let data = new addCrSplineTrajecHandlerResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'trajecgenerator/addCrSplineTrajecHandlerResponse';
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
    const resolved = new addCrSplineTrajecHandlerResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: addCrSplineTrajecHandlerRequest,
  Response: addCrSplineTrajecHandlerResponse,
  md5sum() { return 'a67c4c6881252e2b649960aef205c15e'; },
  datatype() { return 'trajecgenerator/addCrSplineTrajecHandler'; }
};
