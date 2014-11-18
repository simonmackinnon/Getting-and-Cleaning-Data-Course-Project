library(plyr)

# data can be downloaded from: 
#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Merge the training and the test sets to create one data set.

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

  #remove variables no longer needed (free memory)
rm(subject_test, measurement_test, activity_test,
   subject_train, measurement_train, activity_train)

  #rename the data sets (Ensure common variable names)
colnames(train_set)[1] <- "Subject"
colnames(train_set)[2] <- "Activity"
colnames(test_set)[1] <- "Subject"
colnames(test_set)[2] <- "Activity"

  #merge by all common variables (columns)
mergedData <- merge(test_set, train_set, all=TRUE)

  #remove variables no longer needed (free memory)
rm(test_set, train_set)

  #read the table and use only the second column
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Extracts only the measurements on the mean and standard deviation for each measurement. 

  #get the specific names from the table
extractedFeaturesTF <- grepl("^.+(mean\\(\\)|std\\(\\))$",features)

  #extract the columns that end with "mean()" or "std()" as representative of mean and standard
  # deviation values for each measurement
extractedData <- cbind(mergedData$Subject, mergedData$Activity, 
                       mergedData[extractedFeaturesTF])

  #remove variables no longer needed (free memory)
rm(features, extractedFeaturesTF)

  # rename for ease of viewing
colnames(extractedData)[1] <- "Subject"
colnames(extractedData)[2] <- "Activity"
  
# Use descriptive activity names to name the activities in the data set

  # load the activity number to name table
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

  # turn activity column into factor
extractedData$Activity <- factor(extractedData$Activity)

  # relevel the factor (this recodes the number values to be the descriptive names)
levels(extractedData$Activity) <- activities

  #remove variables no longer needed (free memory)
rm(activities)

# Appropriately labels the data set with descriptive variable names. 

varNames <- c("Mean of the linear acceleration of the body on the phone (time domain)",
              "Standard deviation of the linear acceleration of the body on the phone (time domain)",
              "Mean of the gravitational acceleration on the phone (time domain)",
              "Standard deviation of the gravitational acceleration on the phone (time domain)",
              "Mean of the linear jerk of the body on the phone (time domain)",
              "Standard deviation of the linear jerk of the body on the phone (time domain)",
              "Mean of the angular velocity of the body on the phone (time domain)",
              "Standard deviation of the angular velocity of the body on the phone (time domain)",
              "Mean of the angular jerk of the body on the phone (time domain)",
              "Standard deviation of the angular jerk of the body on the phone (time domain)",              
              "Mean of the linear acceleration of the body on the phone (frequency domain)",
              "Standard deviation of the linear acceleration of the body on the phone (frequency domain)",
              "Mean of the linear jerk of the body on the phone (frequency domain)",
              "Standard deviation of the linear jerk of the body on the phone (frequency domain)",
              "Mean of the angular velocity of the body on the phone (frequency domain)",
              "Standard deviation of the angular velocity of the body on the phone (frequency domain)",
              "Mean of the angular jerk of the body on the phone (frequency domain)",
              "Standard deviation of the angular jerk of the body on the phone (frequency domain)")

names(extractedData) <- c("Subject", 
                          "Activity", 
                          as.character(varNames))

# From the data set in step 4, creates a second, independent tidy data set with 
#     the average of each variable for each activity and each subject.

groupColumns = c("Subject","Activity")
dataColumns = (length(groupColumns)+1):ncol(extractedData)
resultDataFrame = ddply(extractedData, groupColumns, function(x) colMeans(x[dataColumns]))

  #remove variables no longer needed (free memory)
rm(groupColumns, dataColumns)

  #rename to indictate averaged aggregate values
names(resultDataFrame) <- c("Subject", "Activity", paste("Mean of [",as.character(varNames), "]", sep=""))

  #remove variables no longer needed (free memory)
rm(varNames)



