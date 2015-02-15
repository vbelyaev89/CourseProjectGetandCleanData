# CourseProjectGetandCleanData
This is made for the course project of Getting and Cleaning Data course

## we start in the folder with 2 directories test and train and 2 files activity_labels.txt and features.txt
## So I don't check the existence of the directory and files

## First task
## 1. I create two datasets features and activity_labels from features.txt and activity_labels.txt
## Before I checked data in X tables with sum(is.na()) and sum(any( ="")), results equal 0, therefore I don't use these checking here
## 2. I go to subfolders and get data first from test (by creating datasets subject_test, X_test and y_test), then I return and go to the train subfolder to get data from there (by creating datasets subject_train, X_train and y_train)
## 3. We need only one table, so I add data from test and train to each other by creating datasets final_X, final_subject and final_y
## 4. Let's assing good labels for final_X from the second column of features and by naming final_subject and final_y by ourselves (i.e., "subject" and "activity")
## 5. I add subject and y to final_table to get some useful information

## Second task
## I decided to get only 2 columns in addition to subject and activity - just to make it easier to understand. So I took subject, activity, tBodyAcc-mean()-X and tBodyAcc-std()-X (3 and 6 columns in final_table). The last two ones weer made from information collected from body accelerometer, axis X and were recalculated as mean and standart deviation.

## Third task
## We need to replace numbers 1,2,3,..6 with tidy words like WALKING, LAYING and so on. So, I merge tidy_table and activity_labels by id of activity to make join and add a column with activity names. Then I remove unnecessary activity column with numbers

## Forth task
## I create some good names for columns

## Fifth task
## Finally, I am creating new tidy dataset with the grouped data for activity and subject. Here I use group_by() from dplyr, so I assume that it was installed before. Firstly, I make the data "groupped" and then by summarizing I calculate mean values (groupped firstly by volunteer and then by activity) for meanxforbodyaccel and stdevxforbodyaccel. At the end I write the dataset in a file.
