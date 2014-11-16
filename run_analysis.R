## read in the data

xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")
subjecttrain <- read.table("train/subject_train.txt")

xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt")
subjecttest <- read.table("test/subject_test.txt")

activitylabel<-read.table("activity_labels.txt")

features<-read.table("features.txt")
# convert factor valued into character value
features$V2<-as.character(features$V2)

## Extracts only the measurements on the mean and standard deviation for each measurement. 
# return a logical vector, true if contain mean() or std() pattern in values of features $V2
meanNstd<-grepl("mean()|std()",features$V2)
xtestextract<-xtest[,meanNstd]
xtrainextract<-xtrain[,meanNstd]

## Uses descriptive activity names to name the activities in the data set
ytrain[,1]<-activitylabel[ytrain[,1],2]
ytest[,1]<-activitylabel[ytest[,1],2]


## Merge training set
trainingset<-cbind(xtrainextract,ytrain,subjecttrain)

## Merge testing set
testingset<-cbind(xtestextract,ytest,subjecttest)

## merge both sets into one data set
cleandata<-rbind(trainingset,testingset)

## Appropriately labels the data set with descriptive variable names. 
names(cleandata)<-c(features$V2[meanNstd],"Activity","Subject")


### Step 1 to 4 completed, resulting the merged data frame "cleandata"
## creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)

seconddata<-ddply(cleandata, c("Subject", "Activity"), function(x) colMeans(x[, 1:79]))
write.table(seconddata, "MeanBySubjectNActivity.txt", row.name=FALSE)
