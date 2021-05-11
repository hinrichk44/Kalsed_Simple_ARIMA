#ARIMA with auto.arima
#We are going to create an ARIMA model using the lynx dataset
#Annual numbers of lynx trappings for 1821--1934 in Canada.
#First we will plot the lynx dataset as a comparison
plot(lynx)
#We must import the forecast library to use auto.arima
library(forecast)
#There seems to be autoregression in the dataset
#Lynx trappings of prior years affect the number caught the following years
#To truly test for autoregression we will use tsdisplay
#tsdisplay plots a time series along with its acf and its pacf
tsdisplay(lynx)
#Several lags go past the threshold, indicating autoregression
#Now we will create our ARIMA model using auto.arima
auto.arima(lynx)
#We get ARIMA(2,0,2) so autoregression on second order lag and moving average
#on second order lag
#Now we will run the same model, but adding trace = True
#This will give us a list of ARIMA models to use
auto.arima(lynx, trace = T)
#In general you try to choose the one with the lowest value
#In this case it happens to be the orginal ARIMA(2,0,2)
#If we remove stepwise and approximation, we force auto.arima to be more precise
auto.arima(lynx, trace = T, stepwise = F, approximation = F)
#In this case, ARIMA(4,0,0) is the best model to use