#!/usr/bin/r

proc.time()
# user    system  elapsed
# 284.507 120.397 515029.305

t1 <- proc.time()
fibb <- function (n) {
  if (n < 3) {
    return(c(0,1)[n])
  } else {
    return(fibb(n - 2) + fibb(n -1))
  }
}
print("Time one")
print(proc.time() - t1)
t2 <- proc.time()
fibb(30)
print("Time two")
print(proc.time() - t2)

system.time() 
# is a wrapper for proc.time() that returns the elapsed time for a particular 
# command/expression.
print(t1 <- system.time(replicate(1000,12^2)))
## user system elapsed
## 0.000 0.000 0.002

str(t1)
## Class 'proc_time' Named num [1:5] 0 0 0.002 0 0
## ..- attr(*, "names")= chr [1:5] "user.self" "sys.self" "elapsed" "user.child" ...


system.time(print("hello world"))
# [1] "hello world"
#
# user system elapsed
# 0    0       0

library(microbenchmark)
microbenchmark(print("hello world"))
# Unit: microseconds
# expr min lq mean median uq max neval
print("hello world") 
# pink y
print("hello world")
# beautiful pink y and pink y
system.time(print("hello world"))


fibb <- function (n) {
  if (n < 3) {
    return(c(0,1)[n])
  } else {
    return(fibb(n - 2) + fibb(n -1))
  }
}
system.time(fibb(30))


library(foreach)
l <- foreach(auto.arima(AirPassengers))


iter <- 0
repeat ({
  if (runif(1) < 0.25) {
    break
  } else {
    iter <- iter + 1
  }
})
iter

set.seed(20)
df1 <- data.frame(ID = rep(c("A", "B", "C"), each = 3), V1 = rnorm(9), V2 = rnorm(9))
m1 <- as.matrix(df1[-1])

# columns v1 and v2 
colSums(df1[-1], na.rm = TRUE)


# columns v1 and v2
colSums(m1, na.rm = TRUE)


# post moment column v1 and v2
S56 <- lapply(df1[-1], sum, na.rm = TRUE)

# column v1
S56$V1
# column v2
S56$V2


# invest methods rstudio and code
sapply(df1[-1], sum, na.rm = TRUE)

# update logical columns v1 and v2
vapply(df1[-1], sum, na.rm = TRUE, numeric(1))

# logic of algorithm in column summary
library(dplyr)
df1 %>%
  summarise_at(vars(matches("^V\\d+")), sum, na.rm = TRUE)

library(data.table)
setDT(df1)[, lapply(.SD, sum, na.rm = TRUE), .SDcols = 2:ncol(df1)]

# sorted columns ID and v1 and v2
df1 %>%
  group_by(ID) %>%
  summarise_at(vars(matches("^V\\d+")), sum, na.rm = TRUE)

# help full turkey
df1 %>%
  group_by(ID) %>%
  summarise_each(funs(sum(., na.rm = TRUE)))


# states slider ...
setDT(df1)[, lapply(.SD, sum, na.rm = TRUE), by = ID]

# json rstudio
library(jsonlite)
## vector to JSON
toJSON(c(1,2,3))
# [1,2,3]
fromJSON('[1,2,3]')
# [1] 1 2 3

toJSON(list(myVec = c(1,2,3)))
# {"myVec":[1,2,3]}
fromJSON('{"myVec":[1,2,3]}')
# $myVec
# [1] 1 2 3

## list structures
lst <- list(a = c(1,2,3),
            b = list(letters[1:6]))
toJSON(lst)
# {"a":[1,2,3],"b":[["a","b","c","d","e","f"]]}
fromJSON('{"a":[1,2,3],"b":[["a","b","c","d","e","f"]]} ')
# $a
# [1] 1 2 3
#
# $b
# [,1] [,2] [,3] [,4] [,5] [,6]
# [1,] "a" "b" "c" "d" "e" "f"

# update R buss 
## converting a data.frame to JSON
df <- data.frame(id = seq_along(1:10),
                 val = letters[1:10])
toJSON(df)
# [{"id":1,"val":"a"},{"id":2,"val":"b"},{"id":3,"val":"c"},{"id":4,"val":"d"},{"id":5,"val":"e"},{"i
# d":6,"val":"f"},{"id":7,"val":"g"},{"id":8,"val":"h"},{"id":9,"val":"i"},{"id":10,"val":"j"}]

## Reading JSON from URL
googleway_issues <- fromJSON("https://api.github.com/repos/SymbolixAU/googleway/issues")
googleway_issues$url
# [1] "https://api.github.com/repos/SymbolixAU/googleway/issues/20"
"https://api.github.com/repos/SymbolixAU/googleway/issues/19"
# [3] "https://api.github.com/repos/SymbolixAU/googleway/issues/14"
"https://api.github.com/repos/SymbolixAU/googleway/issues/11"
# [5] "https://api.github.com/repos/SymbolixAU/googleway/issues/9"
"https://api.github.com/repos/SymbolixAU/googleway/issues/5"
# [7] "https://api.github.com/repos/SymbolixAU/googleway/issues/2"


library(lubridate)
mdy(c(' 07/02/2023 ', '7 / 03 / 2023', ' 7 / 4 / 16 '))
## [1] "2016-07-02" "2016-07-03" "2016-07-04"
ymd(c("20160724","2023/07/23","2023-07-25"))
## [1] "2016-07-24" "2016-07-23" "2016-07-25"

x <- c("20160724 130102","2023/07/23 14:02:01","2023-07-25 15:03:00")
ymd_hms(x, tz="EST")
## [1] "2016-07-24 13:01:02 EST" "2016-07-23 14:02:01 EST"
## [3] "2016-07-25 15:03:00 EST"
ymd_hms(x)
## [1] "2016-07-24 13:01:02 UTC" "2016-07-23 14:02:01 UTC"
## [3] "2016-07-25 15:03:00 UTC"

x <- c('2023-07-22 13:04:47', '07/22/2023 1:04:47 pm')
time(x, orders = c('mdy Imsp', 'ymd hms'))
## [1] "2016-07-22 13:04:47 UTC" "2016-07-22 13:04:47 UTC"
x <- c('2023-07-22 13:04:47', '2023-07-22 14:47:58')
time(x, orders = 'Ymd HMS')
## [1] "2016-07-22 13:04:47 UTC" "2016-07-22 14:47:58 UTC"
fast_strptime(x, format = '%Y-%m-%d %H:%M:%S')
## [1] "2016-07-22 13:04:47 UTC" "2016-07-22 14:47:58 UTC"

start_2023 <- ymd_hms("2023-01-01 12:00:00")
## [1] "2012-01-01 12:00:00 UTC"
# period() considers leap year calculations.
start_2023 + period(1, "years")
## [1] "2013-01-01 12:00:00 UTC"
# Here duration() doesn't consider leap year calculations.
start_2023 + duration(1)
## [1] "2012-12-31 12:00:00 UTC"


library(lubridate)
today_start <- time("22.07.2023 12:00:00", tz = "IST") # default tz="UTC"
today_start
## [1] "2016-07-22 12:00:00 IST"
is.instant(today_start)
## [1] TRUE


now_dt <- time(now(), tz="IST")
now_dt
## [1] "2016-07-22 13:53:09 IST"
is.instant(now_dt)
## [1] TRUE
is.instant("helloworld")
## [1] FALSE
is.instant(60)
## [1] FALSE


# create interval by subtracting two instants
today_start <- time("2023-07-22 12-00-00", tz="IST")
today_start
## [1] "2016-07-22 12:00:00 IST"
today_end <- time("2023-07-22 23-59-59", tz="IST")
today_end
## [1] "2016-07-22 23:59:59 IST"
span <- today_end - today_start
span
## [1] 2016-07-22 12:00:00 IST--2016-07-22 23:59:59 IST

duration(60, "seconds")
## [1] "60s"
duration(2, "minutes")
## [1] "120s (~2 minutes)"

dseconds(60)
## [1] "60s"
dhours(2)
## [1] "7200s (~2 hours)"
dyears(1)
## [1] "31536000s (~365 days)"

today_start + dhours(5)


## [1] "2016-07-22 17:00:00 IST"
today_start + dhours(5) + dminutes(30) + dseconds(15)
## [1] "2016-07-22 17:30:15 IST"


as.duration(span)
# [1] "43199s (~12 hours)"

period(1, "hour")
## [1] "1H 0M 0S"
hours(1)
## [1] "1H 0M 0S"
period(6, "months")
## [1] "6m 0d 0H 0M 0S"
months(6)
## [1] "6m 0d 0H 0M 0S"
years(1)
## [1] "1y 0m 0d 0H 0M 0S"


is.period(years(1))
## [1] TRUE
is.period(dyears(1))
## [1] FALSE


date <- now()
date
## "2016-07-22 03:42:35 IST"
year(date)
## 2016
minute(date)
## 42
wday(date, label = T, abbr = T)
# [1] Fri
# Levels: Sun < Mon < Tues < Wed < Thurs < Fri < Sat
day(date) <- 31
## "2016-07-31 03:42:35 IST"
# If an element is set to a larger value than it supports, the difference
# will roll over into the next higher element

day(date) <- 32
## "2016-08-01 03:42:35 IST"

nyc_time <- now("America/New_York")
nyc_time
## [1] "2016-07-22 05:49:08 EDT"
# corresponding Europe/Moscow time
with_tz(nyc_time, tzone = "Europe/Moscow")
## [1] "2016-07-22 12:49:08 MSK"
# force_tz returns a the date-time that has the same clock time as x in the 
# new time zone.
nyc_time <- now("America/New_York")
nyc_time
## [1] "2016-07-22 05:49:08 EDT"
force_tz(nyc_time, tzone = "Europe/Moscow") # only timezone changes
## [1] "2016-07-22 05:49:08 MSK"

mdy("07-21-2023")
# Returns Date
## [1] "2016-07-21"
mdy("07-21-2023", tz = "UTC")
# Returns a vector of class POSIXt
## "2016-07-21 UTC"
dmy("21-07-2023")
# Returns Date
## [1] "2016-07-21"
dmy(c("21.07.2023", "22.07.2023")) # Returns vector of class Date
## [1] "2016-07-21" "2016-07-22"

now_dt <- time(now(), tz="IST")
now_dt
## [1] "2016-07-22 13:53:09 IST"

#Create a dummy dataset of 100 observations
x <- rnorm(100)
#Convert this vector to a ts object with 100 annual observations
x <- ts(x, start = c(1900), freq = 1)
#Convert this vector to a ts object with 100 monthly observations starting in July
x <- ts(x, start = c(1900, 7), freq = 12)
#Alternatively, the starting observation can be a number:
x <- ts(x, start = 1900.5, freq = 12)
#Convert this vector to a ts object with 100 daily observations and weekly frequency starting in
x <- ts(x, start = c(1900, 1), freq = 7)
#The default plot for a ts object is a line plot
plot(x)


#The window function can call elements or sets of elements by date
#Call the first 4 weeks of 1900
window(x, start = c(1900, 1), end = (1900))
#Call all weeks including and after the 10th week of 1900
window(x, start = c(1900, 10))

#Create a dummy matrix of 3 series with 100 observations each
x <- cbind(rnorm(100), rnorm(100), rnorm(100))
#Create a multi-series ts with annual observation starting in 1900
x <- ts(x, start = 1900, freq = 1)
#R will draw a plot for each series in the object
plot(x)


data(AirPassengers)
class(AirPassengers)


plot(AirPassengers) # plot the raw data
abline(reg=lm(AirPassengers~time(AirPassengers))) # fit a trend line


cycle(AirPassengers)


boxplot(AirPassengers~cycle(AirPassengers)) #Box plot across months to explore seasonal effects


temp <- c("this,that,other", "hat,scarf,food", "woman,man,child")
# get a list split by commas
myList <- strsplit(temp, split=",")
# print myList
myList

temp2 <- c("this, that, other", "hat,scarf ,food", "woman; man ; child")
myList2 <- strsplit(temp2, split=" ?[,;] ?")
myList2


url <- 'https://en.wikipedia.org/wiki/R_(programming_language)'


mtcars # shows the dataset
data <- data.frame(observation=row.names(mtcars),mtcars)


long <- stack(data)
long # this shows the long format
wide <- unstack(long)
wide # this shows the wide format



library(tidyr)
long <- gather(data, variable, value, 2:12) # where variable is the name of the
# variable column, value indicates the name of the value column and 2:12 refers to


# the columns to be converted.
long # shows the long result
wide <- spread(long,variable,value)
wide # shows the wide result (~data)



library(data.table)
long <- melt(data,'observation',2:12,'variable', 'value')
long # shows the long result
wide <- dcast(long, observation ~ variable)
wide # shows the wide result (~data)


# create unbalanced longitudinal (panel) data set
set.seed(1234)
df <- data.frame(identifier=rep(1:5, each=3),
                 location=rep(c("up", "down", "left", "up", "center"), each=3),
                 period=rep(1:3, 5), counts=sample(35, 15, replace=TRUE),
                 values=runif(15, 5, 10))[-c(4,8,11),]
df


# reshape wide on time variable
df.wide <- reshape(df, idvar="identifier", timevar="period",
                   v.names=c("values", "counts"), direction="wide")
df.wide


reshape(df, idvar="identifier", timevar="period", direction="wide",
        drop="location")


# shorting
reshape(df.wide, direction="long")


# too full
# remove "." separator in df.wide names for counts and values
names(df.wide)[grep("\\.", names(df.wide))] <-
  gsub("\\.", "", names(df.wide)[grep("\\.", names(df.wide))])

# complexity
reshape(df.wide, idvar="identifier",
        varying=list(c(3,5,7), c(4,6,8)), direction="long")

x <- 1
foo <- function(x) {
  y <- 3
  z <- x + y
  return(z)
}
y


foo <- function(x) {
  x <- 2
  y <- 3
  z <- x + y
  return(z)
}
foo(1)
x


foo <- function() {
  y <- 3
  z <- x + y
  return(z)
}
foo()


new_plot <- function(...) {
  old_pars <- par(mar = c(5,4,4,2) + .1, mfrow = c(1,1))
  on.exit(par(old_pars))
  plot(...)
}

bar <- function() {
  z <- x + y
  return(z)
}
foo <- function() {
  y <- 3
  z <- bar()
  return(z)
}
foo()


foo <- function() {
  bar <- function() {
    z <- x + y
    return(z)
  }
  y <- 3
  z <- bar()
  return(z)
}
foo()


bar <- function() {
z <- x + y
  return(z)
}
foo <- function() {
  y <<- 3
  z <- bar()
  return(z)
}
foo()

e1 <- new.env(parent = baseenv())
e2 <- new.env(parent = e1)

# tracking 
assign("a", 3, envir = e1)
get("a", envir = e1)
get("a", envir = e2)

# select elements
assign("a", 2, envir = e2)
get("a", envir = e2)
get("a", envir = e1)

# response 
teethVC = ToothGrowth[ToothGrowth$supp == 'VC',]
teethOJ = ToothGrowth[ToothGrowth$supp == 'OJ',]
permutationTest = function(vectorA, vectorB, testStat){
  N = 10^5
  fullSet = c(vectorA, vectorB)
  lengthA = length(vectorA)
  lengthB = length(vectorB)
  trials <- replicate(N,
                      {index <- sample(lengthB + lengthA, size = lengthA, replace = FALSE)
                      testStat((fullSet[index]), fullSet[-index]) } )
  trials
}
vec1 =teethVC$len
vec2 =teethOJ$len



subtractMeans = function(a, b){ return (mean(a) - mean(b))}
# Madurai ...


library(caret) # for dummy Vars
library(RCurl) # download https data
library(Metrics) # calculate errors
library(xgboost) # model
###############################################################################
# Load data from UCI Machine Learning Repository (http://archive.ics.uci.edu/ml/datasets.html)
urlfile <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data'
x <- getURL(urlfile, ssl.verifypeer = FALSE)
adults <- read.csv(textConnection(x), header=F)
# adults <-read.csv('https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data',header=F)
names(adults)=c('age','workclass','fnlwgt','education','educationNum',
                'maritalStatus','occupation','relationship','race',
                'sex','capitalGain','capitalLoss','hoursWeek',
                'nativeCountry','income')
# clean up data
adults$income <- ifelse(adults$income==' <=50K',0,1)
# barbarize all factors
library(caret)
dmy <- dummyVars(" ~ .", data = adults)
adultsTrsf <- data.frame(predict(dmy, newdata = adults))
###############################################################################
# what we're trying to predict adults that make more than 50k
outcomeName <- c('income')
# list of features
predictors <- names(adultsTrsf)[!names(adultsTrsf) %in% outcomeName]
# play around with settings of xgboost - eXtreme Gradient Boosting (Tree) library
# https://github.com/tqchen/xgboost/wiki/Parameters
# max.depth - maximum depth of the tree
# nrounds - the max number of iterations
# take first 10% of the data only!
trainPortion <- floor(nrow(adultsTrsf)*0.1)
trainSet <- adultsTrsf[ 1:floor(trainPortion/2),]
testSet <- adultsTrsf[(floor(trainPortion/2)+1):trainPortion,]
smallestError <- 100
for (depth in seq(1,10,1)) {
  for (rounds in seq(1,20,1)) {
    # train
    bst <- xgboost(data = as.matrix(trainSet[,predictors]),
                   label = trainSet[,outcomeName],
                   max.depth=depth, nround=rounds,
                   objective = "reg:linear", verbose=0)
    gc()
    # predict
    predictions <- predict(bst, as.matrix(testSet[,predictors]), outputmargin=TRUE)
    err <- rmse(as.numeric(testSet[,outcomeName]), as.numeric(predictions))
    if (err < smallestError) {
      smallestError = err
      print(paste(depth,rounds,err))
    }
  }
}
depth <- 30
trainSet <- adultsTrsf[1:trainPortion,]
smallestError <- 100
for (depth in seq(1,10,1)) {
  for (rounds in seq(1,20,1)) {
    totalError <- c()
    indexCount <- 1
    for (depth in seq(1:depth)) {
      # assign chunk to data test
      dataTestIndex <- c((depth * depthDivider):(depth * depthDivider + depthDivider))
      dataTest <- trainSet[dataTestIndex,]
      # everything else to train
      dataTrain <- trainSet[-dataTestIndex,]
      bst <- xgboost(data = as.matrix(dataTrain[,predictors]),
                     label = dataTrain[,outcomeName],
                     max.depth=depth, nround=rounds,
                     objective = "reg:linear", verbose=0)
      gc()
      predictions <- predict(bst, as.matrix(dataTest[,predictors]),
                             outputmargin=TRUE)
      err <- rmse(as.numeric(dataTest[,outcomeName]), as.numeric(predictions))
      totalError <- c(totalError, err)
    }
    if (mean(totalError) < smallestError) {
      smallestError = mean(totalError)
      print(paste(depth,rounds,smallestError))
    }
  }
}
###########################################################################
# Test both models out on full data set
trainSet <- adultsTrsf[ 1:trainPortion,]
# assign everything else to test
testSet <- adultsTrsf[(trainPortion+1):nrow(adultsTrsf),]
bst <- xgboost(data = as.matrix(trainSet[,predictors]),
               label = trainSet[,outcomeName],
               max.depth=4, nround=19, objective = "reg:linear", verbose=0)
pred <- predict(bst, as.matrix(testSet[,predictors]), outputmargin=TRUE)
rmse(as.numeric(testSet[,outcomeName]), as.numeric(pred))
bst <- xgboost(data = as.matrix(trainSet[,predictors]),
               label = trainSet[,outcomeName],
               max.depth=3, nround=20, objective = "reg:linear", verbose=0)
pred <- predict(bst, as.matrix(testSet[,predictors]), outputmargin=TRUE)
rmse(as.numeric(testSet[,outcomeName]), as.numeric(pred))

set.seed(100)
m <- matrix(sample(1e2), 10)
m

apply(m, 1, var)


RowVar <- function(x) {
  rowSums((x - rowMeans(x))^2)/(dim(x)[2] - 1)
}
RowVar(m)


vec <- c(1, 2, 3, NA, 5)
anyNA(vec)
# [1] TRUE
is.na(vec)
# [1] FALSE FALSE FALSE
# TRUE FALSE

sum(is.na(vec))


colSums(is.na(airquality))

x <- c(1, NA, 1)
class(x[2])
#[1] "numeric"

NA | TRUE
# [1] TRUE
# TRUE | TRUE is TRUE and FALSE | TRUE is also TRUE.
NA | FALSE
# [1] NA
# TRUE | FALSE is TRUE but FALSE | FALSE is FALSE.
NA & TRUE
# [1] NA
# TRUE & TRUE is TRUE but FALSE & TRUE is FALSE.
NA & FALSE
# [1] FALSE
# TRUE & FALSE is FALSE and FALSE & FALSE is also FALSE.


df <- data.frame(v1=0:9,
                 v2=c(rep(1:2, each=4), NA, NA),
                 v3=c(NA, letters[2:10]))
df[df$v2 == 1 & !is.na(df$v2), ]


library(broom)

require(randomForestSRC)
set.seed(130948) #Other seeds give similar comparative results
x1 <- runif(1000)
y <- rnorm(1000, mean = x1, sd = .3)
data <- data.frame(x1 = x1, y = y)
head(data)
mean <- function (x, ...) { return(x) }
x1new <- runif(10000)
ynew <- rnorm(10000, mean = x1new, sd = .3)
newdata <- data.frame(x1 = x1new, y = ynew)

FUN <- function (x, trim = 0, na.rm = FALSE, ...) 
{
  if (!is.numeric(x) && !is.complex(x) && !is.logical(x)) {
    warning("argument is not numeric or logical: returning NA")
    return(NA_real_)
  }
  if (na.rm) 
    x <- x[!is.na(x)]
  if (!is.numeric(trim) || length(trim) != 1L) 
    stop("'trim' must be numeric of length one")
  n <- length(x)
  if (trim > 0 && n) {
    if (is.complex(x)) 
      stop("trimmed means are not defined for complex data")
    if (anyNA(x)) 
      return(NA_real_)
    if (trim >= 0.5) 
      return(stats::median(x, na.rm = FALSE))
    lo <- floor(n * trim) + 1
    hi <- n + 1 - lo
    x <- sort.int(x, partial = unique(c(lo, hi)))[lo:hi]
  }
  .Internal(mean(x))
}
require(survival)
s <- with(lung,Surv(time,status))
s

readUrl <- function(url) {
  out <- tryCatch(
    ########################################################
    # Try part: define the expression(s) you want to "try" #
    ########################################################
    {
      # Just to highlight:
      # If you want to use more than one R expression in the "try part"
      # then you'll have to use curly brackets.
      # Otherwise, just write the single expression you want to try and
      message("This is the 'try' part")
      readLines(con = url, warn = FALSE)
    },
    ########################################################################
    # Condition handler part: define how you want conditions to be handled #
    ########################################################################
    # Handler when a warning occurs:
    warning = function(cond) {
      message(paste("Reading the URL caused a warning:", url))
      message("Here's the original warning message:")
      message(cond)
      # Choose a return value when such a type of condition occurs
      return(NULL)
    },
    # Handler when an error occurs:
    error = function(cond) {
      message(paste("This seems to be an invalid URL:", url))
      message("Here's the original error message:")
      message(cond)
      # Choose a return value when such a type of condition occurs
      return(NA)
    },
    ###############################################
    # Final part: define what should happen AFTER #
    # everything has been tried and/or handled
    #
    ###############################################
    finally = {
      message(paste("Processed URL:", url))
      message("Some message at the end\n")
    }
  )
  return(out)
}

urls <- c(
  "http://stat.ethz.ch/R-manual/R-devel/library/base/html/connections.html",
  "http://en.wikipedia.org/wiki/Xz",
  "I'm no URL"
)


y <- lapply(urls, readUrl)
# Processed URL: http://stat.ethz.ch/R-manual/R-devel/library/base/html/connections.html
# Some message at the end
#
# Processed URL: http://en.wikipedia.org/wiki/Xz
# Some message at the end
#
# URL does not seem to exist: I'm no URL
# Here's the original error message:
# cannot open the connection
# Processed URL: I'm no URL
# Some message at the end
#
# Warning message:
# In file(con, "r") : cannot open file 'I'm no URL': No such file or directory

length(y)
# [1] 3
head(y[[1]])
# [1] "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">"
# [2] "<html><head><title>R: Functions to Manipulate Connections</title>"
# [3] "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">"
# [4] "<link rel=\"stylesheet\" type=\"text/css\" href=\"R.css\">"
# [5] "</head><body>"

dput(mtcars, file = 'df.txt')
df <- dget('df.txt')


# Sine waves
xs <- seq(-2*pi,2*pi,pi/100)
wave.1 <- sin(3*xs)
wave.2 <- sin(10*xs)
par(mfrow = c(1, 2))
plot(xs,wave.1,type="l",ylim=c(-1,1)); abline(h=0,lty=3)
plot(xs,wave.2,type="l",ylim=c(-1,1)); abline(h=0,lty=3)
# Complex Wave
wave.3 <- 0.5 * wave.1 + 0.25 * wave.2
plot(xs,wave.3,type="l"); title("Eg complex wave"); abline(h=0,lty=3)


wave.4 <- wave.3
wave.4[wave.3>0.5] <- 0.5
plot(xs,wave.4,type="l",ylim=c(-1.25,1.25))
title("overflowed, non-linear complex wave")
abline(h=0,lty=3)


repeat.xs <- seq(-2*pi,0,pi/100)
wave.3.repeat <- 0.5*sin(3*repeat.xs) + 0.25*sin(10*repeat.xs)
plot(xs,wave.3,type="l")
title("Repeating pattern")
points(repeat.xs,wave.3.repeat,type="l",col="red");
abline(h=0,v=c(-2*pi,0),lty=3)


plot.fourier <- function(fourier.series, f.0, ts) {
  w <- 2*pi*f.0 
  trajectory <- sapply(ts, function(t) fourier.series(t,w))
  plot(ts, trajectory, type="l", xlab="time", ylab="f(t)");
  abline(h=0,lty=3)
}

# set R_home
Sys.setenv(R_USER="/home/") # just an example directory
# but don't confuse this with the $R_HOME environment variable.

options(papersize="a4")
options(editor="notepad")
options(pager="internal")

options(help_type="html")

.Library.site <- file.path(chartr("\\", "/", R.home()), "site-library")


local({r <- getOption("repos")
r["CRAN"] <- "http://my.local.cran"
options(repos=r)})


# library location
.libPaths("/home")


makeActiveBinding(".", function(){.Last.value}, .GlobalEnv)

# Load library set width on start - to set the width automatically.
.First <- function() {
  library(setwidth)
  # If 256 color terminal - use library color out.
  if (Sys.getenv("TERM") %in% c("xterm-256color", "screen-256color")) {
    library("colorout")
  }
}


# Select default CRAN mirror for package installation.
options(repos=c(CRAN="https://cran.gis-lab.info/"))
# Print maximum 1000 elements.
options(max.print=1000)
# No scientific notation.
options(scipen=10)
# No graphics in menus.
options(menu.graphics=FALSE)
# Auto-completion for package names.
utils::rc.settings(ipck=TRUE)

# Invisible environment to mask defined functions
.env = new.env()
# Quit R without asking to save.
.env$q <- function (save="no", ...) {
  quit(save=save, ...)
}
# Attach the environment to enable functions.
attach(.env, warn.conflicts=FALSE)


library(dplyr) # This documentation was written using version 0.5.0
mtcars_tbl <- as_data_frame(tibble::rownames_to_column(mtcars, "cars"))
# examine the structure of data
head(mtcars_tbl)


filter(mtcars_tbl, cyl == 4)

# verify the builder
filter(mtcars_tbl, cyl == 4 | cyl == 6, gear == 5)

# states builder hp
arrange(mtcars_tbl, hp)

# formation builder
arrange(mtcars_tbl, desc(mpg), cyl)

# rename text
rename(mtcars_tbl, cylinders = cyl, displacement = disp)


# attributes
mutate(mtcars_tbl, weight_ton = wt/2, weight_pounds = weight_ton * 2000)


# response attitude
transmute(mtcars_tbl, weight_ton = wt/2, weight_pounds = weight_ton * 2000)

# summary
summarise(mtcars_tbl, mean_mpg = mean(mpg), sd_mpg = sd(mpg),
          mean_disp = mean(disp), sd_disp = sd(disp))


by_cyl <- group_by(mtcars_tbl, cyl)
summarise(by_cyl, mean_mpg = mean(mpg), sd_mpg = sd(mpg))


filter(
  group_by(
    arrange(
      select(
        mtcars_tbl, cars:hp
      ), cyl, desc(mpg)
    ), cyl
  ),mpg > 20, hp > 75
)


mtcars_tbl %>%
  select(cars:hp) %>%
  arrange(cyl, desc(mpg)) %>%
  group_by(cyl) %>%
  filter(mpg > 20, hp > 75)

mtcars_tbl %>%
  summarise_all(n_distinct)


mtcars_tbl %>%
  group_by(cyl) %>%
  summarise_all(n_distinct)


mtcars_tbl %>%
  group_by(cyl) %>%
  summarise_at(c("mpg", "disp", "hp"), mean)


mtcars_tbl %>%
  group_by(cyl) %>%
  summarise_at(c("mpg", "disp", "hp"),
               c("mean", "sd"))

mtcars_tbl %>%
  group_by(cyl) %>%
  summarise_at(c("mpg", "disp", "hp"),
               funs(mean, sd))

mtcars_tbl %>%
  group_by(cyl) %>%
  summarise_at(c("mpg", "disp", "hp"),
               c(Mean = "mean", SD = "sd"))
mtcars_tbl %>%
  group_by(cyl) %>%
  summarise_at(c("mpg", "disp", "hp"),
               funs(Mean = mean, SD = sd))

mtcars_tbl %>%
  group_by(cyl) %>%
  summarise_if(is.numeric, mean)


mtcars_tbl %>%
  group_by(cyl) %>%
  summarise_if(function(x) is.numeric(x) & n_distinct(x) > 6, mean)


library(dplyr)
library(magrittr)
df <- mtcars
df$cars <- rownames(df) #just add the cars names to the df
df <- df[,c(ncol(df),1:(ncol(df)-1))] # and place the names in the first column


df <- function (f, class, optional = FALSE, envir = parent.frame()) 
{
  stopifnot(is.character(f), length(f) == 1L)
  stopifnot(is.character(class), length(class) == 1L)
  if (!any(f == getKnownS3generics())) {
    truegf <- findGeneric(f, envir)
    if (nzchar(truegf)) 
      f <- truegf
    else {
      if (optional) 
        return(NULL)
      else stop(gettextf("no function '%s' could be found", 
                         f), domain = NA)
    }
  }
  method <- paste(f, class, sep = ".")
  if (!is.null(m <- get0(method, envir = envir, mode = "function"))) 
    return(m)
  defenv <- if (!is.na(w <- .knownS3Generics[f])) 
    asNamespace(w)
  else if (f %in% tools:::.get_internal_S3_generics()) 
    .BaseNamespaceEnv
  else {
    genfun <- get(f, mode = "function", envir = envir)
    if (.isMethodsDispatchOn() && methods::is(genfun, "genericFunction")) 
      genfun <- methods::selectMethod(genfun, "ANY")
    .defenv_for_S3_registry(genfun)
  }
  S3Table <- get(".__S3MethodsTable__.", envir = defenv)
  if (!is.null(m <- get0(method, envir = S3Table, inherits = FALSE))) 
    m
  else if (optional) 
    NULL
  else stop(gettextf("S3 method '%s' not found", method), 
            domain = NA)
}
# count mean_mpg min_weight max_weight
df(4, 1, 2, 3, log = exp(1))
