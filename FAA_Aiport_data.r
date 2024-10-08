library(tidyverse)

flight_data_shortened <- read.csv("data/shortened_flight_data")

# US Airport Data
# Los Angeles Airport
LAX_data <- flight_data_shortened %>% filter(destination == "KLAX")
LAX_data$country <- "USA"

# Hartsfield-Jackson Atlanta International Airport
ATL_data <- flight_data_shortened %>% filter(destination == "KATL")
ATL_data$country <- "USA"


# Dallas–Fort Worth International Airport 
DFW_data <- flight_data_shortened %>% filter(destination == "KDFW")
DFW_data$country <- "USA"

# Denver International Airport
DEN_data <- flight_data_shortened %>% filter(destination == "KDEN")
DEN_data$country <- "USA"


# Chicago’s O’Hare International Airport
ORD_data <- flight_data_shortened %>% filter(destination == "KORD")
ORD_data$country <- "USA"

# CANADA AIRPORT DATA
# Edmonton International Airport
YEG_data <- flight_data_shortened %>% filter(destination == "CYEG")
YEG_data$country <- "CAN"


# Calgary International Airport
YYC_data <- flight_data_shortened %>% filter(destination == "CYYC")
YYC_data$country <- "CAN"


# Montreal-Trudeau International Airport
YUL_data <- flight_data_shortened %>% filter(destination == "CYUL")
YUL_data$country <- "CAN"


# Vancouver International Airport
YVR_data <- flight_data_shortened %>% filter(destination == "CYVR")
YVR_data$country <- "CAN"


# Toronto-Pearson International Airport
YYZ_data <- flight_data_shortened %>% filter(destination == "CYYZ")
YYZ_data$country <- "CAN"

combined_data_US <- rbind(LAX_data, ATL_data, DEN_data, DFW_data, ORD_data)
combined_data_US$day <- as.Date(combined_data_US$day)
str(combined_data_US)


flight_count_US <- combined_data_US %>% 
                      group_by(day) %>% 
                      summarise(num_flights = n())

ggplot(flight_count_US, aes(x = day, y = num_flights)) +
  geom_line() +
  labs(title = "Number of Flights Over Time in the US (Arriving)", x = "Date", y = "Number of Flights") +
  theme_bw() +
  ylim(0, 6000) +
  xlim(as.Date("2020-03-01"), as.Date("2020-03-31"))

combined_data_CAN <- rbind(YEG_data, YYC_data, YUL_data, YVR_data, YYZ_data)
combined_data_CAN$day <- as.Date(combined_data_CAN$day)
str(combined_data_CAN)

flight_count_CAN <- combined_data_CAN %>% 
  group_by(day) %>% 
  summarise(num_flights = n())

ggplot(flight_count_CAN, aes(x = day, y = num_flights)) +
  geom_line() +
  labs(title = "Number of Flights Over Time in Canada (Arriving)", x = "Date", y = "Number of Flights") +
  theme_bw() +
  ylim(0, 6000) +
  xlim(as.Date("2020-03-01"), as.Date("2020-03-31"))

