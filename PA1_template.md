# Reproducible Research: Peer Assessment 1
The goal of this report is to analyze...

## Loading and preprocessing the data
Data is in ```activity.zip```, included in this repository. It must be unzipped and read in:


```r
unzip("activity.zip")
data <- read.csv("activity.csv")
data$date <- as.Date(data$date)
```

## What is mean total number of steps taken per day?
To determine the mean total number of steps taken per day, we can use the ```aggregate``` function to sum steps per date:

```r
by.date <- aggregate(steps ~ date, data=data, FUN=sum, na.rm=TRUE)
steps <- by.date$steps
hist(steps, main="Frequency of Daily Step Counts")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

We use the the ```mean``` and ```median``` functions to find the mean and median steps taken in one day:

```r
mean(steps)
```

```
## [1] 10766
```

```r
median(steps)
```

```
## [1] 10765
```

## What is the average daily activity pattern?

We once again use ```aggregate``` to average the number of steps for each 5-minute interval across all days:

```r
by.interval <- aggregate(steps ~ interval, data=data, FUN = mean, na.rm=TRUE)
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

Of ``17568`` observations in our data, we're missing ``2304`` of them. To fill this out without a lot of complexity, we can use the means for the corresponding intervals for days for which we do have data (which we computed above).


```r
imputed.data <- merge(data, by.interval, by="interval", suffixes=c("",".mean"), all = TRUE)
```

```
## Error: 'by' must specify a uniquely valid column
```

```r
NAs <- is.na(imputed.data$steps)
```

```
## Error: object 'imputed.data' not found
```

```r
imputed.data$steps[NAs] <- imputed.data$steps.mean[NAs]
```

```
## Error: object 'imputed.data' not found
```

Now let's perform our previous exploration using the _imputed_ data:

```r
imputed.by.date <- aggregate(steps ~ date, data=imputed.data, FUN=sum, na.rm=TRUE)
```

```
## Error: object 'imputed.data' not found
```

```r
steps <- imputed.by.date$steps
```

```
## Error: object 'imputed.by.date' not found
```

```r
hist(steps, main="Frequency of Daily Step Counts (with imputed values)")
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7.png) 

```r
mean(steps)
```

```
## [1] 10766
```

```r
median(steps)
```

```
## [1] 10765
```
We see no significant change upon imputing values using our simple method.

## Are there differences in activity patterns between weekdays and weekends?
