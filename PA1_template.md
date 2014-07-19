# Reproducible Research: Peer Assessment 1
The goal of this report is to analyze...

## Loading and preprocessing the data
Data is in ```activity.zip```, included in this repository. It must be unzipped and read in:


```r
unzip("activity.zip")
data <- read.csv("activity.csv")
```

## What is mean total number of steps taken per day?
To determine the mean total number of steps taken per day, we can use the ```summaryBy``` function in the ```doBy``` package to sum steps per date:

```r
##install.packages("doBy") ##if necessary
library(doBy)
by.date <- summaryBy(steps ~ date, data=data, FUN = sum, na.rm=TRUE)
steps <- by.date$steps.sum
hist(steps, main="Frequency of Daily Step Counts")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

We use the the ```mean``` and ```median``` functions to find the mean and median steps taken in one day:

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

We once again use ```summaryBy``` to average the number of steps for each 5-minute interval across all days:

```r
by.interval <- summaryBy(steps ~ interval, data=data, FUN = mean, na.rm=TRUE)
names(by.interval) <- c("5-minute interval", "average steps")
plot(by.interval, type="l", main="Steps per 5-minute Interval averaged Across Days")
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 

We use the ```max``` function to find the most busy daily interval:

```r
max(by.interval$"average steps")
```

```
## [1] 206.2
```

## Imputing missing values

Of ``17568`` observations in our data, we're missing ``2304`` of them. To try to fill this out...


## Are there differences in activity patterns between weekdays and weekends?
