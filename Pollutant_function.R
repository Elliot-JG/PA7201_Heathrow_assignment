Pollutants <- function (P1, P2, P3, P1_long, P2_long, P3_long){
  
  
  
  pollutant <- importAURN(site =c(P1, P2, P3),
                          pollutant = "no2",
                          year = 2015:2020)
  
  pollutant_wide <<- pollutant %>% 
    select(-site) %>%
    pivot_wider(id_cols = date, 
                names_from = code, 
                values_from = c("no2")) 
  
  pollutant_wide_names <<- setNames(pollutant_wide, c("date", P1_long, P2_long, P3_long))
  
  timePlot(pollutant_wide_names, 
           pollutant = c(P1_long, P2_long, P3_long),
           avg.time = "month", 
           group = TRUE,
           lty = 1, 
           lwd = c(1, 3, 5),
           ylab = "nox (ug/m3)"
  )
  
}
Pollutants("HRL", "HIL", "HORS", "Harlington", "Hillingdon", "Westminster")
xfgfgh