import processing.io.*;

int ledPin = 18;    
int borderSize = 40;  
float t = 0.0;      
float tStep = 0.004;    
SOFTPWM p = new SOFTPWM(ledPin, 10, 100);    
void setup() {
  size(640, 360);  
  strokeWeight(4);  
}

void draw() {
  if (mousePressed) {
    int a = constrain(mouseX, borderSize, width - borderSize);
    t = map(a, borderSize, width - borderSize, 0.0, 1.0);
  } else {
    t += tStep;
    if (t > 1.0) t = 0.0;
  }
  p.softPwmWrite((int)(t*100)); 
  background(255);  
  titleAndSiteInfo();  

  fill(255, 255-t*255, 255-t*255);  
  ellipse(width/2, height/2, 100, 100);
  
  pushMatrix();
  translate(borderSize, height - 45);
  int barLength = width - 2*borderSize;
  
  barBgStyle();  
  line(0, 0, barLength, 0);    
  line(barLength, -5, barLength, 5);

  barStyle();   
  line(0, -5, 0, 5);
  line(0, 0, t*barLength, 0);

  barLabelStyle();    
  text("progress : "+nf(t*100,2,2),barLength/2,-25);
  popMatrix();
}

void titleAndSiteInfo() {
  fill(0);
  textAlign(CENTER);    
  textSize(40);        
  text("Breathing Light", width / 2, 40);    
  textSize(16);
     
}
void barBgStyle() {
  stroke(220);
  noFill();
}

void barStyle() {
  stroke(50);
  noFill();
}

void barLabelStyle() {
  noStroke();
  fill(120);
}
