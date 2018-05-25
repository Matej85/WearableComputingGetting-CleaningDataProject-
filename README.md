# WearableComputingGetting-CleaningDataProject-
Getting and Cleaning Data Course Project, Coursera education

Operation system: Windows 7 32bit
R version:4.3.3.
R studio version: 1.1.447 /
R packages applied:dplyr,readtext,tidyr,readr/
Raw data folder placed in working directoryis must!


# Dataset processing steps:
--------------------------
#1)the downloading of the material to local drive
#	using function tempdir(), tempfile(), download.file(), unzip() to get the data to the local drive
#
#2)loading packages needed for the data processing
#
#3)to setup common/test/train variables to be able to combine
#	function used: read.table(),mutate(),grep()
#	common variables applied for test/train data to be processed:
#		activity_labels - the string edit to be readible and shortened
#		name_variables - calculated variables to be assigned with mean/std mark:
#			std_name_variables - integer vector corresponding to "std" data
#	temp variables for test/train:
#		train_variables
#		test_variables	 	
#
#4)the processing of train data - combining tables together
#	function: grep(),read.table(),full_join(),rename()
#	full_train_variables - dataset created for train data with subject/activity/calculated variables for mean,std
#
#5)the processing of test data - combining tables together
#	function: grep(),read.table(),full_join(),rename()
#	full_test_variables - dataset created for test data with subject/activity/calculated variables for mean,std
#
#6)Combining test and train datasets
#	using rbind() to combine:
#		full_train_variables
#		full_test_variables
#	function gather() to put all calculated variables into a column "source" and their values to a column "value"
#	output of the combining "full_variables2"
#
#7)processing of calculated variable names to be able distinquish the data - per the measurement and type
	temporary variable called "name_variables2" with values from "source" column to be separated (using strsplit() with "split"argument "-") into certain columns to have information about:
		domain signal - time/frequency
		info - the string e.g. BodyGyroJerkMag (more edit below)
		type - mean()/std()
		axis - X/Y/Z/NA
	
	using merge() merging "full_variables2" with "name_variables2" into merged_data
	
	The column "info" in merged_data is processed to more details using mutate()/factor()/grepl():
		sensor signal - acc/gyro
		motion component - body/gravity
		jerk signal - TRUE/FALSE
		magnitude calc - TRUE/FALSE
	the output dataset "tidy_data" with variables:
		activity - STANDING/SITTING/LAYING/WALKING/WALKING DOWN/WALKING UP (activity label performed that was tracing)
		subject  - 1:30 (an identifier of the subject who carried out the experiment)
		type - mean/std (type of calculation)
		domain signal - time/frequency    
		sensor signal - acc/gyro (sensor of measurement)    
		motion component - body/gravity
		jerk signal -     
		magnitude calc - 
		axis - axis that was measured/NA            
		value - measured value           
		measure unit

8)editing dataset tidy_data to display average value for all requested calculated variables
	the output object as "tidy_data_avg" modified using mutate(),paste(),group_by(),summarise(),spred()
	the tidy_data_avg with variables:
		activity - STANDING/SITTING/LAYING/WALKING/WALKING DOWN/WALKING UP (activity during the research)
		subject  - 1:30 (subject ID of the experiment)
		requested variables in coded format using a separator "." column no.3-68, e.g. mean.time.gyro.body.TRUE.FALSE.Z
		format:
		type(mean/std).domain signal(time/frequency).sensor signal(acc/gyro).motion component(body/gravity).jerk signal(TRUE/FALSE).magnitude calc(TRUE/FALSE).axis(X/Y/Z/NA)	
	calculated average value in unit:	for "acc" in standard gravity units 'g'         	
						for "gyro" in radians
