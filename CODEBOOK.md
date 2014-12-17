# THE EXPERIMENT AND DATA COLLECTION
====================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. These activities are:

- Walking
- Walking Upstairs
- Walking Downstairs
- Sitting
- Standing
- Laying

Using the embedded accelerometer and gyroscope in the smartphone, 3-axial linear acceleration and 3-axial angular velocity measurements were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.


# FILES IN UCI HAR DATASET USED IN THIS ANALYSIS
================================================
- 'working_data_files\UCI HAR Dataset\features_info.txt'
- 'working_data_files\UCI HAR Dataset\features.txt'
- 'working_data_files\UCI HAR Dataset\activity_labels.txt'
- 'working_data_files\UCI HAR Dataset\train/X_train.txt'
- 'working_data_files\UCI HAR Dataset\train/y_train.txt'
- 'working_data_files\UCI HAR Dataset\train/subject_train.txt'
- 'working_data_files\UCI HAR Dataset\test/X_test.txt'
- 'working_data_files\UCI HAR Dataset\test/y_test.txt'
- 'working_data_files\UCI HAR Dataset\test/subject_test.txt'


# TRANSFORMATIONS PERFORMED ON UCI HAR DATA
===========================================

## Transformations Performed on Test Data
-----------------------------------------
1. Applied column names from features.txt
2. Appended activity information from y_test.txt and activity_labels.txt
3. Appended subject information from subject_test.txt
4. Appended set name "Test" to each record in the data frame

## Transformations Performed on Training Data
---------------------------------------------
1. Applied column names from features.txt
2. Appended activity information from y_train.txt and activity_labels.txt
3. Appended subject information from subject_train.txt
4. Appended set name "Training" to each record in the data frame

## Merge and Subset Data
------------------------
1. Merged test and training data into a single data frame
2. Saved this data as UCI_HAR_Complete_Raw_Data.txt
3. Subset data for only those columns containing mean and standard deviation measurements (66 columns)

## Produce Tidy Data
--------------------
1. Used aggregate to calculate a mean for each of the 66 columns grouped by subject and activity
2. Saved this data as UCI_HAR_Tidy_Data.txt


# THE TIDY DATASET
==================
The tidy dataset consist of 66 measurement variables and two categorization variables, Subject and Activity. Measurements include estimates for mean and standard deviation for the following signals:

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

Raw data is collected for each subject (30 in total) over a period of time for the six activities. The script takes this raw data file (10,000+ records) and calculates an average of the mean and standard deviation estimates for each of the above mentioned 33 signals (signals ending with XYZ should be counted three times) grouped for each activity performed by each subject to produce the tidy dataset.


# VARIABLES IN THE TIDY DATASET
===============================

## Key
------
- TimeDom: Time domain signals
- FreqDom: Frequency domain signals
- Acc: Acceleration
- Gyro: Gyroscope/gyroscopic
- Mag: Magnitude
- StdDev: Standard deviation
- X/Y/Z: Signal axis

## List of Variables
--------------------
1. subject
2. Activity
3. TimeDom_BodyAcc_Mean_X
4. TimeDom_BodyAcc_Mean_Y
5. TimeDom_BodyAcc_Mean_Z
6. TimeDom_BodyAcc_StdDev_X
7. TimeDom_BodyAcc_StdDev_Y
8. TimeDom_BodyAcc_StdDev_Z
9. TimeDom_GravityAcc_Mean_X
10. TimeDom_GravityAcc_Mean_Y
11. TimeDom_GravityAcc_Mean_Z
12. TimeDom_GravityAcc_StdDev_X
13. TimeDom_GravityAcc_StdDev_Y
14. TimeDom_GravityAcc_StdDev_Z
15. TimeDom_BodyAccJerk_Mean_X
16. TimeDom_BodyAccJerk_Mean_Y
17. TimeDom_BodyAccJerk_Mean_Z
18. TimeDom_BodyAccJerk_StdDev_X
19. TimeDom_BodyAccJerk_StdDev_Y
20. TimeDom_BodyAccJerk_StdDev_Z
21. TimeDom_BodyGyro_Mean_X
22. TimeDom_BodyGyro_Mean_Y
23. TimeDom_BodyGyro_Mean_Z
24. TimeDom_BodyGyro_StdDev_X
25. TimeDom_BodyGyro_StdDev_Y
26. TimeDom_BodyGyro_StdDev_Z
27. TimeDom_BodyGyroJerk_Mean_X
28. TimeDom_BodyGyroJerk_Mean_Y
29. TimeDom_BodyGyroJerk_Mean_Z
30. TimeDom_BodyGyroJerk_StdDev_X
31. TimeDom_BodyGyroJerk_StdDev_Y
32. TimeDom_BodyGyroJerk_StdDev_Z
33. TimeDom_BodyAccMag_Mean
34. TimeDom_BodyAccMag_StdDev
35. TimeDom_GravityAccMag_Mean
36. TimeDom_GravityAccMag_StdDev
37. TimeDom_BodyAccJerkMag_Mean
38. TimeDom_BodyAccJerkMag_StdDev
39. TimeDom_BodyGyroMag_Mean
40. TimeDom_BodyGyroMag_StdDev
41. TimeDom_BodyGyroJerkMag_Mean
42. TimeDom_BodyGyroJerkMag_StdDev
43. FreqDom_BodyAcc_Mean_X
44. FreqDom_BodyAcc_Mean_Y
45. FreqDom_BodyAcc_Mean_Z
46. FreqDom_BodyAcc_StdDev_X
47. FreqDom_BodyAcc_StdDev_Y
48. FreqDom_BodyAcc_StdDev_Z
49. FreqDom_BodyAccJerk_Mean_X
50. FreqDom_BodyAccJerk_Mean_Y
51. FreqDom_BodyAccJerk_Mean_Z
52. FreqDom_BodyAccJerk_StdDev_X
53. FreqDom_BodyAccJerk_StdDev_Y
54. FreqDom_BodyAccJerk_StdDev_Z
55. FreqDom_BodyGyro_Mean_X
56. FreqDom_BodyGyro_Mean_Y
57. FreqDom_BodyGyro_Mean_Z
58. FreqDom_BodyGyro_StdDev_X
59. FreqDom_BodyGyro_StdDev_Y
60. FreqDom_BodyGyro_StdDev_Z
61. FreqDom_BodyAccMag_Mean
62. FreqDom_BodyAccMag_StdDev
63. FreqDom_BodyBodyAccJerkMag_Mean
64. FreqDom_BodyBodyAccJerkMag_StdDev
65. FreqDom_BodyBodyGyroMag_Mean
66. FreqDom_BodyBodyGyroMag_StdDev
67. FreqDom_BodyBodyGyroJerkMag_Mean
68. FreqDom_BodyBodyGyroJerkMag_StdDev