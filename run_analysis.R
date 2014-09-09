library(dplyr)
library(reshape)

if (!file.exists("./data")) dir.create("./data")

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

activityfileName <- paste(dirName,"activity_labels.txt", sep="/")
activity <- read.table(activityfileName, col.names=c("id","name"), stringsAsFactors=FALSE)

featurefileName <- paste(dirName,"features.txt", sep="/")
feature <- read.table(featurefileName, col.names=c("id","name"))
feature$name <- gsub("\\(\\)", "", feature$name) 

getData <- function(set, dir, featureNames, activityNames, filter="-std-|-mean-") {
    
    datafileName <- paste(dir,set,paste("X_", set,".txt", sep=""), sep="/")
    activityfileName <- paste(dir, set, paste("y_",set,".txt", sep=""), sep="/")
    subjectfileName <- paste(dir, set, paste("subject_",set,".txt", sep=""), sep="/")

    measures <- read.table(datafileName, col.names=featureNames)
    measures <- measures[,grepl(filter,featureNames)]
    
    subjects <- read.table(subjectfileName, col.names="subject")
    
    activities <- read.table(activityfileName, col.names="activity")
    activities$activity <- factor(activities$activity, labels=activityNames)
    
    cbind(subjects, activities, measures)    
}

testData <- getData("test", dirName, feature$name, activity$name)
trainData <- getData("train", dirName, feature$name, activity$name)
data <- rbind(testData, trainData)

meanSummary <- cast(melt(data, id=1:2), ... ~ variable, mean)
write.table(meanSummary, "./data/meanSummary.txt", row.names=FALSE)
