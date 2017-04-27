/*
 * File       Control class for Freenove Quadruped Robot
 * Author     Ethan Pan @ Freenove (support@freenove.com)
 * Date       2017/4/22
 * Copyright  Copyright © Freenove (http://www.freenove.com)
 * License    Creative Commons Attribution ShareAlike 3.0
 *            (http://creativecommons.org/licenses/by-sa/3.0/legalcode)
 * -----------------------------------------------------------------------------------------------*/

class ControlRobot {
  Communication communication;

  ControlRobot(PApplet pApplet) {
    communication = new Communication(pApplet);
  }

  public void MoveLeg(int leg, int dx, int dy, int dz) {
    communication.SendCommand(
      new byte[]{Command.requestMoveLeg, 
      (byte)(leg), 
      (byte)(64 + dx), 
      (byte)(64 + dy), 
      (byte)(64 + dz)});
  }

  public void Calibrate() {
    communication.SendCommand(new byte[]{Command.requestCalibrate});
  }

  public void ChangeIO(int IO, boolean status) {
    communication.SendCommand(
      new byte[]{Command.requestChangeIO, 
      (byte)IO, 
      (byte)(status ? 1 : 0)});
  }

  public void CrawlForward() {
    communication.SendCommand(new byte[]{Command.requestCrawlForward});
  }

  public void CrawlBackward() {
    communication.SendCommand(new byte[]{Command.requestCrawlBackward});
  }

  public void TurnLeft() {
    communication.SendCommand(new byte[]{Command.requestTurnLeft});
  }

  public void TurnRight() {
    communication.SendCommand(new byte[]{Command.requestTurnRight});
  }

  public void ActiveMode() {
    communication.SendCommand(new byte[]{Command.requestActiveMode});
  }

  public void SwitchMode() {
    communication.SendCommand(new byte[]{Command.requestSwitchMode});
  }

  public void SleepMode() {
    communication.SendCommand(new byte[]{Command.requestSleepMode});
  }

  public void InstallState() {
    communication.SendCommand(new byte[]{Command.requestInstallState});
  }

  public void CalibrateState() {
    communication.SendCommand(new byte[]{Command.requestCalibrateState});
  }

  public void BootState() {
    communication.SendCommand(new byte[]{Command.requestBootState});
  }

  public void CalibrateVerify() {
    communication.SendCommand(new byte[]{Command.requestCalibrateVerify});
  }

  public void MoveBody(int x, int y, int z) {
    communication.SendCommand(
      new byte[]{Command.requestMoveBodyTo, 
      (byte)(64 + x), 
      (byte)(64 + y), 
      (byte)(64 + z)});
  }

  public void RotateBody(int x, int y) {
    communication.SendCommand(
      new byte[]{Command.requestRotateBodyTo, 
      (byte)(64 + x), 
      (byte)(64 + y)});
  }
}