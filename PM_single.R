# A function that plots PM2.5, at a single location

pm2.5_single <- function(location, years){
  
  Pollutant_place <- importAURN(
    site = location, 
    year = years, 
    meta = TRUE)
  
  timePlot(Pollutant_place, 
           pollutant = c("pm2.5"),
           avg.time = "month",
           y.relation = "free", 
           ylab = "pm2.5 (ug/m3)", 
           fontsize = 30, 
          
           # Line plot widths
           lwd = 3, 
          date.breaks = 12)
}

# Test  
pm2.5_single("HRL", 2008:2020) 
