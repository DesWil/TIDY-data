
> library(plyr)

> library(dplyr)

> feat <- data.table :: fread("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
> activLevel <- data.table :: fread("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
>          ##Read training data
> subTrain <- data.table :: fread("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
> xTrain <- data.table :: fread("UCI HAR Dataset/train/X_train.txt", col.names = feat$functions)

> yTrain <- data.table :: fread("UCI HAR Dataset/train/y_train.txt", col.names = "code")
>         ##Read Test data
> subTest <- data.table :: fread("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
> xTest <- data.table :: fread("UCI HAR Dataset/test/X_test.txt", col.names = feat$functions)
> yTest <- data.table :: fread("UCI HAR Dataset/test/y_test.txt", col.names = "code")
> xtotal <- rbind(xTrain, xTest)
> ytotal <- rbind(yTrain, yTest)
> subtotal <- rbind(subTrain, subTest)
>   ## QUESTION 2
> selectVar <- feat[grep("mean\\(\\)|std\\(\\)",feat[,2]),]
> xtotal<- xtotal[,selectVar[,1]]
>   ## QUEASTION 3
> colnames(ytotal) <- "activity"
> ytotal$activLevel <- factor(ytotal$activity, labels = as.character(activLevel[,2]))
> activLevel <- ytotal[,-1]
> 
> ##Question4
> 
> names(xtotal) <- gsub("([[:lower:]])([[:upper:]])", "\\1 \\2", names(xtotal))
> names(xtotal) <- tolower(names(xtotal))
> names(xtotal) <- sub("^t|t ", "time ", names(xtotal))
> names(xtotal) <- sub("freq", "frequency", names(xtotal))
> names(xtotal) <- sub("^f", "frequency", names(xtotal))
> names(xtotal) <- gsub("-", " ", names(xtotal))
> names(xtotal) <- sub("acc", "acceleration", names(xtotal))
> names(xtotal) <- sub("gyro", "angular velocity", names(xtotal))
> names(xtotal) <- sub("std", "standard deviation", names(xtotal))
> names(xtotal) <- sub("mag", "magnitude", names(xtotal))
> names(xtotal) <- gsub("\\()", "", names(xtotal))
> names(xtotal) <- sub(" $", "", names(xtotal))
> names(xtotal) <- gsub("  "," ", names(xtotal))
> names(xtotal)
