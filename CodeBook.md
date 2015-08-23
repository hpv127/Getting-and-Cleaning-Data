#Getting and Cleaning Data course project - Code book

## Description of data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

####For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

####The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Merge the training and the test sets to create one data set
For the data analysis the main files needed are : -
- 'test/subject_test.txt'
- 'test/X_test.txt'
- 'test/Y_test.txt'
- 'train/subject_train.txt"
- 'train/X_train.txt'
- 'train/Y_train.txt'
- 'activity_labels.txt'
- 'features.txt'
So the first step is to read these files using read.table() function. Then assign names to the columns. The names of the features are in the features.txt. 
Then combine the test tables into a single table and the train tables into another table using cbind(). Then combine both the tables using rbind().

## Extract only the measurements on the mean and standard deviation for each measurement

Use the grepl() function to findout the columns which has mean and standard deviation for each measurement and then create a new dataset using those columns

## Add the description of activities to the data set 

Use merge() function and merge the data set created in the previous step and data set created using the activity_labels.txt file to get the data set with description for activities.

## Appropriately label the data set with descriptive variable names
Use the function gsub() to change the column names to appropriate labels. 

## Create a data set with the average of each variable for each activity and each subject

Use the aggregate(), group_by(),and select() function to get the data set with the average of each variable for each activity and each subject
