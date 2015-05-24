# codebook for run_analysis.R a script by Leptokurtic for tidying the  Samsung dataset

## Code Book

This document describes the code inside `run_analysis.R`.

Formatting Ref: JT Leek “The code book” Source: https://github.com/jtleek/datasharing

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

: run_analysis.R annotates descriptive activity names to name the activities in the data set
## Step 4 
run_analysis.R Assembles join.subject, join.Lab, join_Dataset to data.frame: Cleaned_Data then writes this data to “./joined_dataset.txt”. Allows user option to unprotect [-#] writing to a dually named .csv file as well

##Step 5:  
run_analysis.R takes the data set Cleaned_Data from step 4, and creates a second, independent tidy data set  "tidy_dataset_Bymeans.txt" with the average of each variable for each activity and each subject.

subject.Length: calculates neccessary length of resulting data.frame
col.Length: calculates neccessary width of resulting data.frame
tidying_Dataset:  fits its dimensions as matrix_1 | overwrites matrix as data.frame _2 | stores iterations to completion post post for loop to write output file: “tidy_dataset_Bymeans.txt” and again user has the option to unprotect [-#] codeline writing it to dually names .csv file. 


**Script offered open source by  Leptokurtic**  [@leptokurtic]https://github.com/Leptokurtic

Thank you and enjoy!


**Free Software, Hell Yeah!**

[john gruber]:http://daringfireball.net/
[@thomasfuchs]:http://twitter.com/thomasfuchs
[1]:http://daringfireball.net/projects/markdown/
[marked]:https://github.com/chjj/marked
[Ace Editor]:http://ace.ajax.org
[node.js]:http://nodejs.org
[Twitter Bootstrap]:http://twitter.github.com/bootstrap/
[keymaster.js]:https://github.com/madrobby/keymaster
[jQuery]:http://jquery.com
[@tjholowaychuk]:http://twitter.com/tjholowaychuk
[express]:http://expressjs.com
[AngularJS]:http://angularjs.org
[Gulp]:http://gulpjs.com
