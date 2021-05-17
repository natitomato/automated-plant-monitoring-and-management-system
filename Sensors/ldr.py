import serial

arduino_port = "COM5" #serial port of Arduino
baud = 9600 #arduino uno runs at 9600 baud
fileName="ldr.csv" #name of the CSV file generated
ser = serial.Serial(arduino_port, baud)
print("Connected to Arduino port:" + arduino_port)
file = open(fileName, "w")
print("Created file")

line = 0

while(True):

    #display the data to the terminal
    getData=str(ser.readline())
    data=getData[2:-5]
    print(data)

    #add the data to the file
    file = open(fileName, "a") #append the data to the file
    file.write(data + "\n") #write data with a newline

    file.close()

#close out the file
file.close()