# Load the dplyr library, that includes many functions used in this script
library(dplyr)

# Read the Training set
X.train <- read.table("train/X_train.txt")
y.train <- read.table("train/y_train.txt")
subject.train <- read.table("train/subject_train.txt")

# Read the Test set
X.test <- read.table("test/X_test.txt")
y.test <- read.table("test/y_test.txt")
subject.test <- read.table("test/subject_test.txt")

# Step 1 of the assignment
# Merge the Training and Test sets into a single data.frame
X <- rbind(X.train, X.test)
y <- rbind(y.train, y.test)
subject <- rbind(subject.train, subject.test)
mergedData <- cbind(subject, y, X)

# Step 2 of the assignment
# Read features
features <- read.table("features.txt")
mean.std.indices <- grep("mean\\()|std\\()", features$V2)
filteredData <- mergedData[,c(1:2, mean.std.indices+2)] #2 added to indices to count for 'subject' and 'y'

# Step 3 of the assignment
# Read activity labels column
activity_labels <- read.table("activity_labels.txt")$V2
# Name the first two columns
names(filteredData)[1] = "SubjectId"
names(filteredData)[2] = "Activity"
filteredData <- mutate(filteredData, Activity = factor(Activity, labels=activity_labels))

# Step 4 of the assignment
var.names <- gsub("-|\\(|\\)","",features$V2[mean.std.indices])
names(filteredData)[3:dim(filteredData)[2]] <- var.names

# Step 5 of the assignment
groupedData <- group_by(filteredData, SubjectId, Activity)
result <- summarise_each(groupedData, funs(mean))
write.table(result, file="result.txt", row.names=FALSE)

# Final output is available in result.txt
