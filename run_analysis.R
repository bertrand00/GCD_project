"""
NAME : RUN_ANALYSIS.R

DESC :  1) The code merges the training and the test sets to create one data
                set : data
        2) Extracts only the measurements on the mean and standard deviation for 
                each measurement : data_filtered
        3) Uses descriptive activity names to name the activities in the data 
                set : data_labeled
        4) Appropriately labels the data set with descriptive variable names 
                in data_labeled
        5) From the data set in step 4, creates a second, independent tidy 
                data set with the average of each variable for each activity 
                and each subject : data_tidy

REM : Set the working directory where run_analysis.R is stored, and put the data
         in this wd, such that data will be available at ./UCI HAR Dataset/ 

CREATED : 27 oct 2017 by Bertrand Denolle

"""
setwd("~/R/repo/GCD_project/")
library(dplyr)

# 1) Load X_train and X_test from first directory
path_base <- "./UCI HAR Dataset/"
path_train <- "./UCI HAR Dataset/train/"
path_test <- "./UCI HAR Dataset/test/"

X_train <- read.table(file=paste(path_train,'X_train.txt',sep=""),header=FALSE)
X_test <- read.table(file=paste(path_test,'X_test.txt',sep=""),header=FALSE)

# Combine data from train and test
data <- rbind(X_train,X_test)

# 2) Select datas containing mean and standard deviation in their feature names
features <- read.table(file=paste(path_base,'features.txt',sep=""))
names <- c()
for (i in 1:nrow(features)){names <- c(names,as.character(features[i,2]))}
extracted <- grep("-mean[()]|-std[()]",names)
names_extracted <- grep("-mean[()]|-std[()]",names,value=TRUE)
data_filtered <- select(data,num_range("V", extracted))

# 3) List and name the activities following the table corresponding to their number
activity_train <- read.table(file=paste(path_train,'y_train.txt',sep=""),header=FALSE)
activity_test <- read.table(file=paste(path_test,'y_test.txt',sep=""),header=FALSE)
activities <- rbind(activity_train,activity_test)
activity_labels <- read.table(file=paste(path_base,'activity_labels.txt',sep=""))
activity_names <- activity_labels[activities$V1,2]

# 4) We now add subject_train and activity_name in the data set. This done now 
#because some  variables from the full feature data set contained the same name,
#so giving names before filtering was complicated,  this couldn't fit with the
#fact that data frame should have a unique name. 

subject_train <- read.table(file=paste(path_train,'subject_train.txt',sep=""),header=FALSE)
subject_test <- read.table(file=paste(path_test,'subject_test.txt',sep=""),header=FALSE)
subjects <- rbind(subject_train,subject_test)

names(data_filtered) <- names_extracted

# We change the name of the data base for clarity and add 2 columns subjects 
# activity_names
data_labeled <- data_filtered
data_labeled$activity_names <- activity_names
data_labeled$subjects <- subjects$V1

# 5) we then group the data by the 2 variables subjects and activity_name
# and use the function summarize all applying the function mean
data_tidy <- summarize_all(group_by(data_labeled, subjects,activity_names),funs(mean))
write.table(file=paste(path_base,'data_tidy.txt',sep=""),x=data_tidy,row.name=FALSE)

