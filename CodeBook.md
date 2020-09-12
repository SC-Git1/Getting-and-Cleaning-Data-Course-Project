# Getting-and-Cleaning-Data-Course-Project

variables created in the run_analysis script:


X_test = dataframe with the data from the X_test.txt file from the UCI HAR Dataset/test
y_test = dataframe with the data from the y_test.txt file from the UCI HAR Dataset/test
subject_test = dataframe with the data from the subject_test.txt file from the UCI HAR Dataset/test
X_train = dataframe with the data from the X_train.txt file from the UCI HAR Dataset/train
y_train = dataframe with the data from the y_train.txt file from the UCI HAR Dataset/train
subject_train = dataframe with the data from the subject_train.txt file from the UCI HAR Dataset/train
X_features = dataframe with the data from the features.txt file from the UCI HAR Dataset

Xys_df = dataframe with the activity, subject and all relevant columns about the mean or standard 
deviation from the X_ dataframes. The data from the test.txt files is found in the first 2947 rows.
colmeans_Xys_df = A second, independent tidy data set with the average of each variable for each activity and each subject.

wd = the current working directory after set to the UCI HAR Dataset on your computer