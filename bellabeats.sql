
-- This code converts ActivityHour from string to datetime
SELECT Id, PARSE_TIMESTAMP('%m/%d/%Y %r %Z', utc) AS ActivityHour,
 Calories
   TotalTimeInBed FROM 
( SELECT Id,
 CONCAT(ActivityHour, " +00:00") AS utc,
  Calories
     FROM `bellabeat-364423.bellabeats_data.hourlyCalories_merged` )

-- This code converts ActivityHour from string to datetime
SELECT Id, PARSE_TIMESTAMP('%m/%d/%Y %r %Z', utc) AS date,
 TotalIntensity,
  AverageIntensity
 FROM 
( SELECT Id,
 CONCAT(ActivityHour, " +00:00") AS utc,
 TotalIntebsity,
  AverageIntensity
     FROM `bellabeat-364423.bellabeats_data.hourlyIntensities_merged` )


-- This code converts ActivityHours from string to datetime
SELECT Id, PARSE_TIMESTAMP('%m/%d/%Y %r %Z', utc) AS date,
 value,
 logId 
 FROM 
( SELECT Id,
 CONCAT(date, " +00:00") AS utc,
  value,
 logId 
     FROM `bellabeat-364423.bellabeats_data.minutesSleep_merged` )


SELECT Id, PARSE_TIMESTAMP('%m/%d/%Y %r %Z', utc) AS date,
 TotalSleepRecords,
  TotalMinutesAsleep,
   TotalTimeInBed FROM 
( SELECT Id,
 CONCAT(SleepDay, " +00:00") AS utc,
  TotalSleepRecords,
   TotalMinutesAsleep,
    TotalTimeInBed
     FROM `bellabeat-364423.bellabeats_data.sleepDay_merged` )






--This code shows the list of columns shared among tables
SELECT
 column_name,
 table_name,
 data_type
FROM
 bellabeat-364423.bellabeats_data.INFORMATION_SCHEMA.COLUMNS
WHERE
 REGEXP_CONTAINS(LOWER(table_name),"day|daily")
 AND column_name IN (
 SELECT
   column_name
 FROM
   bellabeat-364423.bellabeats_data.INFORMATION_SCHEMA.COLUMNS
 WHERE
   REGEXP_CONTAINS(LOWER(table_name),"day|daily")
 GROUP BY
   1
 HAVING
   COUNT(table_name) >=2)
ORDER BY
1;



--This code makes sure data type align with tables
SELECT
 A.Id,
 A.Calories,
 * EXCEPT(Id,
   Calories,
   ActivityDay,
   SleepDay,
   SedentaryMinutes,
   LightlyActiveMinutes,
   FairlyActiveMinutes,
   VeryActiveMinutes,
   SedentaryActiveDistance,
   LightActiveDistance,
   ModeratelyActiveDistance,
   VeryActiveDistance),
 I.SedentaryMinutes,
 I.LightlyActiveMinutes,
 I.FairlyActiveMinutes,
 I.VeryActiveMinutes,
 I.SedentaryActiveDistance,
 I.LightActiveDistance,
 I.ModeratelyActiveDistance,
 I.VeryActiveDistance
FROM
 `bellabeat-364423.bellabeats_data.daily_activity` A
LEFT JOIN
 `bellabeat-364423.bellabeats_data.daily_calories` C
ON
 A.Id = C.Id
 AND A.ActivityDate=C.ActivityDay
 AND A.Calories = C.Calories
LEFT JOIN
 `bellabeat-364423.bellabeats_data.daily_intensities` I
ON
 A.Id = I.Id
 AND A.ActivityDate=I.ActivityDay
 AND A.FairlyActiveMinutes = I.FairlyActiveMinutes
 AND A.LightActiveDistance = I.LightActiveDistance
 AND A.LightlyActiveMinutes = I.LightlyActiveMinutes
 AND A.ModeratelyActiveDistance = I.ModeratelyActiveDistance
 AND A.SedentaryActiveDistance = I.SedentaryActiveDistance
 AND A.SedentaryMinutes = I.SedentaryMinutes
 AND A.VeryActiveDistance = I.VeryActiveDistance
 AND A.VeryActiveMinutes = I.VeryActiveMinutes
LEFT JOIN
 `bellabeat-364423.bellabeats_data.daily_steps` S
ON
 A.Id = S.Id
 AND A.ActivityDate=S.ActivityDay
LEFT JOIN
 `bellabeat-364423.bellabeats_data.sleep_day` Sl
ON
 A.Id = Sl.Id
 AND A.ActivityDate=Sl.SleepDay;


--This code determines the number of naps taken during the day 
 SELECT
 Id,
 sleep_start AS sleep_date,
 COUNT(logId) AS number_naps,
 SUM(EXTRACT(HOUR
   FROM
     time_sleeping)) AS total_time_sleeping
FROM (
 SELECT
   Id,
   logId,
   MIN(DATE(date)) AS sleep_start,
   MAX(DATE(date)) AS sleep_end,
   TIME( TIMESTAMP_DIFF(MAX(date),MIN(date),HOUR),
     MOD(TIMESTAMP_DIFF(MAX(date),MIN(date),MINUTE),60),
     MOD(MOD(TIMESTAMP_DIFF(MAX(date),MIN(date),SECOND),3600),60) ) AS time_sleeping
 FROM
   `bellabeat-364423.bellabeats_data.minutes_sleep_merged`
 WHERE
   value=1
 GROUP BY
   1,
   2)
WHERE
 sleep_start=sleep_end
GROUP BY
 1,
 2
ORDER BY
 3 DESC;



