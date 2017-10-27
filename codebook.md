# Description of data and variables

## Content of the data

The data consists of different .txt files : 
* features.txt : contains the names of the physical parameters corresponding to each feature
* activity_labels.txt : contains a table linking activity label and id of this activity from 1 to 6 and with values LAYING, SITTING ...
* y_train.txt : contains the activity id, going from 1 to 6 
subject_train.txt : contains the id of the subject doing one of the 6 activities
* 'X_train.txt : each features are processed and stored, for each 
* subject_train.txt : contains the id of the subject, from 1 to 30

And the same for the test data. 

There is also raw datas that are stored in Inertial Signals files, that contains the raw datas that were processed to give features data

## Data Frame names 

* data contains the reading of the raw values of features
* data_filtered contains the data where -mean() and -std() are present. I chose to exclude meanFreq values on purpose, because only mean was asked. Is also added the name of each features left in the dataset.

* data_labeled contains the data_filtered with activity names and subject ID added. 
* data_tidy contains the mean of features following each subject id on each activity name.  
