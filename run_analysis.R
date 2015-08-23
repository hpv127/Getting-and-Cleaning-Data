# Course project for Getting and Cleaning Data
# Step 1 to read the test and train data sets
setwd("C:/Users/I039307/Documents/Hashin/01_Official/40_Data_Scientist/Getting and Cleaning Data/Course_project/UCI HAR Dataset")

library(dplyr)

# Read test data sets
subject_test <- read.table("./test/subject_test.txt", header = FALSE)
X_test <- read.table("./test/X_test.txt", header = FALSE)
Y_test <- read.table ("./test/Y_test.txt", header = FALSE)

# Read train data sets
subject_train <- read.table("./train/subject_train.txt", header = FALSE)
X_train <- read.table("./train/X_train.txt", header = FALSE)
Y_train <- read.table ("./train/Y_train.txt", header = FALSE)

# Read Other Files
activity_labels <- read.table("activity_labels.txt", header = FALSE)
features <- read.table("features.txt", header = FALSE)

#Assign column names
colnames(activity_labels) <- c("activityno","Activity")
colnames(features)        <- c("Feature_no", "Feature")
colnames(subject_test)    <- "Subject"
colnames(Y_test)          <- "activityno"
colnames(X_test)          <- features$Feature
colnames(subject_train)   <- "Subject"
colnames(X_train)         <- features$Feature
colnames(Y_train)         <- "activityno"

#Merging test data and training data 
test_data <- cbind(subject_test, X_test, Y_test)
train_data <- cbind(subject_train, X_train, Y_train)
data <- rbind(train_data, test_data)

columnNames <- colnames(data)

#Find the columns with mean and std
columns <- (grepl("activityno",columnNames) | grepl("Subject",columnNames) | grepl("-mean..",columnNames) & !grepl("mean..-",columnNames) & !grepl("-meanFreq..",columnNames) | grepl("-std..",columnNames) & !grepl("-std..-",columnNames) )

#Select the columns with mean or std
meanstddata <- data[columns==TRUE]
ncol(meanstddata)

#Use Descriptive activity names
finaldata <- merge(meanstddata, activity_labels, by = "activityno")

#Appropriately labeling the data set with descriptive variable names

finaldatacols <- colnames(finaldata)

#function to change the names
changename <- function(columnName) {
  temp <- columnName
  temp <- gsub("tBody", "timeBody", temp)
  temp <- gsub("tGravity", "timeGravity", temp)
  temp <- gsub("fBody", "freqBody", temp)
  temp <- gsub("-mean", "Mean", temp)
  temp <- gsub("-std", "Std", temp)
  temp <- gsub("\\()", "", temp)
  temp <- gsub("Mag","Magnitude", temp)
  return(temp)
}

#using lapply to call the function changename for all records
finaldatacols <- lapply(finaldatacols, changename)

#Changing the names of the columns
colnames(finaldata)<- finaldatacols

# Create a second, independent tidy data set with the average of each variable for each activity and each subject
summarydata<- aggregate(
  finaldata[, names(finaldata) != c("activityno","Subject","Activity")]
  , by = finaldata %>% group_by(Activity,activityno,Subject) %>% select(Activity,activityno,Subject), FUN = mean 
  )

#Write to a file
write.table(summarydata, './finalData.txt',row.names=FALSE,sep='\t')



