# Theory of Operation (Simplified) #


ArduIMU uses gyros, accelerometers, and GPS to maintain a model of the the board's orientation in space.  This is not as simple a problem as integrating the roll rates from the gyros.  As a simple illustrative example, consider an airplane flying level to the north that first banks (rolls) 90 degrees to the right and then pitches 90 degrees.  mathematical algorithm called the Direction Cosine Matrix (DCM) to take sensor data from the gyros, accelerometersThe airplane would be flying horizontally to the east in a 90 degree bank orientation.  If instead the airplane pitched up 90 degrees first, then banked 90 degrees the airplane would be flying straight up.  We cannot just keep track of how much roll and pitch have occurred and know the orientation of the aircraft.

For a detailed description of how the DCM algorithm works see Bill Premmerlani’s tutorial [here](http://gentlenav.googlecode.com/files/DCMDraft2.pdf). You can also read a detailed description in Mahoney's original papers [here](http://gentlenav.googlecode.com/files/MahonyPapers.zip).

For this simplified explanation here are the essential components of the algorithm.

  * The Direction Cosine Matrix is a 3 by 3 numerical matrix (array)
  * The gyro data is used in a time step integration to update the DCM matrix
  * Data from the accelerometers and gps is used to correct for errors that creep in to the DCM matrix.  These errors arise from drift in the gyros as well as numerical errors due to quantization of the gyro signals and rounding errors in the computations.
  * Pitch, roll and yaw can be computed from the elements of the direction cosine matrix.
  * ArduIMU outputs a serial data stream.  The firmware can be configured so that this data stream includes a variety of data including the DCM matrix itself, the pitch, roll and yaw of the unit, raw sensor and gps data, and other computed data.  (DW)

For more information on this application of the DCM, please see the [UAVDevBoard section](http://diydrones.com/page/uav-devboard) on DIY Drones.