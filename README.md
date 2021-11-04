
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Travis-CI Build
Status](https://travis-ci.org/jjchern/zcta.svg?branch=master)](https://travis-ci.org/jjchern/zcta)

# About

This R data package intends to store 2010 Census ZIP Code Tabulation
Area (ZCTA) Relationship files. So far it includes:

-   official US Census “2010 ZCTA to County Relationship File”
    (`zcta_county_rel_10.rda`)

-   official US Census “2010 ZCTA to Tract Relationship File”
    (`zcta_tract_rel_10.rda`)

-   ZIP Code to ZCTA crosswalk table developed by John Snow,
    Inc. (`zipzcta.rda`)

# Motivation

Linking the USPS’s ZIP codes to US counties is tedious:

-   ZIP codes do not resemble spatial entities; they are created for
    delivering mails. ZIP codes also change over time.

-   To get a truly spatial representations of ZIP codes, the US Census
    Bureau develops the concept of ZIP Code tabulation areas (ZCTAs),
    which approximates ZIP codes. But

    -   Census does not release an official crosswalk between ZIP codes
        and ZCTAs.

    -   Census does release relationship files between ZCTAs and
        counties, but at least 25% of the ZCTAs cannot be uniquely
        linked to counties.

A proposed solution: ZIP codes -> ZCTAs -> counties. This package
contains data for connecting these links using official US Census
relationship files and ZIP-to-ZCTA crosswalk files created by John Snow,
Inc.

# Useful Links

-   [Census File Data
    Source](https://www.census.gov/geographies/reference-files/time-series/geo/relationship-files.2010.html#par_textimage_674173622)

-   [Explanation of the 2010 ZCTA to County Relationship
    File](http://www2.census.gov/geo/pdfs/maps-data/data/rel/explanation_zcta_county_rel_10.pdf)

-   [Census ZIP Code Tabulation Areas
    page](https://www.census.gov/programs-surveys/geography/guidance/geo-areas/zctas.html)

-   [2010 ZIP Code Tabulation Area (ZCTA) Relationship File Layouts and
    Contents](https://www.census.gov/programs-surveys/geography/technical-documentation/records-layout/2010-zcta-record-layout.html)

-   [UDS Mapper](https://udsmapper.org/) hosts the ZCTA-ZIP crosswalk
    file, which should be able to link ZIP codes to 2010 Census ZCTAs.
    Newer crosswalks are also available from UDS Mapper.

-   [The ZIP Code Resources
    Page](http://mcdc.missouri.edu/allabout/zipcodes.html)

-   [All About ZIP Codes: 2010
    Supplement](http://mcdc.missouri.edu/allabout/zipcodes_2010supplement.shtml)

# Installation

``` r
# install.packages("devtools")
devtools::install_github("jjchern/zcta")
```

# Usage

``` r
# devtools::install_github("jjchern/gaze")

library(tidyverse)

# ZCTA to counties
zcta::zcta_county_rel_10
#> # A tibble: 44,410 x 24
#>    zcta5 state county geoid poppt  hupt   areapt arealandpt  zpop   zhu    zarea
#>    <chr> <chr> <chr>  <chr> <dbl> <dbl>    <dbl>      <dbl> <dbl> <dbl>    <dbl>
#>  1 00601 72    001    72001 18465  7695   1.65e8  164333375 18570  7744   1.67e8
#>  2 00601 72    141    72141   105    49   2.33e6    2326414 18570  7744   1.67e8
#>  3 00602 72    003    72003 41520 18073   8.37e7   79288158 41520 18073   8.37e7
#>  4 00603 72    005    72005 54689 25653   8.21e7   81880442 54689 25653   8.21e7
#>  5 00606 72    093    72093  6276  2740   9.49e7   94851862  6615  2877   1.10e8
#>  6 00606 72    121    72121    89    38   6.68e6    6679806  6615  2877   1.10e8
#>  7 00606 72    153    72153   250    99   8.05e6    8048393  6615  2877   1.10e8
#>  8 00610 72    003    72003   160    62   2.37e5     237185 29016 12618   9.72e7
#>  9 00610 72    011    72011 28856 12556   9.70e7   92784282 29016 12618   9.72e7
#> 10 00612 72    013    72013 66938 30961   1.84e8  174066899 67010 30992   1.85e8
#> # ... with 44,400 more rows, and 13 more variables: zarealand <dbl>,
#> #   copop <dbl>, cohu <dbl>, coarea <dbl>, coarealand <dbl>, zpoppct <dbl>,
#> #   zhupct <dbl>, zareapct <dbl>, zarealandpct <dbl>, copoppct <dbl>,
#> #   cohupct <dbl>, coareapct <dbl>, coarealandpct <dbl>

# ZIP codes to ZCTAs 
zcta::zipzcta 
#> # A tibble: 41,270 x 5
#>    zip   po_name       state zip_type                             zcta 
#>    <chr> <chr>         <chr> <chr>                                <chr>
#>  1 96916 Merizo        GU    Post Office or large volume customer 96916
#>  2 96917 Inarajan      GU    Post Office or large volume customer 96917
#>  3 96928 Agat          GU    Post Office or large volume customer 96928
#>  4 96915 Santa Rita    GU    ZIP Code area                        96915
#>  5 96923 Mangilao      GU    Post Office or large volume customer 96913
#>  6 96910 Hagatna       GU    ZIP Code area                        96910
#>  7 96932 Hagatna       GU    Post Office or large volume customer 96932
#>  8 96919 Agana Heights GU    Post Office or large volume customer 96910
#>  9 96921 Barrigada     GU    Post Office or large volume customer 96921
#> 10 96913 Barrigada     GU    ZIP Code area                        96913
#> # ... with 41,260 more rows

# Show variable labels, and whether value label exists for certain variables
# devtools::install_github("larmarange/labelled")
labelled::var_label(zcta::zcta_county_rel_10)
#> $zcta5
#> [1] "2010 ZIP Code Tabulation Area"
#> 
#> $state
#> [1] "2010 State FIPS Code"
#> 
#> $county
#> [1] "2010 County FIPS Code"
#> 
#> $geoid
#> [1] "Concatenation of 2010 State and County"
#> 
#> $poppt
#> [1] "Calculated 2010 Population for the relationship record"
#> 
#> $hupt
#> [1] "Calculated 2010 Housing Unit Count for the relationship record"
#> 
#> $areapt
#> [1] "Total Area for the record"
#> 
#> $arealandpt
#> [1] "Land Area for the record"
#> 
#> $zpop
#> [1] "2010 Population of the 2010 ZCTA"
#> 
#> $zhu
#> [1] "2010 Housing Unit Count of the 2010 ZCTA"
#> 
#> $zarea
#> [1] "Total Area of the 2010 ZCTA"
#> 
#> $zarealand
#> [1] "Total Land Area of the 2010 ZCTA"
#> 
#> $copop
#> [1] "2010 Population of the 2010 County"
#> 
#> $cohu
#> [1] "2010 Housing Unit Count of the 2010 County"
#> 
#> $coarea
#> [1] "Total Area of the 2010 County"
#> 
#> $coarealand
#> [1] "Total Land Area of the 2010 County"
#> 
#> $zpoppct
#> [1] "The Percentage of Total Population of the 2010 ZCTA represented by the record"
#> 
#> $zhupct
#> [1] "The Percentage of Total Housing Unit Count of the 2010 ZCTA represented by the record"
#> 
#> $zareapct
#> [1] "The Percentage of Total Area of the 2010 ZCTA represented by the record"
#> 
#> $zarealandpct
#> [1] "The Percentage of Total Land Area of the 2010 ZCTA represented by the record"
#> 
#> $copoppct
#> [1] "The Percentage of Total Population of the 2010 County represented by the record"
#> 
#> $cohupct
#> [1] "The Percentage of Total Housing Unit Count of the 2010 County represented by the record"
#> 
#> $coareapct
#> [1] "The Percentage of Total Area of the 2010 County represented by the record"
#> 
#> $coarealandpct
#> [1] "The Percentage of Total Land Area of the 2010 County represented by the record"

# Total number of zcta records
nrow(zcta::zcta_county_rel_10)
#> [1] 44410

# Number of distinct zcta
zcta::zcta_county_rel_10 %>% distinct(zcta5) %>% nrow()
#> [1] 33120

# In most instances the ZCTA code is the same as the ZIP Code for an area
# But some zctas fall in more than one county 
# For example, there're 7060 zctas fall in 2 counties
zcta::zcta_county_rel_10 %>% 
  group_by(zcta5) %>% 
  summarise(`Num of counties` = n()) %>% 
  group_by(`Num of counties`) %>% 
  summarise(`Num of zctas` = n())
#> # A tibble: 6 x 2
#>   `Num of counties` `Num of zctas`
#>               <int>          <int>
#> 1                 1          24084
#> 2                 2           7060
#> 3                 3           1718
#> 4                 4            240
#> 5                 5             16
#> 6                 6              2

# To get an one-to-one relationship between zcta and county, assign county to 
# a zcta if the zcta has the most population. For Example:
# Before: zcta 601 fall in county 72001 and 72141
zcta::zcta_county_rel_10 %>% 
  select(zcta5, state, county, geoid, poppt, zpoppct)
#> # A tibble: 44,410 x 6
#>    zcta5 state county geoid poppt zpoppct
#>    <chr> <chr> <chr>  <chr> <dbl>   <dbl>
#>  1 00601 72    001    72001 18465   99.4 
#>  2 00601 72    141    72141   105    0.57
#>  3 00602 72    003    72003 41520  100   
#>  4 00603 72    005    72005 54689  100   
#>  5 00606 72    093    72093  6276   94.9 
#>  6 00606 72    121    72121    89    1.35
#>  7 00606 72    153    72153   250    3.78
#>  8 00610 72    003    72003   160    0.55
#>  9 00610 72    011    72011 28856   99.4 
#> 10 00612 72    013    72013 66938   99.9 
#> # ... with 44,400 more rows

# After: relate zcta 601 only to county 72001 as it accounts for 99.43% of the population
one_to_one_pop <- zcta::zcta_county_rel_10 %>% 
  select(zcta5, state, county, geoid, poppt, zpoppct) %>% 
  group_by(zcta5) %>% 
  slice(which.max(zpoppct)) %>% 
  ungroup()
one_to_one_pop
#> # A tibble: 33,120 x 6
#>    zcta5 state county geoid poppt zpoppct
#>    <chr> <chr> <chr>  <chr> <dbl>   <dbl>
#>  1 00601 72    001    72001 18465    99.4
#>  2 00602 72    003    72003 41520   100  
#>  3 00603 72    005    72005 54689   100  
#>  4 00606 72    093    72093  6276    94.9
#>  5 00610 72    011    72011 28856    99.4
#>  6 00612 72    013    72013 66938    99.9
#>  7 00616 72    013    72013 11017   100  
#>  8 00617 72    017    72017 24457    99.4
#>  9 00622 72    023    72023  7853   100  
#> 10 00623 72    023    72023 43061   100  
#> # ... with 33,110 more rows

# Or assign county to a zcta if the zcta accounts for most of the area.
one_to_one_area <- zcta::zcta_county_rel_10 %>% 
  select(zcta5, state, county, geoid, poppt, zpoppct, zareapct) %>% 
  group_by(zcta5) %>% 
  slice(which.max(zareapct)) %>% 
  ungroup()
one_to_one_area
#> # A tibble: 33,120 x 7
#>    zcta5 state county geoid poppt zpoppct zareapct
#>    <chr> <chr> <chr>  <chr> <dbl>   <dbl>    <dbl>
#>  1 00601 72    001    72001 18465    99.4     98.6
#>  2 00602 72    003    72003 41520   100      100  
#>  3 00603 72    005    72005 54689   100      100  
#>  4 00606 72    093    72093  6276    94.9     86.6
#>  5 00610 72    011    72011 28856    99.4     99.8
#>  6 00612 72    013    72013 66938    99.9     99.4
#>  7 00616 72    013    72013 11017   100      100  
#>  8 00617 72    017    72017 24457    99.4     99.6
#>  9 00622 72    023    72023  7853   100      100  
#> 10 00623 72    023    72023 43061   100      100  
#> # ... with 33,110 more rows

# Using either of these ZCTA-to-county tables, you can go from ZIP codes to ZCTAs to county
zipcounty <- zcta::zipzcta %>% 
  left_join(one_to_one_area, by = c("zcta" = "zcta5")) %>% 
  select(zip, zcta, state = state.x, countygeoid = geoid) %>% 
  arrange(zip)
zipcounty
#> # A tibble: 41,270 x 4
#>    zip   zcta  state countygeoid
#>    <chr> <chr> <chr> <chr>      
#>  1 00501 11742 NY    36103      
#>  2 00544 11742 NY    36103      
#>  3 00601 00601 PR    72001      
#>  4 00602 00602 PR    72003      
#>  5 00603 00603 PR    72005      
#>  6 00604 00603 PR    72005      
#>  7 00605 00603 PR    72005      
#>  8 00606 00606 PR    72093      
#>  9 00610 00610 PR    72011      
#> 10 00611 00641 PR    72141      
#> # ... with 41,260 more rows

# Merge the two 1 to 1 relationship datasets and identify zctas that have different county match
one_to_one_pop %>% 
  left_join(one_to_one_area, by = "zcta5") %>% 
  select(zcta5, 
         county.x, geoid.x, zpoppct.x, 
         county.y, geoid.y, zpoppct.y) %>% 
  filter(geoid.x != geoid.y)
#> # A tibble: 922 x 7
#>    zcta5 county.x geoid.x zpoppct.x county.y geoid.y zpoppct.y
#>    <chr> <chr>    <chr>       <dbl> <chr>    <chr>       <dbl>
#>  1 00934 061      72061        58.0 021      72021       42.0 
#>  2 02543 001      25001        96.4 007      25007        3.62
#>  3 03579 007      33007        77.7 017      23017       22.3 
#>  4 04424 029      23029        71.6 003      23003       28.4 
#>  5 04429 019      23019        65.2 009      23009       34.8 
#>  6 04459 019      23019        88.9 003      23003       11.1 
#>  7 04462 019      23019        99.0 021      23021        1.03
#>  8 04942 025      23025        78.4 021      23021       21.6 
#>  9 05842 019      50019        61.3 005      50005       38.7 
#> 10 07747 025      34025        65.5 023      34023       34.5 
#> # ... with 912 more rows

# Get county names for the 1 to 1 relationship dataset
# Also keep just states and DC
one_to_one_pop %>% 
  mutate(geoid = as.integer(geoid)) %>% 
  left_join(gaze::county10, by = "geoid") %>% 
  select(zcta5, state, usps, county, geoid, name) %>% 
  filter(state <= 56)
#> # A tibble: 32,989 x 6
#>    zcta5 state usps  county geoid name            
#>    <chr> <chr> <chr> <chr>  <int> <chr>           
#>  1 01001 25    MA    013    25013 Hampden County  
#>  2 01002 25    MA    015    25015 Hampshire County
#>  3 01003 25    MA    015    25015 Hampshire County
#>  4 01005 25    MA    027    25027 Worcester County
#>  5 01007 25    MA    015    25015 Hampshire County
#>  6 01008 25    MA    013    25013 Hampden County  
#>  7 01009 25    MA    013    25013 Hampden County  
#>  8 01010 25    MA    013    25013 Hampden County  
#>  9 01011 25    MA    013    25013 Hampden County  
#> 10 01012 25    MA    015    25015 Hampshire County
#> # ... with 32,979 more rows
```
