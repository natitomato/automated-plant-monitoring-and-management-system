#include <Wire.h>

const int ledPin = 13;
const int ldrPin = A0;
bool label = true;

void setup() {
  Wire.begin(0x8);
                
  Wire.onReceive(receiveEvent);
  
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
  pinMode(ldrPin, INPUT);
}

void receiveEvent(int howMany) {
  while (Wire.available()) { 
    int c = Wire.read(); 
    digitalWrite(ledPin, c);
  }
}
void loop() {
  while(label)
  {
  Serial.print("LDR Value");
  Serial.print(",");
  Serial.println("LED Value");
  label = false;
  }
  int ldrStatus = analogRead(ldrPin);
  int ledStatus = analogRead(ledPin);
  Serial.print(ldrStatus);
  Serial.print(",");
  Serial.println(ledStatus);
  delay(100);
}
