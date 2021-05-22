const int ledPin = 13;

const int ldrPin = A0;

int curr1; int curr2;

bool label = true;
void setup() {

Serial.begin(9600);

pinMode(ledPin, OUTPUT);

pinMode(ldrPin, INPUT);

}

void loop() {

while(label){
  Serial.print("LDR Value");
  Serial.print(",");
  Serial.println("LED Value");
  label = false;
}
int ldrStatus = analogRead(ldrPin);
int ledStatus = analogRead(ledPin);

if(curr1 != ldrStatus || curr2 != ledStatus){

  Serial.print(ldrStatus);
  Serial.print(",");
  Serial.println(ledStatus);
  delay(1000);
}
if (ldrStatus >= 250 ) {

digitalWrite(ledPin, HIGH);

//Serial.println(ldrStatus);

} else {

digitalWrite(ledPin, LOW);

//Serial.println(ldrStatus);

}

}
