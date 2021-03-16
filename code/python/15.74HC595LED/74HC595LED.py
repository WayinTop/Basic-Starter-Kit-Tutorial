import RPi.GPIO as GPIO
import time

LWAY = 1
MWAY = 2

dataPin = 11        #DS Pin of 74HC595(Pin14)
latchPin = 13       #ST_CP Pin of 74HC595(Pin12)
clockPin = 15       #CH_CP Pin of 74HC595(Pin11)

def setup():
    GPIO.setmode(GPIO.BOARD)    
    GPIO.setup(dataPin,GPIO.OUT)
    GPIO.setup(latchPin,GPIO.OUT)
    GPIO.setup(clockPin,GPIO.OUT)

def sendout(dPin,cPin,way,val):
    for i in range(0,8):
        GPIO.output(cPin,GPIO.LOW)
        if(way == LWAY):
            GPIO.output(dPin,(0x01 & (val>>i)==0x01) and GPIO.HIGH or GPIO.LOW)
        elif(way == MWAY):
            GPIO.output(dPin,(0x80 & (val<<i)==0x80) and GPIO.HIGH or GPIO.LOW)
        GPIO.output(cPin,GPIO.HIGH)


def loop():
    while True:
        x=0x01
        for i in range(0,8):
            GPIO.output(latchPin,GPIO.LOW)      #Output low level to latchPin
            sendout(dataPin,clockPin,LWAY,x)    #Send serial data to 74HC595
            GPIO.output(latchPin,GPIO.HIGH)     #Output high level to latchPin, and 74HC595 will update the data to the parallel output port.
            x<<=1                   # make the variable move one bit to left once, then the bright LED move one step to the left once.
            time.sleep(0.1)
        x=0x80
        time.sleep(0.5)
        for i in range(0,8):
            GPIO.output(latchPin,GPIO.LOW)      #Output low level to latchPin
            sendout(dataPin,clockPin,LWAY,x)    #Send serial data to 74HC595
            GPIO.output(latchPin,GPIO.HIGH)     #Output high level to latchPin, and 74HC595 will update the data to the parallel output port.
            x>>=1                   # make the variable move one bit to left once, then the bright LED move one step to the left once.
            time.sleep(0.1)
        time.sleep(0.5)

def destroy():      # When 'Ctrl+C' is pressed, the function is executed.
    GPIO.cleanup()

if __name__ == '__main__':   # Program starting from here
    print("starting...")
    setup()
    try:
        loop()
    except KeyboardInterrupt:
        destroy()