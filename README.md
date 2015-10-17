# Coursera - Getting and Cleaning Data

## Requirements
The only requirement is the `dplyr` R package.

## How to run `run_analysis.R`
### repo and data setup

To run `run_analysis.R` you need first to clone the repo and copy the course project dataset to a specified location. You can do it manually or you can use the script provided below if you run R on Linux/Mac.

#### Manual steps
 1. Clone this git repo (`$ git clone https://github.com/elibus/getdata-033`)
 2. Download the course projects dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 3. Unzip it in the repo folder
 
This is the whole tree:

    elibus@livia getdata-033$ tree
    .
    ├── README.md
    ├── UCI\ HAR\ Dataset
    │   ├── README.txt
    │   ├── activity_labels.txt
    │   ├── features.txt
    │   ├── features_info.txt
    │   ├── test
    │   │   ├── Inertial\ Signals
    │   │   │   ├── body_acc_x_test.txt
    │   │   │   ├── body_acc_y_test.txt
    │   │   │   ├── body_acc_z_test.txt
    │   │   │   ├── body_gyro_x_test.txt
    │   │   │   ├── body_gyro_y_test.txt
    │   │   │   ├── body_gyro_z_test.txt
    │   │   │   ├── total_acc_x_test.txt
    │   │   │   ├── total_acc_y_test.txt
    │   │   │   └── total_acc_z_test.txt
    │   │   ├── X_test.txt
    │   │   ├── subject_test.txt
    │   │   └── y_test.txt
    │   └── train
    │       ├── Inertial\ Signals
    │       │   ├── body_acc_x_train.txt
    │       │   ├── body_acc_y_train.txt
    │       │   ├── body_acc_z_train.txt
    │       │   ├── body_gyro_x_train.txt
    │       │   ├── body_gyro_y_train.txt
    │       │   ├── body_gyro_z_train.txt
    │       │   ├── total_acc_x_train.txt
    │       │   ├── total_acc_y_train.txt
    │       │   └── total_acc_z_train.txt
    │       ├── X_train.txt
    │       ├── subject_train.txt
    │       └── y_train.txt
    ├── run_analysis.R
    └── secondTidy.txt
    
    5 directories, 31 files

#### Script for Linux/Mac
The following script should do the job if you run R on Mac/Linux:

    git clone https://github.com/elibus/getdata-033
    cd getdata-033
    wget https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip -O dataset.zip
    unzip dataset.zip

### Run `run_analysis.R`
 1. Run R or RStudio
 2. Set the working directory to the repo with `setwd("/path/to/the/cloned/repo)`
 3. source run_analysis.R
