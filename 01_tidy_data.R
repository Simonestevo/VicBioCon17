#set working directory

setwd("C:/Users/Simone/Dropbox/Deakin_PhD/170206_R_Workshop/VicBioCon17")

#Script to load all tidyverse libraries

library(tidyverse)

#load readr package

library(readr)

#import and store bat data

bat <- readr::read_csv("./data/bat_dat.csv", 
                           col_types = cols(
                             Season = col_factor(levels = c(1,2)),
                             Habitat = col_factor(levels = c(0,1)),
                             Bioregion= col_factor(levels=c(1,2,3,4),NA)
                           ))

#subset only rows where season = 1 and sightings of species Chgouldii are over 100

# Define a standard error function called se:
se <- function(x) {
  sqrt(var(x, na.rm = TRUE) / length(na.omit(x)))
}

# Apply the function to the Chgouldii column
bat %>%
  select(1:4, Bioregion) %>%
  group_by(Bioregion, Season) %>%
  summarise(mean_Cg = mean(Chgouldii),
            se_Cg = se(Chgouldii))

