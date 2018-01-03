---
title: "Introduction to readFARS"
author: "Edmund julian L Ofilada"
date: "2018-01-03"
output:
      rmarkdown::html_vignette:
        fig_caption: yes
        keep_md: yes
        toc: yes
vignette: >
  %\VignetteIndexEntry{Vignette Title}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---



## Package readFARS 

Package readFARS was designed to make it easy for R users to summarize and visualize the Fatality Analysis Reporting System or FARS data from the National Highway Traffic Safety Administration [NHTSA](www-fars.nhtsa.dot.gov/Main/index.aspx). This document hopes to familiarize the reader with the fars_read function from the package readFARS and the variables contained in a FARS data file.

### Data: fars2015

Fatality Analysis Reporting System or FARS contains data derived from a census of fatal motor vehicle traffic crashes within the 50 States, the District of Columbia, and Puerto Rico. FARS data is available for every year since FARS was established in 1975.

Interested parties may access data tables at [NHTSA](www-fars.nhtsa.dot.gov/Main/index.aspx), download files via FTP at ftp://ftp.nhtsa.dot.gov/fars/, or make requests through the [Publications and Data Requests page](www-nrd.nhtsa.dot.gov/Cats/Index.aspx). Information requests can also be made by phone at 800-934-8517, or by e-mail at ncsaweb@dot.gov 

To download a copy of the 2015 FARS data, first go to this NHTSA website  https://www.nhtsa.gov/research-data/fatality-analysis-reporting-system-fars. Click on the the link [Download Raw Data from FTP Site](ftp://ftp.nhtsa.dot.gov/fars/) which will bring you to another page with the title **Index of /fars/**. Click on the year [2015](ftp://ftp.nhtsa.dot.gov/fars/2015/) which will bring you to the **Index of /fars/2015/** page. Click on the link [National](ftp://ftp.nhtsa.dot.gov/fars/2015/National/) which contains the zip file for the FARS national data for the year 2015. This will bring you another page **Index of /fars/2015/National/** where you can choose the file format you want to download. The FARS 2015 National data is available in .csv, .sas, and .dbf format. Choose the [FARS2015NationalCSV.zip](ftp://ftp.nhtsa.dot.gov/fars/2015/National/FARS2015NationalCSV.zip) which will start the download process from the ftp site. After the download has completed, unzip the file using a local software in your computer such as `WinRAR` in Windows or the unzip function in R. The .csv file should have the file name `accident.csv`. **WARNING!!!** If you are downloading .csv files for different years, it will be a good idea to download the zip files to different directories or folders. The files in each zip files have similar names which can result in confusion or files being overwritten. 

For example the .csv file we are interested in is the `accident.csv` file. The same file name exists in the 2016 zip file , the 2015 zip file, the 2014 zip file as well as other zip files for different years. After unzipping the files, it's a good idea to change the name of the file to reflect the year the data was derived from. Changing `accident.csv` to `accident_2015.csv` can save some frustrations later on and also because you cannot keep a file with same file name in a single directory. 

You can rename a file in R Studio. Go to the lower right pane in R Studio and select the square slot next to the file you want to change the name. A check mark will appear in the square slot. Click on this and click rename. Enter the new name for the file. 

### Downloading the file in R

If you know the URL for the file you want to download, you can download the file inside R itself. One of the great things about R is its versatility. It can be adapted to different demands of the workspace by utilizing the different packages that has been developed for it.


```r
fileurl2015 <- "ftp://ftp.nhtsa.dot.gov/fars/2015/National/FARS2015NationalCSV.zip" ### URL of the file we want to download

download.file(fileurl2015,destfile="FARS2014NationalCSV.zip") ###downloading the .zip file

dateDownloaded2015 <- date() ### recording the date and time of our download
dateDownloaded2015

file2015 <- "FARS2014NationalCSV.zip" ### Assign file name to an R object
unzip(file2015) ### unzip the file

list.files() ### show all the content of the zip file
```

Once you have unzipped the file, look for the file `accident.csv` and rename it to `accident_2015`.   

### Reading the data in R: The fars_read function

The fars_read() is the function we use to read the fars data in R. We use the file name as an argument to the function and save it as an R object with the name `"accident_2015"` like so:

```
accident_2015 <- fars_read("accident_2015.csv")

```
We are not limited as to what name to assign to the output. We can actually save the result to whatever name you like. You may find `acc_2015` or `fars_2015` easier to use as it is shorter than `accident_2015`. It contains less letters and therefore easier to type on the keyboard.

For this tutorial we have downloaded the fars data for the year 2015 for you. We changed the file name from `accident.csv` to `accident_2015.csv` and read it in R. We saved the result in the R object `accident_2015`. My fingers needed more exercise.


```r
library(FARSread) ### load package to have access to functions in FARSread package
accident_2015 <- fars_read("accident_2015.csv") ### Read the file accident_2015.csv and assign it to an R object named accident_2015
```

The data has 32166 rows and 52 columns.

### Looking at the variables in our data

Once the data is read in R, we can use all the functions available in R to analyze the data

To see what variables are present in the data we can use the r function `glimpse` from the package `dplyr`.  You can see the results below but first we have to load the dplyr package using the function `library`.


```r
library(dplyr) ### load package dplyr to access the  function glimpse
glimpse(accident_2015) ### view the variable names 
#> Observations: 32,166
#> Variables: 52
#> $ STATE      <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
#> $ ST_CASE    <int> 10001, 10002, 10003, 10004, 10005, 10006, 10007, 10...
#> $ VE_TOTAL   <int> 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 2, 3, 1, 1, 1, 2, 1, ...
#> $ VE_FORMS   <int> 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 2, 3, 1, 1, 1, 2, 1, ...
#> $ PVH_INVL   <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
#> $ PEDS       <int> 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
#> $ PERNOTMVIT <int> 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
#> $ PERMVIT    <int> 1, 1, 2, 1, 2, 2, 2, 1, 1, 2, 2, 6, 1, 1, 1, 2, 1, ...
#> $ PERSONS    <int> 1, 1, 2, 1, 2, 2, 2, 1, 1, 2, 2, 6, 1, 1, 1, 2, 1, ...
#> $ COUNTY     <int> 127, 83, 11, 45, 45, 111, 89, 73, 117, 33, 83, 95, ...
#> $ CITY       <int> 0, 0, 0, 0, 2050, 0, 1730, 350, 47, 0, 0, 1500, 0, ...
#> $ DAY        <int> 1, 1, 1, 4, 7, 8, 8, 3, 13, 5, 7, 9, 10, 11, 11, 13...
#> $ MONTH      <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
#> $ YEAR       <int> 2015, 2015, 2015, 2015, 2015, 2015, 2015, 2015, 201...
#> $ DAY_WEEK   <int> 5, 5, 5, 1, 4, 5, 5, 7, 3, 2, 4, 6, 7, 1, 1, 3, 4, ...
#> $ HOUR       <int> 2, 22, 1, 0, 7, 9, 18, 21, 8, 18, 20, 6, 10, 6, 8, ...
#> $ MINUTE     <int> 40, 13, 25, 57, 9, 59, 33, 30, 0, 45, 55, 35, 55, 1...
#> $ NHS        <int> 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ...
#> $ RUR_URB    <int> 1, 1, 1, 1, 2, 1, 2, 2, 2, 1, 2, 2, 1, 1, 1, 2, 2, ...
#> $ FUNC_SYS   <int> 3, 1, 3, 4, 3, 5, 3, 5, 3, 4, 3, 3, 5, 4, 3, 4, 5, ...
#> $ RD_OWNER   <int> 1, 1, 1, 1, 1, 2, 1, 4, 1, 1, 1, 1, 2, 1, 2, 1, 2, ...
#> $ ROUTE      <int> 3, 1, 2, 3, 2, 4, 2, 6, 2, 3, 3, 2, 4, 2, 4, 3, 4, ...
#> $ TWAY_ID    <chr> "SR-5", "I-65", "US-SR 6", "SR-27", "US-SR 53", "CR...
#> $ TWAY_ID2   <chr> NA, NA, NA, NA, "HINTON WATERS AVE", NA, NA, NA, NA...
#> $ MILEPT     <int> 1754, 3604, 1958, 566, 308, 0, 1030, 0, 2520, 34, 8...
#> $ LATITUDE   <dbl> 33.87865, 34.91044, 32.14201, 31.43981, 31.31933, 3...
#> $ LONGITUD   <dbl> -87.32533, -86.90871, -85.75846, -85.51030, -85.515...
#> $ SP_JUR     <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
#> $ HARM_EV    <int> 35, 34, 42, 53, 12, 1, 43, 8, 23, 12, 12, 12, 1, 1,...
#> $ MAN_COLL   <int> 0, 0, 0, 0, 6, 0, 0, 0, 0, 2, 7, 6, 0, 0, 0, 6, 0, ...
#> $ RELJCT1    <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
#> $ RELJCT2    <int> 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 1, ...
#> $ TYP_INT    <int> 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
#> $ WRK_ZONE   <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
#> $ REL_ROAD   <int> 4, 3, 4, 4, 1, 4, 4, 1, 4, 1, 1, 1, 1, 4, 4, 1, 4, ...
#> $ LGT_COND   <int> 2, 2, 2, 2, 1, 1, 3, 2, 1, 2, 2, 1, 1, 1, 1, 3, 1, ...
#> $ WEATHER1   <int> 1, 10, 1, 10, 1, 1, 1, 2, 10, 1, 1, 1, 1, 10, 1, 10...
#> $ WEATHER2   <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
#> $ WEATHER    <int> 1, 10, 1, 10, 1, 1, 1, 2, 10, 1, 1, 1, 1, 10, 1, 10...
#> $ SCH_BUS    <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
#> $ RAIL       <chr> "0000000", "0000000", "0000000", "0000000", "000000...
#> $ NOT_HOUR   <int> 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 88,...
#> $ NOT_MIN    <int> 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 88,...
#> $ ARR_HOUR   <int> 2, 22, 1, 1, 7, 10, 18, 21, 8, 19, 21, 6, 88, 6, 8,...
#> $ ARR_MIN    <int> 58, 20, 45, 15, 16, 17, 38, 48, 3, 1, 20, 41, 88, 2...
#> $ HOSP_HR    <int> 88, 88, 99, 88, 88, 99, 99, 99, 88, 99, 88, 99, 88,...
#> $ HOSP_MN    <int> 88, 88, 99, 88, 88, 99, 99, 99, 88, 99, 88, 99, 88,...
#> $ CF1        <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
#> $ CF2        <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
#> $ CF3        <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
#> $ FATALS     <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
#> $ DRUNK_DR   <int> 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, ...
```

From the output we can see:

* The variable `STATE` codes the various States into integers from 1 to 56.  The state of Alaska is represented by the integer 2.

* The variable `MONTH` codes the months into integers from 1 to 12.  The month of Decemeber is coded as, you guessed it 12.

* The variable `PEDS` counts the number of persons who were not a motor Vehicle occupant.

* The variable `PERNOTMVIT` counts the number of non-motorists in the crash.

* The variable `VE_TOTAL` counts all the vehicles in the crash.

* The variable `FATALS` counts the number of fatally injured persons in the crash.

* The variable `DRUNK_DR` counts the number of drinking drivers involved in the crash.

If these are the variables we are interested in, we can select these among the many variables in the data and see a summary.

### Exploring FARS

If we wanted to see the first 6 rows of data we can do the following:


```r
accident_2015 %>% 
        select(STATE, MONTH, PEDS, PERNOTMVIT, VE_TOTAL, FATALS, DRUNK_DR) %>% ###select variables
        as.data.frame() %>% ###  save results as a data frame
        head() ### print first 6 rows of data
#>   STATE MONTH PEDS PERNOTMVIT VE_TOTAL FATALS DRUNK_DR
#> 1     1     1    0          0        1      1        1
#> 2     1     1    0          0        1      1        0
#> 3     1     1    0          0        1      1        1
#> 4     1     1    0          0        1      1        1
#> 5     1     1    0          0        2      1        0
#> 6     1     1    0          0        1      1        0
```

### Creating summaries of variables of interest

We can create a summary of the variables we're interested in


```r
accident_2015 %>% 
        select(STATE, MONTH, PEDS, PERNOTMVIT, VE_TOTAL, FATALS, DRUNK_DR) %>% ### selects variables
        summary() ### summarize data
#>      STATE          MONTH             PEDS           PERNOTMVIT     
#>  Min.   : 1.0   Min.   : 1.000   Min.   : 0.0000   Min.   : 0.0000  
#>  1st Qu.:12.0   1st Qu.: 4.000   1st Qu.: 0.0000   1st Qu.: 0.0000  
#>  Median :28.0   Median : 7.000   Median : 0.0000   Median : 0.0000  
#>  Mean   :27.6   Mean   : 6.791   Mean   : 0.2149   Mean   : 0.2237  
#>  3rd Qu.:42.0   3rd Qu.:10.000   3rd Qu.: 0.0000   3rd Qu.: 0.0000  
#>  Max.   :56.0   Max.   :12.000   Max.   :16.0000   Max.   :16.0000  
#>     VE_TOTAL          FATALS          DRUNK_DR     
#>  Min.   : 1.000   Min.   : 1.000   Min.   :0.0000  
#>  1st Qu.: 1.000   1st Qu.: 1.000   1st Qu.:0.0000  
#>  Median : 1.000   Median : 1.000   Median :0.0000  
#>  Mean   : 1.556   Mean   : 1.091   Mean   :0.2832  
#>  3rd Qu.: 2.000   3rd Qu.: 1.000   3rd Qu.:1.0000  
#>  Max.   :58.000   Max.   :10.000   Max.   :3.0000
```


### Creating tables

If we wanted to see the States with the highest number of recorded traffic accidents, we can:


```r
most_count <- accident_2015 %>% ###fars data object in R
        group_by(STATE) %>% ### groups the data according to State
        summarize(count = n()) %>% ### count the number of observations per State 
        arrange(desc(count)) ### arrange from highest to lowest
#> Warning: package 'bindrcpp' was built under R version 3.4.3
        
head(most_count, 15)
#> # A tibble: 15 x 2
#>    STATE count
#>    <int> <int>
#>  1    48  3124
#>  2     6  2925
#>  3    12  2699
#>  4    13  1327
#>  5    37  1275
#>  6    42  1102
#>  7    36  1046
#>  8    39  1029
#>  9    17   914
#> 10    45   909
#> 11    26   893
#> 12    47   884
#> 13     4   810
#> 14    29   802
#> 15     1   783
```

The table above shows that Texas (48) has the highest number of accidents followed by California (6) and Florida (12).

### Plotting the results

We can also plot these results for presentations using the `barplot()` function that comes with a standard installation of R, but first we'll have to change the names of the States from the numbers that represent them to their true names.



```r
plot_most_count <- most_count %>% ### The table above we just created
                        slice(1:15) %>% ### Get only top 15 States
                        mutate(STATE = c("TX", "CA", "FL", "GA", "NC", "PA", "NY", "OH",
                               "IL", "SD", "MI", "TN", "AR", "MS", "AL")) %>% ### Change to State abbreviated Names
                        as.data.frame() ### save as a data frame
barplot(height = plot_most_count$count, ### variable for y-axis
        names.arg = plot_most_count$STATE, ### variable for x-axis
        las = 1, ### orientation of labels on the x -axis
        cex.lab = 1, ### magnification for the size of the labels on the y and x-axis
        cex.names = 0.8, ### size of the text for the labels on the x and y-axis
        col = rainbow(20), ### color for the bars of the plot
        ylab = "Number of Crashes", ### label for the y-axis
        xlab = "States") ### label for the x-axis
title("Top 15 States\n With Highest \n Number of Traffic Accidents", ###text for title
      line=-4, ### position of the title
      cex.main = 1.2) ###size of the text
```

![fig. 1](introduction-to-readfars_files/figure-html/unnamed-chunk-1-1.png)

If we wanted to find the peak months for traffic accidents in 2015 we can


```r
most_months <- accident_2015 %>% ### data that we read in R
        group_by(MONTH) %>% ### groups the data according to month
        summarize(count = n()) %>% ### find the total number of accidents per month
        mutate(mon_abb = as.factor(month.abb)) %>% ### create a new variable of abbreviations for month names
        as.data.frame() ### save result as a data frame
most_months
#>    MONTH count mon_abb
#> 1      1  2368     Jan
#> 2      2  1968     Feb
#> 3      3  2385     Mar
#> 4      4  2430     Apr
#> 5      5  2847     May
#> 6      6  2765     Jun
#> 7      7  2998     Jul
#> 8      8  3016     Aug
#> 9      9  2865     Sep
#> 10    10  3019     Oct
#> 11    11  2724     Nov
#> 12    12  2781     Dec
```

It's hard to see a trend or compare values looking at a table. We can better appreciate the results by plotting them and this time we'll use the function `ggplot` from the package `ggplot2` 


```r
library(forcats) ### load package forcats to change factor levels
most_months$mon_abb <- fct_relevel(most_months$mon_abb, "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec") ### change factor levels to correctly plot the data using ggplot

library(ggplot2) ### load ggplot2 package for plotting data
#> Warning: package 'ggplot2' was built under R version 3.4.3
ggplot(data = most_months, aes(x = mon_abb, y = count, group = 1)) + ### select the data and variables we will plot
        geom_line(colour = "red", linetype = "dashed", size = 1.5) + ### plot data as a line
        geom_point(colour = "red", size = 4, shape = 21, fill = "green") + ### plot data as green round points as well
        xlab("Month") + ### add label to x-axis
        ggtitle("Number of Accidents Recorded per Month in 2015") ### add title
```

![fig. 2](introduction-to-readfars_files/figure-html/plotmonthcount-1.png)

We see that the peak months for traffic accidents are the months from July to october. The package readFARS has other functions which will be demonstrated on the second vignette included in this package. Among those functions is a function that creates a map plot of a State with the location of the traffic accidents shown as points in the map. 

To gain a better understanding of the data in FARS we have provide below a brief description of the variables included in the 2015 FARS data. The FARS  for the year 2015 is included in this package. You can view the first 6 rows of the data in R on the console by typing the following:

---
library(readFARS)
head(fars_2015)
---        

A brief description of the variables has been included in the appendix at the bottom  of this page. For a detailed description of the variables in the data you can download a copy of the pdf file **Fatality Analysis Reporting System (FARS) Analytical User's Manual 1975-2016** available from the website https://crashstats.nhtsa.dot.gov/Api/Public/Publication/812447

Raw data from the year 2013 is also available with this package. You may access them like so:

---
fars_2013 <- system.file("extdata", "accident_2013.csv", package = "readFARS") ### find the file path 

library(readFARS) ### load package readFARS to access functions from the package

accident_2013 <- fars_read(fars_2013)
---

This ends the first part of the tutorial for the package readFARS.  For the second tutorial we will be demonstrating the use of the function `fars_summarize_years` function and the `fars-map_state` function.

The `fars_summarize_years` function is designed to facilitate creating a table that will show the number of traffic accidents for every month in a single or a number of years. Similar to the table we created above. The `fars-map_state` function create a map plot using geospatial locationing to plot the location where the accidents occured in a particular State.

We hope that you enjoyed our short presentation.

### Appendix
#####List of variables in the dataset provided in package readFARS

|Variable         |Desscription                                                                             |DataType |
|:----------------|:----------------------------------------------------------------------------------------|:--------|
|`STATE`          |State number corresponding to a State in the USA                                         |int      |
|`ST_CASE`        |a unique case number assigned by the data entry system                                   |int      |
|`VE_TOTAL`       |number of contact motor vehicles involved in the crash                                   |int      |
|`VE_FORMS`       |number of vehicles in-transport involved in crash. Legally parked vehicles not included  |int      |
|`PVH_INVL`       |count of the number of parked and working vehicles involved                              |int      |
|`PEDS`           |number of Person Forms (Not a Motor Vehicle Occupant)                                    |int      |
|`PERNOTMVIT`     |number of non-motorists in the crash                                                     |int      |
|`PERMVIT`        |number of motorists in the crash                                                         |int      |
|`PERSONS`        |number of all persons involved in the crash                                              |int      |
|`COUNTY`         |location of the unstabilized event with regard to the County                             |int      |
|`CITY`           |location of the unstabilized event with regard to the City                               |int      |
|`DAY`            |day of the month on which the crash occurred                                             |int      |
|`MONTH`          |month in which the crash occurred                                                        |int      |
|`YEAR`           |the year in which the crash occurred                                                     |int      |
|`DAY_WEEK`       |the day of the week on which the crash occurred                                          |int      |
|`HOUR`           |the hour at which the crash occurred                                                     |int      |
|`MINUTE`         |the minutes after the hour at which the crash occurred                                   |int      |
|`NHS`            |whether the crash occurred on a trafficway that is part of the National Highway System.  |int      |
|`RUR_URB`        |classification of the segment of the trafficway on which the crash occurred              |int      |
|`FUNC_SYS`       |functional classification of the segment of the trafficway on which the crash occurred   |int      |
|`RD_OWNER`       |legal owner of the segment of the trafficway on which the crash occurred                 |int      |
|`ROUTE`          |the route signing of the trafficway on which the crash occurred.                         |int      |
|`TWAY_ID`        |the trafficway on which the crash occurred 1982-Later                                    |int      |
|`TWAY_ID2`       |the trafficway on which the crash occurred 2004-Later                                    |int      |
|`MILEPT`         |he milepoint nearest to the location where the crash occurred                            |int      |
|`LATITUDE`       |the position of latitude in Global Position coordinates                                  |num      |
|`LONGITUD`       |the position of longitude in Global Position coordinates                                 |num      |
|`SP_JUR`         |identifies if the location where the crash occurred qualifies as a Special Jurisdiction  |int      |
|`HARM_EV`        |describes the first injury or damage producing event of the crash                        |int      |
|`MAN_COLL`       |describes the orientation of 2 motor vehicles involved in the “First Harmful Event”      |int      |
|`RELJCT1`        |dentifies the crash's location with respect to presence in an interchange area 1975-2009 |int      |
|`RELJCT2`        |dentifies the crash's location with respect to presence in an interchange area 2010-Later|int      |
|`TYP_INT`        |identifies and allows separation of various intersection types                           |int      |
|`WRK_ZONE`       |identifies whether the first harmful event occured within the boundaries of a work zone  |int      |
|`REL_ROAD`       |identifies the location of the crash in relation to its position with the trafficway     |int      |
|`LGT_COND`       |records the type/level of light that existed at the time of the crash                    |int      |
|`WEATHER1`       |the prevailing atmospheric conditions that existed at the time of the crash  1975-2006   |int      |
|`WEATHER2`       |the prevailing atmospheric conditions that existed at the time of the crash  2007-Later  |int      |
|`SCH_BUS`        |identifies if a school bus/vehicle functioning as a schoolbus, is related to the crash.  |int      |
|`NOT_HOUR`       |the hour that emergency medical service was notified                                     |int      |
|`NOT_MIN`        |the minutes after the hour that emergency medical service was notified                   |int      |
|`ARR_HOUR`       |the hour that emergency medical service arrived                                          |int      |
|`ARR_MIN`        |the minutes after the hour that emergency medical service (EMS) arrived                  |int      |
|`HOSP_HR`        |the hour that emergency medical service arrived at the treatment facility                |int      |
|`HOSP_MN`        |the minutes after the hour that EMS arrived at the treatment facility                    |int      |
|`CF1`            |factors related to the crash expressed by the investigating officer  1975-1981           |int      |
|`CF2`            |factors related to the crash expressed by the investigating officer  1982-2013           |int      |
|`CF3`            |factors related to the crash expressed by the investigating officer  2013-later          |int      |
|`FATALS`         |the number of fatally injured persons in the crash                                       |int      |
|`DRUNK_DR`       |the number of drinking drivers involved in the crash                                     |int      |

### References

- FARS Analytical User's Manual. 1975 - 2016. U. S. Department of Transportation. National Highway Traffic Safety Administration. National Center for Statistics and?Analysis. Washington, D.C. 20590

- National Highway Traffic Safety Administration [NHTSA](www-fars.nhtsa.dot.gov/Main/index.aspx) website



