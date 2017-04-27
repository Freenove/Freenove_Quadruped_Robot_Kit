/*
 * File       Communiction commands for Freenove Quadruped Robot
 * Author     Ethan Pan @ Freenove (support@freenove.com)
 * Date       2017/4/22
 * Copyright  Copyright © Freenove (http://www.freenove.com)
 * License    Creative Commons Attribution ShareAlike 3.0
 *            (http://creativecommons.org/licenses/by-sa/3.0/legalcode)
 * -----------------------------------------------------------------------------------------------*/

class Command
{
  // Format:  [transStart] [command] [data 0] [data 1] ... [data n] [transEnd]
  //          [x] is byte type and the range of [command] and [data x] is 0~127
  // Process: The requesting party send the command, then the responding party respond the command.
  //          The non blocking command will be responded immediately, and the blocking command will
  //          be responded commandStart immediately, then respond commandDone after completion.

  // Transmission control bytes, range is 128 ~ 255
  static final byte transStart = (byte)128;
  static final byte transEnd = (byte)129;


  // Commands, range is 0 ~ 127
  // Some commands have proprietary response commands, others use commandStart and commandDone
  // The even commands is sent by the requesting party, and the odd commands is sent by the 
  // responding party.


  // Non blocking commands, range 0 ~ 63

  // Request echo, to confirm the device
  static final byte requestEcho = 0;            // [Command]
  // Respond echo
  static final byte echo = 1;                   // [Command]

  // Request supply voltage
  static final byte requestSupplyVoltage = 10;  // [Command]
  // Respond supply voltage
  static final byte supplyVoltage = 11;         // [Command] [voltage * 100 / 128] [voltage * 100 % 128]

  //
  static final byte requestMoveLeg = 20;        // [Command] [leg] [64 + dx] [64 + dy] [64 + dz]
  static final byte requestCalibrate = 22;      // [Command]

  //
  static final byte requestChangeIO = 30;       // [Command] [IOindex] [1/0]

  //
  static final byte requestMoveBodyTo = 40;     // [Command] [64 + x] [64 + y] [64 + z]
  static final byte requestRotateBodyTo = 42;   // [Command] [64 + x] [64 + y]

  // Universal responded commands
  static final byte commandStart = 21;          // [Command]
  static final byte commandDone = 23;           // [Command]


  // Blocking commands, range 64 ~ 127

  //
  static final byte requestCrawlForward = 64;   // [Command]
  static final byte requestCrawlBackward = 66;  // [Command]
  static final byte requestTurnLeft = 68;       // [Command]
  static final byte requestTurnRight = 70;      // [Command]
  static final byte requestActiveMode = 72;     // [Command]
  static final byte requestSleepMode = 74;      // [Command]
  static final byte requestSwitchMode = 76;     // [Command]

  //
  static final byte requestInstallState = 80;   // [Command]
  static final byte requestCalibrateState = 82; // [Command]
  static final byte requestBootState = 84;      // [Command]

  //
  static final byte requestCalibrateVerify = 90;// [Command]

  //
  static final byte requestMoveBody = 100;      // [Command] [64 + x] [64 + y] [64 + z]
  static final byte requestRotateBody = 102;    // [Command] [64 + x] [64 + y]
}