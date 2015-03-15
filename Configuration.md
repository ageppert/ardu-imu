## User-modifiable options ##



There is no configuration file for the firmware.  Use modifiable options are set with several #define statements in the main file (ArduIMU.pde).  There are also #define statements which are not intended to be user modifiable options, so only change the parameters shown below.

```
// *** NOTE!   Hardware version - Can be used for v1 (daughterboards) or v2 (flat)
#define BOARD_VERSION 2 // 1 For V1 and 2 for V2

// Ublox gps is recommended!
#define GPS_PROTOCOL 4    // 1 - NMEA,  2 - EM406,  3 - Ublox, 4 -- MediaTek  

// Enable Air Start uses Remove Before Fly flag - connection to pin 6 on ArduPilot 
#define ENABLE_AIR_START 0  //  1 if using airstart/groundstart signaling, 0 if not
#define GROUNDSTART_PIN 8    //  Pin number used for ground start signal (recommend 10 on v1 and 8 on v2 hardware)

/*Min Speed Filter for Yaw drift Correction*/
#define SPEEDFILT 2 // >1 use min speed filter for yaw drift cancellation, 0=do not use speed filter

/*For debugging propurses*/
#define PRINT_DEBUG 0   //Will print Debug messages

//OUTPUTMODE=1 will print the corrected data, 0 will print uncorrected data of the gyros (with drift), 2 will print accelerometer only data
#define OUTPUTMODE 1

#define PRINT_DCM 0     //Will print the whole direction cosine matrix
#define PRINT_ANALOGS 0 //Will print the analog raw data
#define PRINT_EULER 0   //Will print the Euler angles Roll, Pitch and Yaw
#define PRINT_GPS 1     //Will print GPS data

// *** NOTE!   To use ArduIMU with ArduPilot you must select binary output messages (change to 1 here)
#define PRINT_BINARY 0   //Will print binary message and suppress ASCII messages (above)

// *** NOTE!   Performance reporting is only supported for Ublox.  Set to 0 for others
#define PERFORMANCE_REPORTING 1  //Will include performance reports in the binary output ~ 1/2 min

/* Support for optional magnetometer (1 enabled, 0 disabled) */
#define USE_MAGNETOMETER 0 // use 1 if you want to make yaw gyro drift corrections using the optional magnetometer                   

/* Support for optional barometer (1 enabled, 0 disabled) */
#define USE_BAROMETER 0 	// use 1 if you want to get altitude using the optional absolute pressure sensor                  
#define ALT_MIX	50			// For binary messages: GPS or barometric altitude.  0 to 100 = % of barometric.  For example 75 gives 25% GPS alt and 75% baro
```

These are all pretty self-explanatory, except for AIR\_START. Here is the explanation of the author, Doug Weibel:

"Airstart is only there to save you if for some reason the AP restarts in the
air.  This could happen due to a power glitch or due to toggling the mode
quickly.

If the AP restarts in the air it is important that it not take a lot of time
doing the things it normally does when starting on the ground - i.e.
calibrating everything.  When we do a ground start we get the offsets for
all the analog sensors, set the home location, etc.  We then store this
stuff in EEPROM.  When an airstart occurs we just grab this stuff back from
EEPROM and start operating immediately.

There is no real reason a user would want to intentionally perform an
airstart on the ground other than debugging.

The biggest source of confusion I have seen is with the IMU.  If users set
ENABLE\_AIRSTART then the IMU will ALWAYS air start unless it gets a signal
from the AP to ground start.  This will often result in the IMU doing funky
stuff, because it will be using calibration data from EEPROM that may not be
appropriate.  So if a user is just looking at the IMU on the bench and they
have it doing air start instead of ground start then they will often think
there is a problem."

In short, leave it at 0 when you're bench testing or unless you've got it attached to ArduPilot via the D6/D8 pin.


## Other settings ##

There are also adjustable gains for the XY and Z directions, but you probably will not want to change them unless you understand what effect the change will cause.  The values shown below have been shown to work reasonably well.

```
// LPR530 & LY530 Sensitivity (from datasheet) => 3.33mV/º/s, 3.22mV/ADC step => 1.03
// Tested values : 0.96,0.96,0.94
#define Gyro_Gain_X 0.92 //X axis Gyro gain
#define Gyro_Gain_Y 0.92 //Y axis Gyro gain
#define Gyro_Gain_Z 0.94 //Z axis Gyro gain
```