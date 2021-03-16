import processing.io.*;

int bluePin = 17;    //blue Pin
int greenPin = 27;  //green Pin
int redPin = 22;    //red Pin
int borderSize = 40;  //picture border size

SOFTPWM pRed = new SOFTPWM(redPin, 100, 100);    
SOFTPWM pGreen = new SOFTPWM(greenPin, 100, 100);
SOFTPWM pBlue = new SOFTPWM(bluePin, 100, 100);

ProgressBar rBar, gBar, bBar;
boolean rMouse = true, gMouse = true, bMouse = true;
void setup() {
  size(640, 360);  //display window size
  strokeWeight(4);  //stroke Weight
  int barLength = width - 2*borderSize;
  rBar = new ProgressBar(borderSize, height - 85, barLength);
  gBar = new ProgressBar(borderSize, height - 65, barLength);
  bBar = new ProgressBar(borderSize, height - 45, barLength);
  //Set ProgressBar's title
  rBar.setTitle("Red");gBar.setTitle("Green");bBar.setTitle("Blue");
}

void draw() {
  background(200);  
  titleAndSiteInfo();  

  fill(rBar.progress*255, gBar.progress*255, bBar.progress*255);  
  ellipse(width/2, height/2, 100, 100);  

  rBar.create();  
  gBar.create();
  bBar.create();
}

void mousePressed() {
  if ( (mouseY< rBar.y+5) && (mouseY>rBar.y-5) ) {
    rMouse = true;
  } else if ( (mouseY< gBar.y+5) && (mouseY>gBar.y-5) ) {
    gMouse = true;
  } else if ( (mouseY< bBar.y+5) && (mouseY>bBar.y-5) ) {
    bMouse = true;
  }
}
void mouseReleased() {
  rMouse = false;
  bMouse = false;
  gMouse = false;
}
void mouseDragged() {
  int a = constrain(mouseX, borderSize, width - borderSize);
  float t = map(a, borderSize, width - borderSize, 0.0, 1.0);
  if (rMouse) {
    pRed.softPwmWrite((int)(100-t*100)); 
    rBar.setProgress(t);
  } else if (gMouse) {
    pGreen.softPwmWrite((int)(100-t*100)); 
    gBar.setProgress(t);
  } else if (bMouse) {
    pBlue.softPwmWrite((int)(100-t*100));
    bBar.setProgress(t);
  }
}

void titleAndSiteInfo() {
  fill(0);
  textAlign(CENTER);    
  textSize(40);        //set text size
  text("Colorful LED", width / 2, 40);    //title
  textSize(16);
  
}
