#include <wiringPi.h>
#include <stdio.h>

#define buzzerPin    0  	
#define buttonPin 1		

int main(void)
{
	if(wiringPiSetup() == -1){ 
		printf("setup wiringPi failed !");
		return 1; 
	}
	
	pinMode(buzzerPin, OUTPUT); 
	pinMode(buttonPin, INPUT);

	pullUpDnControl(buttonPin, PUD_UP);  
	while(1){
		
		if(digitalRead(buttonPin) == LOW){ 
			digitalWrite(buzzerPin, HIGH);   
			printf("buzzer on...\n");
		}
		else {				
			digitalWrite(buzzerPin, LOW);   
			printf("...buzzer off\n");
		}
	}

	return 0;
}

