## Creating index variable 

# Read the Data
data = read.csv("car_data.csv", header=T)
attach(data)
# Random sampling
samplesize = 0.60 * nrow(data)
set.seed(80)
index = sample( seq_len ( nrow ( data ) ), size = samplesize )

# Create training and test set
datatrain = data[ index, ]
datatest = data[ -index, ]
## Scale data for neural network

max = apply(data , 2 , max)
min = apply(data, 2 , min)
scaled = as.data.frame(scale(data, center = min, scale = max - min))
## Fit neural network 

# install library
install.packages("neuralnet ")

# load library
library(neuralnet)

# creating training and test set
trainNN = scaled[index , ]
testNN = scaled[-index , ]

# fit neural network
NN = neuralnet(IsBadBuy ~ VehicleAge + VehOdo+MMRAcquisitionAuctionAveragePrice+MMRAcquisitionRetailAveragePrice, trainNN, hidden =2 , linear.output = T )

# plot neural network
plot(NN)
# Compute Predictions off Test Set
predicted.nn.values <- compute(NN,testNN)

# Check out net.result
print(head(predicted.nn.values$net.result))
predicted.nn.values$net.result <- sapply(predicted.nn.values$net.result,round,digits=0)
##build a confusion matrix
table(testNN$IsBadBuy,predicted.nn.values$net.result)
