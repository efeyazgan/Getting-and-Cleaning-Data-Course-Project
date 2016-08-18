# Getting-and-Cleaning-Data-Course-Project

## The task

    1. Merge the training and the test sets to create one data set.
    2. Extract only the measurements on the mean and standard deviation for each measurement.
    3. Use descriptive activity names to name the activities in the data set
    4. Appropriately label the data set with descriptive variable names.
    5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

## The repository contents

`README.md`, instructions. 

`CodeBook.md`, the code book that describes the variables, the data, and transformations and work that were performed to clean up the data 

`run_analysis.R`, the main scrit to run. 

`means.txt`, the output file created by `run_analysis.R`

## Step by step Instructions

1. The data for the project is [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
Download it and unzip it. 
2. Go to the folder `UCI HAR Dataset`
3. Place the script `run_analysis.R` and in R(studio)
4. Set the folder UCI HAR Dataset as the working directory by typying `setwd()`
5. Run the script by `source("run_analysis.R")`
6. The outputs will be `merged_data.txt` (the data set before tidying) and `means.txt` which is the tidy data set. 

## Required packages
`data.table`

`dplyr`
