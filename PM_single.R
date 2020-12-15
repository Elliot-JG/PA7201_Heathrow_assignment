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
           ylab = "pm2.5 (ug/m3)", fontsize = 20, 
          
           # Line plot widths
           lwd = 2)
}

# Test  
pm2.5_single("HRL", 2010:2020) 
