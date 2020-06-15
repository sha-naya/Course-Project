\#\#The Variables

The resulting dataset has four variables/columns. Therefore, each row
has 4 identifying values and represents one single observation.

The first variable is *SubjectID*. The accelerometer data was collected
using 30 subjects and this variable simply identifies each person, 1
through 30. (Ex. SubjectID = 27)

The second variable is *Activity*. This variable identifies one of the
six activities performed when the data was collected. The activities
are: Laying, Sitting, Standing, Walking, Walking Downstairs, and Walking
Upstairs. (Ex. Activity = Walking)

The third variable is *MeasurementMean*. Each value in the
*MeasurementMean* variable represents the average value of 561-feature
vectors values for each observation, which was then further averaged for
each combination of *SubjectID* and *Activity* to form grand mean
values. (Ex. -0.6169734)

The fourth variable is *MeasurementSD*. It is the standard deviation of
the 561-feature vectors, which was then further averaged for each
combination of *SubjectID* and *Activity* to form grand mean values.
(Ex. 0.5422944)

\#\#The Data

The task consisted of first creating an all observation dataset and then
refining it to a more tidy one. Thus, there were 2 resulting datasets.
The first is final.data, which combines 6 provided datasets into one:
X\_test, X\_train, y\_test, y\_train, subject\_test, and subject\_train.
However, not only is it the combination of the 6, but a more tidy and
summarized dataset in general. It has the previously mentioned four
variables that were either trasnformed or derived from the 6 datsets to
be more clearly understood and presented. This refined dataset has 10
299 observations.

The second dataset, the final product, goes a step further and
summarizes the data in a more presentable, tidy way. It provides the
average of *MeasurementMean* and *MeasurementSD* variables for each
combination of *SubjectID* and *Activity*. As a result, it has 180
observations of 4 variables, which is 6 activties for each subject of
30.

\#\#Additional Notes

Initially, *Activity* identification corresponded to 6 numbers. In order
to make the data more readable, the numbers were transformed into easily
identifiable activity names according to the activity\_labels.txt
document provided.

Additionally, the final.data dataset was ordered by *SubjectID* so that
observations associated with subject 1 were first and those of subject
30 were last. The final.tidy dataset was ordered by *SubjectID* as well,
along with *Activity* variable, so that subject 1 and activity “Laying”
were first and subject 30 with activity “Walking Upstairs” was last.
