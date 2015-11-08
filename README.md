<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/jjchern/zcta.svg?branch=master)](https://travis-ci.org/jjchern/zcta)

About
=====

This R data package intends to store 2010 Census ZIP Code Tabulation Area (ZCTA) Relationship files. So far in only includes the "2010 ZCTA to County Relationship File" (`zcta_county_rel_10.rda`).

Useful Links
============

-   [Data Source](https://www.census.gov/geo/maps-data/data/zcta_rel_download.html)
-   [Explanation of the 2010 ZCTA to County Relationship File](http://www2.census.gov/geo/pdfs/maps-data/data/rel/explanation_zcta_county_rel_10.pdf)
-   [Census ZIP Code Tabulation Areas page](https://www.census.gov/geo/reference/zctas.html)
-   [ZIP Code Tabulation Areas (ZCTAs) Delineation Animation](https://www.census.gov/geo/reference/zcta/zcta_delin_anim.html)
-   [Overview of the 2010 ZIP Code Tabulation Area (ZCTA) Relationship Files](https://www.census.gov/geo/maps-data/data/zcta_rel_overview.html)
-   [2010 ZIP Code Tabulation Area (ZCTA) Relationship File Layouts and Contents](https://www.census.gov/geo/maps-data/data/zcta_rel_layout.html)
-   [Census Frequently Asked Questions about ZCTAs](https://ask.census.gov/faq.php?id=5000&rtopic=1795&rsubtopic=8048)

Installation
============

``` r
# install.packages("devtools")
devtools::install_github("jjchern/zcta")
```

Usage
=====

``` r
library(dplyr)

# Data
zcta::zcta_county_rel_10
#> Source: local data frame [44,410 x 24]
#> 
#>    zcta5 state county geoid poppt  hupt    areapt arealandpt  zpop   zhu
#>    (int) (int)  (int) (int) (int) (int)     (dbl)      (dbl) (int) (int)
#> 1    601    72      1 72001 18465  7695 165132671  164333375 18570  7744
#> 2    601    72    141 72141   105    49   2326414    2326414 18570  7744
#> 3    602    72      3 72003 41520 18073  83734431   79288158 41520 18073
#> 4    603    72      5 72005 54689 25653  82063867   81880442 54689 25653
#> 5    606    72     93 72093  6276  2740  94864349   94851862  6615  2877
#> 6    606    72    121 72121    89    38   6679806    6679806  6615  2877
#> 7    606    72    153 72153   250    99   8048393    8048393  6615  2877
#> 8    610    72      3 72003   160    62    237185     237185 29016 12618
#> 9    610    72     11 72011 28856 12556  96956283   92784282 29016 12618
#> 10   612    72     13 72013 66938 30961 183876062  174066899 67010 30992
#> ..   ...   ...    ...   ...   ...   ...       ...        ...   ...   ...
#> Variables not shown: zarea (dbl), zarealand (dbl), copop (int), cohu
#>   (int), coarea (dbl), coarealand (dbl), zpoppct (dbl), zhupct (dbl),
#>   zareapct (dbl), zarealandpct (dbl), copoppct (dbl), cohupct (dbl),
#>   coareapct (dbl), coarealandpct (dbl)

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
# For example, there're 7064 zctas fall in 2 counties
zcta::zcta_county_rel_10 %>% 
  group_by(zcta5) %>% 
  summarise(`Num of counties` = n()) %>% 
  group_by(`Num of counties`) %>% 
  summarise(`Num of zctas` = n())
#> Source: local data frame [6 x 2]
#> 
#>   Num of counties Num of zctas
#>             (int)        (int)
#> 1               1        24084
#> 2               2         7060
#> 3               3         1718
#> 4               4          240
#> 5               5           16
#> 6               6            2

# To get an one-to-one relationship between zcta and county, assign county to 
# a zcta if the zcta has the most population. For Example:
# Before: zcta 601 fall in county 72001 and 72141
zcta::zcta_county_rel_10 %>% 
  select(zcta5, state, county, geoid, poppt, zpoppct)
#> Source: local data frame [44,410 x 6]
#> 
#>    zcta5 state county geoid poppt zpoppct
#>    (int) (int)  (int) (int) (int)   (dbl)
#> 1    601    72      1 72001 18465   99.43
#> 2    601    72    141 72141   105    0.57
#> 3    602    72      3 72003 41520  100.00
#> 4    603    72      5 72005 54689  100.00
#> 5    606    72     93 72093  6276   94.88
#> 6    606    72    121 72121    89    1.35
#> 7    606    72    153 72153   250    3.78
#> 8    610    72      3 72003   160    0.55
#> 9    610    72     11 72011 28856   99.45
#> 10   612    72     13 72013 66938   99.89
#> ..   ...   ...    ...   ...   ...     ...

# After: relate zcta 601 only to county 72001 as it accounts for 99.43% of the population
one_to_one_pop = zcta::zcta_county_rel_10 %>% 
  select(zcta5, state, county, geoid, poppt, zpoppct) %>% 
  group_by(zcta5) %>% 
  slice(which.max(zpoppct))
one_to_one_pop
#> Source: local data frame [33,120 x 6]
#> Groups: zcta5 [33120]
#> 
#>    zcta5 state county geoid poppt zpoppct
#>    (int) (int)  (int) (int) (int)   (dbl)
#> 1    601    72      1 72001 18465   99.43
#> 2    602    72      3 72003 41520  100.00
#> 3    603    72      5 72005 54689  100.00
#> 4    606    72     93 72093  6276   94.88
#> 5    610    72     11 72011 28856   99.45
#> 6    612    72     13 72013 66938   99.89
#> 7    616    72     13 72013 11017  100.00
#> 8    617    72     17 72017 24457   99.43
#> 9    622    72     23 72023  7853  100.00
#> 10   623    72     23 72023 43061  100.00
#> ..   ...   ...    ...   ...   ...     ...

# Or assign county to a zcta if the zcta accounts for most of the area.
one_to_one_area = zcta::zcta_county_rel_10 %>% 
  select(zcta5, state, county, geoid, poppt, zpoppct, zareapct) %>% 
  group_by(zcta5) %>% 
  slice(which.max(zareapct))
one_to_one_area
#> Source: local data frame [33,120 x 7]
#> Groups: zcta5 [33120]
#> 
#>    zcta5 state county geoid poppt zpoppct zareapct
#>    (int) (int)  (int) (int) (int)   (dbl)    (dbl)
#> 1    601    72      1 72001 18465   99.43    98.61
#> 2    602    72      3 72003 41520  100.00   100.00
#> 3    603    72      5 72005 54689  100.00   100.00
#> 4    606    72     93 72093  6276   94.88    86.56
#> 5    610    72     11 72011 28856   99.45    99.76
#> 6    612    72     13 72013 66938   99.89    99.44
#> 7    616    72     13 72013 11017  100.00   100.00
#> 8    617    72     17 72017 24457   99.43    99.65
#> 9    622    72     23 72023  7853  100.00   100.00
#> 10   623    72     23 72023 43061  100.00   100.00
#> ..   ...   ...    ...   ...   ...     ...      ...

# Merge the two 1 to 1 relationship datasets and identify zctas that have different county match
one_to_one_pop %>% 
  left_join(one_to_one_area, by = "zcta5") %>% 
  select(zcta5, 
         county.x, geoid.x, zpoppct.x, 
         county.y, geoid.y, zpoppct.y) %>% 
  mutate(diff = geoid.x - geoid.y) %>% 
  filter(diff != 0)
#> Source: local data frame [922 x 8]
#> Groups: zcta5 [922]
#> 
#>    zcta5 county.x geoid.x zpoppct.x county.y geoid.y zpoppct.y  diff
#>    (int)    (int)   (int)     (dbl)    (int)   (int)     (dbl) (int)
#> 1    934       61   72061     57.99       21   72021     42.01    40
#> 2   2543        1   25001     96.38        7   25007      3.62    -6
#> 3   3579        7   33007     77.66       17   23017     22.34  9990
#> 4   4424       29   23029     71.57        3   23003     28.43    26
#> 5   4429       19   23019     65.21        9   23009     34.79    10
#> 6   4459       19   23019     88.87        3   23003     11.13    16
#> 7   4462       19   23019     98.97       21   23021      1.03    -2
#> 8   4942       25   23025     78.43       21   23021     21.57     4
#> 9   5842       19   50019     61.30        5   50005     38.70    14
#> 10  7747       25   34025     65.50       23   34023     34.50     2
#> ..   ...      ...     ...       ...      ...     ...       ...   ...

# Get county names for the 1 to 1 relationship dataset
# Also keep just states and DC
one_to_one_pop %>% 
  left_join(gaze::county10, by = "geoid") %>% 
  select(zcta5, state, usps, county, geoid, name) %>% 
  filter(state <= 56) %>% 
  group_by(state)
#> Source: local data frame [32,989 x 6]
#> Groups: state [51]
#> 
#>    zcta5 state  usps county geoid             name
#>    (int) (int) (chr)  (int) (int)            (chr)
#> 1   1001    25    MA     13 25013   Hampden County
#> 2   1002    25    MA     15 25015 Hampshire County
#> 3   1003    25    MA     15 25015 Hampshire County
#> 4   1005    25    MA     27 25027 Worcester County
#> 5   1007    25    MA     15 25015 Hampshire County
#> 6   1008    25    MA     13 25013   Hampden County
#> 7   1009    25    MA     13 25013   Hampden County
#> 8   1010    25    MA     13 25013   Hampden County
#> 9   1011    25    MA     13 25013   Hampden County
#> 10  1012    25    MA     15 25015 Hampshire County
#> ..   ...   ...   ...    ...   ...              ...
```
