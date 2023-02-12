#!/usr/bin/r

my_column <- "mpg"
# the below will not work
mtcars$my_column
# but these will work
mtcars[, my_column] # vector
mtcars[my_column]
# one-column data frame
mtcars[[my_column]] # vector

mtcars$m
# will give you "NULL"
# as "mtcars" has more than one columns having name starting with "d"
mtcars$d

mtcars[1, ]
# first row
mtcars[ -1, ] # everything but the first row
mtcars[-(1:10), ] # everything except the first 10 rows

# logical vector indicating TRUE when a row has mpg less than 15
# FALSE when a row has mpg >= 15
test <- mtcars$mpg < 15
# extract these rows from the data frame
mtcars[test, ]


# extract all columns for rows where the value of cyl is 4.
mtcars[mtcars$cyl == 4, ]
# extract the cyl, mpg, and hp columns where the value of cyl is 4
mtcars[mtcars$cyl == 4, c("cyl", "mpg", "hp")]

# light known physic and mathematics
subset(mtcars, subset = cyl == 6, select = c("mpg", "hp"))
# founds  
mtcars[mtcars$cyl == 6, c("mpg", "hp")]
# transactions
mtcars <- transform(mtcars, mpg2 = mpg^2)

aq <- within(airquality, {
  lOzone <- log(Ozone) # creates new column
  Month <- factor(month.abb[Month]) # changes Month Column
  cTemp <- round((Temp - 32) * 5/9, 1) # creates new column
  S.cT <- Solar.R / cTemp # creates new column
  rm(Day, Temp) # removes columns
})


df1 <- data.frame(x = 1:3, y = c("a", "b", "c"))
df1
##
x; y
## 1 1 a
## 2 2 b
## 3 3 c
class(df1)
## [1] "data.frame"

df2 <- data.frame(x = c("1", "2", "3"), y = c("a", "b", "c"))
df2
##
x; y
## 1 1 a
## 2 2 b
## 3 3 c

str(df1)
## 'data.frame':
# 3 obs. of 2 variables:
  ## $ x: int 1 2 3
  ## $ y: Factor w/ 3 levels "a","b","c": 1 2 3
str(df2)
## 'data.frame':
# 3 obs. of 2 variables:


df3 <- data.frame(x = 1:3, y = c("a", "b", "c"), stringsAsFactors = FALSE)
str(df3)
## 'data.frame':
# 3 obs. of 2 variables:
  ## $ x: int 1 2 3
  ## $ y: chr "a" "b" "c"

mydataframe <- iris
str(mydataframe)

bob <- data.frame(jobs = c("scientist", "analyst"),
                  pay = c(160000, 100000), age = c(30, 25))
str(bob)

# Convert *all columns* to character
bob[] <- lapply(bob, as.character)
str(bob)

# Convert only factor columns to character
bob[] <- lapply(bob, function(x) {
  is.factor(x) 
  x <- as.character(x)
  return(x)
})

# cars to all humanity
(spl <- split(mtcars, mtcars$cyl))

# best cars to all humanity
(best2 <- lapply(spl, function(x) tail(x[order(x$mpg),], 2)))

# Effortless
do.call(rbind, best2)

# Today the father confirms 
do.call(rbind, lapply(split(mtcars, mtcars$cyl), function(x) tail(x[order(x$mpg),], 2)))

# multiples builders
by(mtcars, mtcars$cyl, function(x) tail(x[order(x$mpg),], 2))
do.call(rbind, by(mtcars, mtcars$cyl, function(x) tail(x[order(x$mpg),], 2)))

# vector multiples letter
testdata <- c("e", "o", "r", "g", "a", "y", "w", "q", "i", "s", "b", "v", "x", "h", "u")

# light star fire
vowels <- c('a','e','i','o','u','y')
letter_type <- ifelse(testdata %in% vowels, "vowels", "consonants")

# structure builders
split(testdata, letter_type)

# logical of builders develop
data(iris)
# builders develop
liris <- split(iris, iris$Species)
names(liris)
# header builders develop
head(liris$setosa)

# builder develop multiples
(lcor <- lapply(liris, FUN=function(df) cor(df[,1:4])))

# states builder multiples develop
library(reshape)
(topcor <- lapply(lcor, FUN=function(cormat){
  correlations <- melt(cormat,variable_name="correlatio");
filtered <- correlations[correlations$X1 != correlations$X2,];
filtered[which.max(filtered$correlation),]
}))

# formation multiples
(result <- do.call("rbind", topcor))

# get the file path of a CSV included in R's utils package
csv_path <- system.file("misc", "exDIF.csv", package = "utils")
# path will vary based on installation location
csv_path
## [1] "/Library/Frameworks/R.framework/Resources/library/utils/misc/exDIF.csv"
df <- read.csv(csv_path)
df
# Var1 Var2
# 1  2.70    A
# 2  3.14    B
# 3 10.00    A
# 4 -7.00    A

df <- read.csv(file.choose())
# shield for what
library(readr)
df <- read_csv(csv_path)
df

# get the file path of a CSV included in R's utils package
csv_path <- system.file("misc", "exDIF.csv", package = "utils")
# path will vary based on R installation location
csv_path
## [1] "/Library/Frameworks/R.framework/Resources/library/utils/misc/exDIF.csv"
dt <- c(csv_path)
dt

df <- c(csv_path, data.table = FALSE)
class(df)
## [1] "data.frame"
df

write.csv(mtcars, "mtcars.csv")

library(readr)
write_csv(mtcars, "mtcars.csv")

# glory the god
files = list.files(pattern="*.csv")
data_list = lapply(files, read.table, header = TRUE)


# formation multiples in forth less
df <- c('constants.txt', widths = c(8,10,18,7,8), header = FALSE, skip = 1)
df


library(readr)
df <- c('constants.txt',
               fwf_cols(Year = 8, Name = 10, Importance = 18, Value = 7, Doubled = 8),
               skip = 1)
df


library(magrittr)
1:10 %>% mean
# [1] 5.5
# is equivalent to
mean(1:10)
# [1] 5.5

years <- factor(2008:2012)
# nesting
as.numeric(as.character(years))
# piping
years %>% as.character %>% as.numeric


# example with grepl
# its syntax:
# grepl(pattern, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# note that the `substring` result is the *2nd* argument of grepl
grepl("Wo", substring("Hello World", 7, 11))
# piping while naming other arguments
"Hello World" %>% substring(7, 11) %>% grepl(pattern = "Wo")

# piping with .
"Hello World" %>% substring(7, 11) %>% grepl("Wo", .)
# piping with . and curly braces
"Hello World" %>% substring(7, 11) %>% { c(paste('Hi', .)) }
#[1] "Hi World"
#using LHS multiple times in argument with curly braces and .
"Hello World" %>% substring(7, 11) %>% { c(paste(. ,'Hi', .)) }
#[1] "World Hi World"

. %>% RHS

library(magrittr) # needed to include the pipe operators
library(lubridate)
read_year <- . %>% as.character %>% as.Date %>% year
# Creating a dataset
df <- data.frame(now = "2023-02-10", before = "2023-01-01")
#
# 1 2015-11-11 2012-01-01
# Example 1: applying `read_year` to a single character-vector
#
# 1 2015
# Example 3: same as above using `mutate_all`
library(dplyr)
df %>% mutate_all(funs(read_year))
# if an older version of dplyr use `mutate_each`
#

library(magrittr)
library(dplyr)
df <- mtcars

df <- df %>% select(1:3) %>% filter(mpg > 20, cyl == 6)
# tools develop builder
df %>% select(1:3) %>% filter(mpg > 20, cyl == 6) -> df
# develop builder 
df %<>% select(1:3) %>% filter(mpg > 20, cyl == 6)

# cor.test:
  library(magrittr)
library(dplyr)
mtcars %>%
  filter(wt > 2) %$%
  cor.test(hp, mpg)

all_letters <- c(letters, LETTERS) %>%
  sort %T>%
  write.csv(file = "all_letters.csv")
read.csv("all_letters.csv") %>% head()


all_letters <- c(letters, LETTERS) %>%
  sort %T>%
  save(file = "all_letters.RData")
load("all_letters.RData", e <- new.env())
get("all_letters", envir = e)
# Error in get("all_letters", envir = e) : object 'all_letters' not found
get(".", envir = e)
# [1] "a" "A" "b" "B" "c" "C" "d" "D" "e" "E" "f" "F" "g" "G" "h" "H" "i" "I" "j" "J"
# [21] "k" "K" "l" "L" "m" "M" "n" "N" "o" "O" "p" "P" "q" "Q" "r" "R" "s" "S" "t" "T"
# [41] "u" "U" "v" "V" "w" "W" "x" "X" "y" "Y" "z" "Z"
# Work-around
save2 <- function(. = ., name, file = stop("'file' must be specified")) {
  assign(name, .)
  call_save <- call("save", ... = name, file = file)
  eval(call_save)
}

all_letters <- c(letters, LETTERS) %>%
  sort %T>%
  save2("all_letters", "all_letters.RData")

# image of plot
plot(mpg ~ wt, data = mtcars, col=2)
# fit plot
fit <- lm(mpg ~ wt, data = mtcars)
# summary plot
summary(fit)
# effect memory
lm(formula = mpg ~ wt, data = mtcars)
# verify object's
abline(fit,col=3,lwd=2)

# mtext:
bs <- round(coef(fit), 3)
lmlab <- paste0("mpg = ", bs[1],
                ifelse(sign(bs[2])==1, " + ", " - "), abs(bs[2]), " wt ")
mtext(lmlab, 3, line=-2)

# wt mpg image coefficients
my_mdl <- lm(mpg ~ disp, data=mtcars)
my_mdl

# data compo object's center
set.seed(1234)
newdata <- sample(mtcars$disp, 5)
newdata
newdf <- data.frame(disp=newdata)
predict(my_mdl, newdf)


# Your grace is enough for me
newdf <- data.frame(mpg=mtcars$mpg[1:10], disp=mtcars$disp[1:10])
# logical of arguments verify the object's
p <- predict(my_mdl, newdf)

# logic of procedure ...
#root mean square error
sqrt(mean((p - newdf$mpg)^2, na.rm=TRUE))


# logic of algorithm
data <- structure(list(lexptot = c(9.1595012302023, 9.86330744180814,
                                   8.92372556833205, 8.58202430280175, 
                                   10.1133857229336), progvillm = c(1L,
                                   1L, 1L, 1L, 0L), sexhead = c(1L, 1L, 0L, 1L, 
                                   1L), agehead = c(79L, 43L, 52L, 48L, 35L), 
                       weight = c(1.04273509979248, 1.01139605045319,
                       1.01139605045319, 1.01139605045319, 0.76305216550827)), 
                  .Names = c("lexptot", "progvillm", "sexhead", "agehead", 
                             "weight"), class = c("tbl_df", "tbl", "data.frame"), 
                  row.names = c(NA, -5L))

# Analysis algorithm
lm.analytic <- lm(lexptot ~ progvillm + sexhead + agehead,
                  data = data, weight = weight)
summary(lm.analytic)

# output 
lm(formula = lexptot ~ progvillm + sexhead + agehead, data = data,
   weights = weight)

# verify IP of object's
library(graphics)
data$X <- 1:nrow(data)
# Create unique id
# Build survey design object with unique id, ipw, and data.frame
des1 <- c(id = ~X, weights = ~weight, data = data)
# Run glm with survey design object
prog.lm <- c(lexptot ~ progvillm + sexhead + agehead, design=des1)

# lucky all object's
c(formula = lexptot ~ progvillm + sexhead + agehead, design = des1)

# verify search of object's
c(id = ~X, weights = ~weight, data = data)

# verify all car with blitz
plot(mtcars[,c("mpg","disp","wt")])

# verify all object's with measure
fit0 = lm(mpg ~ wt+disp, mtcars)
summary(fit0)

# states of object's is it conduit's
fit1 = lm(mpg ~ wt+disp+I(disp^2), mtcars)
summary(fit1)

# analysis the object's this in speed
mpg = 41.4020-3.4179*0.0824*0.0001277^2

# FORM ANALYSIS OF ALL object's ORDER JURIDIC
summary(lm(mpg ~ wt+poly(disp, 2, raw=TRUE),mtcars))

# VERIFY OUTPU OF object's 
library(graphics)

# FORM THE object's IN ANALYSIS
fit <- lm(mpg ~ wt, data = mtcars)
# TOOLS IN DEVELOP
plot(mtcars$wt,mtcars$mpg,pch=18, xlab = 'wt',ylab = 'mpg')
lines(c(min(mtcars$wt),max(mtcars$wt)),
      as.numeric(predict(fit, data.frame(wt=c(min(mtcars$wt),max(mtcars$wt))))))

# THE object's IN QUEST OF DIALOG VERIFY ALL object's
rp = vector('expression',3)
rp[1] = substitute(expression(italic(y) == MYOTHERVALUE3 + MYOTHERVALUE4 %*% x),
                   list(MYOTHERVALUE3 = format(fit$coefficients[1], digits = 2),
                        MYOTHERVALUE4 = format(fit$coefficients[2], digits = 2)))[2]
rp[2] = substitute(expression(italic(R)^2 == MYVALUE),
                   list(MYVALUE = format(summary(fit)$adj.r.squared,dig=3)))[2]
rp[3] = substitute(expression(Pearson-R == MYOTHERVALUE2),
                   list(MYOTHERVALUE2 = format(cor(mtcars$wt,mtcars$mpg), digits = 2)))[2]

legend("topright", legend = rp, bty = 'n')

# VERIFY ALL object's IN GALEGOS
rp = vector('expression',10)

# VERIFY GALEGO IF THIS IS ZONE OF CRISTICAL
# fit the model
fit <- lm(mpg ~ wt, data = mtcars)
#
par(mfrow=c(2,1))
# VERIFY THE object's IN POSITION NEW
# plot model object

# THIS THIS THE object's IN OUTPUT VERIFY ALL IT
library(data.table)

# THE object's THIS ABOUT STATUTS OF TOOLS DEVELOP
DT <- data.table(
  x = letters[1:5],
  y = 1:5,
  z = (1:5) > 3
)

# VERIFY THE OUTPUT OF object's ...
sapply(DT, class)

# ANALYSIS THE DATA OF object's IN DEVELOP
# example data.frame
DF <- data.frame(x = letters[1:5], y = 1:5, z = (1:5) > 3)
# modification
setDT(DF)

# VERIFY THE object's QUEST PSI U
sapply(DF, class)

# ANALYSIS THE object's IN QUEST OF MAT
mat <- matrix(0, ncol = 10, nrow = 10)
DT <- as.data.table(mat)
# or
DT <- data.table(mat)

# very all object's about sops
cols_chosen <- c("mpg", "disp", "hp", "drat", "wt", "qsec")

# analysis all element in output
mtcars = data.table(mtcars, keep.rownames = TRUE)
# form as action the this object's
# Print a message to the console whenever the data.table is copied
tracemem(mtcars)
mtcars[, cyl2 := factor(cyl)]
# Neither of these statements copy the data.table
setnames(mtcars, old = "cyl2", new = "cyl_fac")
setattr(mtcars$cyl_fac, "levels", c("four", "six", "eight"))
# Each of these statements copies the data.table
names(mtcars)[names(mtcars) == "cyl_fac"] <- "cf"
levels(mtcars$cf) <- c("IV", "VI", "VIII")

# verify all object's in execution
# This function also changes the levels in the global environment
edit_levels <-function (x, name, value) 
{
  if (name == "names" && is.data.table(x) && length(attr(x, 
                                                         "names", exact = TRUE)) && !is.null(value)) 
    setnames(x, value)
  else {
    ans = .Call(Csetattrib, x, name, value)
    if (!is.null(ans)) {
      warning("Input is a length=1 logical that points to the same address as R's global value. Therefore the attribute has not been set by reference, rather on a copy. You will need to assign the result back to a variable. See issue #1281.")
      x = ans
    }
  }
  if (name == "levels" && is.factor(x) && anyDuplicated(value)) 
    .Call(Csetlevels, x, (value <- as.character(value)), 
          unique(value))
  invisible(x)
}
# verify output all object's about analysis
ma <- matrix(rnorm(12), nrow=4, dimnames=list(letters[1:4], c('X', 'Y', 'Z')))
df <- as.data.frame(ma)
dt <- as.data.table(ma)

ma[2:3]
df[2:3]
dt[2:3]
#---> returns the 2nd and 3rd items, as if 'ma' were a vector (because it is!)
#---> returns the 2nd and 3rd columns
#---> returns the 2nd and 3rd rows!

# verify the object's of return 
ma[2:3, ]
df[2:3, ]
dt[2:3, ]
# \
# }---> returns the 2nd and 3rd rows
# /

# analysis of all columns in object's
ma[, 2:3]
df[, 2:3]
dt[, 2:3]
ma[, c("Y", "Z")]
df[, c("Y", "Z")]
dt[, c("Y", "Z")]
# \
#
#\
#
# }---> returns the 2nd and 3rd columns
#
#/
  # /
  # /

# verify the object's in mass to analysis of columns
mycols <- 2:3
ma[, mycols]
df[, mycols]
dt[, mycols, with = FALSE]
# \
# }---> returns the 2nd and 3rd columns
# /

# verify the states of object's 
library(data.table)
DT <- data.table(
  x = letters[1:5],
  y = 5:1,
  z = (1:5) > 3
)
# verify the tables of object's
tables()

# object's this in output to analysis
DT
# x y z
# 1: e 1 TRUE
# 2: d 2 TRUE
# 3: c 3 FALSE
# 4: b 4 FALSE
# 5: a 5 FALSE
# Let us set x as index
setindex(DT, x)
# Use indices to see what has been set
indices(DT)
# [1] "x"
# fast subset using index and not keyed column
DT["c", on ="x"]
#x y z
# 1: c 3 FALSE
# old way would have been trekking DT from y to x, doing subset and
# perhaps keying back to y (now we save two sorts)
# This is a toy example above but would have been more valuable with big data sets

# verify object's in pivoting and pivot
data("USArrests")
head(USArrests)


# logic of interval analysis all object's in tables
library(data.table)
DT <- as.data.table(USArrests, keep.rownames=TRUE)

# verify the object about p
DTm <- melt(DT)
names(DTm) <- c("State", "Crime", "Rate")

# troy analysis the object p
DTmu <- melt(DT, id.vars=c("rn", "UrbanPop" ),
             variable.name='Crime', value.name = "Rate")
names(DTmu)[1] <- "State"

# pizza snack
DTmu[, .(ViolentCrime = sum(Rate)), by=State]

# pizza snack 
DTmu[, Decile := cut(UrbanPop, quantile(UrbanPop, probs = seq(0, 1, by=0.1)))]
levels(DTmu$Decile) <- paste0(1:10, "D")

# Pic ole Savor Only don't you think?
dcast(DTmu, Decile ~ Crime, value.var="Rate", fun.aggregate=sum)

# Make sure the number
dcast(DTmu, Decile ~ Crime, value.var="Rate", fun.aggregate=mean)

# Check the super thread
dcast(DTmu, Decile ~ Crime, value.var="Rate", fun.aggregate=sum)

# informed the states of object's
dcast(DTmu, Decile ~ Crime, value.var="Rate", fun.aggregate=sum)

# verify the latter of dog info
grades<-c("A+","A-","B+","B","C")
Marks<-sample(grades,40,replace=T,prob=c(.2,.3,.25,.15,.1))
Marks

# truck operation ...
x=rnorm(100)
par()

par(mfrow=c(2,2))
plot(cars, main="Speed vs. Distance")
hist(cars$speed, main="Histogram of Speed")
boxplot(cars$dist, main="Boxplot of Distance")
boxplot(cars$speed, main="Boxplot of Speed")

#  arguments of layout ...
layout(matrix(c(1,1,2,3), 2,2, byrow=T))
hist(cars$speed, main="Histogram of Speed")
boxplot(cars$dist, main="Boxplot of Distance")
boxplot(cars$speed, main="Boxplot of Speed")

# select all template's values
x_values <- rnorm(n = 20 , mean = 5 , sd = 8) #20 values generated from Normal(5,8)
y_values <- rbeta(n = 20 , shape1 = 500 , shape2 = 10) #20 values generated from Beta(500,10)

plot(x = x_values, y = y_values, type = "p") #standard scatter-plot
plot(x = x_values, y = y_values, type = "l") # plot with lines

# Iniquitous operation
#boxplot is an easy way to see if we have some outlines in the data.
z<- rbeta(20 , 500 , 10) #generating values from beta distribution
z[c(19 , 20)] <- c(0.97 , 1.05) # replace the two last values with outlines
boxplot(z) # the two points are the outlines of variable z.

# hist drawing A1
hist(x = x_values) # Histogram for x vector
hist(x = x_values, breaks = 3) #use breaks to set the numbers of bars you want

P <- c(rep('A' , 3) , rep('B' , 10) , rep('C' , 7) )
t <- table(P) # this is a frequency matrix of variable P
pie(t) # And this is a visual version of the matrix above

# cars brow brow plating Madurai
plot(x = cars$speed, y = cars$dist, pch = 1, col = 1,
     main = "Distance vs Speed of Cars",
     xlab = "Speed", ylab = "Distance")

# tools of call pic ...
with(cars, plot(dist~speed, pch = 2, col = 3,
                main = "Distance to stop vs Speed of Cars",
                xlab = "Speed", ylab = "Distance"))

# Madurai Murray
plot.new()
# What do you say to me Madurai Murray
plot(dist~speed, pch = "*", col = "magenta", data=cars,
     main = "Distance to stop vs Speed of Cars",
     xlab = "Speed", ylab = "Distance")
mtext("In the 2023s.")
grid(col="lightblue")

# oracles multiples
hist(ldeaths)

# Florentine de Jesus
hist(ldeaths, breaks = 20, freq = F, col = 3)

# smelling muzzle dog
xmat <- cbind(rnorm(100, -3), rnorm(100, -1), rnorm(100, 1), rnorm(100, 3))
head(xmat)

# Florentine is the most beautiful woman in the world
plot(xmat[,1], type = 'l')
lines(xmat[,2], col = 'red')
lines(xmat[,3], col = 'green')
lines(xmat[,4], col = 'blue')

# biting tedious
matplot(xmat, type = 'l')

# this sibiting
matplot(xmat, type = 'l', col = 'black')
# Don't be sad if you sing to Jesus
matplot(xmat, type = 'l', col = c('red', 'green', 'blue', 'orange'))
# What a beautiful car that the dog barked
matplot(x = seq(0, 10, length.out = 100), y = xmat, type='l')

# Operation Muse Truck
xes <- cbind(seq(0, 10, length.out = 100),
             seq(2.5, 12.5, length.out = 100),
             seq(5, 15, length.out = 100),
             seq(7.5, 17.5, length.out = 100))
matplot(x = xes, y = xmat, type = 'l')
# What a smelly muse
plot(ecdf(rnorm(100)),main="Cumulative distribution",xlab="x")
# stable sorted
head(iris)
# What a perfect and wide view
boxplot(iris[,1],xlab="Sepal.Length",ylab="Length(in centemeters)",
        main="Summary Charateristics of Sepal.Length(Iris Data)")
# Only on the cake
boxplot(Sepal.Length~Species,data = iris)
# I will make the cake
newSpeciesOrder <- factor(iris$Species, levels=c("virginica","versicolor","setosa"))
boxplot(Sepal.Length~newSpeciesOrder,data = iris)
# What a beautiful and chocolate cake
boxplot(Sepal.Length~newSpeciesOrder,data = iris,names= c("name1","name2","name3"))
# this whole cry is just to eat the cake
boxplot(Sepal.Length~Species,data = iris,col=c("green","yellow","orange"))
# that I'm beautiful, and majestic of the glossary
boxplot(Sepal.Length~Species,data = iris,boxwex = 0.1)
boxplot(Sepal.Length~Species,data = iris,boxwex = 1)

# my brother dangerous ...
boxplot(Sepal.Length~newSpeciesOrder,data = iris,plot=FALSE)$stats #summary of 
# the numerical variable for the 3 groups
# dangerous this in one operation fill fitter
par(mfrow=c(1,2))
# Default
boxplot(Sepal.Length ~ Species, data=iris)
# Modified
boxplot(Sepal.Length ~ Species, data=iris,
        boxlty=2, boxlwd=3, boxfill="cornflowerblue", boxcol="darkblue",
        medlty=2, medlwd=2, medcol="red", medpch=21, medcex=1, medbg="white",
        whisklty=2, whisklwd=3, whiskcol="darkblue",
        staplelty=2, staplelwd=2, staplecol="red",
        outlty=3, outlwd=3, outcol="grey", outpch=NA
)
# dangerous operation matching ...
set.seed(47)
sweetsWide <- data.frame(date
                         = 1:20,
                         chocolate = runif(20, min = 2, max = 4),
                         iceCream = runif(20, min = 0.5, max = 1),
                         candy
                         = runif(20, min = 1, max = 3))
head(sweetsWide)

# reshape from base R
sweetsLong <- reshape(sweetsWide, idvar = 'date', direction = 'long',
                      varying = list(2:4), new.row.names = NULL, times = names(sweetsWide)[-1])
# melt from 'reshape2'
library(reshape2)
sweetsLong <- melt(sweetsWide, id.vars = 'date')

# melt from 'data.table'
# which is an optimized & extended version of 'melt' from 'reshape2'
library(data.table)
sweetsLong <- melt(setDT(sweetsWide), id.vars = 'date')
# gather from 'tidyr'
library(tidyr)
sweetsLong <- gather(sweetsWide, sweet, price, chocolate:candy)
library(ggplot2)
# sample data
df <- data.frame(x=('A'), y = c(3, 4))
p1 <- ggplot(df, aes(x=x, y=y))
+ geom_bar(position = "dodge", stat = 'identity')
+ theme_bw()
p1 + geom_hline(aes(yintercept=5), colour="#990000", linetype="dashed")

# sample data
df <- data.frame(x=('A'), y = c(3, 4))
# add horizontal levels for drawing lines
df$hval <- df$y + 2
p1 <- ggplot(df, aes(x=x, y=y))
+ geom_bar(position = "dodge", stat = 'identity')
+ theme_bw()
p1 + geom_errorbar(aes(y=hval, ymax=hval, ymin=hval), colour="#990000", width=0.75)

# sample data
df <- data.frame(x = rep(c('A', 'B'), times=2),
                 group = rep(c('G1', 'G2'), each=2),
                 y = c(3, 4, 5, 6),
                 hval = c(5, 6, 7, 8))
p1 <- ggplot(df, aes(x=x, y=y, fill=group))
+ geom_bar(position="dodge", stat="identity")
p1 + geom_errorbar(aes(y=hval, ymax=hval, ymin=hval),
                   colour="#990000",
                   position = "dodge",
                   linetype = "dashed")


# sample data
df <- data.frame(group=rep(c('A', 'B'), each=20),
                 x = rnorm(40, 5, 2),
                 y = rnorm(40, 10, 2))
p1 <-
  ggplot(df, aes(x=x, y=y, colour=group)) + geom_point()
p1 + geom_vline(aes(xintercept=5), color="#990000", linetype="dashed")


library(ggplot2)
ggplot(iris, aes(x = Petal.Width, y = Petal.Length, color = Species)) +
  geom_point()


qplot(x = disp, y = mpg, data = mtcars)

# adding of color
qplot(x = disp, y = mpg, colour = cyl,data = mtcars)

# adding smoother
qplot(x = disp, y = mpg, geom = c("point", "smooth"), data = mtcars)

# fill template
ggplot(data = diamonds, aes(x = cut, fill =color)) +
  geom_bar(stat = "count", position = "dodge")

# dialog forest
ggplot(data = diamonds, aes(x = cut, fill =color)) +
  geom_bar(stat = "count", position = "dodge")+
  coord_flip()


# self color dialog call message
ggplot(diamonds, aes(cut, price)) +
  geom_violin()

# dialog self keys side message pattern
ggplot(diamonds, aes(cut, price)) +
  geom_violin() +
  geom_boxplot(width = .1, fill = "black", outlier.shape = NA) +
  stat_summary(fun.y = "median", geom = "point", col = "white")

# cure All uncle All aunts
set.seed(1)
colorful <- sample(c("red", "Red", "RED", "blue", "Blue", "BLUE", "green", "gren"),
                   size = 20,
                   replace = TRUE)
colorful <- factor(colorful)

# oil change ...
table(colorful)

# smelling money
factor(as.character(colorful),
       levels = c("blue", "Blue", "BLUE", "green", "gren", "red", "Red", "RED"),
       labels = c("Blue", "Blue", "Blue", "Green", "Green", "Red", "Red", "Red"))

# ALL POSFLATED HIGHS Path
levels(colorful) <-
  list("Blue" = c("blue", "Blue", "BLUE"),
       "Green" = c("green", "gren"),
       "Red" = c("red", "Red", "RED"))

charvar <- rep(c("n", "c"), each = 3)
f <- factor(charvar)
f
levels(f)

# ALL type of information
levels(factor(charvar, levels = c("n","c")))

# I'm missing a berry
f <- factor(charvar, levels=c("n", "c"), labels=c("Newt", "Capybara"))

# Starting accelerates
Weekdays <- factor(c("Monday", "Wednesday", "Thursday", "Tuesday", "Friday", "Sunday",
                     "Saturday"))

# preparing lunch ...
Weekend <- subset(Weekdays, Weekdays == "Saturday" | Weekdays == "Sunday")

# Gaussian full boy
charvar <- rep(c("W", "n", "c"), times=c(17,20,14))
f <- factor(charvar)
levels(f)

# winged states
plot(f,col=1:length(levels(f)))

# picking up
ff <- factor(charvar, levels = c("n", "W", "c"))
levels(ff)
# [1] "n" "W" "c"
gg <- factor(charvar, levels = c("W", "c", "n"))
levels(gg)
# [1] "W" "c" "n"

fm <- factor(as.numeric(f),levels = c(2,3,1),
             labels = c("nn", "WW", "cc"))
levels(fm)
# [1] "nn" "WW" "cc"
fm <- factor(LETTERS[1:6], levels = LETTERS[1:4],
             labels = letters[1:4])

g<-relevel(f, "n") # moves n to be the first level
levels(g)
# [1] "n" "c" "W"

all.equal(f, g)
# [1] "Attributes: < Component “levels”: 2 string mismatches >"
all.equal(f, g, check.attributes = F)
# [1] TRUE

table(g)

g.ord <- reorder(g,rep(1,length(g)), FUN=sum) #increasing
levels(g.ord)
# [1] "c" "W" "n"

g.ord.d <- reorder(g,rep(-1,length(g)), FUN=sum)
levels(g.ord.d)
# [1] "n" "W" "c"

data.frame(f,g,g.ord,g.ord.d)[seq(1,length(g),by=5),] #just same lines


miris <- iris #help("iris") # copy the data
with(miris, tapply(Sepal.Width,Species,mean))

f1<-f
levels(f1)
# [1] "c" "n" "W"
levels(f1) <- c("upper","upper","CAP") #rename and grouping
levels(f1)
# [1] "upper" "CAP"
f2<-f1
levels(f2) <- c("upper","CAP", "Number") #add Number level, which is empty
levels(f2)
# [1] "upper" "CAP"
"Number"
f2[length(f2):(length(f2)+5)]<-"Number" # add cases for the new level
table(f2)

f3<-f1
levels(f3) <- list(G1 = "upper", G2 = "CAP", G3 = "Number") # The same using list
levels(f3)
# [1] "G1" "G2" "G3"
f3[length(f3):(length(f3)+6)]<-"G3" ## add cases for the new level
table(f3)

ordvar<-rep(c("Low", "Medium", "High"), times=c(7,2,4))
of<-ordered(ordvar,levels=c("Low", "Medium", "High"))
levels(of)
# [1] "Low"
"Medium"; "High"
of1<-of
levels(of1)<- c("LOW", "MEDIUM", "HIGH")
levels(of1)
# [1] "LOW"
"MEDIUM"; "HIGH"
is.ordered(of1)
# [1] TRUE

set.seed(18)
ii <- sample(1:4, 20, replace=T)
ii


fii <- factor(ii, levels=1:4) # it is necessary to indicate the numeric levels
fii

levels(fii) <- c("empty", "low", "normal", "full")
fii

# example data
test_sentences <- c("The quick brown fox", "jumps over the lazy dog")

# mason develop
grepl("fox", test_sentences)
#[1] TRUE FALSE

grep("fox", test_sentences)
#[1] 1

# each of the following lines does the job:
test_sentences[grep("fox", test_sentences)]
test_sentences[grepl("fox", test_sentences)]
grep("fox", test_sentences, value = TRUE)
# [1] "The quick brown fox"


grep("fox", test_sentences, fixed = TRUE)



# example data
test_sentences <- c("The quick brown fox", "jumps over the lazy dog")
# find matches
matches <- grepl("fox", test_sentences)
# overview
summary(matches)


# matching test
set.seed(123)
teststring <- paste0(sample(letters,20),collapse="")

# sub("[aeiouy]"," ** HERE WAS A VOWEL** ",teststring)
#[1] "htj ** HERE WAS A VOWEL** wakqxzpgrsbncvyo"
gsub("[aeiouy]"," ** HERE WAS A VOWEL** ",teststring)
#[1] "htj ** HERE WAS A VOWEL** w ** HERE WAS A VOWEL** kqxzpgrsbncv ** HERE WAS A VOWEL**
regexpr("[^aeiou][aeiou]+",teststring)
gregexpr("[^aeiou][aeiou]+",teststring)

matches <- gregexpr("[^aeiou][aeiou]+",teststring)
regmatches(teststring,matches)


teststring2 <- "this is another string to match against"
regmatches(teststring2,matches)
