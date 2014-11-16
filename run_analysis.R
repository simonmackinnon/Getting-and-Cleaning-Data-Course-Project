library(data.table)
library(plyr)

# You should create one R script called 
#     run_analysis.R that does the following. 

# Merges the training and the 
#     test sets to create one data set.

#Get the test data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
measurement_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

#Get the training data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
measurement_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

#make the test data set
test_set <- cbind(subject_test, activity_test, measurement_test)

#make the training data set
train_set <- cbind(subject_train, activity_train, measurement_train)

#rename the data sets (Ensure common variable names)
names(train_set) <- c("Subject", "Activity", paste("V", 1:561, sep=""))
names(test_set) <- c("Subject","Activity", paste("V", 1:561, sep=""))

#merge by all common variables (columns)
mergedData <- merge(test_set, train_set, all=TRUE)

#free up the memory by getting rid of variables no longer needed
rm(test_set, train_set, 
   subject_test, subject_train, 
   activity_test, activity_train,
   measurement_test, measurement_train)

features <- read.table("./UCI HAR Dataset/features.txt")[,2]

#read in the measurement feature names (no need to store this vector)
names(mergedData) <- c("Subject", 
                       "Activity", 
                       as.character(features))

# Extracts only the measurements 
#     on the mean and standard deviation for 
#     each measurement. 
  
# Uses descriptive activity names to name 
#     the activities in the data set



# Appropriately labels the data set with 
#     descriptive variable names. 



# From the data set in step 4, creates a 
#     second, independent tidy data set with 
#     the average of each variable for each 
#     activity and each subject.



