# ArduIMU V4 #

![https://ardu-imu.googlecode.com/svn/wiki/ArduIMUV4.jpg](https://ardu-imu.googlecode.com/svn/wiki/ArduIMUV4.jpg)

Like its predecessor, ArduIMU V4 is an Inertial Measure Unit plus an Arduino-compatible processor that can run on an Attitude Heading Reference System (AHRS) code based on Mahony’s DCM filter algorithm with Madgwick’s magnetic distortion compensation.  In addition to the 3-axis gyro sensors, accelerometers & magnetometers and GPS port, the hardware now includes a dynamic analog temperature sensor, ambient light sensor and pressure sensor. The microprocessor is an ATMEGA128RFA1 at 16 MHz that has 128KB of self-programmable flash and 4KB of EEPROM and the ability to transmit or receive data at 2.4 GHz ISM band.

ArduIMU V4 features the latest MPU-9150 that includes a 3-axis gyroscopes, accelerometers and magnetometers and uses I²C for optimal implementation.

_Important Note: ArduIMU is not an Autopilot. It's just an orientation solution (the heart of an Autopilot) and can be used on anything where you want to know its orientation in respect to the ground--boats, cars, rockets or even your dog. To learn more about IMUs read [here](http://en.wikipedia.org/wiki/Inertial_measurement_unit)._

# Specifications: #
  * **APDS-9301 (Ambient Light Sensor)**
    * I²C interface fast mode at 400 kHz
    * Two photodiodes Ambient; one measures visible + infrared, the other measures infrared
    * Programmable Interrupt Function with threshold settings, analog gains and integration time.
    * 50/60 Hz Lighting Ripple Rejection
  * **BMP180 (Pressure Sensor)**
    * I²C interface
    * Wide range of fully calibrated pressure measurements: 300 to 1100 hPa
    * Low noise and low power consumption.
  * **HTU21D (Humidity & Temperature Sensor)**
    * I²C interface and fast response time
    * Fully calibrated
    * Wide range of temperature measurements from -40°C to 125 °C.
    * Humidity accuracy of +/- 3% RH (Humidity Operating Range) tolerance @ 55%RH
  * **MPU-9150 (9-axis MEMS device)**
    * I²C interface fast mode at 400 kHz
    * Tri-Axis angular rate sensor (gyroscope) with a sensitivity up to 131 LSBs/dps and a full-scale range of ±250, ±500, ±1000, and ±2000dps
    * Tri-Axis accelerometer with a programmable full scale range of ±2g, ±4g, ±8g and ±16g
    * Tri-axis compass with a full scale range of ±1200µT
    * Digital Motion Processing™ (DMP™) engine offloads complex MotionFusion, sensor timing synchronization and gesture detection with supported software (Only produces 6-axis sensor fusion and not yet incorporated with the internal 3-axis compass).
    * Reduced settling effects and sensor drift by elimination of board-level cross-axis alignment errors between accelerometer, gyroscope, and compass
    * Full Chip Idle Mode Supply Current: 8µA
    * On-chip timing generator with ±1% frequency variation over full temperature range
    * User self test
    * 10,000g shock tolerant




# Other ArduIMU V4 features: #
  * Compact size (  1.25” x 1.25” )
  * USB / lithium ion battery powered with the ability to charge the battery via USB.
  * microSD card slot for expandable mass storage and datalogging; SPI interface for maximum performance.
  * Arduino compatible and open source.
  * 3 status LED's (RGB).
  * I²C port with 3.3V translation.
  * Analog pin, PWM pin & SPI port available.
  * GPS port with FTDI autoswitch.
  * Soft power On/Off switch (button)
  * This device is versatile for more applications from balance robots, simple movement detection and network communications.


_Note: ArduIMU V4 is in development and will be available very soon._