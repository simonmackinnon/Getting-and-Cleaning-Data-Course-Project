library(data.table)
library(plyr)

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

  #read the table and use only the second column
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

  #read in the measurement feature names (no need to store this vector)
names(mergedData) <- c("Subject", 
                       "Activity", 
                       as.character(features))

  #free the memory used by features
rm(features)

# Extracts only the measurements on the mean and standard deviation for each measurement. 

  #get the specific names from the table
extractedFeatures <- names(mergedData)[grepl("^.+(mean\\(\\)|std\\(\\))$",names(mergedData))]

  #extract the columns that end with "mean()" or "std()" as representative of mean and standard
  # deviation values for each measurement
extractedData <- cbind(mergedData$Subject, mergedData$Activity, 
                       mergedData[,grepl("^.+(mean\\(\\)|std\\(\\))$",names(mergedData))])

  #free up the memory used by mergedData
rm(mergedData)

  # rename for ease of viewing
names(extractedData) <- c("Subject", 
                          "Activity", 
                          as.character(extractedFeatures))

  #free up the memory used by extractedFeatures
rm(extractedFeatures)
  
# Use descriptive activity names to name the activities in the data set

  # load the activity number to name table
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

  # turn activity column into factor
extractedData$Activity <- factor(extractedData$Activity)

  # relevel the factor (this recodes the number values to be the descriptive names)
levels(extractedData$Activity) <- activities

  #free the memory used by activities
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



