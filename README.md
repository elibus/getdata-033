# Coursera - Getting and Cleaning Data

## General requirements
 - R >= 3.2.x
 - `dplyr` R package

## How to run `run_analysis.R`

To run `run_analysis.R` you just need to:
 1. clone this repo `git clone https://github.com/elibus/getdata-033`
 2. Run R or RStudio
 3. Set the working directory `setwd('/path/to/the/cloned/repo')`
 4. source ('run_analysis.R')

`run_analysis.R` will download the course dataset, unzip it and process the data to create two tidy dataset as requested.
`run_analysis.R` is cross-platform (followed this advice https://thoughtfulbloke.wordpress.com/2015/08/31/hello-world), i.e. it should work seamlessly on Windows, Mac and Linux. Still there might be incompatibilities with Windows or Linunx as I did not have the chance to test it on Windows. In case of issue change the `method` option at row 4 to something different (`native`, `curl` or whatever you think best).

This is the line you might need to modify:

    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", method = "libcurl", destfile = "dataset.zip")

### Data transformation
This section describes how the two tidy datasets are built from the data files and how they satisfy the requirements. Here I am going to follow the code instead of the order of the requirements in the course project description.

#### Requirement n.4 - Appropriately labels the data set with descriptive variable names. 
`feature.txt` lists all features descriptive names. The file can be read as a table with two colums: `id` and `feature`.
The column `id` is useless (it is just a counter), while the column `feature` holds the descriptive variable names for the train and test datasets. While reading the `X_train.txt`, column names can be assigned from the `feature` column.

The same holds for the test dataset.

#### Requirement n.3 - Uses descriptive activity names to name the activities in the data set
 Activity labels are stored in the `activity_labels.txt` file which is a table with two colums: `id` and `activity`.
 
 `y_train.txt` file contains only one column that holds the activity id for each measurement contained in the `X_train.txt`., hence `X_train.txt` and `y_train.txt` can be easily read and combined together in a single dataframe (`y_train.txt` is a column of `X_train.txt`). 
 
 The new dataframe can be joined  using `id` as key. The final result is a dataframe whos columns looks like this:
 
| activity |   VAR1   | VAR2  | ... | VARn |
| -------- | -------- | ----  | --- | ---- |
| WALKING  | SITTING  | 0.289 | ... | 0.27 |
 
 The same holds for the test dataset.
 
#### Requirement n.1 - Merges the training and the test sets to create one data set.
Train and test datasets have identical dimensions, they can be simply merged in a single dataset appending the rows of one to the other.

#### Requirement n.2 - Extracts only the measurements on the mean and standard deviation for each measurement.
Once we built a unified dataset with all data from train and test datasets, this can be easily achived by selecting only those columns whose name include "mean()" or "std()". As explained in the `features_info.txt` file, the variable names follow the following pattern: `<SIGNAL>-<FUN>-<AXIS>`.

The angle variables, that do not follow this pattern, have excluded from the dataset as they are calculated from averages of other variables hence they are not "measurements on the mean and standard deviation".

#### Requirement n.5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Since we need the subjects for grouping, subjects must be added to the first dataset (see Requirement n.1). Subjects are recorded in the `subject_train.txt` that can be processed very much alike the `y_train.txt` file. The first final dataset has the following structure:
 
| subject | activity | VAR1  | VAR2 | ... | VARn |
| ------- | -------- | ----- | ---- | --- | ---- |
|    1    | SITTING  | 0.289 | 0.28 | ... | 0.27 |

The second data set "with the average of each variable for each activity and each subject" can be obtained grouping by `subject` and `activity` and the applying the function `summarise_each(funs(mean))` that will call the `mean()` function on all columns of the data set.
 
