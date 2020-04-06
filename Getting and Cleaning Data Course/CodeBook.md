**Getting and Cleaning Data Project Steps**

**1.** Download the dataset

Dataset downloaded and extracted under the folder called UCI HAR Dataset

**2.** Read Files

Read Activity, Subject, Features train and test files seperately

**3.** Merges the training and the test sets to create one data set

First by creating 3 separate data set by using rbind function
'Activity','Subject','Featuers' then merge 3 data set by using cbind
function

subject and activity are Identifiers.

subject: the ID of the subject activity: the name of the activity
performed by the subject

**4.** Extracts the mean and standard deviation for each measurement

By using grep and select functions

**5.** Uses descriptive activity names to name the activities in the
data set

By using gsub function

All start with character t in column's name replaced by Time All start
with character f in column's name replaced by Frequency All Acc in
column's name replaced by Accelerometer All Gyro in column's name
replaced by Gyroscope All BodyBody in column's name replaced by Body All
Mag in column's name replaced by Magnitude and so on..

**6.** From the data set in step before, creates a second, independent
tidy data set with the average of each variable for each activity and
each subject

FinalData (180 rows, 81 columns) is created and Export FinalData into
FinalData.txt file.

**Measurements:**

*1.*timeBodyAccelerometerMean()-X  
*2.*timeBodyAccelerometerMean()-Z  
*3.*timeBodyAccelerometerSTD()-Y  
*4.*timeGravityAccelerometerMean()-X  
*5.*timeGravityAccelerometerMean()-Z  
*6.*timeGravityAccelerometerSTD()-Y  
*7.*timeBodyAccelerometerJerkMean()-X  
*8.*timeBodyAccelerometerJerkMean()-Z  
*9.*timeBodyAccelerometerJerkSTD()-Y  
*10.*timeBodyGyroscopeMean()-X  
*11.*timeBodyGyroscopeMean()-Z  
*12.*timeBodyGyroscopeSTD()-Y  
*13.*timeBodyGyroscopeJerkMean()-X  
*14.*timeBodyGyroscopeJerkMean()-Z  
*15.*timeBodyGyroscopeJerkSTD()-Y  
*16.*timeBodyAccelerometerMagnitudeMean()  
*17.*timeGravityAccelerometerMagnitudeMean()  
*18.*timeBodyAccelerometerJerkMagnitudeMean()  
*19.*timeBodyGyroscopeMagnitudeMean()  
*20.*timeBodyGyroscopeJerkMagnitudeMean()  
*21.*frequencyBodyAccelerometerMean()-X  
*22.*frequencyBodyAccelerometerMean()-Z  
*23.*frequencyBodyAccelerometerSTD()-Y  
*24.*frequencyBodyAccelerometerMeanFreq()-X  
*25.*frequencyBodyAccelerometerMeanFreq()-Z  
*26.*frequencyBodyAccelerometerJerkMean()-Y  
*27.*frequencyBodyAccelerometerJerkSTD()-X  
*28.*frequencyBodyAccelerometerJerkSTD()-Z  
*29.*frequencyBodyAccelerometerJerkMeanFreq()-Y  
*30.*frequencyBodyGyroscopeMean()-X  
*31.*frequencyBodyGyroscopeMean()-Z  
*32.*frequencyBodyGyroscopeSTD()-Y  
*33.*frequencyBodyGyroscopeMeanFreq()-X  
*34.*frequencyBodyGyroscopeMeanFreq()-Z  
*35.*frequencyBodyAccelerometerMagnitudeSTD()  
*36.*frequencyBodyAccelerometerJerkMagnitudeMean()  
*37.*frequencyBodyAccelerometerJerkMagnitudeMeanFreq()  
*38.*frequencyBodyGyroscopeMagnitudeSTD()  
*39.*frequencyBodyGyroscopeJerkMagnitudeMean()  
*40.*frequencyBodyGyroscopeJerkMagnitudeMeanFreq()  
*41.*timeBodyAccelerometerMean()-Y  
*42.*timeBodyAccelerometerSTD()-X  
*43.*timeBodyAccelerometerSTD()-Z  
*44.*timeGravityAccelerometerMean()-Y  
*45.*timeGravityAccelerometerSTD()-X  
*46.*timeGravityAccelerometerSTD()-Z  
*47.*timeBodyAccelerometerJerkMean()-Y  
*48.*timeBodyAccelerometerJerkSTD()-X  
*49.*timeBodyAccelerometerJerkSTD()-Z  
*50.*timeBodyGyroscopeMean()-Y  
*51.*timeBodyGyroscopeSTD()-X  
*52.*timeBodyGyroscopeSTD()-Z  
*53.*timeBodyGyroscopeJerkMean()-Y  
*54.*timeBodyGyroscopeJerkSTD()-X  
*55.*timeBodyGyroscopeJerkSTD()-Z  
*56.*timeBodyAccelerometerMagnitudeSTD()  
*57.*timeGravityAccelerometerMagnitudeSTD()  
*58.*timeBodyAccelerometerJerkMagnitudeSTD()  
*59.*timeBodyGyroscopeMagnitudeSTD()  
*60.*timeBodyGyroscopeJerkMagnitudeSTD()  
*61.*frequencyBodyAccelerometerMean()-Y  
*62.*frequencyBodyAccelerometerSTD()-X  
*63.*frequencyBodyAccelerometerSTD()-Z  
*64.*frequencyBodyAccelerometerMeanFreq()-Y  
*65.*frequencyBodyAccelerometerJerkMean()-X  
*66.*frequencyBodyAccelerometerJerkMean()-Z  
*67.*frequencyBodyAccelerometerJerkSTD()-Y  
*68.*frequencyBodyAccelerometerJerkMeanFreq()-X  
*69.*frequencyBodyAccelerometerJerkMeanFreq()-Z  
*70.*frequencyBodyGyroscopeMean()-Y  
*71.*frequencyBodyGyroscopeSTD()-X  
*72.*frequencyBodyGyroscopeSTD()-Z  
*73.*frequencyBodyGyroscopeMeanFreq()-Y  
*74.*frequencyBodyAccelerometerMagnitudeMean()  
*75.*frequencyBodyAccelerometerMagnitudeMeanFreq()  
*76.*frequencyBodyAccelerometerJerkMagnitudeSTD()  
*77.*frequencyBodyGyroscopeMagnitudeMean()  
*78.*frequencyBodyGyroscopeMagnitudeMeanFreq()  
*79.*frequencyBodyGyroscopeJerkMagnitudeSTD()
