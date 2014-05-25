Getting and Cleaning Data Course Project - Codebook
========================================================

## Raw Data
The raw data for this analysis is taken from this source:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

On this webpage, the dataset is described as:


"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

The readme.txt file contains further details about the raw dataset.

## Tidy Data
The following files from the raw data set are used by the script to calculate the tidy data set:

UCI HAR Dataset/test/subject_test.txt  
UCI HAR Dataset/test/X_test.txt  
UCI HAR Dataset/test/y_test.txt  
UCI HAR Dataset/train/subject_train.txt  
UCI HAR Dataset/train/X_train.txt  
UCI HAR Dataset/train/y_train.txt  
UCI HAR Dataset/activity_labels.txt  
UCI HAR Dataset/features.txt  

In the tidy dataset both the data in the test directory and the train directory is used. The tidy dataset contains only observations on the mean and standard deviation for each measurement. These are the measurements that contain mean() or std() in the string of the variable name in the second column of the features.txt file. Out of the 561 features in the raw data set, only 66 remain in the tidy data set. For better readability in the tidy data set, the parentheses are removed from the column names, so for example **tBodyAcc-mean()-X** becomes **tBodyAcc-mean-X**.

### Tidy Data Set text file format
The tidy data set is a comma separated file (delimiter character =",") and can be loaded into spreadsheet programs like Excel or OpenOffice Calc.

### Tidy Data Set Columns
*subject* is the person who was doing the activity in the research. There are 30 persons, numbered from 1-30.

*activity* is the activity the subject was doing in the research. There are 6 different activities as stated in the activity_labels.txt file. The activities in the tidy data set are written as text rather than its ID.

For all the other columns refer to the features_info.txt file in the raw data set. Note that for each row, the raw data is filtered for the specific subject doing the specific activity, and the value in the matching row in the tidy data set is the **mean** of all these filtered observations for one person doing one activity.

#### List of columns
1 subject  
2 activity  
3 tBodyAcc-mean-X  
4 tBodyAcc-mean-Y  
5 tBodyAcc-mean-Z  
6 tBodyAcc-std-X  
7 tBodyAcc-std-Y  
8 tBodyAcc-std-Z  
9 tGravityAcc-mean-X  
10 tGravityAcc-mean-Y  
11 tGravityAcc-mean-Z  
12 tGravityAcc-std-X  
13 tGravityAcc-std-Y  
14 tGravityAcc-std-Z  
15 tBodyAccJerk-mean-X  
16 tBodyAccJerk-mean-Y  
17 tBodyAccJerk-mean-Z  
18 tBodyAccJerk-std-X  
19 tBodyAccJerk-std-Y  
20 tBodyAccJerk-std-Z  
21 tBodyGyro-mean-X  
22 tBodyGyro-mean-Y  
23 tBodyGyro-mean-Z  
24 tBodyGyro-std-X  
25 tBodyGyro-std-Y  
26 tBodyGyro-std-Z  
27 tBodyGyroJerk-mean-X  
28 tBodyGyroJerk-mean-Y  
29 tBodyGyroJerk-mean-Z  
30 tBodyGyroJerk-std-X  
31 tBodyGyroJerk-std-Y  
32 tBodyGyroJerk-std-Z  
33 tBodyAccMag-mean  
34 tBodyAccMag-std  
35 tGravityAccMag-mean  
36 tGravityAccMag-std  
37 tBodyAccJerkMag-mean  
38 tBodyAccJerkMag-std  
39 tBodyGyroMag-mean  
40 tBodyGyroMag-std  
41 tBodyGyroJerkMag-mean  
42 tBodyGyroJerkMag-std  
43 fBodyAcc-mean-X  
44 fBodyAcc-mean-Y  
45 fBodyAcc-mean-Z  
46 fBodyAcc-std-X  
47 fBodyAcc-std-Y  
48 fBodyAcc-std-Z  
49 fBodyAccJerk-mean-X  
50 fBodyAccJerk-mean-Y  
51 fBodyAccJerk-mean-Z  
52 fBodyAccJerk-std-X  
53 fBodyAccJerk-std-Y  
54 fBodyAccJerk-std-Z  
55 fBodyGyro-mean-X  
56 fBodyGyro-mean-Y  
57 fBodyGyro-mean-Z  
58 fBodyGyro-std-X  
59 fBodyGyro-std-Y  
60 fBodyGyro-std-Z  
61 fBodyAccMag-mean  
62 fBodyAccMag-std  
63 fBodyBodyAccJerkMag-mean  
64 fBodyBodyAccJerkMag-std  
65 fBodyBodyGyroMag-mean  
66 fBodyBodyGyroMag-std  
67 fBodyBodyGyroJerkMag-mean  
68 fBodyBodyGyroJerkMag-std  


### Tidy Data Set Rows
The tidy data set contains 180 rows (30 people * 6 different activities). The rows are arranged by subject (ascending, first priority) and activity (alphabetically ascending order, second priority).
