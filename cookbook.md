---
title: "Cookbook"
author: "michael110686"
date: "8 2 2021"
output: html_document
---


**Code Book**
========

This document describes the original data, all data transformation / cleaning steps, and the features of the output data set "tidy_data.txt" / "tidy_data.csv". All data is saved in the folder "Data".

### The code was performed in thes steps:
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


### Helper libraries

	1. "dplyr"

### Data (Text from Original Data Source)

    The Date inside "tidy.txt" is based on the experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
    
    The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
    
    More Information: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##  Variables of Output

### Identifiers: 

    **[1]** "Activity" - The Type of Activity  (1-6) - Type "Factor" 
        1. WALKING 
        2. WALKING_UPSTAIRS 
        3. WALKING_DOWNSTAIRS
        4. SITTING 
        5. STANDING 
 
    **[2]** "Subject" - The ID  of the Subject  (1-30) - Type "Factor" 

### Measurements: - Type "Double"
    
    This data comprises the average of the measurements' mean and standard deviation for each activity and each subject.
    
     [3] "tBodyAcc-Mean-X"              
     [4] "tBodyAcc-Mean-Y"              
     [5] "tBodyAcc-Mean-Z"              
     [6] "tBodyAcc-StD-X"               
     [7] "tBodyAcc-StD-Y"               
     [8] "tBodyAcc-StD-Z"               
     [9] "tGravityAcc-Mean-X"           
    [10] "tGravityAcc-Mean-Y"           
    [11] "tGravityAcc-Mean-Z"           
    [12] "tGravityAcc-StD-X"            
    [13] "tGravityAcc-StD-Y"            
    [14] "tGravityAcc-StD-Z"            
    [15] "tBodyAccJerk-Mean-X"          
    [16] "tBodyAccJerk-Mean-Y"          
    [17] "tBodyAccJerk-Mean-Z"          
    [18] "tBodyAccJerk-StD-X"           
    [19] "tBodyAccJerk-StD-Y"           
    [20] "tBodyAccJerk-StD-Z"           
    [21] "tBodyGyro-Mean-X"             
    [22] "tBodyGyro-Mean-Y"             
    [23] "tBodyGyro-Mean-Z"             
    [24] "tBodyGyro-StD-X"              
    [25] "tBodyGyro-StD-Y"              
    [26] "tBodyGyro-StD-Z"              
    [27] "tBodyGyroJerk-Mean-X"         
    [28] "tBodyGyroJerk-Mean-Y"         
    [29] "tBodyGyroJerk-Mean-Z"         
    [30] "tBodyGyroJerk-StD-X"          
    [31] "tBodyGyroJerk-StD-Y"          
    [32] "tBodyGyroJerk-StD-Z"          
    [33] "tBodyAccMag-Mean"             
    [34] "tBodyAccMag-StD"              
    [35] "tGravityAccMag-Mean"          
    [36] "tGravityAccMag-StD"           
    [37] "tBodyAccJerkMag-Mean"         
    [38] "tBodyAccJerkMag-StD"          
    [39] "tBodyGyroMag-Mean"            
    [40] "tBodyGyroMag-StD"             
    [41] "tBodyGyroJerkMag-Mean"        
    [42] "tBodyGyroJerkMag-StD"         
    [43] "fBodyAcc-Mean-X"              
    [44] "fBodyAcc-Mean-Y"              
    [45] "fBodyAcc-Mean-Z"              
    [46] "fBodyAcc-StD-X"               
    [47] "fBodyAcc-StD-Y"               
    [48] "fBodyAcc-StD-Z"               
    [49] "fBodyAcc-MeanFreq-X"          
    [50] "fBodyAcc-MeanFreq-Y"          
    [51] "fBodyAcc-MeanFreq-Z"          
    [52] "fBodyAccJerk-Mean-X"          
    [53] "fBodyAccJerk-Mean-Y"          
    [54] "fBodyAccJerk-Mean-Z"          
    [55] "fBodyAccJerk-StD-X"           
    [56] "fBodyAccJerk-StD-Y"           
    [57] "fBodyAccJerk-StD-Z"           
    [58] "fBodyAccJerk-MeanFreq-X"      
    [59] "fBodyAccJerk-MeanFreq-Y"      
    [60] "fBodyAccJerk-MeanFreq-Z"      
    [61] "fBodyGyro-Mean-X"             
    [62] "fBodyGyro-Mean-Y"             
    [63] "fBodyGyro-Mean-Z"             
    [64] "fBodyGyro-StD-X"              
    [65] "fBodyGyro-StD-Y"              
    [66] "fBodyGyro-StD-Z"              
    [67] "fBodyGyro-MeanFreq-X"         
    [68] "fBodyGyro-MeanFreq-Y"         
    [69] "fBodyGyro-MeanFreq-Z"         
    [70] "fBodyAccMag-Mean"             
    [71] "fBodyAccMag-StD"              
    [72] "fBodyAccMag-MeanFreq"         
    [73] "fBodyBodyAccJerkMag-Mean"     
    [74] "fBodyBodyAccJerkMag-StD"      
    [75] "fBodyBodyAccJerkMag-MeanFreq"
    [76] "fBodyBodyGyroMag-Mean"        
    [77] "fBodyBodyGyroMag-StD"         
    [78] "fBodyBodyGyroMag-MeanFreq"    
    [79] "fBodyBodyGyroJerkMag-Mean"    
    [80] "fBodyBodyGyroJerkMag-StD"     
    [81] "fBodyBodyGyroJerkMag-MeanFreq"