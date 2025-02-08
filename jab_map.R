library(countries)
library(dplyr)

setwd("C:/Users/Yen Yi/Downloads")

jab <- read.csv("JAB lit 1.csv")

# total number of papers
length(unique(jab$Title)) # 57

# total number of countries
length(unique(jab$CountryConti)) # 22

# how many papers per country?
jab_count <- jab %>% 
  group_by(CountryConti) %>% 
  summarise(papers=n(),
            .groups = 'drop')

# change column name to country
colnames(jab_count)[1] <- "country"

# plot map
quick_map(jab_count, plot_col = "papers", theme = "Candy", reverse_palette = TRUE, name_legend = "Number of Papers", verbose = T, width_border = 0.5)

