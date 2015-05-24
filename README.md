# run_analysis.R README
A script for tidying the samsung dataset

Getting and Cleaning Data Course Project
Author: Leptokurtic
=================================================================================================

This file describes how run_analysis.R script works.

run_analysis.R is a script for tidying the Samsung smartphone datasets in preperation for working working with them. 

A full description of the dataset is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
The dataset for the project was orginally sourced from: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Instructions
* Download the Samsung_Dataset here https://github.com/Leptokurtic/Tidying-Data.
* Make sure the script run_analysis.R and the dataset folder "Samsung_Dataset" are unzipped and in your current working R directory. see: ?setwd() for help 
* source("run_analysis.R") command in RStudio. 
* 2 [/+2] tidy data files will be created in your working directory:
##NOTE: Lines 59 and 86 are protected with [#] you can elect to unprotect each by deleting "#" and allowing them to run, in which case they will duplicate the names of both ouput files below as .CSV

  - Cleaned_Data.txt: this is the data frame called cleanedData with with descriptive variable names and the mean and Std           measurments of each.
  - tidy_dataset_BYmeans.txt: this is the data "tidying_Dataset" with the average of each variable for each activity and each       subject
* when run_analysis.R finishes you can call the obect "tidying_Dataset" or read in the file "tidy_dataset_BYmeans.txt"
*alternatley you may elect to work with the .CSV if you allowed lines 59 or 86 to execute.
