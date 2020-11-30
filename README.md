# PA7201_Heathrow_assignment

* The project is ONGOING (30/11/2020)
* Some files and aspects of the project stated in this README will be missing

This is a repository for the [**GY7702 EO of the atmosphere**](https://le.ac.uk/modules/2021/pa7201) assignment at the University of Leicester. 
The aim of this assignment was to explore air quality at Heathrow Airport through the use of the UK AURN Network, Sentinel 5P and the OpenAir R package. 
I also delved into functions which streamlined result output and lead to a 'cleaner' and more robust .Rmd file. 

This assignment is broken down into 4 stages: 

1. Import Uk AURN network data 
2. Isolate Heathrow air quality data 
3. Assess NO2 and PM2.5 concentrations at Heathrow 
4. Compare with other external sites (outside of Heathrow)
5. Explore spatial patterns with Sentinel 5P TROPOMI data 
6. Visualise results in front-facing report for public and stakeholders

## :dog: Table of contents 
* [General info](#introduction)
* [Prerequisites](#prerequisites)
* [Data](#data)
* [Usage](#usage)
* [Guide to the files](#guide)

## :rose: Prerequisites <a name="prerequisites"></a>
The dependencies for the assignment are:
* [tidyverse](https://www.tidyverse.org/)
* [openair](https://davidcarslaw.github.io/openair/)
* [knitr](https://yihui.org/knitr/)
* [kableExtra](https://haozhu233.github.io/kableExtra/)


## :octopus: Guide to the files <a name="guide"></a>
* **Master_code.R**  
  + In this file you will find experimental sections of code that address the aims of this project
  + Highly commented, raw code with brief comments on the data analysis
* **GY7201_Greatrix.Rmd** 
  + Report for public and stakeholders
  + An R Markdown version of *Master_code.R*.
  + While I am working in *Master_code.R* now, I predict that the work flow will move over mainly to this file 
* **GY7201_Greatrix.pdf**
  + A .pdf file created when *GY7702_Greatrix.Rmd* is executed or *knitted*
* **Archived.R**
  + Archived code that I was too scared to delete at the time
