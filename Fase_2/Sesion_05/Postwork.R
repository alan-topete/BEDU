#libraries
library(dplyr)
library(ggplot2)
library(fbRanks)

#getting datasets
data.la.liga.18 <- read.csv("https://www.football-data.co.uk/mmz4281/1718/SP1.csv")
data.la.liga.19 <- read.csv("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")
data.la.liga.20 <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

#merging all three datasets into one
SmallData <- rbind(
  data.la.liga.18 %>% select (date = Date, home.team = HomeTeam, home.score = FTHG, away.team = AwayTeam,  away.score = FTAG),
  data.la.liga.19 %>% select (date = Date, home.team = HomeTeam, home.score = FTHG, away.team = AwayTeam,  away.score = FTAG),
  data.la.liga.20 %>% select (date = Date, home.team = HomeTeam, home.score = FTHG, away.team = AwayTeam,  away.score = FTAG)
)
SmallData <- mutate(SmallData, date= as.Date(date,"%d/%m/%y") )
write.csv(SmallData, file = "soccer.csv", row.names = FALSE)
listasoccer <- create.fbRanks.dataframes("soccer.csv")

anotaciones <- listasoccer$scores
equipos <- listasoccer$teams
fechas <- unique(listasoccer$scores$date)
ranking = rank.teams(scores = anotaciones, teams = equipos, min.date = fechas[1], max.date = fechas[length(fechas)-1])
predict(ranking, date = fechas[length(fechas)])

