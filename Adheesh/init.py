# -*- coding: utf-8 -*-
#   ___      _ _                    _     
#  / _ \    | | |                  | |    
# / /_\ \ __| | |__   ___  ___  ___| |__  
# |  _  |/ _` | '_ \ / _ \/ _ \/ __| '_ \ 
# | | | | (_| | | | |  __/  __/\__ \ | | |
# \_| |_/\__,_|_| |_|\___|\___||___/_| |_|
# Date:   2020-02-22 10:36:53
# Last Modified time: 2020-02-22 15:32:24

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
		time.append(sensor1[i][0][11:16])
		date.append(sensor1[i][0][0:10]) 
	time=time[0:96]
	return sensor, date,time

def split_time(sensor,time):
	time_hour=[]
	for i in range(0,len(time)):
		if i%4==0:
			time_hour.append(time[i])
	return time_hour

def plot_data(mode,time_hour):
	plt.figure(1)
	plt.plot(time_hour,mode[0],label="pedestrian")
	plt.plot(time_hour,mode[1],label="cycle")
	plt.plot(time_hour,mode[2],label="car")
	plt.plot(time_hour,mode[3],label="bus")
	plt.plot(time_hour,mode[4],label="truck")
	plt.xlabel("time")
	plt.ylabel("traffic")
	plt.legend(loc=1)
	plt.grid()
	plt.show()

def process():
	mode1 = [sum(pedestrian[0:96][i:i+4]) for i in range(0, len(pedestrian[0:96]),4)]
	mode2 = [sum(cycle[0:96][i:i+4]) for i in range(0, len(cycle[0:96]),4)]
	mode3 = [sum(car[0:96][i:i+4]) for i in range(0, len(car[0:96]),4)]
	mode4 = [sum(bus[0:96][i:i+4]) for i in range(0, len(bus[0:96]),4)]
	mode5 = [sum(truck[0:96][i:i+4]) for i in range(0, len(truck[0:96]),4)]
	return (mode1,mode2,mode3,mode4,mode5)

if __name__=="__main__":
	myData=load_data()
	sensor,date,time=seperate_data(myData)
	time_hour=split_time(sensor,time)
	pedestrian=sensor[:,:,1][0]
	cycle=sensor[:,:,2][0]
	car=sensor[:,:,3][0]
	bus=sensor[:,:,4][0]
	truck=sensor[:,:,5][0]
	mode=process()
	plot_data(mode,time_hour)
