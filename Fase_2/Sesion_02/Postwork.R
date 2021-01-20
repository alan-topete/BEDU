#libraries
library(dplyr)

#getting datasets
data.la.liga.18 <- read.csv("https://www.football-data.co.uk/mmz4281/1718/SP1.csv")
data.la.liga.19 <- read.csv("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")
data.la.liga.20 <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

#exploratory analysis
str(data.la.liga.18)
str(data.la.liga.19)
str(data.la.liga.20)

head(data.la.liga.18)
head(data.la.liga.19)
head(data.la.liga.20)

View(data.la.liga.18)
View(data.la.liga.19)
View(data.la.liga.20)

summary(data.la.liga.18)
summary(data.la.liga.19)
summary(data.la.liga.20)

#merging all three datasets into one
data.three.seasons <- rbind(
data.la.liga.18 %>% select (Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR),
data.la.liga.18 %>% select (Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR),
data.la.liga.18 %>% select (Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)
)
#setting date column as date class
data.three.seasons <- data.three.seasons %>% mutate(Date = as.Date(Date, format = "%d.%m.%Y"))
#checking types of each column
str(data.three.seasons)
