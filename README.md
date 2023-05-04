Cyclistic-Project

A case study of Cyclistic bike sharing company based on a real-world Chicago-based company.

Ask Phase:

Business Task: How do annual members and casual riders use Cyclistic's bike-sharing service differently? Goal to Solve: How to convert more casual riders into annual members.
Stakeholders for this project: Lily Moreno, director of marketing/my manager The Marketing analytics team, my peers Cyclistic's Executive Team, decides whether or not to approve my recommendations.

Prepare Phase:

Data is located from divvytrip-data, Divvy is the Chicago-based bike-sharing company that has given us a data license to analyze and copy their public city data as long as the license's conditions are not broken. Data from this source is first-party data as their company has a first hand in gathering and processing it. Data is relevant, current, up-to-date and reliable. Data's integrity has been verified and personal user information has been encrypted to ensure privacy. Data has been gathered from all users regardless of anything such as membership, age, gender, or race. Thus ensuring it is unbias Data contains all necessary fields for analysis and membership comparison.

Process Phase:

Tools used: Bigquerry for SQL processing, analyzing and cleaning. The data set is too large for analysis in excel or sheets. Bigquerry has google cloud support that will allow for importing and storing the necessary file sizes of the data sets Tableau public for visualizations. Dashboards in Tableau are interactable and show in-depth information as well as being highly flexible and customizable. Google sheets will be used as a bridge between Bigquerry and tableau. Google slides will be used for presentation deliverables.
Please see the SQL query page for in-depth code on how the cleaning process was executed.

Data Cleaning Process:

Downloaded 13 months' worth of data from divvy-trips and renamed files to be able to be found easier later on.
Uploaded October 2021 to October 2022 as distinct tables into Bigquerry. Utilizing google cloud's bucket system as a full data set exceeds 1.2 gigs.
Used SQL queries to join 4 months of data into a single table and created new tables doing this, Repeated for the rest of the data set.
Created columns for ride_length (in minutes), weekday, date and start_time. Repeated for other data clusters and joined them all into one master data table. (approximately containing 6.3 million rows)
Filtered out longitude, latitude start and end columns as most are null and incomplete, as well as time being a better understanding of bike usage. Determined that long/lat was unreliable to determine distance.
Filtered out ride_id as it was encrypted so each was unique even if it was the same user, as well as to further protect data integrity and user privacy.
Filtered out station_id, end_station, and end_station_id as they were redundant and unreliable as they contained null values.
Deleted temp tables used to create a master data table.
Exploration of the master table revealed negative ride lengths from improper data collection. Deleted these rows and checked to ensure no other anomalies.

Analysis Process:

Aggerations made:
  1. Counts of weekday casual vs annual members with bike types and ride lengths.
  2. Counts of bike types with average ride_lengths casual vs annual members.
  3. Counts of start_stations with the count of ride_lengths as trips and member type.
  4. Mode of weekdays: count of ride_lengths as trips, member type and weekday.
  5. Average ride_length by date and member type.
  6. Start times before noon and afternoon, dates and member types.
  7. Count of ride_lengths as trips by date and member type.
 
Trends found:

Average ride length for casual members of 22.3 min and 12.2 min for annual members. Docked bikes are used the least but only by casual riders. Casual riders used service most on Saturday than Sunday, whereas annual members were consistent throughout the week with most trips in midweek(Wednesday). Casual riders use electric bikes the most, Annual are close to even on classic and electric. Classic bikes get the highest ride lengths. Casual riders use Streeter Dr & Grand ave station the most. Followed by DuSable Lake Shore Dr & Monroe street station. Annual members tend to not have a preference or use all stations consistently. Most trips are in the afternoon.

Analysis Conclusion:

Casual riders ride longer and more on the weekends. Whereas annual members ride consistently throughout the week but slightly less on weekends. Docked bikes are the least popular, electric is the most popular and classic is nearly as used as electric but get the longest trips per usage. For Casual members, Streeter Dr & Grand ave station is used the most followed by DuSable Lake Shore Dr & Monroe street station and Millennium Park.

Recommendations:

  1. Casual members use the service for longer during the weekends, especially during the summer months. I recommend targeting ads involving weekend deals during the summer for annual memberships.
  2. I recommend positioning ads at the following locations to reach the highest possible number of casual riders: Streeter Dr & Grand ave station, DuSable Lake Shore Dr & Monroe street station and Millennium Park.
  3. Classic bikes are used for the longest trips and electric are used more often but for shorter periods. I recommend considering a marketing campaign for annual price discounts for longer trips as well as one for using electric bikes to entice more casual to annual member conversions.

Thank you for reading! Please see other pages for SQL code, presentation slides and data visualizations.
