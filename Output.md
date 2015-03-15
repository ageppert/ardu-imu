# Output Overview #
**Please be aware that this page is extremely new, and its accuracy is still being verified.**

The ArduIMU outputs serial data in different formats depending on its configuration. The two main options are either binary or Ascii. You can pick between these formats and a variety of other options in the user configuration settings ([see here](Configuration.md)).


# Ascii Output #

Typical Ascii output with a GPS unit looks like this:

```
!!!VER:1.8.1,RLL:1.12,PCH:-0.07,YAW:34.03,IMUH:253,LAT:499247361,LON:-1193955623, ALT:3525,COG:0,SOG:0,FIX:1,SAT:9,TOW:21230400***
```

The variables in the output are determined by configuration settings. Depending on what flags are set some of these fields may not appear or there will be more fields. The variables in this example are :
  1. Roll: Measured in degrees with positive and increasing as the right wing drops
  1. Pitch: Measured in degrees with positive and increasing as the nose rises
  1. Yaw: Measured in degrees with positive and increasing as the nose goes right
  1. IMUH:
  1. Latitude: Measured in decimal degrees times 10^7
  1. Longitude: Measured in decimal degrees times 10^7
  1. Altitude: Measured in meters above sea level times 10^1
  1. Course over ground:
  1. Speed over ground:
  1. GPS Fix: A binary indicator of a valid gps fix
  1. Satellite Count: The number of GPS satellites used to calculate this position
  1. Time of week: Time of week is related to GPS time formats. If this is important to your system, I suggest you read external resources on this confusing topic.

# Binary Output #

There are partial examples of parsing binary data on forum posts, but no official documentation.

# Output Rate #

Experimentation has shown that ascii serial data is pushed at about 8 Hz, though some fields (such as gps) are updated at a different rate (4 Hz) based on the availability of new data.

### Thanks ###
Examples of output taken from a post by Scotty of DIYDrones.