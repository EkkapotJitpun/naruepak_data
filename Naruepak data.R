install.packages("googlesheets4")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("lubridate")

library(googlesheets4)
library(ggplot2)
library(dplyr)
library(lubridate)

data <- read_sheet("https://docs.google.com/spreadsheets/d/1OfmyRinEQ2N0gCTw4j_8pqPHrUdrAOXWmSOMh6X72rY/edit#gid=409733318")

data

data_edit <- data %>%
  mutate(Pop = Pop*1000000)%>%
  mutate(pop_per_ICUNsx = Pop/ICUNsx) %>%
  mutate(total_per_pop = total/Pop)
str(data_edit)
  
pairs(data_edit[4:14])

ggplot(data_edit, aes(x = ICUNsx, y = percent_death)) + geom_point() + geom_smooth(method = "lm") +  geom_text(aes(label = hosp, hjust = .5, vjust = 1))
ggplot(data_edit, aes(y = percent_death, x = hosp)) + geom_col() 

ggplot(data_edit, aes(x = pop_per_ICUNsx, y = percent_death)) + geom_point() + geom_smooth(method = "lm") + geom_text(aes(label = hosp, hjust = 0.5, vjust = 1))

ggplot(data_edit, aes(x = NSx, y = total_per_pop)) + geom_point() + geom_smooth(method = "lm")+ geom_text(aes(label = hosp, hjust = 0.5, vjust = 1))

ggplot(data_edit, aes(x = NSx, y = Pop)) + geom_point() + geom_smooth(method = "lm")+ geom_text(aes(label = hosp, hjust = 0.5, vjust = 1))
