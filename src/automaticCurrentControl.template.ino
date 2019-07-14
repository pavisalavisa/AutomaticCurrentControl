float currentValues[]={{CurrentValues}};
int currentBinaryValue[12];//MSB->LSB
int intervalInSeconds={{intervalInSeconds}};
int valueIndex=0;
float resolution=0.025;

void setup() {
   //MSB->LSB
   pinMode(2,OUTPUT);
   pinMode(3,OUTPUT);
   pinMode(4,OUTPUT);
   pinMode(5,OUTPUT);
   pinMode(6,OUTPUT);
   pinMode(7,OUTPUT);
   pinMode(8,OUTPUT);
   pinMode(9,OUTPUT);
   pinMode(10,OUTPUT);
   pinMode(11,OUTPUT);
   pinMode(12,OUTPUT);
   pinMode(13,OUTPUT);
}

void loop() {
  setCurrentValue(valueIndex);

  delay(intervalInSeconds*1000);
  valueIndex++; 
}

void setCurrentValue(int valueIndex){
   float decimalCurrentValue=currentValues[valueIndex]/resolution;
   decToBinary(decimalCurrentValue);
   setPinValues();
}

void decToBinary(int n) 
{ 
  for (int i = 11; i >= 0; i--) { 
    int k = n >> i; 
    currentBinaryValue[11-i]=k & 1; 
  }    
} 

void setPinValues(){
  int outputPinOffset=2;
  
  for(int i=0;i<12;i++){
    digitalWrite(i+outputPinOffset,currentBinaryValue[i]);
  }   
}
