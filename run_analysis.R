library(dplyr)
library(reshape)

# Create the sub-directory to hold the data if it does not exist
if (!file.exists("./data")) dir.create("./data")

# Check if the zip file has been be downloaded and the data extracted
# If not do so now and write a timestamp of the download time
dirName <- "./data/UCI HAR Dataset"
if (!file.exists(dirName)) {
    zipName <- "./data/UCI HAR Dataset.zip"
    timeStampFile <- "./data/UCI HAR timestamp"
    url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url, zipName, method="curl")
    download.date <- date()
    dput(x = download.date, file = timeStampFile)
    unzip(zipfile, exdir="./data")
}

# Read in the activity text labels to allow meaningful activity data
# in the tidied datasets, and convert to lower case
activityfileName <- paste(dirName,"activity_labels.txt", sep="/")
activity <- read.table(activityfileName, col.names=c("id","name"), stringsAsFactors=FALSE)
# Convert to lower case
activity$name <- tolower(activity$name)

# Read in the measured feature text labels to allow meaningful feature column
# names in tidied datasets
featurefileName <- paste(dirName,"features.txt", sep="/")
feature <- read.table(featurefileName, col.names=c("id","name"))
# Remove "()" from the feature names as they are special characters in R
# Subst "-" for "_" and convert to lower case
feature$name <- gsub("\\(\\)", "", feature$name) 
feature$name <- gsub("-", "_", feature$name)
feature$name <- tolower(feature$name)



# The function getData reads in a set of data and constructs a tidied dataset
# It is specified as a function as it is called once for the test set
# and once for the training set

# function arguments
#   set: character string which determines the locaton of the dataset ("train" or "test")
#   dir: the base directory of the data files
#   featureNames: a character vector containing the names of the measured features
#   activityNames: a character vector containing the labels of the activities
#   filter: a grep expression which is used to dertermine the measured features to appear in the output
# function output
#   a tidied dataset containing the subject, activity and measures determined by filter

getData <- function(set, dir, featureNames, activityNames, filter="_std_|_mean_") {
    
    # construct the file names for the 3 pieces of data to be read from file
    datafileName <- paste(dir,set,paste("X_", set,".txt", sep=""), sep="/")
    activityfileName <- paste(dir, set, paste("y_",set,".txt", sep=""), sep="/")
    subjectfileName <- paste(dir, set, paste("subject_",set,".txt", sep=""), sep="/")

    # STEP 4: read in the data labelling the data columns
    measures <- read.table(datafileName, col.names=featureNames)
    subjects <- read.table(subjectfileName, col.names="subject")
    activities <- read.table(activityfileName, col.names="activity")
    
    # STEP 2: include only those features that meet the filter expression
    measures <- measures[,grepl(filter,featureNames)]

    # STEP 3: Convert activity ids into factor with textual levels    
    activities$activity <- factor(activities$activity, labels=activityNames)
    
    # combine the three data fragments into a single data frame
    cbind(subjects, activities, measures)    
}

# STEP 2 to 4: read and tidy the test and training data
testData <- getData("test", dirName, feature$name, activity$name)
trainData <- getData("train", dirName, feature$name, activity$name)

# STEP 1: combine the two datasets into single dataset
data <- rbind(testData, trainData)

# STEP 5: create a summary of the means of the selected features for each activity/subject
meanSummary <- melt(data, id=1:2) %>%
    group_by(subject, activity, variable) %>%
    summarize(mean(value))
colnames(meanSummary)[3:4] <- c("feature", "mean_value")

# Write the summary data to file
write.table(meanSummary, "./data/meanSummary.txt", row.names=FALSE)
