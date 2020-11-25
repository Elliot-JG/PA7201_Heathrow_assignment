PM2.5_Urban <- importAURN(
  site = c("HRL", "ECCL", "HORS"), 
  year = 2018:2020, 
  pollutant = "pm2.5")

# Strip the time from the date column
# We don't need it and it's confusing things
PM2.5_Urban_Years <- format(as.POSIXct(strptime(PM2.5_Urban$date,"%Y-%m-%d %H:%M:%S",tz="")) ,format = "%Y-%m-%d")

# Set date column as 'date'
PM2.5_Urban$date = as.Date(PM2.5_Urban$date, format = "%Y-%m-%d")

# Make a new date column that we can easily manipulate and use for "mutate"
PM2.5_Urban$date_month <- format(as.POSIXct(strptime(PM2.5_Urban$date,"%Y-%m-%d",)) ,format = "%Y-%m")

# Prep for mutate by removing Na values 
PM2.5_Urban <- na.omit(PM2.5_Urban)

# average for each month 
PM2.5_Urban <- PM2.5_Urban %>%
  group_by(site, date_month)%>%
  mutate(avg_pm2.5 = mean(pm2.5))

# Then something maybe like 
# group_by(avg_pm2.5)
#   And drop all the 



# Plot it up 

ggplot2::ggplot(
  data = PM2.5_Urban, 
  mapping = aes(
    x = date,
    format = "%Y-%m-%d",
    y = avg_pm2.5,
    colour = site))+
  geom_line()+
  scale_x_date(
    date_breaks = "1 year",
    date_labels = "%Y") +
  xlab("Year")+
  ylab("PM2.5 (ug/m3)")