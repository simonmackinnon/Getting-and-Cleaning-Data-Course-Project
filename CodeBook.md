#The Code Book



### Variable Information
* "Subject" - Subject Id, integer from 1 to 30 representing each participant in the data
* "Activity" - Activity, textual description of the activity performed during measurements  

* "Mean of [Mean of the linear acceleration of the body on the phone (time domain)]"                  
* "Mean of [Standard deviation of the linear acceleration of the body on the phone (time domain)]" 

* "Mean of [Mean of the gravitational acceleration on the phone (time domain)]"
* "Mean of [Standard deviation of the gravitational acceleration on the phone (time domain)]"

* "Mean of [Mean of the linear jerk of the body on the phone (time domain)]"                       
* "Mean of [Standard deviation of the linear jerk of the body on the phone (time domain)]" 

* "Mean of [Mean of the angular velocity of the body on the phone (time domain)]"
* "Mean of [Standard deviation of the angular velocity of the body on the phone (time domain)]"

* "Mean of [Mean of the angular jerk of the body on the phone (time domain)]"                  
* "Mean of [Standard deviation of the angular jerk of the body on the phone (time domain)]"

* "Mean of [Mean of the linear acceleration of the body on the phone (frequency domain)]"              
* "Mean of [Standard deviation of the linear acceleration of the body on the phone (frequency domain)]"

* "Mean of [Mean of the linear jerk of the body on the phone (frequency domain)]"                      
* "Mean of [Standard deviation of the linear jerk of the body on the phone (frequency domain)]" 

* "Mean of [Mean of the angular velocity of the body on the phone (frequency domain)]"                 
* "Mean of [Standard deviation of the angular velocity of the body on the phone (frequency domain)]" 

* "Mean of [Mean of the angular jerk of the body on the phone (frequency domain)]"                     
* "Mean of [Standard deviation of the angular jerk of the body on the phone (frequency domain)]" 

### Assumptions and Units of Measurement 

1. Assumption that only total mean or standard deviation values are what is meant by "Extracts only the measurements on the mean and standard deviation for each measurement." i.e. that columns with names ending with "mean()" or "std()" are to be extracted, and not columns with names containing "mean" or "std" somewhere else.

2. Assume units of measurement are the same for linear acceleration and gravity, i.e. SI units for acceleration ms^-2

3. Assume units of measurement for angular velocity is SI units Rs^-1

4. Assume conversion to frequency domain replaces seconds with freq in hertz i.e. linear acceleration units mf^-2'

5. Assume jerk units are 1st derivitive of units for respective acceleration

### Study dDesign 

The raw data was downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

which is a copy of the data orginially from:

http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

An explanation of the raw data can be found in by extracting the compressed files "\UCI HAR Dataset\README.txt" and "\UCI HAR Dataset\features_info.txt"


