bar.data <- flyover %>%
  group_by(Player) %>%
  summarise(WS = mean(as.numeric(WS)), Rk = mean(as.numeric(Rk))) %>%
  arrange(Rk) %>%
  mutate(total = sum(WS)) %>%
  mutate(screen = 1:n()) %>%
  mutate(totalWS = cumsum(WS))

bar.data
flyover
bar.data2 <- flyover %>%
  ungroup() %>%
  select(Rk, Player, WS, fr) %>%
  mutate(WS.anim = ifelse(fr <11, as.numeric(WS) / 10, 0)) %>%
  mutate(total = cumsum(WS.anim)) %>%
  mutate(screen = 1:n())

View(bar.data2)  

p <- ggplot(data=bar.data2, aes(x=1, y=total, colour = Player), show.legend = FALSE) +
  geom_bar(stat='identity', position = "identity", width = 0.001, show.legend = FALSE) +
  geom_label(aes(label = WS, colour = "#22211d", fontface = "bold")) + 
        theme(text = element_text(color = "#22211d"),  # plot.background = element_rect(fill = "#f5f5f2", color = NA), 
        panel.background = element_rect(fill = "#f5f5f2", color = NA), 
        plot.title = element_text(size= 17, hjust=0.01, color = "#4e4d47", margin = margin(b = -0.1, t = 0.4, l = 2, unit = "cm")),
        plot.subtitle = element_text(size= 12, hjust=0.01, color = "#4e4d47", margin = margin(b = -0.1, t = 0.43, l = 2, unit = "cm")),
        plot.caption = element_text( size=8, color = "#4e4d47", margin = margin(b = 0.3, r=100, unit = "cm") ),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.title.x = element_blank(), axis.text.x = element_blank(), axis.ticks.x = element_blank(),
        axis.title.y = element_blank(), axis.text.y = element_blank(), axis.ticks.y = element_blank(),
        legend.position="none") 
p

ggbar <- p +
  transition_time(screen) +
  shadow_wake(wake_length = 0)

tradebar <- animate(ggbar, fps = 24, duration = 20, height=450, width=60)
anim_save("tradebar.gif", tradebar, path = NULL)

