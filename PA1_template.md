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
install.packages("doBy") ##(if necessary)
```

```
## Installing package into '/Users/vj/Library/R/3.0/library'
## (as 'lib' is unspecified)
```

```
## 
## The downloaded binary packages are in
## 	/var/folders/5s/x0295db12v102t796tkxh5th0000gn/T//RtmpQIiV0d/downloaded_packages
```

```r
library(doBy)
by.date <- summaryBy(steps ~ date, data=data, FUN = sum, na.rm=TRUE)
plot(by.date) ##(unnecessary visualization for fun)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

```r
mean(by.date$steps.sum)
```

```
## [1] 9354
```

## What is the average daily activity pattern?



## Imputing missing values



## Are there differences in activity patterns between weekdays and weekends?
