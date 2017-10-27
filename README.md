
# Analyze of wearable computing datas
This project is a coursera lesson consisting in analyzing a data set from an online project. These datas are smartphone measurements of acceleration and angular velocity recorded on smartphones that 30 patients weared, while making 6 different moves. Some couples of patient/movement were used to train data and other to test data. 

## Getting started
To install the code
```
* copy-paste the run_analysis.R script into a directory
* download the set of data and put it into this directory
* while running the code, modify the setwd() value to this directory
```
the code will need dplyr library 
To install the library type in R : 

```
install.packages("dplyr")
```

## Description of the script
NAME : RUN_ANALYSIS.R

DESC :  
	1) The code merges the training and the test sets to create one data set : data
        2) Extracts only the measurements on the mean and standard deviation for each measurement : data_filtered
        3) Uses descriptive activity names to name the activities in the data set : data_labeled
        4) Appropriately labels the data set with descriptive variable names in data_labeled
        5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject : data_tidy

REM : Set the working directory where run_analysis.R is stored, and put the data in this wd, such that data will be available at ./UCI HAR Dataset/ 

CREATED : 27 oct 2017 by Bertrand Denolle

## Authors
The script was made by Bertrand Denolle


The data were collected for this project : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


See this paper for more info on the data here : Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 




