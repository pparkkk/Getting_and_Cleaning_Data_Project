# Getting_and_Cleaning_Data_Project_CodeBook
This is a codebook for the project. The document will describe all the variables which are being used in the analysis and any manipulation of the initial data.


## The Raw Data
There are 3 main categories of variables, as the following:
1. The participant ID    -> ranged from 1 to 30
2. The activity ID       -> ranged from 1 to 6, which are corresponding to *WALKING*, *WALKING_UPSTAIRS*, *WALKING_DOWNSTAIRS*, *SITTING*, *STANDING* and *LAYING*
3. The measurements/features  -> each of the following measurements has a summary statistics attached to it, but we are only interested in the mean(*mean()*) and standard deviation(*std()*)    
    + tBodyAcc-XYZ  
    + tGravityAcc-XYZ  
    + tBodyAccJerk-XYZ  
    + tBodyGyro-XYZ  
    + tBodyGyroJerk-XYZ  
    + tBodyAccMag  
    + tGravityAccMag  
    + tBodyAccJerkMag  
    + tBodyGyroMag  
    + tBodyGyroJerkMag  
    + fBodyAcc-XYZ  
    + fBodyAccJerk-XYZ  
    + fBodyGyro-XYZ  
    + fBodyAccMag  
    + fBodyAccJerkMag  
    + fBodyAccJerkMag  
    + fBodyGyroJerkMag 
     
**(Note: the list of measurements above and the following explanation about them is copied from the *'features._info.txt'* file in the *UCI HAR Dataset*)**

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


## Transformations
The following manipulations were carried out during the process of tidying up the dataset:
1. The interested datasets are merged together
2. The columns of the 'x_total' data is being renamed using 'feat'
3. A new column is added called the *activityLabels*. This is a factor variable consisting of 6 levels, corresponding to the tasks specified above.
4. A new 'tidy' data set was created, consisting of the mean values of each measurements interested, grouped by *activityLabels* and *subject*

