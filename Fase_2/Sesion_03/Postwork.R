#libraries
library(dplyr)
library(ggplot2)

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

(marginal.prob.home.goals <- as.data.frame(round(table(data.three.seasons$FTHG) / margin.table(table(data.three.seasons$FTHG)) *100, 2))) #relative freq home team goals
(marginal.prob.away.goals <- as.data.frame(round(table(data.three.seasons$FTAG) / margin.table(table(data.three.seasons$FTAG)) *100, 2))) #relative freq away team goals
joint.prob.goals <- round(table(data.three.seasons$FTHG, data.three.seasons$FTAG) / 380 * 100, 2) #relative joint freq home and away teams goals

ggplot(data = marginal.prob.home.goals, aes(x = Var1, y = Freq)) +
    geom_bar(stat="identity", col="black", fill = "green") + 
    ggtitle("¿Cuańtos goles anotan los locales?") +
    ylab("Porcentaje de partidos (%)") +
    xlab("Goles") + 
    theme_classic()

ggplot(data = marginal.prob.away.goals, aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", col = "black", fill = "green") + 
  ggtitle("¿Cuańtos goles anotan los visitantes?") +
  ylab("Porcentaje de partidos (%)") +
  xlab("Goles") + 
  theme_classic()

ggplot(as.data.frame(joint.prob.goals), aes(Var1, Var2)) +                           # Create heatmap with ggplot2
  ggtitle("Resultados más comunes") +
  xlab("Goles del local") + 
  ylab("Goles del visitante") + 
  geom_tile(aes(fill = Freq)) + 
  labs(fill = "Frecuencia") +
  scale_fill_gradient(low = "white", high = "black") 
