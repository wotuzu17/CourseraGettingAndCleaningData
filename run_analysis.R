# unzip the zip file
zipfile <- "getdata_projectfiles_UCI HAR Dataset.zip"
unzip(zipfile)

rawDataDir <- "UCI HAR Dataset"
featuresFile <- "features.txt"
activitiesFile <- "activity_labels.txt"

# function to assemble file name
filename <- function(set, var) {
  return(sprintf("./%s/%s/%s_%s.txt", rawDataDir, set, var, set))
}

# get text labels from features file
feat <- read.csv(paste(rawDataDir, featuresFile, sep="/"), header=FALSE, sep="", stringsAsFactors=FALSE)

#####  Merges the training and the test sets to create one data set.
df <- rbind(cbind(read.csv(filename("test", "subject"), header=FALSE),
                  read.csv(filename("test", "y"), sep="", header=FALSE),
                  read.csv(filename("test", "X"), sep="", header=FALSE)),
            cbind(read.csv(filename("train", "subject"), header=FALSE),
                  read.csv(filename("train", "y"), sep="", header=FALSE),
                  read.csv(filename("train", "X"), sep="", header=FALSE)))
colnames(df) <- c("subject", "activity", feat[,2])

#####  Extracts only the measurements on the mean and standard deviation for each measurement.
df <- df[,c(1,2,grep('mean\\(\\)|std\\(\\)', colnames(df), perl=TRUE))]
# clean up colnames: remove parentheses
colnames(df) <- sub("()","",colnames(df), fixed=TRUE)

#####  Uses descriptive activity names to name the activities in the data set
activityLabels <- read.csv(paste(rawDataDir, activitiesFile, sep="/"),
                           header=FALSE, sep="", stringsAsFactors=FALSE)

#####  Appropriately labels the data set with descriptive activity names. 
df$activity <- activityLabels[as.numeric(df$activity),2]

#####  Creates a second, independent tidy data set with the average of 
#####  each variable for each activity and each subject. 

# get distinct subjects and activities
distinctSubjects <- levels(as.factor(df$subject))
distinctActivities <- levels(as.factor(df$activity))

# loop through every activity and subject, forming the tidy data set tdf
tdf <- data.frame()
for (i in 1:length(distinctActivities)) {
  for (j in 1:length(distinctSubjects)) {
    tdf <- rbind(tdf,
      cbind(data.frame(subject=distinctSubjects[j], activity=distinctActivities[i]), 
            as.data.frame(
              t(colMeans(df[which(df$activity==distinctActivities[i] & df$subject==distinctSubjects[j]),
                  c(3:ncol(df))])))))
  }
}

# outupt the tidy data set in the console
tdf

# store tidy data set as text file in csv format
write.csv(tdf, file="TidyDataSet.txt")
