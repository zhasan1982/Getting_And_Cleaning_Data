GOALS OF THE COURSE PROJECT
===========================
Create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


FILES INCLUDED
==============
File Name                | Description
------------------------ | -------------------------------------------------------------------------------
README.md (this file)    | Lists all the files included and explains how to use the analysis R script file
CODEBOOK.md              | Lists variables in the tidy data and the summaries calculated
run_analysis.R           | R script that can be used to download and tidy up the UCI HAR dataset
UCI_HAR_Tidy_Data.txt    | A copy of the tidy dataset produced using the above script


ABOUT THE SCRIPT
================
- File Name: run_analysis.R
- Language: R
- Created for: Project for "Getting and Cleaning Data" course (coursera.org)


PURPOSE OF THE SCRIPT
=====================
The script does the following:

1. Downloads the UCI HAR Data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
2. Unpacks the ZIP file
3. Performs the following transformations/aggregations as per instructions provided on the "Getting and Cleaning Data" Course Project Page
	+ Merge the test and train datasets, label the activities and variables (instructions 1, 3 and 4)
	+ Subset the data for only the mean and standard deviation measurements (instruction 2)
	+ Produce a tidy dataset (instruction 5)


ABOUT THE UCI HAR DATA
======================

Abstract
--------
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Details
-------
For more details visit http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

License
-------
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


SOFTWARE VERSIONS
=================
The script was developed using the following software:

- RStudio Version 0.98.1091
- R Version x64 3.1.2
- Microsoft Windows 7 Home Professional (64-bit) SP1


REQUIRED R PACKAGES
===================
1. base
2. utils
3. stats
4. dplyr
5. tidyr

Note: Packages 1 to 3 are generally loaded when R or RStudio is opened. Verify these packages are loaded by running 'search()'. The last two packages are loaded during the execution of the script.


INSTRUCTIONS
============
Instruction are provided for downloading the script and running it in RStudio:

1. Download the run_analysis.R file from 'https://github.com/zhasan1982/Getting_And_Cleaning_Data' 
2. Place the downloaded file in any directory on your computer (preferably an empty directory)
3. Open RStudio
4. Open the run_analysis.R file in RStudio
5. Modify the path in line 2 of the script to the path where you have placed the R script
6. Run the entire script

Note: The script may also be run in RGui or using the command line


FILES
=====

Files in UCI HAR Dataset Used in This Analysis
----------------------------------------------
- 'working_data_files\UCI HAR Dataset\features_info.txt': Shows information about the variables used on the feature vector.
- 'working_data_files\UCI HAR Dataset\features.txt': List of all features.
- 'working_data_files\UCI HAR Dataset\activity_labels.txt': Links the class labels with their activity name.
- 'working_data_files\UCI HAR Dataset\train/X_train.txt': Training set.
- 'working_data_files\UCI HAR Dataset\train/y_train.txt': Training labels.
- 'working_data_files\UCI HAR Dataset\train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'working_data_files\UCI HAR Dataset\test/X_test.txt': Test set.
- 'working_data_files\UCI HAR Dataset\test/y_test.txt': Test labels.
- 'working_data_files\UCI HAR Dataset\test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Files Produced by the Script
----------------------------
- 'raw_dataset\UCI_HAR_Complete_Raw_Data.txt': This files contains all records from the training and test data files with labeled variable names and activities
- 'tidy_dataset\UCI_HAR_Tidy_Data.txt': This file contains summaries (means) for all the mean and standard deviation measurements BY Subject and Activity