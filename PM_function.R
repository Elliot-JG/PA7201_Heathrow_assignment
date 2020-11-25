## A function to plot PM2.5 data from the UK AURN network 

# Dependencies:
# library(openair) 
# library(tidyverse)

# A maximum of 3 places (Px) can be plotted, but more can be added

# Arguments (quotation mark sensitive)
# Px = Area code, example -> "ECCL"
# Px_long = Name of area, example -> "Oldbury"
# years = Time period, example -> 2015:2020

pm2.5_plot <- function (P1, P2, P3, P1_long, P2_long, P3_long, years){
  
  
  # Load in data from the UK AURN
  pollutant <- importAURN(site =c(P1, P2, P3),
                          pollutant = "pm2.5",
                          year = years)
  
  # Obtain each area in a separate column
  pollutant_wide <<- pollutant %>% 
    select(-site) %>%
    pivot_wider(id_cols = date, 
                names_from = code, 
                values_from = c("pm2.5")) 
  
  # Fix column names by the name of the area
  pollutant_wide_names <<- setNames(pollutant_wide, c("date", P1_long, P2_long, P3_long))
  
  # Plot the result
  timePlot(pollutant_wide_names, 
           pollutant = c(P1_long, P2_long, P3_long),
           
           # Average data by month
           avg.time = "month",
           
           # Group in the same axis
           group = TRUE,
           lty = 1,
           
           # Line plot widths
           lwd = c(1, 2, 3),
           ylab = "pm2.5 (ug/m3)"
  )
  
}

# Example 
pm2.5_plot("HRL", "ECCL", "HORS", "Harlington", "Salford", "Westminster", 2015:2020)
