# cleaningdata
Implementation of the Course Project of Coursera's "Getting and Cleaning Data" course
This project contains one single R script file.

## Step 0
The necessary libraries (deplyr) is loaded.

## Step 1
The Training and Test data files were read into R
All the data were merged into one single large data.frame

## Step 2
Extracted the features that are either mean or std, using the grep command on features read from features.txt file
Then the merged data is filtered with the selected columns

## Step 3
Activity labels are read from activity_labels.txt and assigned to filtered data (column 2) using mutate function

## Step 4
Meaningful variable names are derived from the features, by removing the "-" and "()"
Assigned the column names to all the columns of the filtered data

## Step 5
The data is then grouped using group_by command on Subject and Actiivity
summarise_each function is used to compute the mean of the grouped data
The result is written into result.txt
