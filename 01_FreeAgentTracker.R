
library(dplyr, lib.loc="C:/R/R-3.5.2/library")
library(rvest, lib.loc="C:/R/R-3.5.2/library" )
library(stringr, lib.loc="C:/R/R-3.5.2/library")
library(readr, lib.loc="C:/R/R-3.5.2/library")

url_csv2 <- 'https://raw.githubusercontent.com/alamine53/nbatrademap/master/raw_NbaCities.csv'
nbacities <- read_csv(url(url_csv2))

link <- paste0("https://www.basketball-reference.com/friv/free_agents.fcgi")
table <-  html_table(html(url(link) ), fill = TRUE)
transactions <-table[[1]] %>% 
  select(Rk, Player, WS, OTm, NTm, Terms) %>%
  filter(Rk != "Rk", NTm != "", as.numeric(Rk) < 11) 


for(s in 1:10) {
  temp <- transactions %>%
    filter(Rk == s)
  mvmt <- rbind(transactions, temp) %>%
    rbind(transactions, temp) %>%
    rbind(transactions, temp) %>%
    rbind(transactions, temp) %>%
    rbind(transactions, temp) %>%
    rbind(transactions, temp) %>%
    rbind(transactions, temp) %>%
    rbind(transactions, temp) %>%
    rbind(transactions, temp) %>%
    rbind(transactions, temp)
}




transactions    
    group_by(Player) %>%
    mutate(fr = 1:n()) 
}  arrange(Rk) %>%


