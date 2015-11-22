
1. Read the two datasets - "train" or "test" - and the labels (activity and features) 
    dir is the path to the datasets
    testdir is the path to the test dataset
    traindir is the path to the train dataset
    activity_labels contains the key and the value for the activity id and the activity name
    feature_labels contains the key and the value for the feature id and the feature name
    test_subjects and train_subjects contains a column with the subject id
    test_data and train_data contains 561 columns corresponding to 561 features
    test_labels and train_labels contain activity ids

2. Extract the mean() and std() data by selecting only the columns whose names contain mean() or std() 
    selected_feature_labels contains features that contain mean() or std()
    test_data and train_data gets only those columns specified by selected_feature_labels

3. Label the columns of the datasets using the labels 
    test_labels and train_labels gets activity names corresponding to activity id by using activity_labels

4. Add a new column to each dataset called type that is either "train" or "test" 
    test_data and train_data gets a new column called type that specifies whether it is "train" or "test" data

5. Merge the two datasets into one data set 
    data combines test_data, test_labels, test_subjects, train_data, train_labels, and train_subjects

6. Create a tidy data set with the average of each variable for each activity and each subject
    data is grouped by activity, subject, and type; it is grouped by type for convenience only
    tidydata contains the means of each variable in data calculated using summarize_each()

