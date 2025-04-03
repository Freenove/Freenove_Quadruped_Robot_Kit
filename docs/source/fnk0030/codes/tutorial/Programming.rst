##############################################################################
Programming
##############################################################################

It is easy to reprogram this robot.

Modify Default Sketch
******************************************************************************

If you just want to modify the parameters of the default functions, it is very simple.

**! In this case, all previous functions will not be affected except the parameters you want to modify.**

Just add the corresponding functions under the following line in the default sketch.

.. code-block:: c

    robot.Start(true);

**! Only the functions mentioned in this section can be added.**

**! Other codes of default sketch cannot be modified or deleted.**

You can modify the Wi-Fi hotspot name and password by calling the following function.

.. code-block:: c

    void FNQR::SetWiFi(String name, String password)

Please open "File" > "Examples" > "FNQR" > "ModifyWiFi" > "Robot" to see how to use.

When there are many Wi-Fi signals nearby, you may not be able to connect to the robot or the signal will be poor. Then you can try to modify the channel by calling the following function.

.. code-block:: c

    void FNQR::SetWiFiChannel(byte channel)

Please open "File" > "Examples" > "FNQR" > "ModifyWiFiChannel" > "Robot" to see how to use.

You can modify the wireless communication address between robot and remote.

To modify the robot, call the following function.

.. code-block:: c

    void FNQR::SetRemote(byte byte0, byte byte1, byte byte2, byte byte3, byte byte4)

To modify the remote, call the following function.

.. code-block:: c

    void FNQRRemote::Set(byte byte0, byte byte1, byte byte2, byte byte3, byte byte4)

You must set them to the same address to control robot with the remote.

Please open "File" > "Examples" > "FNQR" > "ModifyRemote" to see how to use.

You can also modify the wireless communication channel between robot and remote.

To modify the robot, call the following function.

.. code-block:: c

    void FNQR::SetRemoteChannel(byte byte0, byte byte1, byte byte2, byte byte3, byte byte4)

To modify the remote, call the following function.

.. code-block:: c

    void FNQRRemote::SetChannel(byte byte0, byte byte1, byte byte2, byte byte3, byte byte4)

You must set them to the same channel to control robot with the remote.

Please open "File" > "Examples" > "FNQR" > "ModifyRemoteChannel" to see how to use.

Custom Programming
**********************************************************************************

Please open "File" > "Examples" > "FNQR" > "CustomProgramming" to see how to use.

You can also write a new sketch to control the robot by include FNQR library.

**! In this case, the robot is controlled only by your code.**

Processing App, Android App and remote will no longer work.

**! You can add any code you need, not just the functions mentioned in this section.**

**! You can add sensors and other modules, and the P3 I/O port on the control board is also available.**

Create a new blank Arduino sketch, include FNQR library at the begnning.

.. code-block:: c

    #include <FNQR.h>

Then define a robot object.

.. code-block:: c

    FNQR robot;

In function setup(), start the robot.

.. code-block:: c

    void setup() {
        robot.Start();
    }

Now, you can directly use the following code in function loop() to control the robot.

.. code-block:: c

    robot.ActiveMode();
    robot.SleepMode();
    robot.SwitchMode();
    robot.CrawlForward();
    robot.CrawlBackward();
    robot.TurnLeft();
    robot.TurnRight();
    robot.MoveBody(float x, float y, float z);
    robot.RotateBody(float x, float y, float z);
    robot.TwistBody(float xMove, float yMove, float zMove, float xRotate, float yRotate, float zRotate);

There are some examples in"File" > "Examples" > "FNQR" > "Examples ". You can open and upload them to learn how to use FNQR library to control the robot.

.. image:: ../_static/imgs/Programming/Programming00.png
    :align: center

The control board provides some IO and power ports for your use. They are not used by this robot in default.

.. image:: ../_static/imgs/Programming/Programming01.png
    :align: center

If you want to add other parts for this robot. Please refer to "File" > "Examples" > "FNQR" > "Examples” for to build your own programming.

In the default robot code, these ports cannot be programmed.

Complete Reprogramming
**********************************************************************************

It is NOT recommended that you use your own code to control every servo, which is more difficult and it may easily damage the servos.

If you want to learn the details of the code, you can view the FNQR library source code.

All the library files already added to Arduino IDE are in the "libraries" folder under "Sketchbook location" in the “File” > ”Preferences” window.

.. image:: ../_static/imgs/Programming/Programming02.png
    :align: center

And if you want to learn the details about the control board, please find the schematic in the folder.

If you have any questions, please contact our support for help.

Hardware
**********************************************************************************

Please find the circuit diagrams of the boards in the “Hardware” folder.

If FNQR library is used, the reference voltage of analog input may be switched to an external.

- On V2 and later board: the reference voltage is 2.094V.

- On other versions of boards: the reference voltage is 5V by default.

If using a port as an analog input, the voltage that can be measured ranges from 0V to reference voltage.

If the voltage to be measured is higher than the reference voltage, use two resistors to divide the voltage.