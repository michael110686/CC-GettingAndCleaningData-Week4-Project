# File: run_analysis.R
# Author: michael110686

# 0 Load Libraries
library(dplyr)

# 1 Download & Unzip Data Set From Web
## 1.1 Set Url and Data Directory
rawDataUrl <-
    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
### Original Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
dataDir <- "./Data"

## 1.2 Create Data Directory (if it does not already exists)
if (!file.exists(dataDir)) {
    dir.create(dataDir)
}
## 1.3 Download Raw Data Set (if it does not already exists)
if (!file.exists(destfile = paste0(dataDir, "/rawData.zip"))) {
    download.file(url = rawDataUrl,
                  destfile = paste0(dataDir, "/rawData.zip"))
}
## 1.4 Unzip Raw Data Set (if it does not already exists)
if (!file.exists(paste0(dataDir, "/UCI HAR Dataset"))) {
    unzip(zipfile = paste0(dataDir, "/rawData.zip"),
          exdir = dataDir)
}
## 1.5 Remove Unnecessary Data From Environment
rm("rawDataUrl")

# 2 Read Measurement Feature List & Identify Relevant Measurement Features (Only Measurement Features W/ Mean Or Standard Deviation)
features <-
    read.table(paste0(dataDir, "/UCI HAR Dataset/features.txt"))
relevant_features <-
    grep(".*[m]ean.*|.*[s]td.*", as.character(features[, 2]))

# 3 Read & Merge Training & Test Data Sets (Only Measurement Features W/ Mean Or Standard Deviation)
## 3.1 Read & Merge Training Data Set
subject_train <-
    read.table(paste0(dataDir, "/UCI HAR Dataset/train/subject_train.txt"))
activity_train <-
    read.table(paste0(dataDir, "/UCI HAR Dataset/train/Y_train.txt"))
measurement_train <-
    read.table(paste0(dataDir, "/UCI HAR Dataset/train/X_train.txt"))[relevant_features]

dataset_train <-
    cbind(subject_train, activity_train, measurement_train)

## 3.2 Read & Merge Test Data Sets
subject_test <-
    read.table(paste0(dataDir, "/UCI HAR Dataset/test/subject_test.txt"))
activity_test <-
    read.table(paste0(dataDir, "/UCI HAR Dataset/test/Y_test.txt"))
measurement_test <-
    read.table(paste0(dataDir, "/UCI HAR Dataset/test/X_test.txt"))[relevant_features]

dataset_test <- cbind(subject_test, activity_test, measurement_test)

## 3.3 Merge Training & Test Data Sets
dataset <- rbind(dataset_train, dataset_test)

## 3.4 Remove Unnecessary Data From Environment
rm(
    "subject_train",
    "activity_train",
    "measurement_train",
    "dataset_train",
    "subject_test",
    "activity_test",
    "measurement_test",
    "dataset_test"
)

# 4 Clean Measurement Feature Names & Rename Data Set Features W/ Descriptive Names
## 4.1 Clean Measurement Feature Names
features[relevant_features, 2] <-
    gsub("-mean", "Mean", features[relevant_features, 2])
features[relevant_features, 2] <-
    gsub("-std", "StD", features[relevant_features, 2])
features[relevant_features, 2] <-
    gsub("[-()]", "", features[relevant_features, 2])
## 4.2 Rename Data Set Features W/ Descriptive Names
names(dataset) <-
    c("Subject", "Activity", as.character(features[relevant_features, 2]))
## 4.3 Remove Unnecessary Data From Environment
rm("features", "relevant_features")

# 5 Read Activity Labels & Set Descriptive Names For Activities in Data Set
## 5.1 Read Activity Labels
activity_labels <-
    read.table(paste0(dataDir, "/UCI HAR Dataset/activity_labels.txt"))
## 5.2 Set Descriptive Names For Activities in Data Set
dataset$Activity <-
    factor(dataset$Activity , levels = c(1:6), labels = activity_labels[, 2])
## 5.3 Factor Subject in Data Set
dataset$Subject <- factor(dataset$Subject)
## 5.4 Remove Unnecessary Data From Environment
rm("activity_labels")

# 6 Create Tidy Data Set (Average of Each Feature for Each Activity & Subject)
dataset_tidy <-
    dataset %>% group_by(Activity, Subject) %>% summarize_all(mean)

# 7 Write Tidy Data Set to txt- & csv-File
## 7.1 Write Tidy Data Set to txt-File
write.table(
    dataset_tidy,
    file = paste0(dataDir, "/tidy_data.txt"),
    row.names = FALSE,
    col.names = TRUE,
    quote = FALSE
)
## 7.2 Write Tidy Data Set to csv-File
write.csv(
    dataset_tidy,
    file = paste0(dataDir, "/tidy_data.csv"),
    row.names = FALSE,
    quote = FALSE
)
## 7.3 Remove Unnecessary Data From Environment
rm("dataset_tidy", "dataset", "dataDir")

####  END OF SCRIPT  ####
