import RPi.GPIO as GPIO
import time
import math

buzzerPin = 11    
buttonPin = 12    

def setup():
	global p
	print ('Program is starting...')
	GPIO.setmode(GPIO.BOARD)       
	GPIO.setup(buzzerPin, GPIO.OUT)   
	GPIO.setup(buttonPin, GPIO.IN, pull_up_down=GPIO.PUD_UP)    
	p = GPIO.PWM(buzzerPin, 1)
	p.start(0);
	
def loop():
	while True:
		if GPIO.input(buttonPin)==GPIO.LOW:
			alertor()
			print ('buzzer on ...')
		else :
			stopAlertor()
			print ('buzzer off ...')
def alertor():
	p.start(50)
	for x in range(0,361):		
		sinVal = math.sin(x * (math.pi / 180.0))		
		toneVal = 2000 + sinVal * 500	
		p.ChangeFrequency(toneVal)		
		time.sleep(0.001)
		
def stopAlertor():
	p.stop()
			
def destroy():
	GPIO.output(buzzerPin, GPIO.LOW)     
	GPIO.cleanup()                     

if __name__ == '__main__':     
	setup()
	try:
		loop()
	except KeyboardInterrupt:  
		destroy()

