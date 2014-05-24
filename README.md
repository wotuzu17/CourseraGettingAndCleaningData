Getting and Cleaning Data Course Project
========================================================

The run_analysis.R file does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The source data file 'getdata_projectfiles_UCI HAR Dataset.zip' must be in the same directory as the 'run_analysis.R' file. The R script extracts the zip file and loads the contents of the relevant files into the df data frame. The colnames are set according to the contents of the 'features.txt' file. Unused columns are removed. The column 'activity' is filled with names according to the 'activity_labels.txt' file. To produce the tidy data set, the df data.frame is subsetted by all subjects and activities, and the mean is calculated on every column of the subsetted data.frame. In the last line, the tidy data set is stored as .csv file.