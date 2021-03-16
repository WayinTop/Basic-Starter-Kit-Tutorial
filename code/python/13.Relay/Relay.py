import RPi.GPIO as GPIO
import time

relayPin = 11    # define the relayPin
buttonPin = 12    # define the buttonPin

def setup():
    print ('lnitialization')
    GPIO.setmode(GPIO.BOARD)       # Numbers GPIOs by physical location
    GPIO.setup(relayPin, GPIO.OUT)   # Set relayPin's mode is output
    GPIO.setup(buttonPin, GPIO.IN)   # Set buttonpin mode input

def loop():
    i=0
    g=0
    while True:
        reading = GPIO.input(buttonPin)
        if reading == GPIO.HIGH & g==0:
            time.sleep(0.2)
            reading = GPIO.input(buttonPin)
            if reading == GPIO.HIGH:
                i=i+1
                i=i%2
                g=1
                if i==0:
                    GPIO.output(relayPin,GPIO.LOW)
                    print("relayPin.....off")
                if i==1:
                    GPIO.output(relayPin,GPIO.HIGH)
                    print("relayPin.....on")
        else:
            g=0
    
def destroy():
    GPIO.output(relayPin, GPIO.LOW)     # relay off
    GPIO.cleanup()                     # Release resource

if __name__ == '__main__':     # Program start from here
    setup()
    try:
        loop()
    except KeyboardInterrupt:  
        destroy()
        