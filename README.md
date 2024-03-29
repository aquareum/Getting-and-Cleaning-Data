# Getting-and-Cleaning-Data
Cousera


This project aims to clean the "Human Activity Recognition Using Smartphones Dataset" retrieved from the UCI ML Repository.

The project contains just one R script - "run_analysis.R" - that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The R script can be run as long as the data is in the current working directory. Specifically, 
all the data should be located in the "UCI HAR Dataset" folder in the current working directory. If not, the "dir" variable at the beginning of the code can be changed accordingly.

