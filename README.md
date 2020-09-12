# Getting-and-Cleaning-Data-Course-Project

There is one script run_analysis.R that converts the data from the UCI HAR Dataset to a tidy dataframe.
It is important that the working directory is set to the UCI HAR Dataset on your computer. Otherwise, 
the script won't work (error message: "Error in file(file, "rt") : cannot open the connection
In addition: Warning message:...")

The steps taken to create the tidy dataset (also partly given as comments in the script):

set your workspace to the UCI HAR DAtaset on your computer.

First, we introduce the variables needed from the UCI HAR Dataset:
use read.table to create 6 variabels of the 6 different datasets needed 
(X_test,y_test, subject_test,X_train,y_train and subject_train)
create (with read.table) a 7th variable X_features containing the column 
names of the X_ datasets)

generate one dataframe with rbind and cbind so that the test results are on top of the train results 
and the columns are (from left to right) activity, subject and the measurements in the order given in the features.txt file.

remove the variables X_test, y_test, subject_test, X_train, y_train and subject_train 
as it may cause problems in future computations and they aren't used anymore in the script

name the 562 columns of Xys_df with the names provided in the second column of X_features 
and the name "activity" and "subject"

extract all the relevant columns about the mean or standard deviation (every column with mean or std 
in its name. Mean not because those values are angles)and the subject id and activity columns

Use descriptive activity names to name the activities in the data set using the function gsub

create a second dataframe with the average of each column for each activity and subject with the aggregate function

rearrange the first two column so that the first column is activity and the second one is subject then, 
restore the column names

correct the title names. NOTE: the column names can be more descriptive, but they are already relatively long.
_______________________________________________________________________________________________________________
