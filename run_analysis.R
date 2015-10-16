library(dplyr)

# 1.1 Associate activity ids w/ activity labels
activity_labels <- read.table("data/activity_labels.txt", col.names = c("id","activity"))
features <- read.table("data/features.txt", col.names = c("id","feature"), colClasses = c('NULL',"character"))

train_labels    <- read.table("data/train/y_train.txt", col.names = c("id"), header = FALSE)
train_labels <- merge(train_labels, activity_labels)

test_labels     <- read.table("data/test/y_test.txt", col.names = c("id"), header = FALSE)
test_labels  <- merge(test_labels, activity_labels)

# Read subjects for both train and test
train_subjects <- read.table("data/train/subject_train.txt", col.names = c("subject"), header = FALSE)
test_subjects  <- read.table("data/test/subject_test.txt", col.names = c("subject"), header = FALSE)

# Read all data and...
# 3. Uses descriptive activity names to name the activities in the data set
train <- read.table("data/train/X_train.txt", header = FALSE, col.names = unlist(features))
test  <- read.table("data/test/X_test.txt", header = FALSE, col.names = unlist(features))

# 4.Appropriately labels the data set with descriptive variable names.
# Join w/ activity labels and subjects
train <- cbind(activity = train_labels$activity, train)
test  <- cbind(activity = test_labels$activity, test)

train <- cbind(subject = train_subjects$subject, train)
test  <- cbind(subject = test_subjects$subject, test)

# 1. Merges the training and the test sets to create one data set.
firstTidy <- rbind(train,test) %>%
  # 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  select(subject, 
         activity, 
         contains("mean", ignore.case = TRUE ), 
         contains("std", ignore.case = TRUE )
        )

write.table(firstTidy, file = "firstTidy.txt", row.names = FALSE)

# Clean up
rm(train)
rm(test)
rm(features)
rm(activity_labels)
rm(train_labels)
rm(test_labels)
rm(train_subjects)
rm(test_subjects)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
secondTidy <- firstTidy %>% 
  group_by(subject,activity) %>% 
  summarise_each(funs(mean))
