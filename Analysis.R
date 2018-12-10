# Download data and unzip the files

url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#destination zip
destfile<-paste0(getwd(),"/","dataset.zip")
#download zip file
download.file(url,destfile,method = "curl")
#unzip file
unzip("dataset.zip",list = TRUE)


library(dplyr)
library(data.table)

# Put data into tables.
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt", col.names="label")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="subject")
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt", col.names="label")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="subject")
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
features<-read.table("UCI HAR Dataset/features.txt",header = FALSE)
activities<-read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE)

# combine the labels and the subjects from test and train.
y_data <- rbind(train_labels,test_labels)
subjects <- rbind(train_subjects,test_subjects)

# Question 4
# Added the labels to the individual train and test tables.
names(train_data)<-features$V2
names(test_data)<-features$V2
names(y_data) <- "activity"

# Combined subjects, labels and data for test and train datasets.
train_full <- cbind(train_subjects,train_labels,train_data)
test_full <- cbind(test_subjects,test_labels,test_data)

# Question 1 
merged_data <-rbind(train_full,test_full)

# Question 2
# Use grep to indentify columns with either mean() or std()
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
# create a new variables containing full set with mean and std columns.
merged2 <- merged_data[, mean_and_std_features+2]

#Question 3
# updated the label data with activity names. 
y_data[,1]<- activities[y_data[,1],2]


#Question 5
# Merge mean and std data set with labels and subjects
merged3 <- cbind (merged2,y_data,subjects)
# take the mean of data columns based on subject and activities.
averages_final_data <- ddply(merged3, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "averages_final_data.txt", row.name=FALSE)

