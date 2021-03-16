#include <wiringPi.h>
#include <stdio.h>
#include <softPwm.h>

#define ledPin    1 

int main(void)
{
	int i;

	if(wiringPiSetup() == -1){ 
		printf("setup wiringPi failed !");
		return 1; 
	}
	
	softPwmCreate(ledPin,  0, 100);

	while(1){
		for(i=0;i<100;i++){
			softPwmWrite(ledPin, i);
			delay(20);
		}
		delay(300);
		for(i=100;i>=0;i--){
			softPwmWrite(ledPin, i);
			delay(20);
		}
		delay(300);
	}
	return 0;
}

