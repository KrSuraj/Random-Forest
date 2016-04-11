library(randomForest)


cdw = getwd()
setwd("C:\\Users\\Kr_Suraj_Baranwal\\Desktop\\Academics\\DACS\\DA\\Project\\Titanic")

#Loading the data
train = read.csv("train.csv")
test = read.csv("test.csv")
set.seed(21)

#Removing incomplete rows
train<-na.omit(train)
test<-na.omit(test)

#training the data with random forest algorithm
my_forest <- randomForest(as.factor(Survived)~Pclass+Sex+Age+SibSp+Parch+Fare+Embarked,
                          data = train, ntree = 1000, importance = TRUE) 

#Predicting on the test data
my_prediction <- predict(my_forest, test, "class")
my_solution = data.frame(test$PassengerId, my_prediction)
write.csv(my_solution, file = "my_solution.csv", row.names = FALSE)

#Getting Variable importance through the plot
varImpPlot(my_forest)
