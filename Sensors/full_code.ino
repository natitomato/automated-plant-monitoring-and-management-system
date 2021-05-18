#include "DHT.h"

#define DHTPIN 2
 
#define DHTTYPE DHT11

DHT dht(DHTPIN, DHTTYPE);

const int AirValue = 620;   
const int WaterValue = 320;  
int intervals = (AirValue - WaterValue)/3;
int soilMoistureValue = 0;
//const int ldrPin = A1;
bool label = true;
float value;
float perc;
int ldrStatus;

void setup() {
  Serial.begin(9600);

  dht.begin();
}

void loop() {
    while(label)
    {
        Serial.print("humidity");
        Serial.print(",");
        Serial.print("temperature");
        Serial.print(",");
        Serial.print("soil moisture");
        Serial.print(",");
        Serial.println("LDR Value");
        label = false;
    }
  delay(2000);
  soilMoistureValue = analogRead(A0);
  value = soilMoistureValue-WaterValue;
  perc = 100-((value/(AirValue-WaterValue))*100);
  ldrStatus = analogRead(A1);
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  float f = dht.readTemperature(true);

  if (isnan(h) || isnan(t) || isnan(f)) {
    Serial.println(F("Failed to read from DHT sensor!"));
    return;
  }

  Serial.print(h);
  Serial.print(",");
  Serial.print(t);
  Serial.print(",");
  Serial.print(perc);
  Serial.print(",");
  Serial.println(ldrStatus);
}
