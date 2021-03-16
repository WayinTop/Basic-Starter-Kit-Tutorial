import processing.io.*;

int leds[]={17, 18, 27, 22, 23, 24, 25, 8}; 

void setup() {
  size(640, 360);  
  for (int i=0; i<8; i++) {  
    GPIO.pinMode(leds[i], GPIO.OUTPUT);
  }
  background(102);
  textAlign(CENTER);   
  textSize(40);        
  text("Follow Light", width / 2, 40);    
  textSize(16);
   
}

void draw() {
  for (int i=0; i<8; i++) {    
    if (mouseX>(25+60*i)) {     
      fill(255, 0, 0);        
      GPIO.digitalWrite(leds[i], GPIO.LOW);  
    } else {
      fill(255, 255, 255);  
      GPIO.digitalWrite(leds[i], GPIO.HIGH);  
    }
    rect(25+60*i, 90, 50, 180);    
  }
}
