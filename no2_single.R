# A function that plots no2, at a single location

no2_single <- function(location, years){
  
  Pollutant_place <- importAURN(
    site = location, 
    year = years, 
    meta = TRUE)
  
  timePlot(Pollutant_place, 
           pollutant = c("no2"),
           avg.time = "month",
           y.relation = "free", 
           ylab = "no2 (ug/m3)")
}

# Test  
no2_single("HIL", 2015:2020)  
