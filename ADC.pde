void Read_adc_raw(void)
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
