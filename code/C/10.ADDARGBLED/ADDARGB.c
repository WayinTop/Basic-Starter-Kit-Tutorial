#include <wiringPi.h>
#include <pcf8591.h>
#include <stdio.h>
#include <softPwm.h>

#define address 0x48        
#define pinbase 64          
#define A0 pinbase + 0
#define A1 pinbase + 1
#define A2 pinbase + 2
#define A3 pinbase + 3

#define ledRedPin 3         
#define ledGreenPin 2
#define ledBluePin 0
int main(void){
    int val_Red,val_Green,val_Blue;
    if(wiringPiSetup() == -1){ 
        printf("setup wiringPi failed !");
        return 1; 
    }
    softPwmCreate(ledRedPin,0,100);    
    softPwmCreate(ledGreenPin,0,100);
    softPwmCreate(ledBluePin,0,100);
    pcf8591Setup(pinbase,address);     
    
    while(1){
        val_Red = analogRead(A0);  
        val_Green = analogRead(A1);
        val_Blue = analogRead(A2);
        softPwmWrite(ledRedPin,val_Red*100/255);    
        softPwmWrite(ledGreenPin,val_Green*100/255);
        softPwmWrite(ledBluePin,val_Blue*100/255);
        printf("ADC value val_Red: %d  ,\tval_Green: %d  ,\tval_Blue: %d \n",val_Red,val_Green,val_Blue);
        delay(100);
    }
    return 0;
}
