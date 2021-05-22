const int AirValue = 645;   //you need to replace this value with Value_1
const int WaterValue = 330;  //you need to replace this value with Value_2
int intervals = (AirValue - WaterValue)/3;
int soilMoistureValue = 0;
float value;
float perc;
void setup() {
  Serial.begin(9600); // open serial port, set the baud rate to 9600 bps
}
void loop() {
soilMoistureValue = analogRead(A0);  //put Sensor insert into soil
value = soilMoistureValue-WaterValue;
//Serial.println(value);
perc = 100-((value/(AirValue-WaterValue))*100);
Serial.print("Humidity : ");
Serial.print(perc);
Serial.println("%");
delay(200);
}
