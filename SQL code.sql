Step 1: Creation of Temp tables to be combined into a master table
Steps 2 & 3: Make a ride_length column as well as transform the timestamp into weekdays, dates and time 
Also intentionally did not select columns: long/lat start and ends, ride_id, station_id, end_station_id so they would be filtered out when making tables
---------------------------------------------------------------------------------------

SELECT 
 DATE_DIFF(ended_at,started_at,MINUTE) AS ride_length, 
 
 -- Creates the length of a ride as a column in minutes.
 
 FORMAT_DATE('%A',started_at) AS start_day,FORMAT_DATE('%A',ended_at) AS end_day,
 
 -- Formats timestamp into weekdays in a name (for example "Wednesday") and renames column.
 
 EXTRACT(TIME FROM ended_at) AS end_time ,EXTRACT(TIME FROM started_at) AS start_time,
 
 -- Extracts time relative information from the timestamp. 
 
 EXTRACT(DATE FROM ended_at) AS end_date, EXTRACT(DATE FROM started_at) AS start_date,
 
 -- Extracts date (YYYY-MM-DD) from timestamp and renames column.
 
  member_casual, start_station_name,rideable_type
FROM buoyant-genre-370301.Cyclistic_oct2021_oct2022.Divvy_tripdata_oct2021
UNION ALL

-- Fully combines the other queries.

--Repeat for other tables.
SELECT
 DATE_DIFF(ended_at,started_at,MINUTE) AS ride_length,
 FORMAT_DATE('%A',started_at) AS start_day,FORMAT_DATE('%A',ended_at) AS end_day,
 EXTRACT(TIME FROM ended_at) AS end_time ,EXTRACT(TIME FROM started_at) AS start_time,
 EXTRACT(DATE FROM ended_at) AS end_date, EXTRACT(DATE FROM started_at) AS start_date,
 member_casual, start_station_name,rideable_type
FROM buoyant-genre-370301.Cyclistic_oct2021_oct2022.Divvy_tripdata_nov2021
UNION ALL
SELECT
 DATE_DIFF(ended_at,started_at,MINUTE) AS ride_length,
 FORMAT_DATE('%A',started_at) AS start_day,FORMAT_DATE('%A',ended_at) AS end_day,
 EXTRACT(TIME FROM ended_at) AS end_time ,EXTRACT(TIME FROM started_at) AS start_time,
 EXTRACT(DATE FROM ended_at) AS end_date, EXTRACT(DATE FROM started_at) AS start_date,
 member_casual, start_station_name,rideable_type
FROM buoyant-genre-370301.Cyclistic_oct2021_oct2022.Divvy_tripdata_dec2021
UNION ALL
SELECT
 DATE_DIFF(ended_at,started_at,MINUTE) AS ride_length,
 FORMAT_DATE('%A',started_at) AS start_day,FORMAT_DATE('%A',ended_at) AS end_day,
 EXTRACT(TIME FROM ended_at) AS end_time ,EXTRACT(TIME FROM started_at) AS start_time,
 EXTRACT(DATE FROM ended_at) AS end_date, EXTRACT(DATE FROM started_at) AS start_date,
 member_casual, start_station_name,rideable_type
FROM buoyant-genre-370301.Cyclistic_oct2021_oct2022.Divvy_tripdata_jan2022

-- At the end of the query used Bigquerrys 'save as' function to create a table of the unioned data tables.
-- Repeated this twice to make the other 2 data chunks.


Step 4: Union of temp tables into a master data set
----------------------------------------------------------------------------------------------------------
SELECT *
FROM `buoyant-genre-370301.Cyclistic_oct2021_oct2022.feb_march_april_sept_oct2022`
UNION ALL
SELECT *
FROM `buoyant-genre-370301.Cyclistic_oct2021_oct2022.oct_nov_dec2021_jan2022`
UNION ALL 
SELECT *
FROM `buoyant-genre-370301.Cyclistic_oct2021_oct2022.may_june_july_aug2022`

-- Utilized Bigquerry's 'save as' function to create a new table named master_table_oct2021_2022

Step 5: Querying to Find negative ride_lengths 
Step 6: Deleting negative row values
----------------------------------------------------------------------------------------------------------
SELECT ride_length
FROM `buoyant-genre-370301.Cyclistic_oct2021_oct2022.master_table_oct2021_2022`
WHERE ride_length < 0

-- Finds all rows containing rides that are under 0 minutes long

DELETE
FROM `buoyant-genre-370301.Cyclistic_oct2021_oct2022.master_table_oct2021_2022`
WHERE ride_length < 0

-- Only deletes queried results, which are all found negative ride values

Step 7: Data aggregation for Data visualization 
-----------------------------------------------------------------------------------------------------------

-- Counts the number of trips by weekday with member type

SELECT member_casual, COUNT(ride_length) as trips, start_day
FROM `buoyant-genre-370301.Cyclistic_oct2021_oct2022.master_table_oct2021_2022` 
GROUP BY member_casual, start_day

-- Counts the number of trips and Average ride_lengths for each bike type with member type

SELECT AVG(ride_length) AS avg_ridelength,member_casual,rideable_type, COUNT(ride_length) as trips
FROM `buoyant-genre-370301.Cyclistic_oct2021_oct2022.master_table_oct2021_2022`
GROUP BY member_casual, rideable_type

-- Counts each usage of station_names, Total ride times in each station with member type

SELECT COUNT(start_station_name) AS station_usage, SUM(ride_length) AS total_time, member_casual, start_station_name
FROM `buoyant-genre-370301.Cyclistic_oct2021_oct2022.master_table_oct2021_2022` 
GROUP BY member_casual, start_station_name
ORDER BY station_usage DESC
-- Shows most used station first

-- Creates Mode for weekdays with member type

SELECT approx_top_count(start_day, 7) as usage_weekday, member_casual
FROM `buoyant-genre-370301.Cyclistic_oct2021_oct2022.master_table_oct2021_2022`
GROUP BY member_casual
-- This query is not uploaded to Tableau, visualization results are retrieved from the JOINS of trips per weekday view and the station usage view

-- Counts the number of trips by date with member type

SELECT member_casual, COUNT(ride_length) as trips, start_date
FROM `buoyant-genre-370301.Cyclistic_oct2021_oct2022.master_table_oct2021_2022` 
GROUP BY member_casual, start_date

-- Total ride lengths by date with member type

SELECT member_casual, SUM(ride_length) as total_trip_times, start_day, start_date
FROM `buoyant-genre-370301.Cyclistic_oct2021_oct2022.master_table_oct2021_2022`
GROUP BY member_casual, start_day, start_date
ORDER BY total_trip_times DESC

-- Counts the number of trips made before noon and afternoon
SELECT COUNT(ride_length) as trips, member_casual
FROM `buoyant-genre-370301.Cyclistic_oct2021_oct2022.master_table_oct2021_2022` 
WHERE start_time < "12:00:00"
GROUP BY member_casual
-- Before noon
SELECT COUNT(ride_length) as trips, member_casual
FROM `buoyant-genre-370301.Cyclistic_oct2021_oct2022.master_table_oct2021_2022` 
WHERE start_time > "12:00:00"
GROUP BY member_casual
-- Afternoon

-- All  queries above in step 7 are saved as a view, then exported to Google Sheets to be later imported into Tableau for visualization

