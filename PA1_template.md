# Reproducible Research: Peer Assessment 1
The goal of this report is to analyze...

## Loading and preprocessing the data
Data is in ```activity.zip```, included in this repository. It must be unzipped and read in:


```r
unzip("activity.zip")
data <- read.csv("activity.csv")
```

## What is mean total number of steps taken per day?
To determine the mean total number of steps taken per day, we can use the ```summaryBy``` function in the ```doBy``` package to sum steps per date, then take the mean of the results.


```r
##install.packages("doBy") ##if necessary
library(doBy)
by.date <- summaryBy(steps ~ date, data=data, FUN = sum, na.rm=TRUE)
steps <- by.date$steps.sum
hist(steps, main="Frequency of Daily Step Counts")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

```r
mean(steps)
```

```
## [1] 9354
```

```r
median(steps)
```

```
## [1] 10395
```

## What is the average daily activity pattern?



## Imputing missing values



## Are there differences in activity patterns between weekdays and weekends?
