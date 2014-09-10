# CODEBOOK

author: "wattsmo"

## File: meanSummary.txt

### Description: 

This data is derived from an experiment to use accelerometer and gyroscope sensors in a modern smartphone to determine if a prediction of the activity being performed by the user can be made. A full description of the data can be found at the [source website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  This file contains the average values of a reduced set of measured features for each combination of subject and activity.

### Process:

1. The data was downloaded from a [Coursera Data Link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and the directory structure within the zip file extracted.

2. Eight files were read into the R environment "features.txt", "activity_labels.txt", "test/subject_test.txt", "test/X_test.txt", "test/y_test.txt",  "train/subject_train.txt", "train/X_train.txt", "test/y_train.txt".  The first two containing textual labels for features and activities, the last six containing the data split between a training and test dataset.

3. The two datasets were built, labelled with the textual feature and activity names, and features representing the mean and standard deviation measures (containing the text "-mean-" or "-std-") were retained.

4. The two dataset were then combined into a single dataset

5. The average of the selected features were calculated for each "subject" & "activity" combination and the resultant dataset written out to the file "meanSummary.txt".


### Fields:

#### 1 "subject"

description: Identifier indicating the one of thirty human subjects taking part in the trial
    
type: integer
    
values: 1:30
    
#### 2 "activity"

description: A label indicating the activity being performed by the subject at the time of the measurements
    
type: character
    
values:
    "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
        

#### 3 to 50 Average of the Measured Features 

description: The average of measured features (shown below) for the given "subject and "activity".
    
type: numeric
    
values: -1.0 to 1.0

individual measures:

* 3 "tBodyAcc-mean-X"
* 4 "tBodyAcc-mean-Y"
* 5 "tBodyAcc-mean-Z"
* 6 "tBodyAcc-std-X"
* 7 "tBodyAcc-std-Y"
* 8 "tBodyAcc-std-Z"
* 9 "tGravityAcc-mean-X"
* 10 "tGravityAcc-mean-Y"
* 11 "tGravityAcc-mean-Z"
* 12 "tGravityAcc-std-X"
* 13 "tGravityAcc-std-Y"
* 14 "tGravityAcc-std-Z"
* 15 "tBodyAccJerk-mean-X"
* 16 "tBodyAccJerk-mean-Y"
* 17 "tBodyAccJerk-mean-Z"
* 18 "tBodyAccJerk-std-X"
* 19 "tBodyAccJerk-std-Y"
* 20 "tBodyAccJerk-std-Z"
* 21 "tBodyGyro-mean-X"
* 22 "tBodyGyro-mean-Y"
* 23 "tBodyGyro-mean-Z"
* 24 "tBodyGyro-std-X"
* 25 "tBodyGyro-std-Y"
* 26 "tBodyGyro-std-Z"
* 27 "tBodyGyroJerk-mean-X"
* 28 "tBodyGyroJerk-mean-Y"
* 29 "tBodyGyroJerk-mean-Z"
* 30 "tBodyGyroJerk-std-X"
* 31 "tBodyGyroJerk-std-Y"
* 32 "tBodyGyroJerk-std-Z"
* 33 "fBodyAcc-mean-X"
* 34 "fBodyAcc-mean-Y"
* 35 "fBodyAcc-mean-Z"
* 36 "fBodyAcc-std-X"
* 37 "fBodyAcc-std-Y"
* 38 "fBodyAcc-std-Z"
* 39 "fBodyAccJerk-mean-X"
* 40 "fBodyAccJerk-mean-Y"
* 41 "fBodyAccJerk-mean-Z"
* 42 "fBodyAccJerk-std-X"
* 43 "fBodyAccJerk-std-Y"
* 44 "fBodyAccJerk-std-Z"
* 45 "fBodyGyro-mean-X"
* 46 "fBodyGyro-mean-Y"
* 47 "fBodyGyro-mean-Z"
* 48 "fBodyGyro-std-X"
* 49 "fBodyGyro-std-Y"
* 50 "fBodyGyro-std-Z"
