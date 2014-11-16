## Data Set

* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## Variables

xtrain - stores data from X_train.txt
ytrain - stores data from y_train.txt
subjecttrain - stores data from subject_train.txt
xtest - stores data from X_test.txt
ytest - stores data from y_test.txt
subjecttest - stores data from subject_test.txt
activitylabel - stores data from activity_labels.txt
features - stores data from features.txt
meanNstd - a logical vector indicating which feature string name contain patterns "mean()" or "std()". Containing 79 TRUE values.
xtestextract - extracted xtest, only with measurements with mean and standard deviation
xtrainextract - extracted xtrain, only with measurements with mean and standard deviation
trainingset - combination from data related to training
testingset - combination from data related to test
cleandata - merged data from trainingset and testingset
seconddata - store average of each measurement by experiment subject and activity. Data from variable cleandata.


## Transformation
*Strings in features are converted to Character type if it is not read in as Character type.
*ytrain and ytest are converted from Integer valued to descriptive names.
*column names of variable cleandata assigned correspond to the column values.