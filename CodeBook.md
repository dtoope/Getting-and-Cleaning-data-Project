Codebook for Getting and Cleaning Data project. 

Introduction

The purpose of the Analysis.R script is to complete the following 5 questions in the Getting and Cleaning Data Project final project. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Code:

The dplyr and data.table libraries are used for the analysis.

The download.file command is used to write the data to a local file. The unzip command then places the data in a local directory. 

data.table command is used to populate all the tables listed in the variables section.

rbind is used to combine labels from test and train into the file y data. It is also used to combine subjects from both datasets into the subjects file.

The names command is used to add labels to both the test and train datasets.

cbind is used to create full test and train data tables by combining columns of data, labels and subjects.

The combined test and train table(merged_data) is created using rbind

The labels in y_data are populated in column one by extracting the data from activities table.

The cbind command is used again to do a merge of the mean and standard deviation data, the labels and the activities. 

The ddply command takes the data in the combined merged3 dataset and then calculates the average for each column grouped by subject and activity. Results are returned in the data frame averages_final_data.

Finally write.table is used to output averages_final_data to the text file "averages_final_data.txt"

Variables:

url: stores the file path of the data.
destfile: stores the name of the local file where the data will be stored.
test_labels: table containing labels for test data.
test_subjects: table containing subjects for test data.
test_data: table containing test dataset.
train_labels: table containing labels for training data.
train_subjects: table containing subjects for training data.
train_data: table containing training dataset.
features: table containing a list of features.
activities: table containing a list of class labels with their activitiy name.
y_data: merged table of test and training labels.
subjects: merged table of test and training subjects:
train_full: merged table of training data, labels and subjects
test_full: merged table of test data, labels and subjects
merged_data: merged table containing train_full and test_full.
mean_std_features: integer array with column numbers containing mean or std.
merged2: table containing subset of merged data with only mean or std.
merged3: table containing merged2 along with labels and subjects
averages_final_data: table containing the results of taking the average of
of all data by subject and activity on the merged3 table.



