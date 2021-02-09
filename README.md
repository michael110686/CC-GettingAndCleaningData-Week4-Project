# CC-GettingAndCleaningData-Week4-Project

This is the final project for the "Getting and Cleaning Data" course.

The task in this course project was the following:
    The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
    
    One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
    
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
    
    Here are the data for the project:
    
     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
    
    You should create one R script called run_analysis.R that does the following. 
    
    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 
    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The R script "run_analysis.R" conducts the following steps:
    1 Download & Unzip Data Set From Web
        1.1 Set Url and Data Directory
        1.2 Create Data Directory (if it does not already exists)
        1.3 Download Raw Data Set (if it does not already exists)
        1.4 Unzip Raw Data Set (if it does not already exists)
        1.5 Remove Unnecessary Data From Environment
    2 Read Measurement Feature List & Identify Relevant Measurement Features (Only Measurement Features W/ Mean Or Standard Deviation)
    3 Read & Merge Training & Test Data Sets (Only Measurement Features W/ Mean Or Standard Deviation)
        3.1 Read & Merge Training Data Set
        3.2 Read & Merge Test Data Sets
        3.3 Merge Training & Test Data Sets
        3.4 Remove Unnecessary Data From Environment
    4 Clean Measurement Feature Names & Rename Data Set Features W/ Descriptive Names
        4.1 Clean Measurement Feature Names
        4.2 Rename Data Set Features W/ Descriptive Names
        4.3 Remove Unnecessary Data From Environment
    5 Read Activity Labels & Set Descriptive Names For Activities in Data Set
        5.1 Read Activity Labels
        5.2 Set Descriptive Names For Activities in Data Set
        5.3 Factor Subject in Data Set
        5.4 Remove Unnecessary Data From Environment
    6 Create Tidy Data Set (Average of Each Feature for Each Activity & Subject)
    7 Write Tidy Data Set to txt- & csv-File
        7.1 Write Tidy Data Set to txt-File
        7.2 Write Tidy Data Set to csv-File
        7.3 Remove Unnecessary Data From Environment

The R script "run_analysis.R" creates a folder called "Data" where all data files can be found. This includes the raw data (rawData.zip) downloaded from the web, the unzipped raw data in the folder "UCI HAR Dataset" and the output files "tidy_data.txt" and "tidy_data.csv".