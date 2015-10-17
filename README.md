# Coursera - Getting and Cleaning Data

## Requirements
 - R >= 3.2.x
 - `dplyr` R package

## How to run `run_analysis.R`

To run `run_analysis.R` you just need to:
 1. clone this repo `git clone https://github.com/elibus/getdata-033`
 2. Run R or RStudio
 3. Set the working directory `setwd("/path/to/the/cloned/repo)`
 4. source ('run_analysis.R')

`run_analysis.R` will download the course dataset, unzip it and process the data to create the tidy dataset as requested.
`run_analysis.R` is cross-platform (followed this advice https://thoughtfulbloke.wordpress.com/2015/08/31/hello-world), i.e. it should work seamlessly on Windows, Mac and Linux. Still there might be incompatibilities with Windows or Linunx as I did not have the chance to test it on Windows. If case of issue change the `method` option at row 4 to something different (`nativa`, `curl` or whatever you think best).

This is the line you might need to modify:

    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", method = "libcurl", destfile = "dataset.zip")

### Run `run_analysis.R`
 1. Run R or RStudio
 2. Set the working directory to the repo with `setwd('/path/to/the/cloned/repo')`
 3. source ('run_analysis.R')
