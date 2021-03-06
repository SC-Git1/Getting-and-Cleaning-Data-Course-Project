
#set your workspace to the UCI HAR DAtaset on your computer.

#First, we introduce the variables needed from the UCI HAR Dataset.

wd <- getwd()
X_test <- read.table(paste(wd,"/test/X_test.txt",sep = ""))
y_test <- read.table(paste(wd,"/test/y_test.txt",sep = ""))
subject_test <- read.table(paste(wd,"/test/subject_test.txt",sep = ""))
X_train <- read.table(paste(wd,"/train/X_train.txt",sep = ""))
y_train <- read.table(paste(wd,"/train/y_train.txt",sep = ""))
subject_train <- read.table(paste(wd,"/train/subject_train.txt",sep = ""))
X_features <- read.table(paste(wd,"/features.txt",sep = ""))

#generate one dataframe

Xys_df <- rbind(cbind(y_test,subject_test,X_test),cbind(y_train,subject_train,X_train))

#remove the variables used for the creation of Xys_df

rm(X_test,y_test,subject_test,X_train, y_train,subject_train)

#name the 562 columns of Xys_df with the names provided in the second column of X_features 
#and the name "activity" and "subject"

names(Xys_df) <- c("activity","subject",X_features[,2])

#extract all the relevant columns about the mean or standard deviation the subject id and activity 

Xys_df <- Xys_df[,grepl(("mean|std|activity|subject"),names(Xys_df))]

#Use descriptive activity names to name the activities in the data set
Xys_df$activity <- gsub(1,"WALKING",Xys_df$activity)
Xys_df$activity <- gsub(2,"WALKING_UPSTAIRS",Xys_df$activity)
Xys_df$activity <- gsub(3,"WALKING_DOWNSTAIRS",Xys_df$activity)
Xys_df$activity <- gsub(4,"SITTING",Xys_df$activity)
Xys_df$activity <- gsub(5,"STANDING",Xys_df$activity)
Xys_df$activity <- gsub(6,"LAYING",Xys_df$activity)

# create a second dataframe with the average of each column for each activity and subject.
colmeans_Xys_df <- aggregate(Xys_df[,3:81], list(Xys_df$subject,Xys_df$activity), mean)

# rearrange the first two column so that the first column is activity and the second one is subject,
# then, restore the column names
colmeans_Xys_df <- colmeans_Xys_df[,c(2,1,3:81)]
names(colmeans_Xys_df) <- names(Xys_df)

# correct the title names
names(Xys_df) <- gsub("BodyBody","Body",names(Xys_df))
