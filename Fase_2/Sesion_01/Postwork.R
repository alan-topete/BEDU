data.la.liga <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")
round(table(data.la.liga$FTHG) / margin.table(table(data.la.liga$FTHG)), 2)
round(table(data.la.liga$FTAG) / margin.table(table(data.la.liga$FTAG)), 2)
round(table(data.la.liga$FTHG, data.la.liga$FTAG) / 380 * 100, 2)
