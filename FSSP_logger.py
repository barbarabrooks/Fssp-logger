# args exected
#<port> <baud> <output directory>

import sys, io, serial, time
import numpy as np
from fssp import parse_fssp
from datetime import datetime

port = str(sys.argv[1]) #serial port
baudrate = int(sys.argv[2]) #baud
do = str(sys.argv[3]) #output data directory

#open instance of com port 
ser = serial.Serial();

#configure port
ser.port = port
ser.baudrate = baudrate
ser.parity = serial.PARITY_NONE
ser.stopbits = serial.STOPBITS_ONE
ser.bytesize = serial.EIGHTBITS
ser.timeout = 0

#make file
datestring = datetime.utcnow().isoformat(); # starting time
dt = time.strptime(datestring,'%Y-%m-%dT%H:%M:%S.%f')
start_day = dt[2]
yy = str(dt[0])
mm = str(dt[1])
if len(mm) < 2:
   mm = '0' + mm
dd = str(dt[2])
if len(dd) < 2:
   dd = '0' + dd

outfile = do + 'FSSP_' + yy + mm + dd + '.txt'

# open port and send configuration message ot PMS interface
if ser.isOpen():
    ser.close()
ser.open()
ser.isOpen()

ser.write("HBP0R4M2D1G".encode())
print("FSSP interface initalised" + '\n')
print("Hit any Ctrl + c to stop" + '\n')
print('\n')
print("Current log file: " + outfile + '\n')

while ser.isOpen():
   #FSSP interface put 128 bytes on inteface every second
   #loop round as fast as poss and read data one the buffer has 128 byte in
   
   if ser.in_waiting == 128: #how many byte in in buffer
      #get time stamp
      datestring = datetime.utcnow().isoformat(); # time stamp
   
      #read data
      datastring = ser.read(size = 128); #fssp message always 128 bytes long
      print(datestring + 'No Bytes read: ' + str(len(datastring)) + '\n')      
      
      #parse data
      RG = np.zeros([4,16])
      RG = parse_fssp(RG, datastring, np)
   
      #check for new day
      dt = time.strptime(datestring,'%Y-%m-%dT%H:%M:%S.%f')
      now_day = dt[2];
      if now_day != start_day:
         start_day = now_day
         yy = str(dt[0])
         mm = str(dt[1])
         if len(mm) < 2:
            mm = '0' + mm
            dd = str(dt[2])
         if len(dd) < 2:
            dd = '0' + dd
         
         outfile = do + '\FSSP_' + yy + mm + dd + '.txt'
         print("Current log file: " + outfile + '\n')
   
      #save data
      f = open(outfile,'a') #open ascii file for appending
   
      #time
      f.write(datestring + '\n') #write to file

      #range 0 data
      print('Range 0: ' + str(RG[0,:]) + '\n')
      
      f.write('Range 0' + '\t')
      for ii in range(0,15):
         f.write(str(RG[0,ii]) + '\t')
      f.write('\n')
      
      #range 1 data
      print('Range 1: ' + str(RG[1,:]) + '\n')
      
      f.write('Range 1' + '\t')
      for ii in range(0,15):
         f.write(str(RG[1,ii]) + '\t')
      f.write('\n')
      
      #range 2 data
      print('Range 2: ' + str(RG[2,:]) + '\n')
      
      f.write('Range 2' + '\t')
      for ii in range(0,15):
         f.write(str(RG[2,ii]) + '\t')
      f.write('\n')

      #range 3 data
      print('Range 3: ' + str(RG[3,:]) + '\n')
      
      f.write('Range 3' + '\t')
      for ii in range(0,15):
         f.write(str(RG[3,ii]) + '\t')
      f.write('\n')

      f.close() #close file
      

