# Getting-Cleaning-Data-Coursera
Project for the Getting and Cleaning Data course in Coursera

In this repository there are several files used to create a tidy dataset of the accelerometer data from each subject and each activity type. 

Description of files

activity_labels.txt -- this defines the different integers found under the activity variable.

features.txt -- this contains the names of the variables.

features_info.txt -- this describes the meaning of the variable names.

README.txt -- the original README file for the data.

X_test.txt -- This is the test dataset. It has the measurements for each variable with each column corresponding to a particular variable.

y_test.txt -- the values for the activity variable for the test dataset for each row in the X_test.txt file.

subject_test.txt -- the values for the subject identifier for the test dataset for each row in the X_test.txt file.

X_train.txt -- This is the training dataset. It has the measurements for each variable with each column corresponding to a particular variable. 

y_train.txt -- The values for the activity variable for the training dataset for each row in the X_train.txt file. 

subject_train.txt -- The values for the subject identifier for the training dataset for each row in the X_train.txt file. 

mean.std.csv -- the dataset that is the combination of the training and test datasets, with the activty and subject variables added, but with only the mean and standard variables for each accelerometer meausurement. 

mean.csv -- the dataset that is the combination of the training and test datasets, with the activity and subject variables added, but with only the mean variables for each accelerometer measurement.

run_analysis.R -- the R script used to combine training and test datasets, to add the subject and activity variables, and to select/extract the mean and standard deviation variable for each accelerometer measurement.  

