library(dplyr)
library(tidyr)

## Set directories
dir <- "Dataset"
testdir <- file.path(dir, "test")
traindir <- file.path(dir, "train")

## Read labels
activity_labels <- read.table(file.path(dir, "activity_labels.txt"))
feature_labels <- read.table(file.path(dir, "features.txt"))

colnames(activity_labels) <- c("id", "activity")
colnames(feature_labels) <- c("id", "feature")

## Read data
test_subjects <- read.table(file.path(testdir, "subject_test.txt"))
test_data <- read.table(file.path(testdir, "x_test.txt"))
test_labels <- read.table(file.path(testdir, "y_test.txt"))
train_subjects <- read.table(file.path(traindir, "subject_train.txt"))
train_data <- read.table(file.path(traindir, "x_train.txt"))
train_labels <- read.table(file.path(traindir, "y_train.txt"))

## Extract mean and std
selected_feature_labels <- filter(feature_labels, 
                                  grepl("mean()", feature, fixed = TRUE) 
                                  | grepl("std()", feature, fixed = TRUE))
test_data <- test_data[selected_feature_labels$id]
train_data <- train_data[selected_feature_labels$id]

## Label columns
colnames(test_data) <- selected_feature_labels$feature
colnames(train_data) <- selected_feature_labels$feature
test_data <- mutate(test_data, type = "test")[, c(67, 1:66)]
train_data <- mutate(train_data, type = "train")[, c(67, 1:66)]
test_labels <- lapply(test_labels, function(id) {activity_labels$activity[id]})
train_labels <- lapply(train_labels, function(id) {activity_labels$activity[id]})

## Merge data
names(test_labels) <- "activity"
names(train_labels) <- "activity"
colnames(test_subjects) <- "subject"
colnames(train_subjects) <- "subject"
test_data <- cbind(test_labels, test_subjects, test_data)
train_data <- cbind(train_labels, train_subjects, train_data)
data <- bind_rows(test_data, train_data)
data$type <- factor(data$type, levels = c("test","train"))

## Group data
data <- group_by(data, activity, subject, type)

## Create tidy data
tidydata <- summarize_each(data, funs(mean))
tidydata <- arrange(tidydata, activity, subject, type)

## Export data
write.table(tidydata, file = "tidydata.txt", row.names = FALSE)
