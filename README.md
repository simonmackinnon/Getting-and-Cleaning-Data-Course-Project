###Data

The raw data that is being analysed in this assignement was downloaded from the course assignment notes for "Getting and Cleaning Data" https://www.coursera.org/course/getdata, (exact download location https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

###Transformations via R Script

The R-script 'run_analysis.R' assumes the folder containing the data (UCI HAR Dataset) has been extracted to the users R working directory.

To run the transformations in R, (or R Studio,) source the script by entering source("./run_analysis.R"). 
*N.B: If the analysis script is located somewhere other than the working directory, an absolute or relative (to the working directory) path must be supplied to the source function, 

  e.g. 
    source("C:/path/to/run_analysis.R") or 
    source("./relative/path/to/run_analysis.R")

###The Code Book


The codebook 'CodeBook.md' describes the variables, the data, and transformations that were performed to clean up the data.
