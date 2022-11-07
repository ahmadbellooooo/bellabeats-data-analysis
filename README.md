### bellabeats

![bellabeats](images/Bellabeat.png)

## Impact of Smart Device Usage In Consumers

This project is a  case study for Google Data Analytics Capstone Project, for Award of Google Data Analytics Professional Certificate.
This analysis focuses on improving Bellabeat’s smart products, by providing insights to smart device usage and discovering  trends that would influence their marketing strategy.

### Business Task:

What are some trends in smart device usage ?
How could these trends be applied to Bellabeat customers ?
How could these trend help influence Bellabeat marketing strategy ?

### Data Source

  The data used for this analysis is gotten from a third party data source, the  Fitbit Fitness Tracker Data. It is a Public Domain dataset made available on Kaggle. This Kaggle dataset contains personal fitness tracker data from thirty fitbit users. Thirty eligible Fitbit users consented to the submission of personal tracker data, including minute-level output for physical activity, heart rate, and sleep monitoring. It includes information about daily activity, steps, and heart rate that can be used to explore users’ habits.
  The dataset consist of 18 tables with contents relating to daily activities, hourly activities etc.  All data in each table were collected in the year 2016. The data has gone through the process of de-identification as users are represented with Id numbers and personal information were excluded.

### Data Cleaning

The data was downloaded from Kaggle and uploaded into Bigquery SQL for the purpose of cleaning and analysis. It contains multiple number of tables, with long list of rows. The use of an SQL editor would be more efficient as it makes merging tables and data manipulation easier.

  Tables with Timestamp values encountered errors during upload. So timestamp values were changed to string to enable upload.  After upload the tables were cleaned to transform dates that were in string values to timestamp values. Tables were cleaned to eliminate duplicate values, irrelevant data and also fix misspellings. Codes used in cleaning this dataset are available on GITHUB. 

### Analysis

The dataset was checked to view tables with common column names. The results indicated that each table had an Id column which serves as the primary key. Also some tables had some columns in common.

The tables were merged together using the Id as primary key. The results of the aggregation enables room for further analysis into the loss of calories per number of steps taken and total distance covered. The data was also analyzed to determine the number of naps taken by different users to discover sleep patterns.


### The scatter plot below show the calories lost and number of steps taken

![total steps](images/total_steps_calories.png)

The blue circles represent the number of calories lost for every step taken, the highest number of calories lost was at 4900 just below the 5000 mark. The plot also indicates that this was achieved at 20,000 steps.



### The scatter plot below shows the calories lost and distance covered


![distance covered](images/Total_distance_calories.png)

The blue circles represent the number of calories lost for distance covered, the scatter plot is similar to the one above  but it aggregates values of the distance covered. With 28 kilometers being the longest distance  and lowest calories lost is above the 500 mark.

### The line graph bellow shows the sleep pattern of users across weekdays

![time sleeping](images/total_time_sleeping.png)

The line graph shows that users  had the lowest number of naps on Monday 17 and the highest number of naps on Saturday  44.  Also  users get to sleep for less time on Mondays and sleep longer on Saturdays.

### Conclusion 

  Sleeping pattern is similar in all users as they get to take more naps for longer period of time during the weekend and less naps for short periods of time during weekdays.
  Calories burned are not necessarily related to the number of steps taken or distance covered.

### Suggestions

  Products should be marketed towards improving the sleep patterns in users.
  Products should also provided measurements and records for specific activities in users (eg. running or walking) so as to effectively track their data.

### Further Exploration

More data should be collected to show the categories of users to study their activity patterns. Data should include type of  activities carried out , factors affecting sleep patterns and loss of calories. 
