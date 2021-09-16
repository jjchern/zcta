
library(tidyverse)

# Download crosswalk file -------------------------------------------------
# Download date: "2015-11-07 23:43:08 CST"

url = "http://www.udsmapper.org/docs/zip_to_zcta_2015.xlsx"
lcl = "data-raw/zip_to_zcta_2015.xlsx"
if(!file.exists(lcl)) download.file(url, lcl)

# Minimum processing needed -----------------------------------------------

readxl::read_excel(lcl) %>%
  docxtractr::mcga() %>%
  print() -> zipzcta

# Save --------------------------------------------------------------------

devtools::use_data(zipzcta, overwrite = TRUE)
