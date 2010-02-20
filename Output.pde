
void printdata(void)
{    

  #if PRINT_BINARY != 1  //Print either Ascii or binary messages

  Serial.print("!!!VER:");
  Serial.print(SOFTWARE_VER);  //output the software version
  Serial.print(",");
      #if PRINT_ANALOGS==1
      Serial.print("AN0:");
      Serial.print(read_adc(0)); //Reversing the sign. 
      Serial.print(",AN1:");
      Serial.print(read_adc(1));
      Serial.print(",AN2:");
      Serial.print(read_adc(2));  
      Serial.print(",AN3:");
      Serial.print(read_adc(3));
      Serial.print (",AN4:");
      Serial.print(read_adc(4));
      Serial.print (",AN5:");
      Serial.print(read_adc(5));
      Serial.print (",");

      #endif
      #if PRINT_DCM == 1
      Serial.print ("EX0:");
      Serial.print(convert_to_dec(DCM_Matrix[0][0]));
      Serial.print (",EX1:");
      Serial.print(convert_to_dec(DCM_Matrix[0][1]));
      Serial.print (",EX2:");
      Serial.print(convert_to_dec(DCM_Matrix[0][2]));
      Serial.print (",EX3:");
      Serial.print(convert_to_dec(DCM_Matrix[1][0]));
      Serial.print (",EX4:");
      Serial.print(convert_to_dec(DCM_Matrix[1][1]));
      Serial.print (",EX5:");
      Serial.print(convert_to_dec(DCM_Matrix[1][2]));
      Serial.print (",EX6:");
      Serial.print(convert_to_dec(DCM_Matrix[2][0]));
      Serial.print (",EX7:");
      Serial.print(convert_to_dec(DCM_Matrix[2][1]));
      Serial.print (",EX8:");
      Serial.print(convert_to_dec(DCM_Matrix[2][2]));
      Serial.print (",");
      #endif
      #if PRINT_EULER == 1
      Serial.print("RLL:");
      Serial.print(ToDeg(roll));
      Serial.print(",PCH:");
      Serial.print(ToDeg(pitch));
      Serial.print(",YAW:");
      Serial.print(ToDeg(yaw));
      Serial.print (",");
      #endif
      
      #if USE_MAGNETOMETER == 1
      Serial.print("MGX:");
      Serial.print(magnetom_x);
      Serial.print (",MGY:");
      Serial.print(magnetom_y);
      Serial.print (",MGZ:");
      Serial.print(magnetom_z);
      Serial.print (",MGH:");
      Serial.print(MAG_Heading);
      Serial.print (",");
      #endif
      
      
      #if PRINT_GPS == 1
      if(gpsFixnew==1)
      {
      gpsFixnew=0;
      Serial.print("LAT:");
      Serial.print((long)(lat*10000000));
      Serial.print(",LON:");
      Serial.print((long)(lon*10000000));
      Serial.print(",ALT:");
      Serial.print(alt_MSL);
      Serial.print(",COG:");
      Serial.print((ground_course));
      Serial.print(",SOG:");
      Serial.print(ground_speed);
      Serial.print(",FIX:");
      Serial.print((int)gpsFix);
      Serial.print(",EVZ:"); //Vertical Speed
      Serial.print(ecefVZ);
      Serial.print(",SAT:"); 
      Serial.print((int)numSV);
      
      Serial.print (",");
      }
      #endif
  Serial.print("TOW:");
  Serial.print(iTOW);
      
      Serial.println("***");    

  #else
      //  This section outputs a binary data message
      //  Conforms to new binary message standard (12/31/09)
      byte IMU_buffer[20];
      int tempint;
      int ck;
      uint8_t tempuint;
      long templong;
      byte IMU_ck_a=0;
      byte IMU_ck_b=0;
      Serial.print("DIYd");  // This is the message preamble
      IMU_buffer[0]=0x06;
      ck=6;
      IMU_buffer[1] = 0x02;      

      tempint=ToDeg(roll)*100;  //Roll (degrees) * 100 in 2 bytes
      IMU_buffer[2]=tempint&0xff;
      IMU_buffer[3]=(tempint>>8)&0xff;
      
      tempint=ToDeg(pitch)*100;   //Pitch (degrees) * 100 in 2 bytes
      IMU_buffer[4]=tempint&0xff;
      IMU_buffer[5]=(tempint>>8)&0xff;
      
      tempint=ToDeg(yaw)*100;  //Yaw (degrees) * 100 in 2 bytes
      IMU_buffer[6]=tempint&0xff;
      IMU_buffer[7]=(tempint>>8)&0xff;
      
      for (int i=0;i<ck+2;i++) Serial.print (IMU_buffer[i]);  
      for (int i=0;i<ck+2;i++) {
          IMU_ck_a+=IMU_buffer[i];  //Calculates checksums
          IMU_ck_b+=IMU_ck_a;       
      }
      Serial.print(IMU_ck_a);
      Serial.print(IMU_ck_b);
         
	//  This section outputs the gps binary message when new gps data is available
      if(gpsFixnew==1)
      {
        gpsFixnew=0;
      	IMU_ck_a=0;
      	IMU_ck_b=0;
      	Serial.print("DIYd");  // This is the message preamble
		IMU_buffer[0]=0x12;
        	ck=18;
      	IMU_buffer[1] = 0x03;      


        	templong=convert_to_dec(lon); //Longitude *10**7 in 4 bytes
        	IMU_buffer[2]=templong&0xff;
        	IMU_buffer[3]=(templong>>8)&0xff;
        	IMU_buffer[4]=(templong>>16)&0xff;
        	IMU_buffer[5]=(templong>>24)&0xff;
      
        	templong=convert_to_dec(lat); //Latitude *10**7 in 4 bytes
        	IMU_buffer[6]=templong&0xff;
        	IMU_buffer[7]=(templong>>8)&0xff;
        	IMU_buffer[8]=(templong>>16)&0xff;
        	IMU_buffer[9]=(templong>>24)&0xff;
      
        	tempint=alt_MSL*10;   // Altitude MSL in meters * 10 in 2 bytes
        	IMU_buffer[10]=tempint&0xff;
        	IMU_buffer[11]=(tempint>>8)&0xff;
      
        	tempint=speed_3d*100;   // Speed in M/S * 100 in 2 bytes
        	IMU_buffer[12]=tempint&0xff;
        	IMU_buffer[13]=(tempint>>8)&0xff;
        
        	tempint=ground_course*100;   // course in degreees * 100 in 2 bytes
        	IMU_buffer[14]=tempint&0xff;
        	IMU_buffer[15]=(tempint>>8)&0xff;
        
        	IMU_buffer[16]=iTOW&0xff;
        	IMU_buffer[17]=(iTOW>>8)&0xff;
        	IMU_buffer[18]=(iTOW>>16)&0xff;
        	IMU_buffer[19]=(iTOW>>24)&0xff;

      	for (int i=0;i<ck+2;i++) Serial.print (IMU_buffer[i]);  
      	for (int i=0;i<ck+2;i++) {
          		IMU_ck_a+=IMU_buffer[i];  //Calculates checksums
          		IMU_ck_b+=IMU_ck_a;       
      	}
      	Serial.print(IMU_ck_a);
      	Serial.print(IMU_ck_b);
         
	}

    #endif  
}


long convert_to_dec(float x)
{
  return x*10000000;
}

