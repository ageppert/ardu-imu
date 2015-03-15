## Running the Demo Program ##

We've provided two different demo programs so you can see how ArduIMU+ works. Note that you'll need GPS lock to give the most accurate results. Also note that they require Windows be set in standard English numbering, with periods (.) as decimal marks in numbers.

The easiest to use is the Windows test utility, developed by HappyKillmore

![http://ardupilot.googlecode.com/svn/images/arduimu.png](http://ardupilot.googlecode.com/svn/images/arduimu.png)

Download it from [here](http://www.happykillmore.com/Software/ArduIMU/Setup/Setup.exe) and install it. Additional instructions are [here](http://diydrones.com/profiles/blogs/arduimu-v2-test-application).

To use it, first, connect a GPS to the ArduIMU; currently only the uBlox 5 (with the DIY Drones adapter) is supported. If you don't connect a GPS module, the IMU will still work but Yaw data will be unreliable since there is no way to correct for drift in the Yaw gyro. Also, please note that the GPS will probably only get lock when you're outside with a clear view of the sky. If you don't have lock (blue LED on the ArduIMU+ board lights up), it will still work but the yaw data will be wrong.

Note: When you're starting the IMU with AIRSTART = 0, the board will flash its LEDs for about a half-minute while it's calibrating. Once that is done, it should start sending data that you can read with the desktop utility. With AIRSTART = 1, it will boot faster, but be less accurate.

## LabVIEW demo program ##

If you prefer the earlier LabVIEW demo software (shown below) you can find it [here](http://code.google.com/p/ardu-imu/downloads/detail?name=ArduIMU%20utilities.zip&can=2&q=).If you don't already have them, you'll also need the LabView runtime engine and serial drivers. Download the runtime engine [here](http://ftp.ni.com/support/softlib/labview/labview_runtime/8.6/Windows/lvrte86min.exe) and the drivers [here](http://joule.ni.com/nidu/cds/view/p/id/1071/lang/en).

Run ArduIMU.exe in the ArduIMU Demo folder. Follow the directions below.


![http://ardupilot.googlecode.com/svn/images/ddjmqgw3_79n5c4bf3b_b.png](http://ardupilot.googlecode.com/svn/images/ddjmqgw3_79n5c4bf3b_b.png)

When you run the Desktop Utility you need to tell it to find the right serial port and connect to the IMU.

![http://ardupilot.googlecode.com/svn/images/ddjmqgw3_80gd5w4jfk_b.png](http://ardupilot.googlecode.com/svn/images/ddjmqgw3_80gd5w4jfk_b.png)

Select the port in the window shown above. If you're not sure what serial port your FTDI is connected on, you can find out in your Windows Device Manager, as shown below:

![http://ardupilot.googlecode.com/svn/images/ddjmqgw3_81f8xvxp2p_b.png](http://ardupilot.googlecode.com/svn/images/ddjmqgw3_81f8xvxp2p_b.png)

It may take a few seconds for the software to recognize the serial port and for the data to start flowing. But once it does, your main window and graphic display of the rotating box should be working. When you're done, press the little stop icon on the serial window to stop reading data, so you can close the window.