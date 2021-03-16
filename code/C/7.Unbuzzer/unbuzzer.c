#include <wiringPi.h>
#include <stdio.h>
#include <softTone.h>
#include <math.h>
#define buzzeRPin 0 //define the buzzeRPin
#define buttonPin 1 //define the buttonPin
void alertor(int pin){
	 int x;
	 double sinVal, toneVal;
	 for(x=0;x<360;x++){ // The frequency is based on the sine curve.
	 sinVal = sin(x * (M_PI / 180));
	 toneVal = 2000 + sinVal * 500;
	 softToneWrite(pin,toneVal);
	 delay(1);
	}
}
void stopAlertor(int pin){
	softToneWrite(pin,0);
}
int main(void)
{
	 if(wiringPiSetup() == -1){ //when initialize wiring failed,print message to screen
	 printf("setup wiringPi failed !");
	 return 1;
 } 
 pinMode(buzzeRPin, OUTPUT);
 pinMode(buttonPin, INPUT);
 softToneCreate(buzzeRPin);
 pullUpDnControl(buttonPin, PUD_UP); //pull up to high level
 while(1){ 
	 if(digitalRead(buttonPin) == LOW){ //button has pressed down
	 alertor(buzzeRPin); //buzzer on
	 printf("alertor on...\n");
 }
 else { //button has released 
	 stopAlertor(buzzeRPin); //buzzer off
	 printf("...buzzer off\n");
 }
 }
 return 0;
}
