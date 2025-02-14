### Preamble ####
# Purpose: Simulates immunization data form opendatatoronto
# Author: Ruoxian Wu
# Date: 21 January 2023
# Contact: scarletruoxian.wu@utoronto.ca
# Pre-requisites: 
#install.packages("opendatatoronto")
#install.packages("tidyverse")
#install.packages("dplyr")

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)


#### Download data ####

# get package
package <- show_package("99ff3657-b2e7-4005-a6fd-c36838ccc96d")
package

# get all resources for this package
resources <- list_package_resources("99ff3657-b2e7-4005-a6fd-c36838ccc96d")

# identify datastore resources; by default, Toronto Open Data sets datastore 
#resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))
datastore_resources

# load the first datastore resource for analysis
data_1819 <- filter(datastore_resources, row_number()==1) %>% get_resource()
data_1819

data_1718 <- filter(datastore_resources, row_number()==4) %>% get_resource()
data_1718

#### Save data ####
# I assigned the raw data as when you downloaded it.
write_csv(data_1718, "inputs/data/immunization1718.csv") 
write_csv(data_1819, "inputs/data/immunization1819.csv") 