void read_adc_raw(void)
{
  AN[0]= analog_buffer[sensors[0]]/analog_count[sensors[0]]; // Gx     
  AN[1]= analog_buffer[sensors[1]]/analog_count[sensors[1]]; // Gy  sensors[] maps sensors to correct order 
  AN[2]= analog_buffer[sensors[2]]/analog_count[sensors[2]]; // Gz
  AN[3]= analog_buffer[sensors[3]]/analog_count[sensors[3]]; // Ax
  AN[4]= analog_buffer[sensors[4]]/analog_count[sensors[4]]; // Ay
  AN[5]= analog_buffer[sensors[5]]/analog_count[sensors[5]]; // Az

  // STOP ADC interrupt at this moment...
  cli(); // Stop interrupts...
  //Initialization for the next readings...
  for (int i=0;i<8;i++){
    analog_buffer[i]=0;
    analog_count[i]=0;
  }
  //Start interrupts again...
  sei();  // Enable interrupts...

}

int read_adc(int select)
{
  return (AN[select]-AN_OFFSET[select])*SENSOR_SIGN[select];
}

void printdata(void)//ToDeg(x)
{     
      Serial.print("!!!");
      #if PRINT_ANALOGS==1
      Serial.print("AN0:");
      Serial.print(read_adc(0));
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
      Serial.print(ToDeg(atan2(DCM_Matrix[2][1],DCM_Matrix[2][2])));
      Serial.print(",PCH:");
      Serial.print(ToDeg(asin(DCM_Matrix[2][0])));
      Serial.print(",YAW:");
      Serial.print(ToDeg(atan2(DCM_Matrix[1][0],DCM_Matrix[0][0])));
      Serial.print (",");
      #endif
       #if PRINT_GPS == 1
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
      #endif
      
      Serial.println("***"); 
}

long convert_to_dec(float x)
{
  return x*1000000;
}
/////

//Activating the ADC interrupts. 
void Analog_Init(void)
{
 ADCSRA|=(1<<ADIE)|(1<<ADEN);
 ADCSRA|= (1<<ADSC);
}

//
void Analog_Reference(uint8_t mode)
{
  analog_reference = mode;
}

//ADC interrupt vector, this piece of code
//is executed everytime a convertion is done. 
ISR(ADC_vect)
{
  volatile uint8_t low, high;
  low = ADCL;
  high = ADCH;
  analog_buffer[MuxSel] += (high << 8) | low;   // cumulate analog values
  analog_count[MuxSel]++;
  MuxSel++;
  if(MuxSel >=8) MuxSel=0;
  ADMUX = (analog_reference << 6) | (MuxSel & 0x07);
  // start the conversion
  ADCSRA|= (1<<ADSC);
}
