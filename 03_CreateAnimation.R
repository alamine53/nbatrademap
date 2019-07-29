setwd("~/Documents/04_Projects/2019/02_NBA_TradeAnimation")

install.packages(magick)
#load packages
library(dplyr)
library(maps)
library(ggmap)
library(gganimate)
library(ggplot2)
library(grid)
library(gridExtra)
library(viridis)

#load main dataset
labs <- flyover %>%
  ungroup() %>%
  mutate(screen = 1:n())

labs
# load empty USA map // for map without states --> map_data("usa")
usa <- map_data("usa") 
gg1 <- ggplot() + 
  labs(title = "NBA Free Agent Tracker, 2019", subtitle = "This is map of player movements that occurred during the 2019 summer free agency period.") + 
  geom_polygon(data = usa, aes(x = long, y = lat, group = group), fill = "white", colour = "black") +
  #geom_point(data = nbacities, aes(x = long, y = lat), shape = 21, color = "gray", size = 3) +
 # geom_text(data = nbacities, aes(x = long, y = lat, label = names), vjust = 0, nudge_y = 0, hjust = 0, nudge_x = 0, size = 3, 
            #check_overlap = TRUE, family = "Times New Roman") +
  #geom_label(data = nbacities, aes(x = long, y = lat, fill = factor(east), colour = "white", fontface = "bold")) +
  geom_label(data = nbacities, aes(x = long, y = lat, label = names, fill = factor(east)), colour = "white", fontface = "bold", show.legend = FALSE) + 
  theme(panel.background = element_rect(colour = "black", fill = "lightblue"), 
        panel.grid.major = element_blank(), panel.grid.minor = element_blank()) 
gg1

gg11  <- ggplot() + 
  labs(title = "NBA Free Agent Tracker, 2019", 
       subtitle = "This is map of player movements that occurred during the 2019 summer free agency period.",
       caption = "Data: BBRef | Creation: Ramzy Al-Amine | courtsidecoder.home.blog") + 
  geom_polygon(data = usa, aes(x = long, y = lat, group = group), fill = "white", colour = "black") +
  geom_label(data = nbacities, aes(x = long, y = lat, label = names, fill = factor(east)), colour = "#22211d", fontface = "bold", show.legend = FALSE) + 
  theme_void() +
  theme(text = element_text(color = "#22211d"),  # plot.background = element_rect(fill = "#f5f5f2", color = NA), 
    panel.background = element_rect(fill = "#f5f5f2", color = NA), 
    legend.background = element_rect(fill = "#f5f5f2", color = NA),
    plot.title = element_text(size= 17, hjust=0.01, color = "#4e4d47", margin = margin(b = -0.1, t = 0.4, l = 2, unit = "cm")),
    plot.subtitle = element_text(size= 12, hjust=0.01, color = "#4e4d47", margin = margin(b = -0.1, t = 0.43, l = 2, unit = "cm")),
    plot.caption = element_text( size=8, color = "#4e4d47", margin = margin(b = 0.3, r=100, unit = "cm") ),
    panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
    axis.title.x = element_blank(), axis.text.x = element_blank(), axis.ticks.x = element_blank(),
    axis.title.y = element_blank(), axis.text.y = element_blank(), axis.ticks.y = element_blank(),
    legend.position = c(0.7, 0.09)) 
gg11


s# generate map using flyover data (no images)
gg2 <- gg11 + 
  geom_point(data = labs, aes(x = long, y = lat), shape = 21, color = "black", fill = "pink", size = 2) +
  geom_text(data = labs, aes(x = long, y = lat, label = Player), 
            vjust = 0, nudge_y = -1, 
            hjust = 0, nudge_x = -3,
            colour = "black")

gg2

#layout <- matrix(c(1,2),3,2,byrow = TRUE)
#multiplot(gg1,trademap, cols=2)

# generate screen variable for order
# animate gg2
  ggm <- gg2 +
    transition_time(screen) + 
    #labs(title = paste("Day", "{round(frame_time,0)}")) +
    shadow_wake(wake_length = 0)
  
  trademap <- animate(ggm, fps = 24, duration = 20, height=450, width=600) 
  
