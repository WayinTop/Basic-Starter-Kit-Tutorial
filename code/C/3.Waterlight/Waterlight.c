#include <wiringPi.h>
#include <stdio.h>
#define leds 8
int pins[leds] = {0,1,2,3,4,5,6,10};
void led_on(int n)
{
	digitalWrite(n, LOW);
}

void led_off(int n)
{
	digitalWrite(n, HIGH);
}

int main(void)
{
	int i;
	printf("Program is starting ... \n");
	if(wiringPiSetup() == -1){ 
		printf("setup wiringPi failed !");
		return 1; 
	}
	for(i=0;i<leds;i++){       
		pinMode(pins[i], OUTPUT);
	}
	while(1){
		for(i=0;i<leds;i++){   
			led_on(pins[i]);
			delay(100);
			led_off(pins[i]);
		}
		for(i=leds-1;i>=0;i--){   
			led_on(pins[i]);
			delay(100);
			led_off(pins[i]);
		}
	}
	return 0;
}
