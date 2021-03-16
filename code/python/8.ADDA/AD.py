import smbus
import time

address = 0x48  
bus=smbus.SMBus(1)
cmd=0x40        

def analogRead(chn):
    value = bus.read_byte_data(address,cmd+chn)
    return value
    
def analogWrite(value):
    bus.write_byte_data(address,cmd,value)  
    
def loop():
    while True:
        value = analogRead(0)   
        analogWrite(value)      
        voltage = value / 255.0 * 3.3  
        print ('ADC Value : %d, Voltage : %.2f'%(value,voltage))
        time.sleep(0.01)

def destroy():
    bus.close()
    
if __name__ == '__main__':
    print ('Program is starting ... ')
    try:
        loop()
    except KeyboardInterrupt:
        destroy()
        
    
