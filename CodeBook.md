# CourseProjectGetandCleanData
This is made for the course project of Getting and Cleaning Data course

##Data Dictionary for file "tidy data.txt"

#volunteer
Person id, who participated in the survey (from 1 to 30)
  
#activity
Type of activity, which a person was doing. Six options:
    LAYING
    SITTING
    STANDING
    WALKING
    WALKING_DOWNSTAIRS
    WALKING_UPSTAIRS
    
#meanxforbodyaccel
Mean of mean of triaxial acceleration from body accelerometer for axis X calculated for specific person and activity
  
#stdevxforbodyaccel
Mean of standart deviation of triaxial acceleration from body accelerometer for axis X calculated for specific person and activity


This file was made from several datasets X_test, X_train, subject_test, subject_train, y_test, y_train, features and activity_labels. 
1. We needed to create one big table by summarizing data from test and train activities. I got 3 datasets (features was added to the main table before adding table), which I then added to eachother (the details are listed in ReadMe file).
2. I extracted data from the big table to the tidy one.
3. We needed to rename activites inside big table from number to words. So, I merged tidy_table with activity_labels and deleted unnecessary column with numbers.
3. Finally, I made nice names for columns and groupped data by volunteer and activity to calculate mean values for each group.

