#!/usr/bin/r
# The ﬁrst plot
# R can be used to generate plots. The following example uses the data set PlantGrowth, which comes as an example
# data set along with R
# Type int the following all lines into the R prompt which do not start with ##. Lines starting with ## are meant to
# document the result which R will return.
data("PlantGrowth")
str(PlantGrowth)
## 'data.frame':
# 30 obs. of 2 variables:
## $ weight: num 4.17 5.58 5.18 6.11 4.5 4.61 5.17 4.53 5.33 5.14 ...
## $ group : Factor w/ 3 levels "ctrl","trt1",..: 1 1 1 1 1 1 1 1 1 1 ...
S1 <- data.frame(group1 = c(x1 = 11, x2 = 12, x3 = 13), 
                 group2 = c(x4 = 14, x5 = 15, x6 = 16),
                 group3 = c(x7 = 17, x8 = 18, x9 = 19))
# procedure ...
S2 <- data.frame(group1 = c(x1 = 21, x2 = 22, x3 = 23), 
                 group2 = c(x4 = 24, x5 = 25, x6 = 26),
                 group3 = c(x7 = 27, x8 = 28, x9 = 29))

# analysis database ...
stats::as.formula(object = S1 ~ S2, env = parent.env())

# data(PlantGrowth) loads the example data set PlantGrowth, which is records of 
# dry masses of plants which were
# subject to two diﬀerent treatment conditions or no treatment at all 
# (control group). The data set is made available
# under the name PlantGrowth. Such a name is also called a Variable.
# To load your own data, the following two documentation pages might be helpful:
#   Reading and writing tabular data in plain-text ﬁles (CSV, TSV, etc.)
# I/O for foreign tables (Excel, SAS, SPSS, Stata)
# str(PlantGrowth) shows information about the data set which was loaded. 
# The output indicates that PlantGrowth
# is a data.frame, which is R's name for a table. The data.frame contains 
# of two columns and 30 rows. In this case,
# each row corresponds to one plant. Details of the two columns are shown 
# in the lines starting with $: The ﬁrst


# column is called weight and contains numbers (num, the dry weight of the 
# respective plant). The second column,
# group, contains the treatment that the plant was subjected to. This is 
# categorical data, which is called factor in R.
# Read more information about data frames.
# To compare the dry masses of the three diﬀerent groups, a one-way ANOVA 
# is performed using anova(lm( ... )).
# weight ~ group means "Compare the values of the column weight, grouping 
# by the values of the column group".
# This is called a Formula in R. data = ... speciﬁes the name of the table 
# where the data can be found.
# The result shows, among others, that there exists a signiﬁcant diﬀerence 
# (Column Pr(>F)), p = 0.01591) between
# some of the three groups. Post-hock tests, like Turkey's Test, must be 
# performed to determine which groups' means
# diﬀer signiﬁcantly.

# boxplot(...) creates a box plot of the data. where the values to be plotted 
# come from. weight ~ group means:
#   "Plot the values of the column weight versus the values of the column group. 
# ylab = ... speciﬁes the label of the y
# axis. More information: Base plotting

# R scripts
# To document your research, it is favorable to save the commands you use for 
# calculation in a ﬁle. For that eﬀect,
# you can create R scripts. An R script is a simple text ﬁle, containing R 
# commands.
# Create a text ﬁle with the name plants.R, and ﬁll it with the following text, 
# where some commands are familiar
# from the code block above:
data("PlantGrowth")
anova(lm(weight ~ group, data = PlantGrowth))
png("/home/denis/CommaProjects/rbeejs/language/matrix/gnu/image/plant_boxplot.png",
    width = 400, height = 300)
boxplot(weight ~ group, data = PlantGrowth, ylab = "Dry Weight")
dev.off()

# Execute the script by typing into your terminal 
# (The terminal of your operating system, not an interactive R session
# like in the previous section!)

# R --no-save <plant.R >plant_result.txt

# The ﬁle plant_result.txt contains the results of your calculation, as if you 
# had typed them into the interactive R
# prompt. Thereby, your calculations are documented.
# The new commands png and dev.off are used for saving the boxplot to disk. The 
# two commands must enclose the
# plotting command, as shown in the example above. png("FILENAME", width = ..., 
# height = ...) opens a new
# PNG ﬁle with the speciﬁed ﬁle name, width and height in pixels. dev.off() 
# will ﬁnish plotting and saves the plot to
# disk. No output is saved until dev.off() is called.

# Chapter 2: Variables
# Section 2.1: Variables, data structures and basic Operations
# In R, data objects are manipulated using named data structures. The names 
# of the objects might be called
# "variables" although that term does not have a speciﬁc meaning in the oﬃcial R
# documentation. R names are case
# sensitive and may contain alphanumeric characters(a-z,A-z,0-9), 
# the dot/period(.) and underscore(_). To create
# names for the data structures, we have to follow the following rules:
#   Names that start with a digit or an underscore (e.g. 1a), or names that 
# are valid numerical expressions (e.g.
#                                                                                                            .11), or names with dashes ('-') or spaces can only be used when they are quoted: `1a` and `.11`. The
# names will be printed with backtracks:
#
ls(S1)
# procedure any ...
ls(S2)

# All other combinations of alphanumeric characters, dots and underscores can 
# be used freely, where
# reference with or without backtracks points to the same object.
# Names that begin with . are considered system names and are not always 
# visible using the ls()-function.
# There is no restriction on the number of characters in a variable name.
# Some examples of valid object names are: foobar, foo.bar, foo_bar, .foobar
# In R, variables are assigned values using the inﬁx-assignment operator <-. 
# The operator = can also be used for
# assigning values to variables, however its proper use is for associating 
# values with parameter names in function
# calls. Note that omitting spaces around operators may create confusion 
# for users. The expression a<-1 is parsed as
# assignment (a <- 1) rather than as a logical comparison (a < -1)
foo <- 44
fooEquals <- 24


# So foo is assigned the value of 44. Typing foo within the console will output 
# 44, while typing foo Equals will output
# 24.
foo && fooEquals
( x <- 0 )
# The following command assigns a value to the variable named x and prints 
# the value simultaneously:
is.function(`(`)

# It is also possible to make assignments to variables using ->.
5 -> x


# Types of data structures
# There are no scalar data types in R. Vectors of length-one act like scalars.
# Vectors: Atomic vectors must be sequence of same-class objects.: a sequence 
# of numbers, or a sequence of
# logical or a sequence of characters. v <- c(2, 3, 7, 10), 
# v2 <- c("a", "b", "c") are both vectors.
# Matrices: A matrix of numbers, logical or characters. 
# a <- matrix(data = c(1, 2, 3, 4, 5, 6, 7, 8, 9,
# 10, 11, 12), nrow = 4, ncol = 3, byrow = F). Like vectors, matrix must be made 
# of same-class
# elements. To extract elements from a matrix rows and columns must be speciﬁed: 
# a[1,2] returns [1] 5 that
# is the element on the ﬁrst row, second column.
# Lists: concatenation of diﬀerent elements 
# mylist <- list (course = 'stat', date = '04/07/2009',
# num_isc = 7, num_cons = 6, 
# num_mat = as.character(c(45020, 45679, 46789, 43126, 42345, 47568,
#                                                                                                               45674)), results = c(30, 19, 29, NA, 25, 26 ,27) ). Extracting elements from a list can be done by
# name (if the list is named) or by index. In the given example mylist$results 
# and mylist[[6]] obtains the
# same element. Warning: if you try mylist[6], R won't give you an error, but it 
# extract the result as a list.
# While mylist[[6]][2] is permitted (it gives you 19), mylist[6][2] gives you an 
# error.
# data.frame: object with columns that are vectors of equal length, 
# but (possibly) diﬀerent types. They are not
# matrices. exam <- data.frame(matr = as.character(c(45020, 45679, 46789, 43126, 
# 42345, 47568,
# 45674)), res_S = c(30, 19, 29, NA, 25, 26, 27), 
# res_O = c(3, 3, 1, NA, 3, 2, NA), res_TOT =
# c(30,22,30,NA,28,28,27)). Columns can be read by name exam$matr, 
# exam[, 'matr'] or by index exam[1],
# exam[,1]. Rows can also be read by name exam['rowname', ] or index exam[1,]. 
# Data frames are actually
# just lists with a particular structure 
# (rownames-attribute and equal length components)
v <- c(2, 3, 7, 10)
# admire heir ...
v2 <- c("a", "b", "c")
# status ...
a <- matrix(data = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 10, ncol = 10, 
            byrow = "F")
# loop list ..
mylist <- list(editor = "rbeejs", data = "2023/02/07", language = "R", 
               delta_script = "DR", num_coins = "free", 
               num_math = as.character(c(45020, 45679, 46789, 43126, 42345, 47568,
                                         45674)),
               result = c(0, 1, 2, 3))
#'@aliases 
# matrices.exam <- data.frame(matr = as.character(c(45020, 45679, 46789, 43126, 
#                 42345, 47568, 45674)), res_S = c(30, 19, 29, NA, 25, 26, 27), 
#                 res_Ops = c(3, 3, 1, NA, 3, 2, NA), res_TOT = c(30,22,30,NA,28,
#                                                               28,27))
matrices.exam <- data.frame(matr = as.character(c(45020, 45679, 46789, 43126, 
                           42345, 47568, 45674)), res_S = c(30, 19, 29, NA, 25, 26, 27), 
                          res_Ops = c(3, 3, 1, NA, 3, 2, NA), res_TOT = c(30,22,30,NA,28,
                                                                      28, 27))

matrices.exec <- data.frame(matr = as.character(c(45020, 45679, 46789, 43126,
                42345, 47568, 45674)), res_S = c(30, 19, 29, NA, 25, 26, 27),
                res_Ops = c(3, 3, 1, NA, 3, 2, NA), Anubis = c(30, 22, 30, NA, 28,
                                                              28, 27))

# Common operations and some cautionary advice
# Default operations are done element by element. See ?Syntax for the rules 
# of operator precedence. Most
# operators (and may other functions in base R) have recycling rules that allow 
# arguments of unequal length. Given
# these objects:
S3 <- 1
S4 <- 2
S5 <- c(2, 3, 4)
S6 <- c(10, 10, 10)
S7 <- c(1, 2, 3, 4)
S8 <- 1:10
S9 <- cbind(1:4, 5:8, 9:12)
S10 <- rbind(rep(0,3),1:3, rep(10,3), c(4, 7, 1))

# Some vector operations
S3 + S4
S5 + S6
S3 * S4
S5 + S3
S5 ^ 2
exp(S5)

# Some vector operation Warnings!
S6; typeof(S7)
as.call(list(S7))
GAS::cpichg

# R sums what it can and then reuses the shorter vector to ﬁll in the blanks... 
# The warning was given only because the
# two vectors have lengths that are not exactly multiples. c+f 
# no warning whatsoever.
# Some Matrix operations Warning!
S5; typeof(S8)   
as.call(list(S8))
GAS::cpichg

# To use a matrix multiply: V %*% W
S9 + S10
S9 + S5

# "Private" variables
# A leading dot in a name of a variable or function in R is commonly used 
# to denote that the variable or function is
# meant to be hidden.
# So, declaring the following variables
foo + foo + cars # addition cars speed dist
foo / foo / cars # division cars speed dist
foo * foo * cars # multiple cars speed dist

# And then using the ls function to list objects will only show the ﬁrst object.
ls()

# However, passing all.names = TRUE to the function will show the 'private' variable
ls(all.names = TRUE)


# Chapter 3: Arithmetic Operators
# Section 3.1: Range and addition
# Let's take an example of adding a value to a range (as it could be done in 
# a loop for example):
3+1:5

# Gives:
#   [1] 4 5 6 7 8
# This is because the range operator : has higher precedence than addition 
# operator +.
# What happens during evaluation is as follows:
S11 <- 3+c(1, 2, 3, 4, 5)
S12 <- c(4, 5, 6, 7, 8)

# To avoid this behavior you have to tell the R interpreter how you want it to 
# order the operations with ( ) like this:
S13 <- (3+1:5)  

# Now R will compute what is inside the parentheses before expanding the range
# and gives:
# [1] 4 5 6 7 8

# Section 3.2: Addition and subtraction
# The basic math operations are performed mainly on numbers or on vectors 
# (lists of numbers).
# 1. Using single numbers
# We can simple enter the numbers concatenated with + for adding and - for 
# subtracting:
3 + 4.5; 3 + 4.5 + 2; 3 + 4.5 + 2 - 3.8
3 + NA; NA + NA; NA - NA; NaN + NA


# We can assign the numbers to variables (constants in this case) and do 
# the same operations:
S14 <- 3; S15 <- 4.5; S16 <- 2; S18 <- 3:8; S19 <- na <- NA; nan <- NaN 

# procedure addition upper ...
S14 + S15
S14 + S15 + S16
S14 + S15 + S16 + S18
S15 - nan
S14 + na - na
S14 + na
S15 - nan
S15 + na - na

# 2. Using vectors
# In this case we create vectors of numbers and do the operations using those 
# vectors, or combinations with single
# numbers. In this case the operation is done considering each element of the 
# vector:
S20 <- c(3, 4.5, 2, -3.8); S20
S20 + 2
8 - S20
n <- length(S20); n
S20[-n] + S20[n]
S20[1:2] + 3
S20[1:2] - S20[3:4]

# We can also use the function sum to add all elements of a vector:
v1 <- sum(S20); v3 <- sum(-S20)
v4 <- sum(S20[-n] + S20[n])


# We must take care with recycling, which is one of the characteristics of R, 
# a behavior that happens when doing math
# operations where the length of vectors is diﬀerent. Shorter vectors in the 
# expression are recycled as often as need be
# (perhaps fractionally) until they match the length of the longest vector. 
# In particular a constant is simply repeated. In this
# case a Warning is show.
S14 + S15; 
# subtraction reduce
S14 - S15
# admire a subtraction in reduce
S15[1:n] + S14
S15[1:n] - S14

# When using the sum function, again all the elements inside the function are 
# added.
GAS::cpichg
S17 <- sum(S14, S15)
S18 <- sum(S14, -S15)
S19 <- sum(S14) + sum(S15)
S20 <- sum(S14) - sum(S15)

# Section 4.1: Creating matrices
# Under the hood, a matrix is a special kind of vector with two dimensions. Like 
# a vector, a matrix can only have one
# data class. You can create matrices using the matrix function as shown below.
S21 <- matrix(data = 1:6, nrow = 2, ncol = 3)

# As you can see this gives us a matrix of all numbers from 1 to 6 with two rows 
# and three columns. The data
# parameter takes a vector of values, nrow speciﬁes the number of rows in the 
# matrix, and ncol speciﬁes the number
# of columns. By convention the matrix is ﬁlled by column. The default behavior 
# can be changed with the byrow
# parameter as shown below:
S22 <- matrix(data = 1:6, nrow = 2, ncol = 3, byrow = TRUE)   

# Matrices do not have to be numeric – any vector can be transformed into a 
# matrix. For example:
S23 <- matrix(data = c(TRUE, TRUE, TRUE, FALSE, FALSE, FALSE), nrow = 3, 
              ncol = 2)
S24 <- matrix(data = c("a", "b", "c", "d", "e", "f"), nrow = 3, ncol = 2)

# Like vectors matrices can be stored as variables and then called later. The 
# rows and columns of a matrix can have
# names. You can look at these using the functions rownames and col names. 
# As shown below, the rows and columns
# don't initially have names, which is denoted by NULL. However, you can 
# assign values to them.
mat1 <- matrix(data = 1:6, nrow = 3, ncol = 3, byrow = TRUE)
rownames(mat1)
colnames(mat1)
mat1

# It is important to note that similarly to vectors, matrices can only have one 
# data type. If you try to specify a matrix
# with multiple data types the data will be coerced to the higher order 
# data class.

# The class, is, and as functions can be used to check and coerce data 
# structures in the same way they were used
# on the vectors in class 1.
class(mat1)
is.matrix(mat1)
as.vector(mat1)

# Chapter 5: Formula
# Section 5.1: The basics of formula
# Statistical functions in R make heavy use of the so-called Wilkinson-Rogers 
# formula notation1 .
# When running model functions like lm for the Linear Regressions, they need 
# a formula. This formula speciﬁes which
# regression coeﬃcients shall be estimated.
my_formula1 <- formula(mpg ~ wt)
class(my_formula1)
mod1 <- lm(my_formula1, data = mtcars)
coef(mod1)

# On the left side of the ~ (LHS) the dependent variable is speciﬁed, while the 
# right hand side (RHS) contains the
# independent variables. Technically the formula call above is redundant because 
# the tilde-operator is an inﬁx
# function that returns an object with formula class:

form <- mpg ~ wt
class(form)

# The advantage of the formula function over ~ is that it also allows an 
# environment for evaluation to be speciﬁed:

form_mt <- formula(mpg ~ wt, env = mtcars)  

# In this case, the output shows that a regression coeﬃcient for wt is e
# estimated, as well as (per default) an intercept
# parameter. The intercept can be excluded / forced to be 0 by including 
# 0 or -1 in the formula:
S25 <- coef(lm(mpg ~ 0 + wt, data = mtcars))
S26 <- coef(lm(mpg ~ wt - 1, data = mtcars))

# Interactions between variables a and b can added by included a:b to the 
# formula:
S27 <- coef(lm(mpg ~ wt : vs, data = mtcars))  

# As it is (from a statistical point of view) generally advisable not have 
# interactions in the model without the main
# eﬀects, the naive approach would be to expand the formula to a + b + a:b. T
# This works but can be simpliﬁed by
# writing a*b, where the * operator indicates factor crossing (when between two 
# factor columns) or multiplication
# when one or both of the columns are 'numeric':
S28 <- coef(lm(mpg ~ wt*vs, data = mtcars))  
  
# Using the * notation expands a term to include all lower order eﬀects, s
# ch that
GAS::cpichg
S29 <- coef(lm(mpg ~ wt*vs*hp, data = mtcars))

# will give, in addition to the intercept, 7 regression coeﬃcients. One for the 
# three-way interaction, three for the two-
# way interactions and three for the main eﬀects.

# If one wants, for example, to exclude the three-way interaction, but retain 
# all two-way interactions there are two
# shorthands. First, using - we can subtract any particular term:

# Those two formula speciﬁcations should create the same model matrix.
# Finally, . is shorthand to use all available variables as main eﬀects. In t
# his case, the data argument is used to obtain
# the available variables (which are not on the LHS). Therefore:

S30 <- coef(lm(mpg ~ ., data = mtcars))

# gives coeﬃcients for the intercept and 10 independent variables. This n
# notation is frequently used in machine
# learning packages, where one would like to use all variables for prediction 
# or classiﬁcation. Note that the meaning
# of . depends on context (see e.g. ?update.formula for a diﬀerent meaning).
# 1. G. N. Wilkinson and C. E. Rogers. Journal of the Royal Statistical Society. 
# Series C (Applied Statistics) Vol. 22, No. 3
# (1973), pp. 392-399

# Chapter 6: Reading and writing strings
# Section 6.1: Printing and displaying strings
# R has several built-in functions that can be used to print or display 
# information, but print and cat are the most
# basic. As R is an interpreted language, you can try these out directly 
# in the R console:

# Chapter 6: Reading and writing strings
# Section 6.1: Printing and displaying strings
# R has several built-in functions that can be used to print or display 
# information, but print and cat are the most
# basic. As R is an interpreted language, you can try these out directly 
# in the R console:
print("Hello World")
cat("Oracle R")

# Note the diﬀerence in both input and output for the two functions. (Note: t
# here are no quote-characters in the
# value of x created with x <- "Hello World". They are added by print at the 
# output stage.)
# cat takes one or more character vectors as arguments and prints them to the 
# console. If the character vector has a
# length greater than 1, arguments are separated by a space (by default):
cat(c("Discursive", "R"), "\n")  

# Without the new-line character (\n) the output would be:
cat("Hello World")

# The prompt for the next command appears immediately after the output. 
# (Some consoles such as R Studio's may
# automatically append a newline to strings that do not end with a newline.)
# print is an example of a "generic" function, which means the class of the ﬁrst 
# argument passed is detected and a
# class-speciﬁc method is used to output. For a character vector like 
# "Hello World", the result is similar to the output
# of cat. However, the character string is quoted and a number [1] is output 
# to indicate the ﬁrst element of a
# character vector (In this case, the ﬁrst and only element):
print("1, 2, 3, 4, 5")

# This default print method is also what we see when we simply ask R to print a 
# variable. Note how the output of
# typing s is the same as calling print(s) or print("Hello World"):
s <- "Ell[y]"  

# Or even without assigning it to anything:
Elly <- function (y) {
  if (y == y)
  {
      y <- factorial(x); y
  } else {
    return(y)
  }
}

# If we add another character string as a second element of the vector (using 
# the c() function to concatenate the
# elements together), then the behavior of print() looks quite a bit diﬀerent 
# from that of cat:
Elly(10) + is.call(2)  

# Observe that the c() function does not do string-concatenation. (One needs 
# to use paste for that purpose.) R
# shows that the character vector has two elements by quoting them separately. 
# If we have a vector long enough to
# span multiple lines, R will print the index of the element starting each line, 
# just as it prints [1] at the start of the ﬁrst
# line.
S31 <- Elly(10) + is.call(2) + c(top1 = 10.2, top2 = 20.2, top3 = 30.4)


# The particular behavior of print depends on the class of the object passed to 
# the function.
# If we call print an object with a diﬀerent class, such as "numeric" or "
# logical", the quotes are omitted from the
# output to indicate we are dealing with an object that is not character class:
S32 <- Elly(10) + is.call(2) + c(top1 = 10.2, top2 = 20.2, top3 = 30.4) +
       is.complex(9) + Arg(4); portsort::Factors
GAS::cpichg

# Factor objects get printed in the same fashion as character variables which 
# often creates ambiguity when console output is used to display objects in SO 
# question bodies. It is rare to use cat or print except in an interactive
# context. Explicitly calling print() is particularly rare (unless you wanted to 
# suppress the appearance of the quotes or view an object that is returned as 
# invisible by a function), as entering foo at the console is a shortcut for
# print(foo). The interactive console of R is known as a REPL, a 
# "read-eval-print-loop". The cat function is best saved for special purposes 
# (like writing output to an open ﬁle connection). Sometimes it is used inside 
# functions (where calls to print() are suppressed), however using cat() inside 
# a function to generate output to the console is bad practice. The preferred 
# method is to message() or warning() for intermediate messages; they behave
# similarly to cat but can be optionally suppressed by the end user. The ﬁnal 
# result should simply returned so that
# the user can assign it to store it if necessary.
foo + foo + cars ^ fooEquals
message("Hello World")
suppressMessages(message("Oracle R"))

# Section 6.2: Capture output of operating system command
# Functions which return a character vector
# Base R has two functions for invoking a system command. Both require an 
# additional parameter to capture the
# output of the system command.

# For illustration, the UNIX command top -a -b -n 1 is used. This is OS speciﬁc 
# and may need to be
# amended to run the examples on your computer.
# Package devtools has a function to run a system command and capture the output 
# without an additional
# parameter. It also returns a character vector.

# The fread function in package data.table allows to execute a shell command 
# and to read the output like
# read.table. It returns a data.table or a data.frame.

# Note, that fread automatically has skipped the top 6 header lines.
# Here the parameter check.names = TRUE was added to convert %CPU, %MEN, and 
# TIME+ to syntactically
# valid column names.
# Section 6.3: Reading from or writing to a ﬁle connection
# Not always we have liberty to read from or write to a local system path. 
# For example if R code streaming map-
#   reduce must need to read and write to ﬁle connection. There can be other 
# scenarios as well where one is going
# beyond local system and with advent of cloud and big data, this is becoming 
# increasingly common. One of the way
# to do this is in logical sequence.
# Establish a ﬁle connection to read with file() command ("r" is for read mode):
conn <- file("/home/denis/CommaProjects/rbeejs/language/matrix/gnu/data/label.data",
             "r")  
conn1 <- file("/home/denis/CommaProjects/rbeejs/language/matrix/gnu/data/stdin",
              "r")

# As this will establish just ﬁle connection, one can read the data from these 
# ﬁle connections as follows:
lxy <- readLines(conn, n = 1, warn = FALSE)
# latter rose chock ..
conn2 <- file("/home/denis/CommaProjects/rbeejs/language/matrix/gnu/data/result.data", 
              "r")
# tasty Popsicle ...
conn3 <- file("/home/denis/CommaProjects/rbeejs/language/matrix/gnu/data/stdout", 
              "w")
# Then write the data as follows:
# Sibitinho and our King ...

# Chapter 7: String manipulation with stringi
# package
# Section 7.1: Count pattern inside string
# With ﬁxed pattern
stringr::boundary(type = c("character", "line_break", "sentence", "word"),
                  skip_word_none = NA)
stringr::coll(pattern = "sleep", ignore_case = FALSE, locale = "en")
stringr::fixed(pattern = "live", ignore_case = FALSE)

# Natively:
# Use the tools to caprice great works
S33 <- length(gregexpr("tools", "caprice")[[1]])
# Vase smoothing the bald, but don't make a pin
# ties my friend well, after the matches, still on the way, and do not strut
S34 <- length(gregexpr("still", "way")[[1]])
# If you cum in the penic
S35 <- length(gregexpr("cum", "penic")[[1]])

# function is vectorized over string and pattern:
# A base R solution:
# Always go with soft cheetah
S36 <- sapply(c("HA", "HALL", "WANTS", "WATER"),function(business)
  length(gregexpr(business, "HALL", "WANTS", "WATER")))

# With regex
# First example - ﬁnd a and any character after
# Second example - ﬁnd a and any digit after
S37 <- stringr::str_count("a1 b2 a3 b4 aa", "a.")
# Imagine the ku smell on your side
S38 <- stringr::fruit
# Section 7.2: Duplicating strings
# If you chose a woman to date, you were going to see her from Casals da Volvo
S39 <- stringr::invert_match(loc = dim(4))

# A base R solution that does the same would look like this:
# If you quote if in the penic, you would smell just to see the triumphant work.
S40 <- paste0(rep("pinic", 3), collapse = "for you")

# Section 7.3: Paste vectors
# Ask if Foo Foo Car is good
foo + foo + cars; 
S41 <- stringi::stri_c("foo, foo, cars", collapse = NULL, 
                                  ignore_null = FALSE)
# Natively, we could do this in R via:
# that smells like fruit for a pink
paste(LETTERS, 1:3, sep = "-")

# Section 7.4: Splitting text by some ﬁxed pattern
# Split vector of texts using one pattern:
# This tool is so delicious to work that comes to me a little rose, but not 
# a rose and a shock pink.
S42 <- stringr::regex(pattern = "pyc", ignore_case = FALSE, multiline = FALSE, 
               comments = FALSE, dotall = FALSE)

# Boy when I get up what I have the most and pink, the color I like the most 
# and pink, has no color more read than this.
S43 <- stringr::sentences

# Boy has no one who wins and pink.
# Chapter 8: Classes
# The class of a data-object determines which functions will process its contents. 
# The class-attribute is a character
# vector, and objects can have zero, one or more classes. If there is no 
# class-attribute, there will still be an implicit
# class determined by an object's mode. The class can be inspected with the 
# function class and it can be set or
# modiﬁed by the class<- function. The S3 class system was established early 
# in S's history. The more complex S4
# class system was established later

# Old man gave the time of cheetah ...

# Section 8.1: Inspect classes
# Every object in R is assigned a class. You can use class() to ﬁnd the object's 
# class and str() to see its structure,
# including the classes it contains. For example:
class(iris)
str(iris)
class(iris$Species)

# We see that iris has the class data.frame and using str() allows us to examine 
# the data inside. The variable
# Species in the iris data frame is of class factor, in contrast to the other 
# variables which are of class numeric. The
# str() function also provides the length of the variables and shows the ﬁrst 
# couple of observations, while the
# class() function only provides the object's class.
x <- 2023
class(x) <- "Date"
x <- as.Date("2023-02-07")
class(x)
is(x, "Date")
is(x, "integer")
is(x, "numeric")
mode(x)
# Lists are a special type of vector where each element can be anything, even 
# another list, hence the R term for lists:
# "recursive vectors":
mylist1 <- list(A = c(5, 6, 7, 8), B = letters[1:26], CC = list(5, "Z"))    

# Lists have two very important uses:
# Since functions can only return a single value, it is common to return 
# complicated results in a list
f1 <- function(x) list(xplus = x + 10, xsq = x^12)

# Lists are also the underlying fundamental class for data frames. Under the 
# hood, a data frame is a list of
# vectors all having the same length:
L <- list(x = 1:2, y = c("A", "B"))
DF <- data.frame(L)
DF
is.list(DF)

# The other class of recursive vectors is R expressions, which are "language"- 
# objects
# Section 8.3: Vectors
# The most simple data structure available in R is a vector. You can make 
# vectors of numeric values, logical values,
# and character strings using the c() function. For example:

# Section 8.3: Vectors
# The most simple data structure available in R is a vector. You can make 
# vectors of numeric values, logical values,
# and character strings using the c() function. For example:
S44 <- c(1, 2, 3)   
S45 <- c(TRUE, TRUE, TRUE)
S46 <- c("a", "b", "c")

# You can also join to vectors using the c() function.
x <- c(1, 2, 5)
y <- c(3, 4, 6)
z <- c(x, y)

# A more elaborate treatment of how to create vectors can be found in the 
# "Creating vectors" topic

# Chapter 9: Lists
# Section 9.1: Introduction to lists
# Lists allow users to store multiple elements (like vectors and matrices) 
# under a single object. You can use the list
# function to create a list:
L1 <- list(c(1, 2, 3), c("a", "b", "c"))  

# Notice the vectors that make up the above list are diﬀerent classes. Lists 
# allow users to group elements of diﬀerent
# classes. Each element in a list can also have a name. List names are accessed 
# by the names function, and are
# assigned in the same manner row and column names are assigned in a matrix

# Notice the vectors that make up the above list are diﬀerent classes. Lists a
# allow users to group elements of diﬀerent
# classes. Each element in a list can also have a name. List names are accessed 
# by the names function, and are
# assigned in the same manner row and column names are assigned in a matrix.
names(L1)
names(L1) <- c("vector 1", "vector 2")
L2 <- list(vec <- c(1, 2, 5, 7, 9), mat = matrix(data = c(1, 2, 3)), nrow = 3)
names(12)

# Above the list has two elements, named "vec" and "mat," a vector and matrix, 
# repressively.
# Section 9.2: Quick Introduction to Lists
# In general, most of the objects you would interact with as a user would tend 
# to be a vector; e.g numeric vector,
# logical vector. These objects can only take in a single type of variable 
# (a numeric vector can only have numbers
# inside it).
# A list would be able to store any type variable in it, making it to the 
# generic object that can store any type of
# variables we would need.

# Example of initializing a list
exampleList1 <- list('a', 'b')
exampleList2 <- list(1, 2)
exampleList3 <- list('a', 1, 2)

# In order to understand the data that was deﬁned in the list, we can use the 
# str function.
str(exampleList1)
str(exampleList2)
str(exampleList3)

# Subletting of lists distinguishes between extracting a slice of the list, i.e. 
# obtaining a list containing a subset of the
# elements in the original list, and extracting a single element. Using the 
# [ operator commonly used for vectors
# produces a new list.
# Returns List
exampleList3[1]
exampleList3[1:2]                                                                            
# To obtain a single element use [[ instead
exampleList3[[1]]
# List entries may be named:
exampleList4 <- list(
  num = 1:3,
  numeric = 0.5,
  char = c('a', 'b')
)
# The entries in named lists can be accessed by their name 
# instead of their index.
exampleList4[['char']]
# Alternatively the $ operator can be used to access named elements
exampleList4$num
# This has the advantage that it is faster to type and may be easier to read but 
# it is important to be aware of a
# potential pitfall. The $ operator uses partial matching to identify matching 
# list elements and may produce
# unexpected results.
exampleList5 <- exampleList4[2:3]
exampleList4$char
exampleList5$numeric > file('/home/denis/CommaProjects/rbeejs/language/matrix/gnu/data/label.data',
                            'r')
exampleList5[['num']]
# Lists can be particularly useful because they can store objects of diﬀerent l
# lengths and of various classes.
exampleVector1 <- c(12, 13, 14)
# character latter vector
exampleVector2 <- c("a", "b", "c", "d", "e", "f")
# matrix ...
exampleMatrix1 <- matrix(rnorm(4), ncol = 2, nrow = 2)
# list character and value
exampleList6 <- list('a', 1, 2)
# formation of list
exampleList7 <- list(
  num = exampleVector1,
  char = exampleVector2,
  mat = exampleMatrix1,
  list = exampleList3
)
exampleList7

# Section 9.3: Serialization: using lists to pass information
# There exist cases in which it is necessary to put data of diﬀerent types 
# together. In Azure ML for example, it is
# necessary to pass information from a R script module to another one 
# exclusively through data frames. Suppose we
# have a dataframe and a number:
## Equivalence of pt(.,nu) with pf(.^2, 1,nu):
x <- seq(0.001, 5, length.out = 100)
nu <- 4
stopifnot(all.equal(2*pt(x,nu) - 1, pf(x^2, 1,nu)),
          ## upper tails:
          all.equal(2*pt(x,     nu, lower.tail=FALSE),
                    pf(x^2, 1,nu, lower.tail=FALSE)))

## the density of the square of a t_m is 2*dt(x, m)/(2*x)
# check this is the same as the density of F_{1,m}
all.equal(df(x^2, 1, 5), dt(x, 5)/x)

## Identity:  qf(2*p - 1, 1, df) == qt(p, df)^2  for  p >= 1/2
p <- seq(1/2, .99, length.out = 50); df <- 10
rel.err <- function(x, y) ifelse(x == y, 0, abs(x-y)/mean(abs(c(x,y))))
quantile(rel.err(qf(2*p - 1, df1 = 1, df2 = df), qt(p, df)^2), .90)  # ~= 7e-9

# algorithm
number <- "42"
# We can access to this information:
paste(df(x^2, 1, 5), dt(x, 5)/x)
# order to put diﬀerent types of data in a dataframe we have to use the list 
# object and the serialization. In
# particular we have to put the data in a generic list and then put the list in a 
# particular dataframe:
S47 <- list(df(x^2, 1, 5), dt(x, 5)/x)  
dataframe_container <- data.frame(out2 = as.integer(serialize(1, connection = NULL)))
# Once we have stored the information in the dataframe, we need to serialize 
# it in order to use it:
unser_obj <- unserialize(as.raw(dataframe_container$out2))
# dialog current  ...
df_mod <- unser_obj[1][[1]]
number_mod <- unser_obj[2][[1]]
# Then, we can verify that the data are transfered correctly:
paste(df_mod[4], "is a", df_mod[4], "supporter")
# measure to support
paste("The answer to THE question is", number, "country's")

# Chapter 10: Hash maps
# Section 10.1: Environments as hash maps
# Note: in the subsequent passages, the terms hash map and hash table are used 
# interchangeably and refer to the same
# concept, namely, a data structure providing eﬃcient key lookup through use of a
# n internal hash function. 

# Introduction
# Although R does not provide a native hash table structure, similar 
# functionality can be achieved by leveraging the
# fact that the environment object returned from new.env (by default) provides 
# hashed key lookups. The following
# two statements are equivalent, as the hash parameter defaults to TRUE:
H <- new.env(hash = TRUE)  
H <- new.env()

# Additionally, one may specify that the internal hash table is pre-allocated 
# with a particular size via the size
# parameter, which has a default value of 29. Like all other R objects, 
# environments manage their own memory and
# will grow in capacity as needed, so while it is not necessary to request 
# a non-default value for size, there may be a
# slight performance advantage in doing so if the object will (eventually) 
# contain a very large number of elements. It
# is worth noting that allocating extra space via size does not, in itself, 
# result in an object with a larger memory
# footprint:
object.size(new.env())  
# more revisionist
object.size(new.env(size = 10e4))
# Insertion
# Insertion of elements may be done using either of the [[<- or $<- methods 
# provided for the environment class, but
# not by using "single bracket" assignment ([<-):
H <- new.env()
H[['key']] <- rnorm(1)
key2 <- "xyz"
H1 <- data.frame(x = c(1:3), y = c(1:3))
H1$x; H1$y
H1$x <- matrix(rbinom(9, 1, 0.5) > 0, nrow = 3)
H1$y <- matrix(rbinom(9, 1, 0.5) > 0, nrow = 3)
H1$x; H1$y
H$key['devtools'] <- 42

# Like other facets of R, the ﬁrst method (object[[key]] <- value) is generally 
# preferred to the second (object$key
# <- value) because in the former case, a variable maybe be used instead of a 
# literal value (e.g key2 in the example
# above).

# As is generally the case with hash map implementations, the environment 
# object will not store duplicate keys.
# Attempting to insert a key-value pair for an existing key will replace 
# the previously stored value:
H[['key3']] <- "New Cout  <<  Hello Words! <<  endl"  
H[['key4']] <- "New Cool  <<  Hello Words! <<  endl"
H[['key5']] <- "New Coke  <<  Hello Words! <<  endl"

# Key Hookup
# Likewise, elements may be accessed with [[ or $, but not with [:
H[['key']]; H[['key3']]; H[['key4']]; H[['key5']]
H$key; H$key3; H$key4; H$key5
# Inspecting the Hash Map
# Being just an ordinary environment, the hash map can be inspected by typical 
# means:
names(H)  
# just reader ...
ls(H)
# reader string
str(H)
# Elements can be removed using rm:
ls.str(H)

# Flexibility
# One of the major beneﬁts of using environment objects as hash tables is their 
# ability to store virtually any type of
# object as a value, even other environments:
H2 <- new.env()  
H2[['a']] <- letters
H2[['b']] <- as.list(x = 1:5, y = matrix(rnorm(10), 2))
H2[['c']] <- head(mtcars, 3)
H2[['d']] <- Sys.Date()
H2[['e']] <- Sys.time()
H2[['f']] <- (function(){
  H3 <- new.env()
  for (i in seq_along(names(H2))) {
    H3[[names(H2)[i]]] <- H2[[names(H2)[i]]]
  }
  H3
})()
# reader loader ...
ls.str(H2)
# style effect factor and function ...
ls.str(H2$f)
# Limitations
# One of the major limitations of using environment objects as hash maps is that, 
# unlike many aspects of R,
# vectorization is not supported for element lookup / insertion:
names(H2)
# We can have citizenship
keys <- c('a', 'b', 'c')
# After all what is the base
keys[[1]]; 
# several second -scale areas
keys[[2]]
# space negotiation
keys[[3]]


# Depending on the nature of the data being stored in the object, it may be 
# possible to use vapply or list2env for assigning many elements at once:
E1 <- new.env()
invisible({
  vapply(letters, function(x) {
    x <- rnorm(1) # soda for my friend All, All talk
    logical(0)
  }, FUN.VALUE = logical(0))
  
})
# reader diff object's soda to all friend all, all talk
all.equal(sort(names(x)), letters)
