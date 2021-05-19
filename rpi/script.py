import csv
import time
from smbus import SMBus

addr = 0x8 
bus = SMBus(1) 
numb = 1

while numb == 1:
    f1 = open('ldr.csv' , 'r')
    last_line = f1.readlines()[-1]
    temp = last_line.split(',')
    ll = int(temp[0])
    total_time = 0
    t0 = time.time()

    if ll <= 150:

        while (total_time <= 10):
            t1 = time.time()
            total_time = total_time + t1 - t0 
            print("value less than 150")
            bus.write_byte(addr, 0x1) 
            time.sleep(0.7)
            bus.write_byte(addr, 0x0)
            time.sleep(0.7) 

    elif (ll> 150 and ll<=350):
        
        while (total_time <= 10):
            t1 = time.time()
            total_time = total_time + t1 - t0
            print("value is between 150 and 350")
            bus.write_byte(addr, 0x1)    
            time.sleep(0.3)
            bus.write_byte(addr, 0x0)
            time.sleep(0.3)
    else:
        while (total_time <= 10):
            t1 = time.time()
            total_time = total_time + t1 - t0
            print("value is above 300")
            bus.write_byte(addr, 0x1)
            time.sleep(1)
