#Set the working directory
setwd("~/Documents/Coursera/GettingAndCleaningData/Getting-Cleaning-Data-Coursera/UCI HAR Dataset")

#Download the training and test datasets from Samsun Galaxy S smartphone accelerometers. 
download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="accelerometer.zip")

#Unzip the file
unzip("accelerometer.zip")

#Read in the training and test datasets, their activity labels, and their subject labels
train <- read.table("train/X_train.txt")
train.activities <- read.table("train/y_train.txt")
train.subjects <- read.table("train/subject_train.txt")
test <- read.table("test/X_test.txt")
test.activities <- read.table("test/y_test.txt")
test.subjects <- read.table("test/subject_test.txt")

#Read in the features and add in feature labels "activity_type" and "subject" that will be used as column headers for the activities and subject variables, respectively
features <- read.table("features.txt")
activity_type <- data.frame("V1", "activity_type")
colnames(activity_type) <- c("V1", "V2")
subject <- data.frame("V1", "subject")
colnames(subject)<-c("V1", "V2")
features <- rbind(activity_type, features)
features <- rbind(subject, features)

#Remove the first column of the features table because it doesn't provide information
features <- features[,-c(1)]

#Add the activity labels to the training dataset and the test dataset
train <- cbind(train.activities, train)
test <- cbind(test.activities, test)

#Add the subject labels to the training dataset and the test dataset
train <- cbind(train.subjects, train)
test <- cbind(test.subjects, test)

#Set the column headers of the training and test datasets to the features
colnames(train)<-features
colnames(test)<-features

#Add the training and test datasets together
combined <-rbind(train, test)

#For the activity_type variable, changes activities from number to descriptive name
combined$activity_type <- gsub(pattern="1", x=combined$activity_type, replacement="walking")
combined$activity_type <- gsub(pattern="2", x=combined$activity_type, replacement="walking_upstairs")
combined$activity_type <- gsub(pattern="3", x=combined$activity_type, replacement="walking_downstairs")
combined$activity_type <- gsub(pattern="4", x=combined$activity_type, replacement="sitting")
combined$activity_type <- gsub(pattern="5", x=combined$activity_type, replacement="standing")
combined$activity_type <- gsub(pattern="6", x=combined$activity_type, replacement="laying")

#Extract mean and standard deviation for each measurement for each subject and activity
mean.std.colnames <- grep("subject|activity_type|[Mm]ean|std",colnames(combined), value=TRUE)
mean.std.columns <- subset(combined, select=mean.std.colnames)

#write to csv file
write.csv(mean.std.columns, file="mean.std.csv")

#Create a second tidy dataset with the average (mean) of each variable for each activity and each subject. 
mean.colnames <- grep("subject|activity_name|[Mm]ean", colnames(mean.std.columns), value=TRUE)
mean.columns <- subset(mean.std.columns, select=mean.colnames)

#write to csv file
write.csv(mean.columns, file="mean.csv")
