## Troubleshooting Guide ##

  * No lights come on when programming – Are you using an appropriate FTDI cable that supplies power?

  * The blue GPS light does not come on – Is the adapter board properly seated on the Ublox module?  Are you indoors where satellite signals may be too weak? Are you using the uBlox GPS module, or if not have you changed the configuration for the one you are using?

  * You're using ArduIMU with ArduPilot, but it's not working and when you get GPS lock on ArduIMU it doesn't show as locked on ArduPilot.  -- Have you changed #define PRINT\_BINARY  to 1? (see [this](http://code.google.com/p/ardupilot/wiki/ArduIMU) for more)