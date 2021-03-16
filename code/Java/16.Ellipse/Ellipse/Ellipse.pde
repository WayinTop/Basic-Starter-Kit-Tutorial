import processing.io.*; //<>//
PCF8591 pcf = new PCF8591(0x48);
void setup()
{
  size(360, 360);
  background(102);
  textAlign(CENTER, CENTER);
  textSize(64);
  text("Starting...", width / 2, (height - 40) / 2);
  textSize(16);
}

void draw()
{
  int[] analogs = new int[2];
  analogs[0] = pcf.analogRead(0);
  analogs[1] = pcf.analogRead(1);
  if (analogs != null)
  {
    background(102);
    drawEllipse(analogs[0], analogs[1]);
  }
}

void drawEllipse(int x, int y)
{
  int maxDiameter = 280;

  fill(255, 255, 255);
  textAlign(CENTER, CENTER);
  textSize(16);
  text("X: " + x, width / 2 - 30, 20);
  text("Y: " + y, width / 2 + 30, 20);

  x = x * maxDiameter / 255;
  y = y * maxDiameter / 255;
  fill(227, 118, 12);
  ellipse(width / 2, height / 2, x, y);
}
