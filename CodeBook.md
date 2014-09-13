# CODEBOOK

author: "wattsmo"

## File: meanSummary.txt

### Description: 

This data is derived from an experiment to use accelerometer and gyroscope sensors in a modern smartphone to determine if a prediction of the activity being performed by the user can be made. A full description of the data can be found at the [source website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  This file contains the average values of a reduced set of measured features for each combination of subject and activity.

### Process:

1. The data was downloaded from a [Coursera Data Link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and the directory structure within the zip file extracted.

2. Eight files were read into the R environment "features.txt", "activity_labels.txt", "test/subject_test.txt", "test/X_test.txt", "test/y_test.txt",  "train/subject_train.txt", "train/X_train.txt", "test/y_train.txt".  The first two containing textual labels for features and activities, the last six containing the data split between a training and test dataset.

3. The two datasets were built, labelled with the textual feature and activity names, and features representing the mean and standard deviation measures were retained.

4. The two dataset were then combined into a single dataset

5. The average of the selected features were calculated for each "subject" & "activity" combination and the resultant dataset written out to the file "meanSummary.txt".


### Fields:

#### 1 subject

description: Identifier indicating the one of thirty human subjects taking part in the trial
    
type: integer
    
values: 1:30
    
#### 2 activity

description: A label indicating the activity being performed by the subject at the time of the measurements
    
type: character
    
values:
    "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
        

#### 3 feature

description: The motion feature being measured.
    
type: character
    
values:

"tBodyAcc_mean_X", 
"tBodyAcc_mean_Y", 
"tBodyAcc_mean_Z", 
"tBodyAcc_std_X", 
"tBodyAcc_std_Y", 
"tBodyAcc_std_Z", 
"tGravityAcc_mean_X", 
"tGravityAcc_mean_Y", 
"tGravityAcc_mean_Z", 
"tGravityAcc_std_X", 
"tGravityAcc_std_Y", 
"tGravityAcc_std_Z", 
"tBodyAccJerk_mean_X", 
"tBodyAccJerk_mean_Y", 
"tBodyAccJerk_mean_Z", 
"tBodyAccJerk_std_X", 
"tBodyAccJerk_std_Y", 
"tBodyAccJerk_std_Z", 
"tBodyGyro_mean_X", 
"tBodyGyro_mean_Y", 
"tBodyGyro_mean_Z", 
"tBodyGyro_std_X", 
"tBodyGyro_std_Y", 
"tBodyGyro_std_Z", 
"tBodyGyroJerk_mean_X", 
"tBodyGyroJerk_mean_Y", 
"tBodyGyroJerk_mean_Z", 
"tBodyGyroJerk_std_X", 
"tBodyGyroJerk_std_Y", 
"tBodyGyroJerk_std_Z", 
"fBodyAcc_mean_X", 
"fBodyAcc_mean_Y", 
"fBodyAcc_mean_Z", 
"fBodyAcc_std_X", 
"fBodyAcc_std_Y", 
"fBodyAcc_std_Z", 
"fBodyAccJerk_mean_X", 
"fBodyAccJerk_mean_Y", 
"fBodyAccJerk_mean_Z", 
"fBodyAccJerk_std_X", 
"fBodyAccJerk_std_Y", 
"fBodyAccJerk_std_Z", 
"fBodyGyro_mean_X", 
"fBodyGyro_mean_Y", 
"fBodyGyro_mean_Z", 
"fBodyGyro_std_X", 
"fBodyGyro_std_Y", 
"fBodyGyro_std_Z", 

#### 4 mean_value 

description: The average of measured feature for the given subject and activity.
    
type: numeric
    
values: -1 to 1
