# INSTRUCTIONS: You should create one R script called run_analysis.R that does the following. 

#Step1 Merges the training and the test sets to create one data set.

train_Data <- read.table("./Samsung_Dataset/train/X_train.txt")
# Get starting point reference for Tidying, 
# ensure dataset isn't too wide or long to inspect head
dim(train_Data) 

head(train_Data) #see what we're working with
train.Label <- read.table("./Samsung_Dataset/train/y_train.txt")
table(train.Label)#Inspect 
train.Subject <- read.table("./Samsung_Dataset/train/subject_train.txt")
test_Data <- read.table("./Samsung_Dataset/test/X_test.txt")
# Get starting point reference for Tidying on second dataset, 
# ensure second dataset isn't too wide or long to inspect head

dim(test_Data)
test.Label <- read.table("./Samsung_Dataset/test/y_test.txt") 
table(test.Label) #Inspect Var label names
test.Subject <- read.table("./Samsung_Dataset/test/subject_test.txt")
join_Dataset <- rbind(train_Data, test_Data)
dim(join_Dataset) # Check that joined dataset is 10299*561
join.Lab <- rbind(train.Label, test.Label)
dim(join.Lab) # Should Read 10299*1
join.Subject <- rbind(train.Subject, test.Subject)
dim(join.Subject) # Should Read 10299*1

# Step2 Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("./Samsung_Dataset/features.txt")
dim(features)  # Features Should be 561*2
mean.std_Indices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
length(mean.std_Indices) #Indices Length of Mean StdShould be 66
join_Dataset <- join_Dataset[, mean.std_Indices]
dim(join_Dataset) # Should be 10299*66
names(join_Dataset) <- gsub("\\(\\)", "", features[mean.std_Indices, 2]) # remove "()"
names(join_Dataset) <- gsub("mean", "Mean", names(join_Dataset)) # "m" -> "M"
names(join_Dataset) <- gsub("std", "Std", names(join_Dataset)) #  "s" -> "S"
names(join_Dataset) <- gsub("-", "", names(join_Dataset)) # remove "-" from colnames 

# Step3 Uses descriptive activity names to name the activities in the data set

activity <- read.table("./Samsung_Dataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2])) # remove "_" from activity
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activity.Lab <- activity[join.Lab[, 1], 2]
join.Lab[, 1] <- activity.Lab
names(join.Lab) <- "activity"

# Step4 Appropriately labels the data set with descriptive variable names. 

names(join.Subject) <- "subject"
Cleaned_Data <- cbind(join.Subject, join.Lab, join_Dataset)
dim(Cleaned_Data) # Ensure tidying is executing without errors. 
#***Should Read 10299*68
write.table(Cleaned_Data, "joined_dataset.txt") # write out the 1st dataset to comply with step5: "From the data set in step 4"
  #write.csv(Cleaned_Data, file= "Cleaned_Dataset.csv") #*** In case user prefers csv


# Step5 From the data set in step 4, creates a second, independent tidy data set with the average of each 
#variable for each activity and each subject.
 
subject.Length <- length(table(join.Subject)) 
activity.Length <- dim(activity)[1] 
col.Length <- dim(Cleaned_Data)[2]
tidying_Dataset <- matrix(NA, nrow=subject.Length*activity.Length, ncol=col.Length)#fit correct dimensions for tidying dataset as matrix 
tidying_Dataset <- as.data.frame(tidying_Dataset) #convert tidy matrix to tidy data.frame
colnames(tidying_Dataset) <- colnames(Cleaned_Data) #creates variable names for each activity
row <- 1
for(i in 1:subject.Length) {
  for(j in 1:activity.Length) {
    tidying_Dataset[row, 1] <- sort(unique(join.Subject)[, 1])[i]
    tidying_Dataset[row, 2] <- activity[j, 2]
    bool1 <- i == Cleaned_Data$subject
    bool2 <- activity[j, 2] == Cleaned_Data$activity
    tidying_Dataset[row, 3:col.Length] <- colMeans(Cleaned_Data[bool1&bool2, 3:col.Length])
    row <- row + 1
  }
}

head(tidying_Dataset)#check that tidy data set has the average of each variable for each activity and each subject.

write.table(tidying_Dataset, "tidy_dataset_BYmeans.txt", row.names=FALSE) # data set as a txt file created with write.table() using row.name=FALSE
  #write.csv(tidying_Dataset, file= "tidy_Samsung_dataset_ByMeans.csv", row.names=FALSE)#*** In case user prefers csv

#Author: https://github.com/Leptokurtic  
#2015