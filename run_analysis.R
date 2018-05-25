#1)loading packages needed for the data processing

library(dplyr)
library(readtext)
library(tidyr)
library(readr)

#2)to setup general/common variables to be able to combine with test/train datasets
activity_labels<-read.table("~/UCI HAR Dataset/activity_labels.txt",header = FALSE,sep = "")
                activity_labels<-activity_labels%>%mutate(V3=gsub("_"," ",V2))%>%mutate(activity=gsub("STAIRS","",V3))
                activity_labels<-activity_labels[,c(1,4)]
name_variables<-read.table("~/UCI HAR Dataset/features.txt",header=FALSE,sep = "")
                mean_name_variables<-grep("mean[^Ff]",name_variables$V2)
                std_name_variables<-grep("std",name_variables$V2)


        train_variables<-read.table("~/UCI HAR Dataset/train/X_train.txt",header=FALSE,sep = "")
        test_variables<-read.table("~/UCI HAR Dataset/test/X_test.txt",header=FALSE,sep = "")
        
#3)the processing of train data - combining tables together        
full_train_variables<-train_variables[,c(mean_name_variables,std_name_variables)]
        names(full_train_variables)<-c(grep("mean[^Ff]",name_variables$V2,value = TRUE),
                                       grep("std",name_variables$V2,value = TRUE))

        train_labels<-read.table("~/UCI HAR Dataset/train/y_train.txt",header=FALSE,sep = "",stringsAsFactors = FALSE)
                train_labels<-full_join(train_labels,activity_labels,by=c("V1"="V1"),copy = FALSE)
        train_obs<-read.table("~/UCI HAR Dataset/train/subject_train.txt",header = FALSE,sep = "")
                train_obs<-train_obs%>%rename(subject=V1)        

full_train_variables<-cbind(train_labels,train_obs,full_train_variables)

#4)the processing of test data - combining tables together
full_test_variables<-test_variables[,c(mean_name_variables,std_name_variables)]
        names(full_test_variables)<-c(grep("mean[^Ff]",name_variables$V2,value = TRUE),
                                      grep("std",name_variables$V2,value = TRUE))

        test_labels<-read.table("~/UCI HAR Dataset/test/y_test.txt",header=FALSE,sep = "",stringsAsFactors = FALSE)
                test_labels<-full_join(test_labels,activity_labels,by=c("V1"="V1"),copy = FALSE)
        test_obs<-read.table("~/UCI HAR Dataset/test/subject_test.txt",header = FALSE,sep = "")
                test_obs<-test_obs%>%rename(subject=V1)

full_test_variables<-cbind(test_labels,test_obs,full_test_variables)

#5)Combining test and train datasets
full_variables<-rbind(full_train_variables,full_test_variables)        
        full_variables2<-full_variables%>%gather("source","value",c(4:length(colnames(full_variables))))
        

#6)processing of calculated variable names to be able distinquish the data - per the measurement and types

edit_name_variables<-data.frame(sourceID=colnames(full_variables[4:69]))
        list_name_variables<-strsplit(as.character(edit_name_variables$sourceID),split = "-")


name_variables2<-edit_name_variables %>% mutate("domain signal"=substr(edit_name_variables$sourceID,1,1),
                   info=sapply(list_name_variables,function(x) {x[1]}),
                   type=sapply(list_name_variables,function(x) {x[2]}),
                   axis=sapply(list_name_variables,function(x) {x[3]}))
        name_variables2$info<-substr(name_variables2$info,2,nchar(name_variables2$info))
        name_variables2$type<-gsub("\\()","",name_variables2$type)
        

merged_data<-merge(full_variables2,name_variables2,by.x = "source",by.y = "sourceID",all = TRUE,sort = FALSE)
        merged_data<-merged_data[,c(3:9)]
        merged_data$`domain signal`<-ifelse(merged_data$`domain signal`=="t","time","frequency")

##more edit for column "info" to specify data more detailly 
merged_data2<-merged_data%>%
        mutate("sensor signal"=factor(1*grepl("Acc",merged_data$info),labels = c("gyro","acc")))%>%
        mutate("motion component"=factor(1*grepl("GravityAcc",merged_data$info),labels = c("body","gravity")))%>%
        mutate("jerk signal"=factor(1*grepl("Jerk",merged_data$info),labels = c(FALSE,TRUE)))%>%
        mutate("magnitude calc"=factor(1*grepl("Mag",merged_data$info),labels = c(FALSE,TRUE)))
        
        tidy_data<-merged_data2%>%
                mutate("measure unit"=ifelse(merged_data2$`sensor signal`=="gyro","radians","g"))
        tidy_data<-tidy_data[,c(1,2,6,4,8,9,10,11,7,3,12)]
        
        rm(list = ls()[c(1:16,18:20)]);gc(reset = TRUE)

#7)editing dataset tidy_data to display average values for all examined variables
        tidy_data_avg=tidy_data%>%
                mutate(VariableNew=paste(type,`domain signal`,`sensor signal`,`motion component`,`jerk signal`,
                                         `magnitude calc`,axis,sep="."))%>%
                group_by(activity,subject,VariableNew)%>%
                summarise(average=mean(value,na.rm = TRUE))%>%
                spread(VariableNew,average)
        
        
        
        
        
        
        
        
        
        
 