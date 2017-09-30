library(dbplyr)
library(dplyr)
library(RSQLite)

#Set up connection to the SQLite database
connection <- dbConnect(RSQLite::SQLite(), dbname = "../../database.sqlite")

#Print all tables
print("Tables")
all_tables <-  dbListTables(connection)
print(all_tables)

#Print information about 'docs' table
docs <- dbGetQuery(connection, sprintf("SELECT t1.away_team_api_id, t1.home_team_api_id,(SELECT t2.team_long_name FROM Team t2 WHERE t1.home_team_api_id = t2.team_api_id),(SELECT t3.team_long_name FROM Team t3 WHERE t1.away_team_api_id = t3.team_api_id) FROM Match t1 WHERE t1.season = '2015/2016' AND t1.country_id= '1729';"))
print("Column Name")
print(colnames(docs))
print(sprintf("Number of Rows: %d", nrow(docs)))

print(docs);

#Clean up connection to the database
dbDisconnect(connection)
