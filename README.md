# WearableComputingGetting-CleaningDataProject
Getting and Cleaning Data Course Project, Coursera education

## Pre-conditions:
Operation system: Windows 7 32bit  
R version:4.3.3.  
R studio version: 1.1.447  
R packages applied:dplyr,readtext,tidyr,readr  
Raw data folder placed in working directoryis must!  

## Dataset processing steps:
----------------------------
1. loading packages needed for the data processing  

2. to setup common/test/train variables to be able to combine  
	* functions: read.table(),mutate(),grep()  
	* common variables applied for test/train data to be processed:  
		+ activity_labels - the string edit to be readible and shortened  
		+ name_variables - calculated variables to be assigned with mean/std mark:  
			+ mean_name_variables - integer vector corresponding to "mean" data    
			+ std_name_variables - integer vector corresponding to "std" data    
	* temp variables for test/train:  
		+ train_variables  
		+ test_variables  	 	

3. processing of train data - combining tables together  
	* functions: grep(),read.table(),full_join(),rename()  
	* full_train_variables - dataset created for train data with subject/activity/calculated variables for mean,std  

4. processing of test data - combining tables together  
	* functions: grep(),read.table(),full_join(),rename()  
	* full_test_variables - dataset created for test data with subject/activity/calculated variables for mean,std  

5. combining test and train datasets  
	* using rbind() to combine:  
		+ full_train_variables  
		+ full_test_variables  
	* function gather() to put all calculated variables into a column "source" and their values to a column "value"  
	* output of the combining "full_variables2"  

6. processing of calculated variable names to be able distinquish the data - per the measurement and type  
	* temporary variable called "name_variables2" with values from "source" column to be separated (using strsplit() with "split"argument "-") into certain columns to have information about:  
		+ domain signal - time/frequency  
		+ info - the string e.g. BodyGyroJerkMag (more edit below)  
		+ type - mean/std  
		+ axis - X/Y/Z/NA  
	* using merge() merging "full_variables2" with "name_variables2" into merged_data, reference cols "source" & "sourceID"  	
	* the column "info" in merged_data is processed to get more details about the variable using mutate()/factor()/grepl():  
		+ sensor signal - acc/gyro  
		+ motion component - body/gravity  
		+ jerk signal - TRUE/FALSE  
		+ magnitude calc - TRUE/FALSE  
	* the output dataset "tidy_data" with variables:  
		+ activity - STANDING/SITTING/LAYING/WALKING/WALKING DOWN/WALKING UP (activity label performed that was tracing)  
		+ subject  - 1:30 (an identifier of the subject who carried out the experiment)  
		+ type - mean/std (type of calculation in raw data)  
		+ domain signal - time/frequency      
		+ sensor signal - acc/gyro (sensor of measurement)      
		+ motion component - body/gravity  
		+ jerk signal - TRUE/FALSE (body linear acceleration and angular velocity derived in time)  
		+ magnitude calc - TRUE/FALSE  (magnitude of 3-dimensional signals calculated using the Euclidean norm)  
		+ axis - X/Y/Z/NA - axis that was measured or NA  
		+ value - measured/calculated value in raw data  
		+ measure unit - g/radians    
	* temporarily created variables at this point to be removed, keeping on only "tidy_data" object  
7. editing dataset tidy_data to display average value for all requested calculated variables  
	* the output final object is "tidy_data_avg"  
	* tidy_data modified using mutate(),paste(),group_by(),summarise(),spread()  
	* calculated average value in unit:  
		+ for "acc" in standard gravity units 'g'  
		+ for "gyro" in radians 
	* the tidy_data_avg with variables:  
		+ activity - STANDING/SITTING/LAYING/WALKING/WALKING DOWN/WALKING UP (activity during the research)  
		+ subject  - 1:30 (subject ID of the experiment)  
		+ requested variables in coded format using a separator "." column no.3-68, e.g. mean.time.gyro.body.TRUE.FALSE.Z  
		+ format of variable naming:  

part1	|.|part2	  |.|part3        |.|part4           |.|part5           |.|part6         |.|part7   |
--------|-|---------------|-|-------------|-|----------------|-|----------------|-|--------------|-|--------|
type	|.|domain signal  |.|sensor signal|.|motion component|.|jerk signal	|.|magnitude calc|.|axis    |
mean/std|.|time/frequency |.|acc/gyro	  |.|body/gravity    |.|TRUE/FALSE	|.|TRUE/FALSE	 |.|X/Y/Z/NA|  
	 
