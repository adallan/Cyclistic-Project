# Cyclistic-Project
A case study of Cyclistic bike sharing company based on a real world chicago based company.

Ask Phase: 

Business Task: How do annual members and casual riders use Cyclistic's bike sharing service differently?
Goal to Solve: How to convert more casual riders into annual members

Stakeholders for this project: 
  Lily Moreno, director of marketing/my manager
  The Marketing analytics team, my peers
  Cyclistic's Executive Team, decides wether or not to approve my recommendations
  
Prepare Phase:
  
  Data is located from divvytrip-data, Divvy is the chicago based bike sharing company that has given us a data license to analyze and copy their public city data as long as the license's conditions are not broken. 
  Data from this source is first-party data as their company has first hand in gathering and processing it.
  Data is realvent, current, up to date and reliable. Data's intgerity has been verified and personal user information has been encrypted to ensure privacy.
  Data has been gathered from all users regardless of anything such as membership, age, gender, race ect. Thus ensuring it is unbais
  Data contains all necessary fields for analysis and memebership comparison.
  
Process Phase:

Tools used:
  Bigquerry for SQL processing, analyzing and cleaning. Data set is too large for analysis in excel or sheets. Bigquerry has google cloud support that will allow for importing and storing the necessary file sizes of the data sets
  Tableau public for visualizations. Dashboards in tableau are interactable and show in depth information as well as being highly flexible and customizable. 
  Google sheets will be used as a bridge between bigquerry and tableau. Google slides will be used for presentation deleveriable.
  
Please see SQL querry page for in-depth code on how cleaning process was executed.
  
Data Cleaning Process:

1) Downloaded 13 months worth of data from divvy-trips and renamed files to be able to be found easier later on.
2) Uploaded Octover 2021 to October 2022 as distinct tables into bigquerry. Utilizing google cloud's bucket system as full data set exceed 1.2 gigs.
3) Used SQL querries to join 4 months of data into a single table and created new tables doing this, Repeated for the rest of the data set.
4) Created columns for ride_length (in minutues), weekday, date and start_time. Repeated for other data clusters and joined them all into one master data table. (approximately containting 6.3 million rows)
5) Filtered out longittude, latitude start and end columns as most are null and incomplete, as well as time being a better understanding of bike usage. Determined that long/lat was unreliable to determine distance.
6) Filtered out ride_id as it was encrypted so each was unquie even it was the same user, as well as to futher protect data integrity and user privacy.
7) Filtered out station_id, end_station, end_station_id as they were redundant and unreliable as they contained null values. 
8) Deleted temp tables used to create master data table.
9) Exploration of master table revealed negative ride_lengths from improper data collection. Deleted these rows and checked to ensure no other anomalies.

Analysis Process:

Aggerations made:

1) Counts of weekday casual vs annual members with bike_types and ride_lengths.
2) Counts of bike_types with average ride_lengths casual vs annual members.
3) Counts of start_stations with count of ride_lengths as trips and member type.
4) Mode of weekdays: count of ride_lengths as trips, member type and weekday.
5) Average ride_length by date and member type.
6) start times beofre noon and afternoon, dates and member types.
7) Count of ride_lengths as trips by date and member type.

Trends found:
  Average ride length for casual members of 28.6 min and 12.2 min for annual members.
  Docked bikes used the least but only by casual riders.
  Casual riders used service most on Saturday then sunday, where annual member were consistant throughout the week with most trips in midweek(wednesdday).
  Casual riders use eletric bikes the most, Annual are close to even on classic and eletric. Classic bikes get the highest ride_lengths per use.
  Casual riders use Streeter Dr & Grand ave station the most. Followed by DuSable Lake Shore Dr & Monroe street station. Annual members tend to notn have a preferance or use all stations consistently.
  Most trips are in the afternoon.
  
Analysis Conclusion: 

  Casual riders ride longer and more on the weekends. Where as annual members ride consitstantly throughout the week but slightly less on weekends.
  Docked bikes are least popular, electric is the most popular and classic is nearly as used as electric but gets the longest trips per usage.
  For Casual members Streeter Dr & Grand ave station is used the most followed by DuSable Lake Shore Dr & Monroe street station and Millennium Park.
  
Reccomendations:

1) Casual members use service for longer during the weekends especially during the summer months. I reccomend targeting ads involving weekend deals during the summer for annual memberships
2) I reccommend positioning ads at the following locations to reach the highest possible number of casual riders: 
  Streeter Dr & Grand ave station, DuSable Lake Shore Dr & Monroe street station and Millennium Park
3) Classic bikes are used for the longest trips and electric are used more often but for shorter periods of time. I reccommend considering a marketing campaign for annual price discounts for longer trips as well as one for using electric bikes to entice more casual to annual member converions

Thank you for reading! Please see other pages for SQL code and presentation slides and data visualizations
