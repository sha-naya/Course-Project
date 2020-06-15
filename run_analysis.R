#Author: sha-naya
#Date: 15/06/2020
#Description: Code to create tidy data for Getting and Cleaning Data Course Project.

#Packages
#install.packages("matrixStats")

#Part1: Train data
#Reads in the train data, renames some columns to more descriptive names, and calculates
#the mean & standard deviation of 561-feature vectors for each train data observation.
#Lastly, combines the three train datasets into one, titled train.data.
y_train <- read.table("~/Desktop/R Specialization/UCI HAR Dataset/train/y_train.txt")
X_train <- read.table("~/Desktop/R Specialization/UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("~/Desktop/R Specialization/UCI HAR Dataset/train/subject_train.txt")

colnames(subject_train) <- "SubjectID"
colnames(y_train) <- "Activity"

y_train$MeasurementMean <- rowMeans(X_train)
#install.packages("matrixStats")
library(matrixStats) 
y_train$MeasurementSD <- rowSds(as.matrix(X_train))

train.data <- cbind(subject_train, y_train)

#Part 2: Test data
#Does exactly the same thing as with train data, but with test data. Results in test.data.
y_test <- read.table("~/Desktop/R Specialization/UCI HAR Dataset/test/y_test.txt")
X_test <- read.table("~/Desktop/R Specialization/UCI HAR Dataset/test/X_test.txt")
subject_test <- read.table("~/Desktop/R Specialization/UCI HAR Dataset/test/subject_test.txt")

colnames(subject_test) <- "SubjectID"
colnames(y_test) <- "Activity"

y_test$MeasurementMean <- rowMeans(X_test)
y_test$MeasurementSD <- rowSds(as.matrix(X_test))

test.data <- cbind(subject_test, y_test)

#Part 3: Combined data
#Combines train.data and test.data to form one coherent dataset with 10 299 observations.
#Re-labels activity IDs to descriptive names and orders the resulting dataset by SubjectID.
combined.data <- rbind(test.data, train.data)
final.data <- combined.data[order(combined.data$SubjectID),]

final.data$Activity <- as.character(final.data$Activity)

final.data$Activity[final.data$Activity == "1"] <- "Walking"
final.data$Activity[final.data$Activity == "2"] <- "Walking Upstairs"
final.data$Activity[final.data$Activity == "3"] <- "Walking Downstairs"
final.data$Activity[final.data$Activity == "4"] <- "Sitting"
final.data$Activity[final.data$Activity == "5"] <- "Standing"
final.data$Activity[final.data$Activity == "6"] <- "Laying"

#Part 4:Tidy data
#Creates a tidy version of data with the average of each variable for each activity and each subject.
#Orders the final dataset by SubjectID and Activity.
tidy.data <- data.frame(SubjectID = numeric(), Activity = character(), MeasurementMean = numeric(), MeasurementSD = numeric())
subject.vector <- 1:30
activity.vector <- c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")

for(subj in subject.vector) {
  for(acti in activity.vector) {
    df.1 <- subset(final.data, SubjectID == subj & Activity == acti, select = c(SubjectID, Activity, MeasurementMean, MeasurementSD))
    mean1 <- mean(df.1$MeasurementMean)
    mean2 <- mean(df.1$MeasurementSD)
    df.round <- data.frame(SubjectID = subj, Activity = acti, MeasurementMean = mean1, MeasurementSD = mean2)
    tidy.data <- rbind(tidy.data, df.round)
  }
}
final.tidy <- tidy.data[order(tidy.data$SubjectID, tidy.data$Activity),]