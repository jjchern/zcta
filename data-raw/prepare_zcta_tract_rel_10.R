
library(tidyverse)

# Download zcta_tract_rel_10.txt -----------------------------------------
# Download date: 2021-06-02

src = "https://www2.census.gov/geo/docs/maps-data/data/rel/zcta_tract_rel_10.txt"
lcl = "data-raw/zcta_tract_rel_10.txt"
if (!file.exists(lcl)) download.file(src, lcl)

# Ingest data -------------------------------------------------------------

read_csv("data-raw/zcta_tract_rel_10.txt") %>%
  docxtractr::mcga() %>%
  print() -> zcta_tract_rel_10

# Add variable labels
# Source: https://www.census.gov/programs-surveys/geography/technical-documentation/records-layout/2010-zcta-record-layout.html

labelled::var_label(zcta_tract_rel_10) =
  list(
    zcta5 = "2010 ZIP Code Tabulation Area",
    state = "2010 State FIPS Code",
    county = "2010 County FIPS Code",
    tract = "2010 Census Tract Code",
    geoid = "Concatenation of 2010 State and County",
    poppt = "Calculated 2010 Population for the relationship record",
    hupt = "Calculated 2010 Housing Unit Count for the relationship record",
    areapt = "Total Area for the record",
    arealandpt = "Land Area for the record",
    zpop = "2010 Population of the 2010 ZCTA",
    zhu = "2010 Housing Unit Count of the 2010 ZCTA",
    zarea = "Total Area of the 2010 ZCTA",
    zarealand = "Total Land Area of the 2010 ZCTA",
    trpop = "2010 Population of the 2010 County",
    trhu = "2010 Housing Unit Count of the 2010 Census Tract",
    trarea = "Total Area of the 2010 Census Tract",
    trarealand = "Total Land Area of the 2010 Census Tract",
    zpoppct = "The Percentage of Total Population of the 2010 ZCTA represented by the record",
    zhupct = "The Percentage of Total Housing Unit Count of the 2010 ZCTA represented by the record",
    zareapct = "The Percentage of Total Area of the 2010 ZCTA represented by the record",
    zarealandpct = "The Percentage of Total Land Area of the 2010 ZCTA represented by the record",
    trpoppct = "The Percentage of Total Population of the 2010 Census Tract represented by the record",
    trhupct = "The Percentage of Total Housing Unit Count of the 2010 Census Tract represented by the record",
    trareapct = "The Percentage of Total Area of the 2010 Census Tract represented by the record",
    trarealandpct = "The Percentage of Total Land Area of the 2010 Census Tract represented by the record"
  )

# Save the data frame -----------------------------------------------------

usethis::use_data(zcta_tract_rel_10, overwrite = TRUE, compress = "xz")

# Delete the raw file -----------------------------------------------------
# unlink(lcl)
# Or don't include the raw file in the github repo
