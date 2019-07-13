rm(list = ls())
setwd("~/Documents/04_Projects/NBATradeMap")

library("ggplot2", lib.loc="~/Library/R/3.5/library")
library("readr", lib.loc="~/Library/R/3.5/library")
library("dplyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.5/Resources/library")
library(ggplot2)
library(maps)
library(ggthemes)
library(DT)

url_csv <- 'https://raw.githubusercontent.com/alamine53/nbatrademap/master/raw1.csv'
url_csv2 <- 'https://raw.githubusercontent.com/alamine53/nbatrademap/master/raw_NbaCities.csv'
nbaplayers <- read_csv(url(url_csv))
nbacities <- read_csv(url(url_csv2))
labs <- nbacities
#datatable(nbaplayers, rownames = FALSE,
 #         options = list(pageLength = 5))

# map without state borders

usa <- map_data("usa") 
gg1 <- ggplot() + 
  geom_polygon(data = usa, aes(x = long, y = lat, group = group)) + 
  coord_quickmap()

gg1 + 
  geom_point(data = labs, aes(x = long, y = lat), shape = 21, color = "black", fill = "gray", size = 3) +
  geom_text(data = labs, aes(x = long, y = lat, label = names), hjust = 0, nudge_x = 1)


