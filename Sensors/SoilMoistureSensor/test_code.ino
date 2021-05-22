const int AirValue = 645;
const int WaterValue = 330;
int intervals = (AirValue - WaterValue)/3;
int soilMoistureValue = 0;
float value;
float perc;
void setup() {
  Serial.begin(9600);
}
void loop() {
soilMoistureValue = analogRead(A0);
value = soilMoistureValue-WaterValue;
//Serial.println(value);
perc = 100-((value/(AirValue-WaterValue))*100);
Serial.print("Humidity : ");
Serial.print(perc);
Serial.println("%");
delay(200);
}
