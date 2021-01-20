#getting data
data.la.liga <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")
#home and away goals per match
(data.la.liga$FTHG)
(data.la.liga$FTAG)
#documentation regarding table function
?table
#frequency tables for goals scored
round(table(data.la.liga$FTHG) / margin.table(table(data.la.liga$FTHG)), 2) #relative freq home team goals
round(table(data.la.liga$FTAG) / margin.table(table(data.la.liga$FTAG)), 2) #relative freq away team goals
round(table(data.la.liga$FTHG, data.la.liga$FTAG) / 380 * 100, 2) #relative joint freq home and away teams goals
