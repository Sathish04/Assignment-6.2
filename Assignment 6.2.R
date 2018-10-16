#importing the dataset
train<-read.csv('train.csv',header=TRUE)

test<-read.csv('test.csv',header=TRUE)

#add a veriable "super" to the test dataset to allow for combining data sets
test.Survived<-data.frame(Survived=rep("None",nrow(test)),test[,])
data.combined <-rbind(train, test.Survived)

#a. Is there any difference in fares by different class of tickets?
 # Note - Show a boxplot displaying the distribution of fares by class

data.combined$Pclass<-as.numeric(data.combined$Pclass)
data.combined$Fare<-as.numeric(data.combined$Fare)

boxplot(Fare~Pclass, data = data.combined,col= c("gold","red"))

#b. Is there any association with Passenger class and gender?
#Note - Show a stacked bar chart

mixed<-table(data.combined$Sex,data.combined$Pclass)
mixed
barplot(mixed, col = heat.colors(4),border="red", space=0.04,main = "stacked chart" , xlab="passengerclass",ylab = "gender")
