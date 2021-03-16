import processing.io.*;

BUTTON btn;
int relayPin = 17; //define relayPin
int buttonPin = 18;
boolean ledState = false; //define ledState
int count=0;
int fign=0;
float rotaSpeed = 0.02 * PI; //virtual fan's rotating speed, 
float rotaPosition = 0; //motor position
void setup() {
  size(640, 360);
  GPIO.pinMode(relayPin, GPIO.OUTPUT); //set the ledPin to output mode 
  GPIO.pinMode(buttonPin, GPIO.INPUT); 
  btn = new BUTTON(90, height - 90, 50, 30); //define the button
  btn.setBgColor(0, 255, 0); //set button color
  btn.setText("OFF"); //set button text
}

void draw() {
   background(255, 255, 255);
  titleAndSiteInfo();
 if(GPIO.digitalRead(buttonPin)==GPIO.HIGH && fign==0)
 {
	delay(20);
	if(GPIO.digitalRead(buttonPin)==GPIO.HIGH)
	{
		count++;
	}
	count=count%2;
	if(count==1)
		ledState=true;
	else
		ledState=false;
	fign=1;
 }
 else if(GPIO.digitalRead(buttonPin)==GPIO.LOW)
 {
	fign=0;
 }
 textAlign(RIGHT, CENTER);
 text("RelayState: ", btn.x, btn.y+btn.h/2);
 btn.create(); //create the button
 if (ledState) {
 GPIO.digitalWrite(relayPin, GPIO.HIGH); //led on 
 rotaPosition += rotaSpeed;
 btn.setBgColor(0, 255, 0);
 btn.setText("ON");
 } else {
 GPIO.digitalWrite(relayPin, GPIO.LOW); //led off
 btn.setBgColor(255, 0, 0);
 btn.setText("OFF");
 }
 if (rotaPosition >= 2*PI) {
   rotaPosition = 0;
 }
 drawFan(rotaPosition);
}
void drawFan(float angle) { 
 constrain(angle, 0, 2*PI);
 fill(0);
 for (int i=0; i<3; i++) {
 arc(width/2, height/2, 200, 200, 2*i*PI/3+angle, (2*i+0.3)*PI/3+angle, PIE);
 }
 fill(0);
 ellipse(width/2, height/2, 30, 30);
 fill(128);
 ellipse(width/2, height/2, 15, 15);
}
void titleAndSiteInfo() {
 fill(0);
 textAlign(CENTER); //set the text centered
 textSize(40); //set text size
 text("Relay & Motor", width / 2, 40); //title
 textSize(16);
}
