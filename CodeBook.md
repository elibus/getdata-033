# Code Book 
This is the code book for the course project of the "Getting and Cleaning Data" @Coursera based on the study available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The [original dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) reports data sampled from individuals doing activities while wearing a Samsung Galaxy S II.

## Data transformation
This section describes how the two required tidy data sets are built from the data files and how they satisfy the requirements. Here I am going to follow the code instead of the order of the requirements in the course project description.

### Requirement n.4 - Appropriately labels the data set with descriptive variable names. 
`feature.txt` lists all features descriptive names. The file can be read as a table with two colums: `id` and `feature`.
The column `id` is useless (it is just a counter), while the column `feature` holds the descriptive variable names for the train and test data sets. While reading the `X_train.txt`, column names can be assigned from the `feature` column.

Before assigning variable names to columns, to improve readability and still keep syntactically valid variable names, we have decided to have variable names in [CamelCase](https://en.wikipedia.org/wiki/CamelCase). This is needed because variable names are really long.

The same holds for the test data set.

### Requirement n.3 - Uses descriptive activity names to name the activities in the data set
 Activity labels are stored in the `activity_labels.txt` file which is a table with two colums: `id` and `activity`.
 
 `y_train.txt` file contains only one column that holds the activity id for each measurement contained in the `X_train.txt`., hence `X_train.txt` and `y_train.txt` can be easily read and combined together in a single dataframe (`y_train.txt` is a column of `X_train.txt`). 
 
 The new dataframe can be joined  using `id` as key. The final result is a dataframe whos columns looks like this:
 
| activity |   VAR1   | VAR2  | ... | VARn |
| -------- | -------- | ----  | --- | ---- |
| WALKING  | SITTING  | 0.289 | ... | 0.27 |
 
 The same holds for the test data set.
 
### Requirement n.1 - Merges the training and the test sets to create one data set.
Train and test data sets have identical dimensions, they can be simply merged in a single data set appending the rows of one to the other.

### Requirement n.2 - Extracts only the measurements on the mean and standard deviation for each measurement.
Once we built a unified data set with all data from train and test data sets, this can be easily achived by selecting only those columns whose name include "mean()" or "std()", as explained in the `features_info.txt`. Relevant columns can be selected using regular expressions, like this:

    select(subject,
           activity,
           matches("^[f|t]+.*mean[-]*$"),
           matches("^[f|t]+.*std.*$")
          )

### Requirement n.5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Since we need the subjects for grouping, subjects must be added to the first data set (see Requirement n.1). Subjects are recorded in the `subject_train.txt` that can be processed very much alike the `y_train.txt` file. The first final data set has the following structure:
 
| subject | activity | VAR1  | VAR2 | ... | VARn |
| ------- | -------- | ----- | ---- | --- | ---- |
|    1    | SITTING  | 0.289 | 0.28 | ... | 0.27 |

The second data set "with the average of each variable for each activity and each subject" can be obtained grouping by `subject` and `activity` and the applying the function `summarise_each(funs(mean))` that will call the `mean()` function on all columns of the data set.
 
To prove this second data set is tidy, we will first prove that the first data set we built is tidy. Tidy data has the following properties:
 1. **Each variable forms a column**: given the information in `features_info.txt` this is true. All variables have a different column, even axis XYZ have their own variables.
 2. **Each observation forms a row**: given the information in `README.txt` this is true for all records. Still, subject and activity variables are missing from the data set. As described before, we have applied the transformation suggested in ["3.5. One type in multiple tables (Tidy Data - Hadley Wickham)](file:///Users/elibus/Downloads/Week3/tidy-data.pdf) by adding the `subject` and `activity` column to the data set.
 3. **Each type of observational unit forms a table**: we have just one table that is one observational unit, a sample of variables for a given activity and subject.
 
## Variables
Variables are named using the pattern described in the file `README.txt` that comes with the original data. Variable names have been slightly modified to increase readability and still keeping them compatible with R syntax.

The pattern is: `<t|f><Body|Gravity><Acc|Gravity>[Jerk][Mag][{Mean|Std}][{X|Y|Z}]`.
This is a brief explanation of how the naming scheme works:
 - t: time domain signal
 - f: frequency domain signal
 - Body: body acceleration
 - Gravity: gravity acceleration
 - Acc: accelerometer
 - Gyro: gyroscope
 - Jerk: Jerk signal
 - Mag: magnitude of X/Y/Z dimensional signals
 - mean: averaga
 - std: standard deviation

For more details please have a look at `README.txt` and `features_info.txt` in the original data set.

### subject
An identifier of the subject who carried out the experiment.

### activity
Activity name.

### tBodyAccMagMean
### tGravityAccMagMean
### tBodyAccJerkMagMean
### tBodyGyroMagMean
### tBodyGyroJerkMagMean
### fBodyAccMagMean
### fBodyBodyAccJerkMagMean
### fBodyBodyGyroMagMean
### fBodyBodyGyroJerkMagMean
### tBodyAccStd{X|Y|Z}          
### tGravityAccStd{X|Y|Z}
### tBodyAccJerkStd{X|Y|Z}
### tBodyGyroStd{X|Y|Z}
### tBodyGyroJerkStd{X|Y|Z}
### tBodyAccMagStd          
### tGravityAccMagStd
### tBodyAccJerkMagStd
### tBodyGyroMagStd
### tBodyGyroJerkMagStd
### fBodyAccStd{X|Y|Z}
### fBodyAccJerkStd{X|Y|Z}
### fBodyGyroStd{X|Y|Z}
### fBodyAccMagStd
### fBodyBodyAccJerkMagStd
### fBodyBodyGyroMagStd
### fBodyBodyGyroJerkMagStd
