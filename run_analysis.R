rm(list = ls(all.names = TRUE))

#Getting and Cleaning Data Peer Graded Assignment #

#Dowloading Files#

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="auto")

#Unzipping File #

unzip("./data/Dataset.zip", exdir = "./data")

#Files List#

path<- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path, recursive=TRUE)
files

#Read Files #

#Activity Files#

Activity_Test <- read.table(file.path(path, "test" , "y_test.txt" ),header = FALSE)
Activity_Train <- read.table(file.path(path, "train" , "y_train.txt" ),header = FALSE)

#Subject Files#

Subject_Test <- read.table(file.path(path, "test" , "subject_test.txt" ),header = FALSE)
Subject_Train <- read.table(file.path(path, "train" , "subject_train.txt" ),header = FALSE)

#Features Files#

Features_Test <- read.table(file.path(path, "test" , "X_test.txt" ),header = FALSE)
Features_Train <- read.table(file.path(path, "train" , "X_train.txt" ),header = FALSE)

str(Activity_Test)
str(Activity_Train)
str(Subject_Test)
str(Subject_Train)
str(Features_Test)
str(Features_Train)

#Merging Step#

#rbind#

Activity <- rbind(Activity_Train, Activity_Test)
Subject <- rbind(Subject_Train, Subject_Test)
Features <- rbind(Features_Train, Features_Test)

#Variable Names #

names(Subject)<-c("subject")
names(Activity)<- c("activity")
Features_Names <- read.table(file.path(path, "features.txt"),head=FALSE)
names(Features)<- Features_Names$V2

#cbind#

merge_step_1 <- cbind(Subject,Activity)
Main_Data <- cbind(merge_step_1,Features)
names(Main_Data)

#Extracting the mean and standard deviation for each measurement#

selectFeaturesNames<-Features_Names$V2[grep("-(mean|std).*", Features_Names$V2)]
selectNames<-c(as.character(selectFeaturesNames), "subject", "activity" )
SubData<-subset(Main_Data,select=selectNames)
str(SubData)

#Using descriptive activity names to name the activities in the data set

activityLabels <- read.table(file.path(path, "activity_labels.txt"),header = FALSE)
SubData$activity <- factor(SubData$activity, labels= c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
head(SubData)

#Appropriately labeling the data set with descriptive variable names

names(SubData)

names(SubData)<-gsub("^t", "time", names(SubData))
names(SubData)<-gsub("^f", "frequency", names(SubData))
names(SubData)<-gsub("Acc", "Accelerometer", names(SubData))
names(SubData)<-gsub("Gyro", "Gyroscope", names(SubData))
names(SubData)<-gsub("Mag", "Magnitude", names(SubData))
names(SubData)<-gsub("BodyBody", "Body", names(SubData))
names(SubData)<-gsub("-mean()", "Mean", names(SubData), ignore.case = TRUE)
names(SubData)<-gsub("-std()", "STD", names(SubData), ignore.case = TRUE)
names(SubData)<-gsub("-freq()", "Frequency", names(SubData), ignore.case = TRUE)

names(SubData)

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
FinalData <- SubData %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)

str(FinalData)
