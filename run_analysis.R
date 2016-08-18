################################################################################################################################################
## Peer Graded Assignment: Getting and Cleaning Data Course Project
# 
## R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
################################################################################################################################################

## load libraries
library(data.table)
library(dplyr)

# read the training data set 
X_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")
subject_train<-read.table("train/subject_train.txt")
        
# label column name of subject_train
names(subject_train) = "subject"
        
# read the features file
features<-read.table("features.txt")
        
# grep the mean or std (=standard deviation) within the features vector (=features column 2)
mean_sigma_feat<-grepl("mean|std",features[,2]);
        
# read the activity labels file
activity_labels<-read.table("activity_labels.txt")
        
# set the column names of the X_train dataset using the column 2 of the features set
colnames(X_train)<-features[,2]
        
# trim the X_train to have only the mean and standard deviation columns
X_train = X_train[,mean_sigma_feat]
        
# merge y_train and activity labels keeping the activity label number
y_train$activity_label = activity_labels$V2[y_train$V1]
        
# assign the name of the first column of the new y_train
colnames(y_train)[1]<-"activity_number"
        
# column-bind subject_train, y_train and X_train
data_train<-cbind(subject_train,y_train,X_train)

# read the test data set 
X_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
subject_test<-read.table("test/subject_test.txt")
        
# label column name of subject_test (with the same name of subject_train)
names(subject_test) = "subject"
        
# grep the mean or std (=standard deviation) within the features vector (=features column 2)
mean_sigma_feat_test<-grepl("mean|std",features[,2]);
        
# set the column names of the X_test dataset using the column 2 of the features set
colnames(X_test)<-features[,2]
        
# trim the X_train to have only the mean and standard deviation columns
X_test = X_test[,mean_sigma_feat]
        
# merge y_test and activity labels keeping the activity label number
y_test$activity_label = activity_labels$V2[y_test$V1]
colnames(y_test)[1]<-"activity_number"
       
# column-bind subject_test, y_test and X_test
data_test<-cbind(subject_test,y_test,X_test)     

# merge training and test sets
merged_data = rbind(data_train,data_test)
        
# write the merged data to a file
merged_data %>% write.table("merged_data.txt")   
        
# create a second, independent tidy data set with the average of each variable for each activity and each subject.
merged_data %>% group_by(subject,activity_number,activity_label) %>% summarize_each(funs(mean)) %>% write.table("means.txt")         
