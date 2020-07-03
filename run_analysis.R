#load library
library(reshape2)

#set working directory
setwd("/Users/Jakraya/Desktop/R/Getting_and_Cleaning_Data_Project")

#download the data from the Internet and unzip it
filename <- "dataset.zip"
if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
    download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
    unzip(filename)
}

#set new working directory
setwd("./UCI HAR Dataset")

#load the 'test' data into R
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
sub_test <- read.table("./test/subject_test.txt")

#load the 'train' data into R
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
sub_train <- read.table("./train/subject_train.txt")

#load the 'features' and 'activity_labels' into R
feat <- read.table("./features.txt")
act_labels <- read.table("./activity_labels.txt")

#1. Merges the training and the test sets to create one data set.
x_total <- rbind(x_test, x_train)
y_total <- rbind(y_test, y_train)
sub_total <- rbind(subject_test, subject_train)

#4. Appropriately labels the data set with descriptive variable names.
names(x_total) <- feat$V2
x_total$activity <- y_total$V1      #combine y_total with x_total
x_total$subject <- sub_total$V1     #combine sub_total with x_total

#2. Extracts only the measurements on the mean and standard deviation for 
#each measurement.
#keep the activity and subjects columns as well
sel_columns <- grep(".*mean\\(\\)|.*std\\(\\)|activity|subject", 
                    colnames(x_total), value =  TRUE)     
sel_data <- x_total[, sel_columns] 

#3. Uses descriptive activity names to name the activities in the data set
sel_data$activityLabels <- factor(sel_data$activity, labels = c("WALKING", 
                            "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", 
                            "STANDING", "LAYING"))

#Already done step 4

#5. From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
col_names <- grep(".*mean\\(\\)|.*std\\(\\)", colnames(sel_data), value=TRUE)
melted_data <- melt(sel_data, id = c("subject", "activityLabels"), 
                    measure.vars = col_names)
tidy_dataset <- dcast(melted_data, subject + activityLabels ~ variable, mean)

#creating the .txt file
setwd("..")     #back to the project folder
write.table(tidy_dataset, file="tidyData.txt", row.names=FALSE)


