def parse_time(datestring, np):
   import time
   from datetime import datetime
   import calendar
   
   DT = []
   dt = time.strptime(datestring,'%Y-%m-%dT%H:%M:%S.%f')
   DT = np.array(dt[0:6])

   return DT
   
def fssp_size_bins(data, np):

   LD = np.zeros([4,16])
   UD = np.zeros([4,16])
   MD = np.zeros([4,16])
   dD = np.zeros([4,16])
   dlogD = np.zeros([4,16])
   
   #range 0
   delta = 3
   for jj in range(0, 15):
      LD[0, jj] = 2 + (delta * jj)
      UD[0, jj] = LD[0, jj] + delta
  
   #range 1
   delta = 2
   for jj in range(0, 15):
      LD[1, jj] = 2 + (delta * jj)
      UD[1, jj] = LD[1, jj] + delta
   
   #range 2
   delta = 1
   for jj in range(0, 15):
      LD[2, jj] = 1 + (delta * jj)
      UD[2, jj] = LD[2, jj] + delta
   
   #range 3
   delta = 0.5
   for jj in range(0, 15):
      LD[3, jj] = 0.5 + (delta * jj)
      UD[3, jj] = LD[3, jj] + delta
   
   for ii in range(0, 3):
      for jj in range(0,15):
         dD[ii,jj] = UD[ii, jj] - LD[ii, jj]
         MD[ii,jj] = LD[ii, jj] + dD[ii, jj]/2
         dlogD[ii, jj] = np.log10(UD[ii, jj]) - np.log10(LD[ii, jj])
   
   return LD, UD, MD, dD, dlogD
   
def parse_fssp(RG, datastring, np):
   LSB = np.zeros([64])
   MSB = np.zeros([64])
   
   for ii in range(0, 64):
      LSB[ii] = datastring[ii * 2] #byte 0 2 4
      MSB[ii] = datastring[(ii * 2) + 1] #byte 1 3 5
      
   cc = -1
   for ii in range(0, 4):
      for jj in range (0, 15):
         cc = cc + 1
         RG[ii, jj] = LSB[cc] + (MSB[cc] * 256)
   return RG   