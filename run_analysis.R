# Getting and Cleaning Data Project - Course Projet 
# Johns Hopkins University - Coursera 
# Author: Juan Herrera
# Date: 09/06/2020

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Install packages (if you need)
# install.packages(c("plyr","dplyr","reshape2"))

# Load Packages
packages <- c("plyr","dplyr","reshape2")
lapply(packages, require, character.only = TRUE)
rm(packages)

# Set work directory
if (!dir.exists("./dataProject")) {
  dir.create("./dataProject")
}
path <- "./dataProject"; setwd(path)
rm(path)

# Get data and unzip
urldata <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(urldata, destfile = "Dataset.zip", method = "curl")
unzip(zipfile = "Dataset.zip")
rm(urldata)
list.files()   # see dir UCI HAR Dataset

# Load all files 
## activity_labels + features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt",
                     col.names = c("classLabels", "activityName"))
features <- read.table("UCI HAR Dataset/features.txt",
                       col.names = c("index", "featureNames"))
## test files with descriptive variable names (4)
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt",
                          col.names = c("subject"))
measurementsTest <- read.table("UCI HAR Dataset/test/X_test.txt",
                    col.names = features$featureNames, check.names = FALSE)
labelsTest <- read.table("UCI HAR Dataset/test/y_test.txt", 
                    col.names = c("classLabels"))
## train files with descriptive variable names (4)
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt",
                           col.names = c("subject"))
measurementsTrain <- read.table("UCI HAR Dataset/train/X_train.txt",
                                col.names = features$featureNames, check.names = FALSE)
labelsTrain <- read.table("UCI HAR Dataset/train/y_train.txt", 
                          col.names = c("classLabels"))

# convert as factor to subjetTest and subjetTrain  

subjectTest$subject <- as.factor(subjectTest$subject) ; table(subjectTest)
subjectTrain$subject<- as.factor(subjectTrain$subject) ; table(subjectTrain)
activityLabels$classLabels <- as.factor(activityLabels$classLabels)
labelsTest$classLabels <- as.factor(labelsTest$classLabels)
labelsTrain$classLabels <- as.factor(labelsTrain$classLabels)

# Use descriptive activity names to name the activities in the data set (3)
# For test data set
labelsTest$classLabels <- revalue(labelsTest$classLabels, 
                                  c("1"="WALKING", "2"="WALKING_UPSTAIRS", "3" ="WALKING_DOWNSTAIRS",
                                    "4"="SITTING", "5"="STANDING", "6"="LAYING"))
# for train data set
labelsTrain$classLabels <- revalue(labelsTrain$classLabels, 
                                   c("1"="WALKING", "2"="WALKING_UPSTAIRS", "3" ="WALKING_DOWNSTAIRS",
                                     "4"="SITTING", "5"="STANDING", "6"="LAYING"))

# Merges the training and the test sets to create one data set (1).
## First join test dataset 
testdata <- cbind(subjectTest, labelsTest, measurementsTest)
## Second join test dataset 
traindata <- cbind(subjectTrain, labelsTrain, measurementsTrain)
## Join test and train datasets 
## Check testdata 2947 and traindata 7352 is total rows data  2947+7352 = 10299
mergedata <- combine(testdata,traindata)
dim(mergedata) # see dimension data
table(mergedata$subject) # see 30 subject (test and train)
table(mergedata$classLabels) # see 6 activities 
sum(table(mergedata$classLabels)) # see 10299 rows total data
## Extracts only the measurements on the mean and standard deviation for each measurement (2)
## select columns for extracs 
extractcols <- c(1,2,grep("(mean|std)\\(\\)", names(mergedata))) 
extractcols
length(extractcols) # for check
## Finally merge the training and the test sets to create one data set (1)
tidydata.project <- select(mergedata, extractcols)
names(tidydata.project)
dim(tidydata.project)

# From the data set in step 4, creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject (5).
meltdata.project <- melt(tidydata.project, id=c("subject","classLabels"))
new.tidydata.project <- dcast(meltdata.project, subject+classLabels ~ variable, mean)
head(new.tidydata.project)
dim(new.tidydata.project)

## export tidies data (additional)
write.csv(tidydata.project, "./tidy_data_project.csv", row.names = FALSE)
write.csv(new.tidydata.project, "./new_tidy_data_project.csv", row.names = FALSE)

## remove object (no indispensable)
rm(mergedata)
rm(extractcols)
rm(labelsTest)
rm(measurementsTest)
rm(subjectTest)
rm(labelsTrain)
rm(measurementsTrain)
rm(subjectTrain)
rm(activityLabels)
rm(features)
rm(testdata)
rm(traindata)
rm(meltdata.project)
