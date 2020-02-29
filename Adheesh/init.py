# -*- coding: utf-8 -*-
#   ___      _ _                    _     
#  / _ \    | | |                  | |    
# / /_\ \ __| | |__   ___  ___  ___| |__  
# |  _  |/ _` | '_ \ / _ \/ _ \/ __| '_ \ 
# | | | | (_| | | | |  __/  __/\__ \ | | |
# \_| |_/\__,_|_| |_|\___|\___||___/_| |_|
# Date:   2020-02-22 10:36:53
# Last Modified time: 2020-02-28 23:19:12

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import sys
sys.path.insert(1,'../Level4_UMDOTS_CampusTrafficCount')
from collections import Counter

# Importing the dataset
def load_data():
	myData = pd.read_csv('Data_Level4_UMDOTS_CampusTrafficCount.csv')
	location=myData.iloc[:,-1].values
	cnt = Counter()
	for word in location:
		cnt[word] += 1
	return myData

def seperate_data(myData):
	sensor=[]
	for i in range(0,10):
		sensor.append(myData.iloc[1348*i:1348*(i+1),:].values)
	sensor=np.array(sensor)
	sensor1=sensor[0]
	sensor2=sensor[1]
	sensor3=sensor[2]
	sensor4=sensor[3]
	sensor5=sensor[4]
	sensor6=sensor[5]
	sensor7=sensor[6]
	sensor8=sensor[7]
	sensor9=sensor[8]
	sensor10=sensor[9]
	date=[]
	time=[]
	for i in range(0,sensor1.shape[0]):
		time.append(sensor1[i][0][11:13])
		date.append(sensor1[i][0][0:10]) 
	time=time[0:96]
	return sensor, date,time

def split_time(sensor,time):
	time_hour=[]
	for i in range(0,len(time)):
		if i%4==0:
			time_hour.append(time[i])
	return time_hour

def plot_data(mode,time_hour,location, day_of_week,num):
	plt.figure(num)
	plt.plot(time_hour,mode[0],label="pedestrian")
	plt.plot(time_hour,mode[1],label="cycle")
	plt.plot(time_hour,mode[2],label="car")
	plt.plot(time_hour,mode[3],label="bus")
	plt.plot(time_hour,mode[4],label="truck")
	plt.xlabel("time")
	plt.ylabel("traffic")
	plt.legend(loc=1)
	plt.title(f"{location} {day_of_week}")
	plt.grid()
	#plt.show()

def process(pedestrian,cycle,car,bus,truck):

	#Normal Day(28th Oct)
	# mode1 = [sum(pedestrian[0:96][i:i+4]) for i in range(0, len(pedestrian[0:96]),4)]
	# mode2 = [sum(cycle[0:96][i:i+4]) for i in range(0, len(cycle[0:96]),4)]
	# mode3 = [sum(car[0:96][i:i+4]) for i in range(0, len(car[0:96]),4)]
	# mode4 = [sum(bus[0:96][i:i+4]) for i in range(0, len(bus[0:96]),4)]
	# mode5 = [sum(truck[0:96][i:i+4]) for i in range(0, len(truck[0:96]),4)]
	
	#Halloween (31st Oct)
	# mode1 = [sum(pedestrian[96*3:96*4][i:i+4]) for i in range(0, len(pedestrian[96*3:96*4]),4)]
	# mode2 = [sum(cycle[96*3:96*4][i:i+4]) for i in range(0, len(cycle[96*3:96*4]),4)]
	# mode3 = [sum(car[96*3:96*4][i:i+4]) for i in range(0, len(car[96*3:96*4]),4)]
	# mode4 = [sum(bus[96*3:96*4][i:i+4]) for i in range(0, len(bus[96*3:96*4]),4)]
	# mode5 = [sum(truck[96*3:96*4][i:i+4]) for i in range(0, len(truck[96*3:96*4]),4)]

	#Homecoming (2nd Nov)
	# mode1 = [sum(pedestrian[96*5:96*6][i:i+4]) for i in range(0, len(pedestrian[96*5:96*6]),4)]
	# mode2 = [sum(cycle[96*5:96*6][i:i+4]) for i in range(0, len(cycle[96*5:96*6]),4)]
	# mode3 = [sum(car[96*5:96*6][i:i+4]) for i in range(0, len(car[96*5:96*6]),4)]
	# mode4 = [sum(bus[96*5:96*6][i:i+4]) for i in range(0, len(bus[96*5:96*6]),4)]
	# mode5 = [sum(truck[96*5:96*6][i:i+4]) for i in range(0, len(truck[96*5:96*6]),4)]

	#Weekend (3rd Nov)
	# mode1 = [sum(pedestrian[96*6:96*7][i:i+4]) for i in range(0, len(pedestrian[96*6:96*7]),4)]
	# mode2 = [sum(cycle[96*6:96*7][i:i+4]) for i in range(0, len(cycle[96*6:96*7]),4)]
	# mode3 = [sum(car[96*6:96*7][i:i+4]) for i in range(0, len(car[96*6:96*7]),4)]
	# mode4 = [sum(bus[96*6:96*7][i:i+4]) for i in range(0, len(bus[96*6:96*7]),4)]
	# mode5 = [sum(truck[96*6:96*7][i:i+4]) for i in range(0, len(truck[96*6:96*7]),4)]

	# #Monday (4th Nov)
	# mode1 = [sum(pedestrian[96*7:96*8][i:i+4]) for i in range(0, len(pedestrian[0:96]),4)]
	# mode2 = [sum(cycle[96*7:96*8][i:i+4]) for i in range(0, len(cycle[0:96]),4)]
	# mode3 = [sum(car[96*7:96*8][i:i+4]) for i in range(0, len(car[0:96]),4)]
	# mode4 = [sum(bus[96*7:96*8][i:i+4]) for i in range(0, len(bus[0:96]),4)]
	# mode5 = [sum(truck[96*7:96*8][i:i+4]) for i in range(0, len(truck[0:96]),4)]

	# #Tuesday (5th Nov)
	# mode6 = [sum(pedestrian[96*8:96*9][i:i+4]) for i in range(0, len(pedestrian[0:96]),4)]
	# mode7 = [sum(cycle[96*8:96*9][i:i+4]) for i in range(0, len(cycle[0:96]),4)]
	# mode8 = [sum(car[96*8:96*9][i:i+4]) for i in range(0, len(car[0:96]),4)]
	# mode9 = [sum(bus[96*8:96*9][i:i+4]) for i in range(0, len(bus[0:96]),4)]
	# mode10 = [sum(truck[96*8:96*9][i:i+4]) for i in range(0, len(truck[0:96]),4)]

	# #Wednesday (6th Nov)
	# mode11 = [sum(pedestrian[96*9:96*10][i:i+4]) for i in range(0, len(pedestrian[0:96]),4)]
	# mode12 = [sum(cycle[96*9:96*10][i:i+4]) for i in range(0, len(cycle[0:96]),4)]
	# mode13 = [sum(car[96*9:96*10][i:i+4]) for i in range(0, len(car[0:96]),4)]
	# mode14 = [sum(bus[96*9:96*10][i:i+4]) for i in range(0, len(bus[0:96]),4)]
	# mode15 = [sum(truck[96*9:96*10][i:i+4]) for i in range(0, len(truck[0:96]),4)]

	# #Thursday (7th Nov)
	# mode16 = [sum(pedestrian[96*10:96*11][i:i+4]) for i in range(0, len(pedestrian[0:96]),4)]
	# mode17 = [sum(cycle[96*10:96*11][i:i+4]) for i in range(0, len(cycle[0:96]),4)]
	# mode18 = [sum(car[96*10:96*11][i:i+4]) for i in range(0, len(car[0:96]),4)]
	# mode19 = [sum(bus[96*10:96*11][i:i+4]) for i in range(0, len(bus[0:96]),4)]
	# mode20 = [sum(truck[96*10:96*11][i:i+4]) for i in range(0, len(truck[0:96]),4)]

	# #Friday (8th Nov) / BAD WEATHER
	# mode21 = [sum(pedestrian[96*11:96*12][i:i+4]) for i in range(0, len(pedestrian[96*11:96*12]),4)]
	# mode22 = [sum(cycle[96*11:96*12][i:i+4]) for i in range(0, len(cycle[96*11:96*12]),4)]
	# mode23 = [sum(car[96*11:96*12][i:i+4]) for i in range(0, len(car[96*11:96*12]),4)]
	# mode24 = [sum(bus[96*11:96*12][i:i+4]) for i in range(0, len(bus[96*11:96*12]),4)]
	# mode25 = [sum(truck[96*11:96*12][i:i+4]) for i in range(0, len(truck[96*11:96*12]),4)]

	# #Saturday (9th Nov)
	# mode26 = [sum(pedestrian[96*12:96*13][i:i+4]) for i in range(0, len(pedestrian[0:96]),4)]
	# mode27 = [sum(cycle[96*12:96*13][i:i+4]) for i in range(0, len(cycle[0:96]),4)]
	# mode28 = [sum(car[96*12:96*13][i:i+4]) for i in range(0, len(car[0:96]),4)]
	# mode29 = [sum(bus[96*12:96*13][i:i+4]) for i in range(0, len(bus[0:96]),4)]
	# mode30 = [sum(truck[96*12:96*13][i:i+4]) for i in range(0, len(truck[0:96]),4)]

	# #Sunday (10th Nov)
	# mode31 = [sum(pedestrian[96*13:96*14][i:i+4]) for i in range(0, len(pedestrian[0:96]),4)]
	# mode32 = [sum(cycle[96*13:96*14][i:i+4]) for i in range(0, len(cycle[0:96]),4)]
	# mode33 = [sum(car[96*13:96*14][i:i+4]) for i in range(0, len(car[0:96]),4)]
	# mode34 = [sum(bus[96*13:96*14][i:i+4]) for i in range(0, len(bus[0:96]),4)]
	# mode35 = [sum(truck[96*13:96*14][i:i+4]) for i in range(0, len(truck[0:96]),4)]

	return (mode1,mode2,mode3,mode4,mode5)\
	# ,(mode6,mode7,mode8,mode9,mode10), (mode11,mode12,mode13,mode14,mode15),\
	# (mode16,mode17,mode18,mode19,mode20),(mode21,mode22,mode23,mode24,mode25),(mode26,mode27,mode28,mode29,mode30),\
	# (mode31,mode32,mode33,mode34,mode35)
	

if __name__=="__main__":
	myData=load_data()
	sensor,date,time=seperate_data(myData)
	time_hour=split_time(sensor,time)
	pedestrian=sensor[:,:,1][5]
	cycle=sensor[:,:,2][5]
	car=sensor[:,:,3][5]
	bus=sensor[:,:,4][5]
	truck=sensor[:,:,5][5]
	
	#WEEKLY ANALYSIS
	# mode1=process(pedestrian,cycle,car,bus,truck)[0]
	# mode2=process(pedestrian,cycle,car,bus,truck)[1]
	# mode3=process(pedestrian,cycle,car,bus,truck)[2]
	# mode4=process(pedestrian,cycle,car,bus,truck)[3]
	# mode5=process(pedestrian,cycle,car,bus,truck)[4]
	# mode6=process(pedestrian,cycle,car,bus,truck)[5]
	#mode7=process(pedestrian,cycle,car,bus,truck)[6]
	
	#LOCATION ANALYSIS
	# mode1=process(sensor[:,:,1][0],sensor[:,:,2][0],sensor[:,:,3][0],sensor[:,:,4][0],sensor[:,:,5][0])
	# mode2=process(sensor[:,:,1][1],sensor[:,:,2][1],sensor[:,:,3][1],sensor[:,:,4][1],sensor[:,:,5][1])
	# mode3=process(sensor[:,:,1][2],sensor[:,:,2][2],sensor[:,:,3][2],sensor[:,:,4][2],sensor[:,:,5][2])
	# mode4=process(sensor[:,:,1][3],sensor[:,:,2][3],sensor[:,:,3][3],sensor[:,:,4][3],sensor[:,:,5][3])
	# mode5=process(sensor[:,:,1][4],sensor[:,:,2][4],sensor[:,:,3][4],sensor[:,:,4][4],sensor[:,:,5][4])
	# mode6=process(sensor[:,:,1][5],sensor[:,:,2][5],sensor[:,:,3][5],sensor[:,:,4][5],sensor[:,:,5][5])
	# mode7=process(sensor[:,:,1][6],sensor[:,:,2][6],sensor[:,:,3][6],sensor[:,:,4][6],sensor[:,:,5][6])
	# mode8=process(sensor[:,:,1][7],sensor[:,:,2][7],sensor[:,:,3][7],sensor[:,:,4][7],sensor[:,:,5][7])
	# mode9=process(sensor[:,:,1][8],sensor[:,:,2][8],sensor[:,:,3][8],sensor[:,:,4][8],sensor[:,:,5][8])
	# mode10=process(sensor[:,:,1][9],sensor[:,:,2][9],sensor[:,:,3][9],sensor[:,:,4][9],sensor[:,:,5][9])
	

	#WEEKLY PLOTS
	# plot_data(mode1,time_hour,"Regents Drive"."(Monday)",1) #4th Nov
	# plot_data(mode2,time_hour,"Regents Drive","(Tuesday)",2) #5th Nov
	# plot_data(mode3,time_hour,"Regents Drive","(Wednesday)",3) #6th Nov
	# plot_data(mode4,time_hour,"Regents Drive","(Thursday)",4) #7th Nov
	# plot_data(mode5,time_hour,"Regents Drive","(Friday)",5) #8th Nov
	# plot_data(mode6,time_hour,"Regents Drive","(Saturday)",6) #9th Nov
	# plot_data(mode7,time_hour,"Regents Drive","(Sunday)",7) #10th Nov
	

	#LOCATION PLOTS
	# plot_data(mode1,time_hour,"Campus_Dr_&_Presidential_Ave","(Monday)",1)
	# plot_data(mode2,time_hour,"Campus_Dr_At_Paint_Branch_Dr","(Monday)",2)
	# plot_data(mode3,time_hour,"Paint_Branch_Dr_At_Campus_Dr","(Monday)",3)
	# plot_data(mode4,time_hour,"Regents_Dr_&_Stadium_Dr_1","(Monday)",4)
	# plot_data(mode5,time_hour,"Regents_Dr_&_Stadium_Dr_2","(Monday)",5)
	# plot_data(mode6,time_hour,"Regents_Dr_&_Stadium_Dr_3","(Monday)",6)
	# plot_data(mode7,time_hour,"South_Gate_Northern_View","(Monday)",7)
	# plot_data(mode8,time_hour,"South_Gate_South_View","(Monday)",8)
	# plot_data(mode9,time_hour,"Stadium_Dr_East_Of_Regents_Dr","(Monday)",9)
	# plot_data(mode10,time_hour,"University_Blvd_&_Paint_Branch_Dr","(Monday)",10)

	plt.show()