
library(tidyverse)

# Download zcta_county_rel_10.txt -----------------------------------------
# Download date: 2015-11-04

src = "http://www2.census.gov/geo/docs/maps-data/data/rel/zcta_county_rel_10.txt"
lcl = "data-raw/zcta_county_rel_10.txt"
if (!file.exists(lcl)) download.file(src, lcl)

# Ingest data -------------------------------------------------------------

read_csv("data-raw/zcta_county_rel_10.txt") %>%
  docxtractr::mcga() %>%
  print() -> zcta_county_rel_10

# Add variable labels
# Source: https://www.census.gov/geo/maps-data/data/zcta_rel_layout.html

labelled::var_label(zcta_county_rel_10) =
  list(
    zcta5 = "2010 ZIP Code Tabulation Area",
    state = "2010 State FIPS Code",
    county = "2010 County FIPS Code",
    geoid = "Concatenation of 2010 State and County",
    poppt = "Calculated 2010 Population for the relationship record",
    hupt = "Calculated 2010 Housing Unit Count for the relationship record",
    areapt = "Total Area for the record",
    arealandpt = "Land Area for the record",
    zpop = "2010 Population of the 2010 ZCTA",
    zhu = "2010 Housing Unit Count of the 2010 ZCTA",
    zarea = "Total Area of the 2010 ZCTA",
    zarealand = "Total Land Area of the 2010 ZCTA",
    copop = "2010 Population of the 2010 County",
    cohu = "2010 Housing Unit Count of the 2010 County",
    coarea = "Total Area of the 2010 County",
    coarealand = "Total Land Area of the 2010 County",
    zpoppct = "The Percentage of Total Population of the 2010 ZCTA represented by the record",
    zhupct = "The Percentage of Total Housing Unit Count of the 2010 ZCTA represented by the record",
    zareapct = "The Percentage of Total Area of the 2010 ZCTA represented by the record",
    zarealandpct = "The Percentage of Total Land Area of the 2010 ZCTA represented by the record",
    copoppct = "The Percentage of Total Population of the 2010 County represented by the record",
    cohupct = "The Percentage of Total Housing Unit Count of the 2010 County represented by the record",
    coareapct = "The Percentage of Total Area of the 2010 County represented by the record",
    coarealandpct = "The Percentage of Total Land Area of the 2010 County represented by the record"
  )

# Save the data frame -----------------------------------------------------

usethis::use_data(zcta_county_rel_10, overwrite = TRUE)

# Delete the raw file -----------------------------------------------------
# unlink(lcl)
# Or don't include the raw file in the github repo
