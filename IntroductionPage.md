# Introduction to ArduIMU V3 #

![http://wiki.ardupilot-mega.googlecode.com/git/images/arduimu3.jpg](http://wiki.ardupilot-mega.googlecode.com/git/images/arduimu3.jpg)

ArduIMU V3 is an Inertial Measure Unit (sensors and hardware filter circuitry) plus an Arduino-compatible processor that can run our Attitude Heading Reference System (AHRS) code, based on Bill Premerlani's DCM algorithm. This hardware consists of a 3 axis accelerometer and three gyro sensors, dual power regulator (3.3v and 5v), GPS port, an Atmega328@16mhz and a lot of status LED's. It's the cheapest IMU-AHRS on the market!

Includes the pin headers and all the sensors needed, some assembly is required.

_Important Note: ArduIMU is not an Autopilot. It's just an orientation solution (the heart of an Autopilot) and can be used on anything where you want to know its orientation in respect to the ground--boats, cars, rockets or even your dog. To learn more about IMUs read [here](http://en.wikipedia.org/wiki/Inertial_measurement_unit)._

ArduIMU V3 features the new MPU-6000 that includes 3 axis gyros & accells built-in, the latest 3 axis I2C magnetometer HMC-5883L and the classic but very robust Arduino Atmega328 running at 16Mhz...

MPU-6000 uses SPI for max performance.

**Specifications:**
  * Tri-Axis angular rate sensor (gyro) with a sensitivity up to 131 LSBs/dps and a full-scale range of ±250, ±500, ±1000, and ±2000dps
  * Tri-Axis accelerometer with a programmable full scale range of ±2g, ±4g, ±8g and ±16g
  * Reduced settling effects and sensor drift by elimination of board-level cross-axis alignment errors between accelerometers and gyroscopes
  * Digital Motion Processing™ (DMP™) engine offloads complex MotionFusion, sensor timing synchronization and gesture detection with supported software (not yet currently supported in DIY Drones code)
  * Full Chip Idle Mode Supply Current: 5µA
  * On-chip timing generator with ±1% frequency variation over full temperature range
  * User self test
  * 10,000g shock tolerant

**Other ArduIMU V3 features:**

  * Pin compatible with ArduIMU V2.
  * Breadboard compatible (ArduIMU V2 was not!).
  * Smaller size (1.5" x 1.0").
  * Atmega CPU has more % available for other tasks.
  * The 6 analog pins are now available!
  * Arduino compatible and open source.
  * 3 status LED's (RGB).
  * I2C port with 3.3V translation.
  * GPS port with FTDI autoswitch.
  * This device is suitable for ANY application from rockets to simple movement detection.