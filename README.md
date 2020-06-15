\#\#Code Explanation

The code is divided into four parts.

The first part is responsible for reading in and formatting the three
datasets associated with train data. Specifically, it renames variable
names in subject\_train and y\_train datasets to “SubjectID” and
“Activity”, respectively. It then averages the 561-feature vectors in
X\_train dataset to create a new column titled *MeasurementMean* and
finds their standard deviation to create the *MeasurementSD* variable.
It then binds the resulting edited datasets to create a single train
dataset.

The second part is responsible for reading in and formatting the three
datasets associated with test data. It does the exact same thing as it
did for the train data.

The third part is responsible for combining the resulting train and test
data into one coherent dataset. It combines the two datasets and
re-labels the *Activity* variable values from numbers 1 through 6 to
descriptive names. It also orders the data by *SubjectID*, so that
subject 1 is first and subject 30 is last.

The fourth and last part is responsible for creating the second
independent tidy dataset with the average of each variable for each
activity and each subject. It uses a nested for loop to go through
final.data dataset and create tidy data. Lastly, it orders the resulting
dataset by *SubjectID* and *Activity* so that subject 1 of activity
“Laying” is first and subject 30 of activity “Walking Upstairs” is last.

\#\#Additional Notes “matrixStats” package was used to calculate the
standard deviation needed for *MeasurementSD* variable.

The actual code contains detailed descriptions of actions performed to
create the tidy-refined data.
