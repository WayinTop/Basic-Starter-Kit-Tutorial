#include <wiringPi.h>
#include <stdio.h>

#define relayPin    0  	//define the relayPin
#define buttonPin 1		//define the buttonPin
int main(void)
{
	if(wiringPiSetup() == -1){ //when initialize wiring fairelay,print messageto screen
		printf("fairelay !");
		return 1; 
	}
	printf("starting...\n");
	pinMode(relayPin, OUTPUT); 
	pinMode(buttonPin, INPUT);
	pullUpDnControl(buttonPin, PUD_UP);  //pull up to high level
	int i=0;
	int g=0;
	while(1){
		if(digitalRead(buttonPin)==HIGH && g==0)
		{
	            delay(20);
	            if(digitalRead(buttonPin)==HIGH)
		    {
	                i=i+1;
	                i=i%2;
	                g=1;
	                if(i==0)
			{
	                    digitalWrite(relayPin,LOW);
	                    printf("relayPin.....off\n");
			}
	                if(i==1)
			{
	                    digitalWrite(relayPin,HIGH);
	                    printf("relayPin.....on\n");
			}
		     }
		}
	        else if(digitalRead(buttonPin)==LOW)
		{
            		g=0;
		}
	}

	return 0;
}
