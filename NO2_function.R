Pollutants <- function (P1, P2, P3, P4, P1_long, P2_long, P3_long, P4_long, years, pollutants){
  
  
  
  pollutant <- importAURN(site =c(P1, P2, P3, P4),
                          pollutant = pollutants,
                          year = years)
  
  pollutant_wide <<- pollutant %>% 
    select(-site) %>%
    pivot_wider(id_cols = date, 
                names_from = code, 
                values_from = c(pollutants)) 
  
  pollutant_wide_names <<- setNames(pollutant_wide, c("date", P1_long, P2_long, P3_long, P4_long))
  
  timePlot(pollutant_wide_names, 
           pollutant = c(P1_long, P2_long, P3_long, P4_long),
           avg.time = "month", 
           group = TRUE,
           lty = 1, 
           lwd = c(1, 2, 3, 4),
           ylab = "no2 (ug/m3)"
  )
  
}
Pollutants("HRL", "HIL", "HORS", "BOLD", "Harlington", "Hillingdon", "Westminster", "Oldbury", 2015:2020, "no2")
