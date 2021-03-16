#include <wiringPi.h>
#include <stdio.h>

#define  ledPin    0

int main(void)
{
	if(wiringPiSetup() == -1){ 
		printf("setup wiringPi failed !");
		return 1; 
	}
	
	printf("wiringPi initialize successfully, GPIO %d(wiringPi pin)\n",ledPin); 	
	
	pinMode(ledPin, OUTPUT);

	while(1){
			digitalWrite(ledPin, HIGH);  
			printf("led on...\n");
			delay(1000);
			digitalWrite(ledPin, LOW);  
			printf("...led off\n");
			delay(1000);
	}

	return 0;
}

