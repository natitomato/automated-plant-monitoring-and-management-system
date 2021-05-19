#include <Wire.h>

// LED on pin 13
const int ledPin = 13;
const int ldrPin = A0;
bool label = true;

void setup() {
  // Join I2C bus as slave with address 8
  Wire.begin(0x8);
  
  // Call receiveEvent when data received                
  Wire.onReceive(receiveEvent);
  
  // Setup pin 13 as output and turn LED off
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
  pinMode(ldrPin, INPUT);
  //digitalWrite(ledPin, LOW);
}

// Function that executes whenever data is received from master
void receiveEvent(int howMany) {
  while (Wire.available()) { // loop through all but the last
    int c = Wire.read(); // receive byte as a character
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
