# 1. Housekeeping ---------------------------------------------------------

##load libraries needed
library(openair)
library(tidyverse)


# 2. Metadata -------------------------------------------------------------

# Access AURNS metadata
aurn_meta <- importMeta(source = "aurn")
aurn_meta

aurn_detailed <- importMeta(source = "aurn", all = TRUE)
aurn_detailed


# 3. Load HARLINGTON  ------------------------------------------------------------
Harlington <- importAURN(
  site = "HRL", 
  year = 2015:2020, 
  meta = TRUE)


# 4. Load HILLINGDON -----------------------------------------------
Hillingdon <- importAURN(
  site = "HIL", 
  year = 2015:2020, 
  meta = TRUE)


# 5. Time series NO2 -> HARLINGTON --------------------------------------------
timePlot(Harlington, 
         pollutant = c("no2"),
         avg.time = "month",
         y.relation = "free")


# 6. Time series NO2 -> HILLINGDON ---------------------------------------------
timePlot(Hillingdon, 
         pollutant = c("no2"),
         avg.time = "month",
         y.relation = "free")


# 7. Joint time series -> HAR/HIL -----------------------------------------

## import data from Harlingdon and Hillington
hrl_hil <- importAURN(
  site = c("HRL", "HIL"), 
  year = 2015:2020)

## Select everything except "site names" from the data set 
hrl_hil_subset <- select(hrl_hil, -site)

## Pivot data wide
hrl_hil_wide <- pivot_wider(
  hrl_hil_subset, 
  
  # Make new column called dates
  id_cols = date, 
  
  # New column names from the 'code' of the location
  names_from = code, 
  
  # In these new columns put the values from the old columns no2, pm2.5
  values_from = c("no2", "pm2.5")
)

## Plot HRL and HIL together 
timePlot(hrl_hil_wide, 
         pollutant = c("no2_HRL", "no2_HIL"),
         avg.time = "month", 
         group = TRUE,
         lty = 1, 
         lwd = c(1, 3),
         ylab = "no2 (ug/m3)"
)


# 8. Comparing with 3rd site and Central London  ---------------------------------------------

# We need a site that matches in type, but obviously doesn't have an airport next
# to it 

# Harlington  = Urban industrial
# Hillingdon = Urban background

# and both are situated in Greater London, so lets search by those categories and see what we get

no2_urban_gLondon <- filter(
  aurn_detailed,
  variable == "NO2",
  site_type == c("Urban Background", "Urban Industrial"), 
  zone == "Greater London", 
  end_date == "ongoing"
)

# Interestingly Hillingdon does not show up in this search, but Hingley does.

# It's situated SW of a train station, so not affected (too much) by the prevailing 
# wind but still surrounded by enough infrastructure, and in Greater London for this maybe to be an interesting comparison

# Additionally, because we suspect the M4 is the thing having the effect, lets get another site that is situated on a Motorway
# Oldbury Road Birmingham (BOLD) sits on the M5

# Lets also bring in Central London, West minster as we would expect this to be quite high and it may be a useful comparison,
# for some context of how bad it really is to live off the M4 Junction at Heathrow 

# Lets import HG4 and Westminster and repeat step 7 

NO2_Urban <- importAURN(
  site = c("HRL", "HIL", "HG4", "HORS", "BOLD"), 
  year = 2015:2020)

NO2_Urban <- NO2_Urban %>%
  
  select(-site) %>%
  
  ## Pivot data wide
  pivot_wider(
    # Make new column called dates
    id_cols = date,
    
    # New column names from the 'code' of the location
    names_from = code,
    
    # In these new columns put the values from the old columns no2, pm2.5
    values_from = c("no2"))


## Plot HRL, HIL, HG4 and HORS together 
timePlot(NO2_Urban, 
         pollutant = c("no2_HRL", "no2_HIL", "no2_HG4", "no2_HORS", "no2_BOLD"),
         avg.time = "month", 
         group = TRUE,
         lty = 1, 
         lwd = c(1, 3, 5),
         ylab = "no2 (ug/m3)"
)

# Wow, so living in Hillingdon is worse, by a long way than living in Central London 
# It is unclear what pollution the planes bring, it is very clear however the indirect effect that air travel 
# has on the surrounding air quality 

# Sites in a similar location with a similar classification do not suffer as much as Hillingdon


# 9. Wind vectors -> HILLINGDON -------------------------------------------

timePlot(Hillingdon, 
         pollutant = "no2",
         avg.time = "month",
         windflow = list(
           scale = 0.1, 
           lwd = 2, 
           col = "turquoise4"), 
         lwd = 3, 
         group = FALSE, 
         ylab = "concentration (ug/m3)")

# 10. Wind rose -> HILLINGDON ----------------------------------------------

# Lets see if the wind is having any effect on the increased pollutants at Hillingdon 

pollutionRose(Hillingdon, pollutant = "no2")

# So a majority of the wind comes from the South West. The wind from the South 
# brings a fair amount of pollution. 


# 11. Wind rose -> HARLINGTON ----------------------------------------------

pollutionRose(Harlington, pollutant = "no2")

# Same pattern, just less overall pollution


# 12. Time series PM2.5 -> HARLINGTON --------------------------------------------
timePlot(Harlington, 
         pollutant = c("pm2.5"),
         avg.time = "month",
         y.relation = "free")


# 14. Comparing PM2.5 -> HARLINGDON, SALFORD AND WESTMINSTER ---------------------------
PM2.5_Urban <- importAURN(
  site = c("HRL", "ECCL", "HORS"), 
  year = 2018:2020, 
  pollutant = "pm2.5")

