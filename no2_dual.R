# A function to plot NO2 at 2 locations from the UK AURN

no2_dual <- function(P1, P2, P1_long, P2_long, years){

stations <- importAURN(
  site = c(P1, P2),
  pollutant = "no2",
  year = years)

stations_wide <<- stations %>% 
  select(-site)%>%

  pivot_wider(id_cols = date, 
            names_from = code, 
            values_from = c("no2")) 

# Fix column names by the name of the area
stations_wide_names <<- setNames(stations_wide, c("date", P1_long, P2_long))


timePlot(stations_wide_names, 
         pollutant = c(P1_long, P2_long),
         
         # Average data by month
         avg.time = "month",
         
         # Group in the same axis
         group = TRUE,
         lty = 1,
         
         # Line plot widths
         lwd = c(1, 2),
         ylab = "no2 (ug/m3)")
}

# Example
no2_dual("HRL", "HIL", "Harlington", "Hillingdon", 2015:2020)
