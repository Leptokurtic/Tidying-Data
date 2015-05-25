# codebook for run_analysis.R a script by Leptokurtic for tidying the  Samsung dataset

## Code Book

This document describes the code inside `run_analysis.R`.

Formatting Ref: JT Leek “The code book” Source: https://github.com/jtleek/datasharing

*Functional description
*Step by step overview for run_analysis.R script Code Explanation
*Description of dataset, what is measured and how it's labeled.  
*Variable names Declarations

##Before you begin

**Source the raw files.** 
You should have downloaded the Samsung_Dataset found here https://github.com/Leptokurtic/Tidying-Data

Placed it in your working directory



##Step 1: 
**from the local “Samsung_Dataset/*" sub directory in your parent working directory; run_analysis.R will**

**i. /train/***

##Read in the train files:  
X_train.txt | y_train.txt | subject_train.txt

**into memory as object names:**

train_Data | train.Label | train.Subject

**ii. /test/***

##Read in the test files :  
X_test.txt |  y_test.txt | subject_test.txt

**into memory as object names:** 

test_Data | test.Label | test.Subject

##iii. Merge train and test files 

[ X+X, y+y, subject+subject] as:  
join_Dataset | join.Lab | join.Subject

##Step 2:  
##Extract only the measurements on the mean and standard deviation for each measurement. 



##i.  run_analysis.R Concatenates measurements

**ia. test_Data → train_Data →= join_Dataset**

Creating data.frame Of dimension:  **10299x561**



**ib. test.Subject →train.Subject →=  join.Subject**

Creating data.frame Of dimension:    **10299x1** 

**ic. test.Label→train.Label →=  join.Lab**

Creating data.frame Of dimension:  **10299x1**

### ii. run_analysis.R Reads file(s): 

**[From the local “Samsung_Dataset/*" sub directory in your parent working directory]** 

**features.txt** 

into memory as object name(s): 
**features**

**iii Extracts the mean and standard deviation:**
>mean.std_Indices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
for each accordingly:
>names(join_Dataset) <- gsub("\\(\\)", "", features[mean.std_Indices, 2])

**iv. Cleans up formatting of feature names to Uppercase**

## Step 3: run_analysis.R pairs descriptive activity names with the activities in the data set
**[From the local “Samsung_Dataset/*" sub directory in your parent working directory...]**
####run_analysis.R Reads file(s):
**activity_labels.txt**

into memory as object name(s): 
**activity**

###Cleans the activity name

Formats to all lower case removing errant punctuation in activity names and formatting to uppercase where necessary 

###transposes join.Lab with activity name data frame vector 

### Activity names are now 
"laying"
"sitting"
"standing"
"walking"
"walkingDownstairs"
"walkingUpstairs"

: run_analysis.R annotates descriptive activity names to name the activities in the data set
## Step 4 
run_analysis.R Assembles join.subject, join.Lab, join_Dataset to data.frame: Cleaned_Data then writes this data to “./joined_dataset.txt”. Allows user option to unprotect [-#] writing to a dually named .csv file as well

##Step 5:  
run_analysis.R takes the data set Cleaned_Data from step 4, and creates a second, independent tidy data set  "tidy_dataset_Bymeans.txt" with the average of each variable for each activity and each subject.

subject.Length: calculates neccessary length of resulting data.frame
col.Length: calculates neccessary width of resulting data.frame
tidying_Dataset:  fits its dimensions as matrix_1 | overwrites matrix as data.frame _2 | stores iterations to completion post post for loop to write output file: “tidy_dataset_Bymeans.txt” and again user has the option to unprotect [-#] codeline writing it to dually names .csv file. 
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag




Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

##After run_analysis.R  names of features for sensors are now column Variable Std and Mean calculations: 

**These are their tidy names**
"subject"
"activity"
"tBodyAccMeanX"
"tBodyAccMeanY"
"tBodyAccMeanZ"
"tBodyAccStdX"
"tBodyAccStdY"
"tBodyAccStdZ"
"tGravityAccMeanX"
"tGravityAccMeanY"
"tGravityAccMeanZ"
"tGravityAccStdX"
"tGravityAccStdY"
"tGravityAccStdZ"
"tBodyAccJerkMeanX"
"tBodyAccJerkMeanY"
"tBodyAccJerkMeanZ"
"tBodyAccJerkStdX"
"tBodyAccJerkStdY"
"tBodyAccJerkStdZ"
"tBodyGyroMeanX"
"tBodyGyroMeanY"
"tBodyGyroMeanZ"
"tBodyGyroStdX"
"tBodyGyroStdY"
"tBodyGyroStdZ"
"tBodyGyroJerkMeanX"
"tBodyGyroJerkMeanY"
"tBodyGyroJerkMeanZ"
"tBodyGyroJerkStdX"
"tBodyGyroJerkStdY"
"tBodyGyroJerkStdZ"
"tBodyAccMagMean"
"tBodyAccMagStd"
"tGravityAccMagMean"
"tGravityAccMagStd"
"tBodyAccJerkMagMean"
"tBodyAccJerkMagStd"
"tBodyGyroMagMean"
"tBodyGyroMagStd"
"tBodyGyroJerkMagMean"
"tBodyGyroJerkMagStd"
"fBodyAccMeanX"
"fBodyAccMeanY"
"fBodyAccMeanZ"
"fBodyAccStdX"
"fBodyAccStdY"
"fBodyAccStdZ"
"fBodyAccJerkMeanX"
"fBodyAccJerkMeanY"
"fBodyAccJerkMeanZ"
"fBodyAccJerkStdX"
"fBodyAccJerkStdY"
"fBodyAccJerkStdZ"
"fBodyGyroMeanX"
"fBodyGyroMeanY"
"fBodyGyroMeanZ"
"fBodyGyroStdX"
"fBodyGyroStdY"
"fBodyGyroStdZ"
"fBodyAccMagMean"
"fBodyAccMagStd"
"fBodyBodyAccJerkMagMean"
"fBodyBodyAccJerkMagStd"
"fBodyBodyGyroMagMean"
"fBodyBodyGyroMagStd"
"fBodyBodyGyroJerkMagMean"
"fBodyBodyGyroJerkMagStd"

##The 30 Subjects are indicated numericaly in column:subject 

**Script offered open source by  Leptokurtic**  [@leptokurtic]https://github.com/Leptokurtic

Thank you and enjoy!


