import serial

arduino_port = "/dev/ttyACM0"
baud = 9600 
fileName="ldr.csv" 
ser = serial.Serial(arduino_port, baud)
print("Connected to Arduino port:" + arduino_port)
file = open(fileName, "w")
print("Created file")

line = 0

while(True):
    
    getData=str(ser.readline())
    data=getData[2:-5]
    print(data)

    file = open(fileName, "a") 
    file.write(data + "\n") 
    file.close()

file.close()
