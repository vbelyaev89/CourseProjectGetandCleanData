## we start in the folder with 2 directories test and train and 2 files activity_labels.txt and features.txt
## So I don't check the existence of the directory and files

## First task

## 1. Getting labels for activities and for features
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

## Before I checked data in X tables with sum(is.na()) and sum(any( ="")),
## results equal 0, therefore I don't use these checking here

## 2. We go to subfolders and get data first from test
setwd("./test")
subject_test <- read.table("subject_test.txt")
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
## go back and get data from train
setwd("..")
setwd("./train")
subject_train <- read.table("subject_train.txt")
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")

## 3. Creating tables with testing and training data for X, subject and y
final_table <- rbind(X_test,X_train)
final_subject <- rbind(subject_test,subject_train)
final_y <- rbind(y_test,y_train)

## 4. Putting labels for data
names(final_table) <- features[,2]
names(final_subject) <- "subject"
names(final_y)<-"activity"

## 5. Adding subject and y to final_table
final_table <- cbind(final_y,final_table)
final_table <- cbind(final_subject,final_table)

## Second task

## Extracting subject, activity, tBodyAcc-mean()-X and tBodyAcc-std()-X to 
## make a tidy table at the end
tidy_table <- final_table[,c(1,2,3,6)]

## Third task

## Merging tidy_table and activity_labels by id of activity to add a column with activity names
## and then we remove unnecessary activity column with numbers
tidy_table <- merge(tidy_table,activity_labels,by.x="activity",by.y="V1")
tidy_table <- tidy_table[,-(1)]

## Forth task

## Renaming labels in tidy_data
names(tidy_table) <- c("volunteer", "meanxforbodyaccel","stdevxforbodyaccel","activity")

## Fifth task

## Creating new tidy dataset with the grouped data for activity and subject
## Here I use group_by() from dplyr, so I assume that it was installed before
library(dplyr)
new_tidy <- group_by(tidy_table,volunteer,activity)
new_tidy <- summarize(new_tidy,mean(meanxforbodyaccel),mean(stdevxforbodyaccel))
names(new_tidy) <- c("volunteer", "activity", "meanxforbodyaccel","stdevxforbodyaccel")
setwd("..")
write.table(new_tidy, file = "tidy data.txt", row.names = F)
