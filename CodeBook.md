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
    "walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying"
        

#### 3 feature

description: The motion feature being measured.
    
type: character
    
values:

"tbodyacc_mean_x"
"tbodyacc_mean_y"
"tbodyacc_mean_z"
"tbodyacc_std_x"
"tbodyacc_std_y"
"tbodyacc_std_z"
"tgravityacc_mean_x"
"tgravityacc_mean_y"
"tgravityacc_mean_z"
"tgravityacc_std_x"
"tgravityacc_std_y"
"tgravityacc_std_z"
"tbodyaccjerk_mean_x"
"tbodyaccjerk_mean_y"
"tbodyaccjerk_mean_z"
"tbodyaccjerk_std_x"
"tbodyaccjerk_std_y"
"tbodyaccjerk_std_z"
"tbodygyro_mean_x"
"tbodygyro_mean_y"
"tbodygyro_mean_z"
"tbodygyro_std_x"
"tbodygyro_std_y"
"tbodygyro_std_z"
"tbodygyrojerk_mean_x"
"tbodygyrojerk_mean_y"
"tbodygyrojerk_mean_z"
"tbodygyrojerk_std_x"
"tbodygyrojerk_std_y"
"tbodygyrojerk_std_z"
"fbodyacc_mean_x"
"fbodyacc_mean_y"
"fbodyacc_mean_z"
"fbodyacc_std_x"
"fbodyacc_std_y"
"fbodyacc_std_z"
"fbodyaccjerk_mean_x"
"fbodyaccjerk_mean_y"
"fbodyaccjerk_mean_z"
"fbodyaccjerk_std_x"
"fbodyaccjerk_std_y"
"fbodyaccjerk_std_z"
"fbodygyro_mean_x"
"fbodygyro_mean_y"
"fbodygyro_mean_z"
"fbodygyro_std_x"
"fbodygyro_std_y"
"fbodygyro_std_z"

#### 4 mean_value 

description: The average of measured feature for the given subject and activity.
    
type: numeric
    
values: -1 to 1
