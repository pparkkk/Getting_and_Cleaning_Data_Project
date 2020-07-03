# Getting_and_Cleaning_Data_Project_README
This is a project from the 'Getting and Cleaning Data' course in Coursera (part of the Foundations using R specialisation. The project will attempt to clean the data set and do some analysis. This document will describe roughly the experiment and the data used in the analysis as well as a brief walkthrough of the analysis process.

The dataset for which the analysis is carried on is the data collected from the Samsung Galaxy S II. It can be downloaded via this URL link: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip". There are several meters embedded in the smartphone and it took many categories of measurements. The experiment was done by 30 people of age between 19 and 48, where each performed 6 tasks. Of this 30 participants, 70% of their results were recorded in the *train* dataset and the remaining 30% were recorded in the *test* dataset. For more information about the experiment, please visit this archive: "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones".


## The Raw Data
Once we've downloaded the data from the zip file and unzip it(UCI HAR Dataset), there are a bunch of sub-folders and files within the UCI HAR Dataset folder. In this study, we're only interested in the following:
1. features.txt             -> the names of all the measurements that were taken. 
2. activity_labels.txt      -> numbered from 1 to 6, each is an ID representing a particular tasks performed. 
3. X_test.txt               -> the measurements according to the 'features.txt' file from the *test* group. 
4. y_test.txt               -> the activities' ID according to the *activity_labels.txt* file from the *test* group. 
5. subject_test.txt         -> the experiment takers' ID (ranged from 1 to 30) from the *test* group. 
6. X_train.txt              -> the measurements according to the 'features.txt' file from the *train* group. 
7. y_train.txt              -> the activities' ID according to the *activity_labels.txt* file from the *train* group. 
8. subject_train.txt        -> the experiment takers' ID (ranged from 1 to 30) from the *train* group. 


## How the Script Works
The script is written to comply with the instructions given (which will be inserted throughout both in the script and this document). There are 5 main stages in this procedure.
1. Load the *reshape2* package and the data from all files into R. 

2. Merge the corresponding *train* and *test* data files together.   
   ie. the 'x_test' and the 'x_train' dataset are merged to create the 'x_total' and vice versa for the *y* and *subject* datasets
   **(STEP1: Merges the training and the test sets to create one data set.)**
   
3. Rename the column names for the 'x_total' data with those names in the 'feature' dataset (abbreviated as 'feat' in the script). 
   **(STEP4: Appropriately labels the data set with descriptive variable names.)**
   
4. Append the merged *y* and *subject* data to the last 2 columns of the 'x_total' as *activity* and *subject*, respectively. 

5. Subset out the columns in 'x_total' that contains either *mean()* or *std()* (abbreviated for standard deviation), as well as the *activity* and *subject*. 
   **(STEP2: Extracts only the measurements on the mean and standard deviation for each measurement.)**
   
6. Create another column for the 'x_total' called *activityLabels* which refers to the 'activity_labels.txt' file and replace the activity IDs with the              corresponding names. 
   **(STEP3: Uses descriptive activity names to name the activities in the data set.)**
   
7. Calculate the mean of each measurement grouped by both the *activityLabels* and *subject*. Write this out into a new dataset in the '.txt' format. 
   **(STEP5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.)**
       
         
