## Loading the code ##

ArduIMU+ comes with some basic test firmware loaded at the factory, but to get full functionality you should load the latest AHRS firmware. Here's how:

**1)** First, download the latest code from the [repository](http://code.google.com/p/ardu-imu/downloads/list).

**2)** Then you need to download Arduino if you don't already have it and install it. ArduIMU only supports Arduino 023 or below. You can download it here: ([Windows](http://arduino.googlecode.com/files/arduino-0023.zip), [Mac](http://arduino.googlecode.com/files/arduino-0023.dmg), [Linux](http://arduino.googlecode.com/files/arduino-0023-64.tgz)). The instructions for loading ArduIMU code are essentially the same as for ArduPilot, so follow them [here](http://code.google.com/p/ardupilot/wiki/LoadingPage) (especially the part about setting the "Set RTS on close" box and choosing the right board in the Arduino IDE) and then come back to this page.

**3)** You must also define the folder Arduino will use for its "sketches" (Arduino-talk for the set of files that compose a program) and libraries

Create a folder someplace where you can find it, perhaps in your Documents folder or even on your desktop. (If you've been using Arduino, you probably have this set up somewhere already). Launch the Arduino IDE and open the **Preferences** dialog.  Set the sketchbook location to the folder you created or are using. Here's where I have mine:

![http://ardupilot-mega.googlecode.com/svn/ArduPilotMegaImages/sketchfile.png](http://ardupilot-mega.googlecode.com/svn/ArduPilotMegaImages/sketchfile.png)

Once you've changed that directory, you must close Arduino and restart it for it to be recognized.

**4)** Now download the [latest ArduIMU software](http://code.google.com/p/ardu-imu/downloads/list). It will be named ArduIMU(version number).zip. **Unzip this main folder to your desktop.** Inside the main folder there should be two folders: "arduimu" and "libraries". Drag them to the Arduino Sketchbook folder you defined in the previous step.

**Note: these are the same libraries as used in ArduPilotMega and ArduCopter. So if you've already loaded them, you don't have to copy the libraries folder again for ArduIMU.**

Here's where I put the libraries and APM code folder (highlighted). Note that it is **exactly** the same folder as I defined in the Arduino configuration menu in the step above.

![http://ardupilot-mega.googlecode.com/svn/ArduPilotMegaImages/arduimufolder.png](http://ardupilot-mega.googlecode.com/svn/ArduPilotMegaImages/arduimufolder.png)

We recommend you use this same file configuration. If you modify it, Arduino may not be able to find the libraries and you'll get compile errors.

**Important note: DO NOT drag the whole ArduIMU(version number) folder into your sketchfile directory. If you do, the code will not compile.** Instead, just drag the two individual folders within it--"arduimu" and "libraries"--into the sketchfile folder as shown above. Once you've placed them in the sketchfile folder, you can delete the ArduIMU(version) folder on your desktop.

**4)** Open Arduino and load the ArduIMU code from your "arduimu" folder by open the "arduimu.pde" file, which will open all the tabs. Make any configuration changes needed in the first tab of the code. If you just want to try out the IMU with the desktop demo programs, make sure the following configuration options are set as shown:

```
#define PRINT_ANALOGS 1 //Will print the analog raw data
#define PRINT_EULER 1   //Will print the Euler angles Roll, Pitch and Yaw
#define PRINT_GPS 1     //Will print GPS data

#define PRINT_BINARY 0   //Will print binary message and suppress ASCII messages (above)
```

You should also select a GPS module. The uBlox is the default and is recommended, but if you want to use the [MediaTek module](http://store.diydrones.com/MediaTek_MT3329_GPS_10Hz_Adapter_Basic_p/mt3329-02.htm) sold by the DIY Drones store, please note that it comes with a later firmware than is supported by ArduIMU and you must downgrade the firmware to 1.4 as explained in [this tutorial](http://code.google.com/p/ardupilot/wiki/MediaTek).

```
#define GPS_PROTOCOL 3    // 1 - NMEA,  2 - EM406,  3 - Ublox, 4 -- MediaTek  
```

If you want to use ArduIMU with ArduPilot, set the following configuration option as shown:

```
#define PRINT_BINARY 1   //Will print binary message and suppress ASCII messages (above)
```

**Remember to adjust your magnetic declination setting for your local environment.**

**4)** Then connect the FTDI cable to connector pins you soldered on the ArduIMU (check on the bottom of the board where it shows which orientation to plug the FTDI cable in--black is on one side) and use it to load the code on to the board. Again, the [instructions](http://code.google.com/p/ardupilot/wiki/LoadingPage) for ArduPilot are essentially the same, so refer to them if you're having trouble.

**If you are having problems uploading the code (you get a bunch of error messages in red) follow ALL of the debugging tips [here](http://diydrones.com/profiles/blogs/arduino-debugging-tips).**