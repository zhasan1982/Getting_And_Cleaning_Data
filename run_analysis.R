##### Set working directory #####
setwd("C:\\Users\\Zeeshan\\Documents\\Personal\\GACD")

##### Load required packages #####
if (require(dplyr)==FALSE) {
  install.packages("dplyr")
}
if (require(tidyr)==FALSE) {
  install.packages("tidyr")
}

##### Create directories for the data files #####
if (!file.exists("working_data_files")) {
  dir.create("working_data_files")
}
if (!file.exists("raw_dataset")) {
  dir.create("raw_dataset")
}
if (!file.exists("tidy_dataset")) {
  dir.create("tidy_dataset")
}

##### Download data file #####
setwd(".\\working_data_files")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile="getdata-projectfiles-UCI HAR Dataset.zip",method="internal")
dateDownloaded <- date()

##### Extract files from zip files #####
unzip("getdata-projectfiles-UCI HAR Dataset.zip")

##### Read features and activity labels file #####
setwd(".\\UCI HAR Dataset")
featData <- read.table(".\\features.txt")
colnames(featData) <- c("FeatureID","FeatureLabel")
lblActivity <- read.table(".\\activity_labels.txt")
colnames(lblActivity) <- c("ActivityID","ActivityName")

##### 1 - Merge test and training data #####
##### 3 - Apply activity labels        #####
##### 4 - Apply variable labels        #####
# Prep test data
setwd(".\\test")
testData <- read.table(".\\X_test.txt")
colnames(testData) <- featData$FeatureLabel
actTest <- read.table(".\\y_test.txt")
colnames(actTest) <- "ActivityID"
actTest <- left_join(actTest,lblActivity)
subjTest <- read.table(".\\subject_test.txt")
colnames(subjTest) <- "Subject"
testData <- cbind("Test",subjTest,actTest,testData)
names(testData)[1] <- "Set"
# Prep training data
setwd(".\\..\\train")
trainData <- read.table(".\\X_train.txt")
colnames(trainData) <- featData$FeatureLabel
actTrain <- read.table(".\\y_train.txt")
colnames(actTrain) <- "ActivityID"
actTrain <- left_join(actTrain,lblActivity)
subjTrain <- read.table(".\\subject_train.txt")
colnames(subjTrain) <- "Subject"
trainData <- cbind("Training",subjTrain,actTrain,trainData)
names(trainData)[1] <- "Set"
# Merge the two datasets
allData <- rbind(testData,trainData)
# Save raw dataset
write.table(allData,file=".\\..\\..\\..\\raw_dataset\\UCI_HAR_Complete_Raw_Data.txt",row.names=FALSE)

##### Clear unused data items from the environment #####
rm("actTest","actTrain","dateDownloaded","featData","fileURL","lblActivity","subjTest","subjTrain","testData","trainData")

##### 2 - Subset data for variables that have mean() or std() in their name #####
colFilter <- c(1:4,grep(".*mean[(][)].*|.*std[(][)].*",names(allData)))
subData <- allData[,colFilter]

##### Clean-up variable names #####
names(subData) <- gsub("^[t]","TimeDom_",names(subData))
names(subData) <- gsub("^[f]","FreqDom_",names(subData))
names(subData) <- gsub("mean[(][)]","Mean",names(subData))
names(subData) <- gsub("std[(][)]","StdDev",names(subData))
names(subData) <- gsub("[-]","_",names(subData))

##### 5 - Produce tidy dataset #####
tidyData <- aggregate(subData[,c(5:70)],by=list(Subject=subData$Subject,Activity=subData$ActivityName),FUN="mean")
tidyData <- arrange(tidyData,Subject,Activity)
tidyData <- mutate(tidyData,Activity=gsub("[_]"," ",Activity))
write.table(tidyData,file=".\\..\\..\\..\\tidy_dataset\\UCI_HAR_Tidy_Data.txt",row.names=FALSE)
