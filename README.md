# Getting-and-Cleaning-Data-Project

**Author:** Juan Herrera

This is a brief summary of the additional analyzes related to the datasets to obtain a tidy data.

### Purpose and goal of the project

The purpose of this project is collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

### Information project

In this project you will find

1. A tidy data set into the folder ["./dataProject"](https://github.com/juanhercel/Getting-and-Cleaning-Data-Project/tree/master/dataProject) called :
  - "new_tidy_data_project.csv":  independent tidy data set with the average of each variable for each activity and each subject.
2. A link to a my Github repository with your script for performing the analysis, repository called [Getting and Cleaning Data Project](https://github.com/juanhercel/Getting-and-Cleaning-Data-Project)
3. A code book called [CodeBook.md](https://github.com/juanhercel/Getting-and-Cleaning-Data-Project/blob/master/CodeBook.md) in my repository called [Getting and Cleaning Data Project](https://github.com/juanhercel/Getting-and-Cleaning-Data-Project)
4. A analysis R Script called  [run_analysis.R](https://github.com/juanhercel/Getting-and-Cleaning-Data-Project/blob/master/run_analysis.R) in my repository called [Getting and Cleaning Data Project](https://github.com/juanhercel/Getting-and-Cleaning-Data-Project) 
5. - For export tidydata in .txt a script additional created called "`for_submmit_tidydata.R`" into the folder ["./dataProject"](https://github.com/juanhercel/Getting-and-Cleaning-Data-Project/tree/master/dataProject).

### About the script for analysis

The script called [run_analysis.R](https://github.com/juanhercel/Getting-and-Cleaning-Data-Project/blob/master/run_analysis.R)  does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### What you find in this repository

- [CodeBook.md](https://github.com/juanhercel/Getting-and-Cleaning-Data-Project/blob/master/CodeBook.md): information about raw and tidy data set and elaboration made to transform them
- [run_analysis.R](https://github.com/juanhercel/Getting-and-Cleaning-Data-Project/blob/master/run_analysis.R): R script to obtain in two tidy data sets

### How to create the tidy data set

Run in R the script [run_analysis.R](https://github.com/juanhercel/Getting-and-Cleaning-Data-Project/blob/master/run_analysis.R)

### Source data and reference 

Human Activity Recognition Using Smartphones Data Set, Data + Description can be found here [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Reference:

```
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
```

