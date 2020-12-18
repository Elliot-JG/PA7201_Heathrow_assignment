## A function to plot NO2 data from the UK AURN network 

# Dependancies:
# openair 
# tidyverse

# A maximum of 4 places (Px) can be plotted, but more can be added

# Arguments
# Px = Area code, example -> "ECCL"
# Px_long = Name of area, example -> "Oldbury"
# years = Time period, example -> 2015:2020

NO2_plot <- function (P1, P2, P3, P4, P1_long, P2_long, P3_long, P4_long, years){
  
  
  # Load in data from the UK AURN
  pollutant <- importAURN(site =c(P1, P2, P3, P4),
                          pollutant = "no2",
                          year = years)
  
  # Obtain each area in a separate column 
  pollutant_wide <<- pollutant %>% 
    select(-site) %>%
    pivot_wider(id_cols = date, 
                names_from = code, 
                values_from = c("no2")) 
  
  # Fix column names by the name of the area 
  pollutant_wide_names <<- setNames(pollutant_wide, c("date", P1_long, P2_long, P3_long, P4_long))
  
  # Plot the result 
  timePlot(pollutant_wide_names, 
           pollutant = c(P1_long, P2_long, P3_long, P4_long),
           
           # Average data by month 
           avg.time = "year", 
           
           # Group in the same axis 
           group = TRUE,
           lty = 1, 
           
           # Line plot widths
           lwd = c(3, 3, 3, 3),
           ylab = "no2 (ug/m3)", 
           fontsize = 30, 
           date.breaks = 10,
  )
  
}

# Example 
NO2_plot("HRL", "HIL", "HORS", "BOLD", "Harlington", "West Drayton", "Westminster", "Oldbury", 2010:2020)
