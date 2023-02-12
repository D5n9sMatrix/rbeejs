#!/usr/bin/r

parallelcluster <- parallel::makeCluster(parallel::detectCores())

library(foreach)
library(doSNOW)
cl <- makeCluster(5, type = "SOCK")
registerDoSNOW(cl)
f <- foreach(i = 1:100000, .combine = c, .inorder = F) %dopar% {
  k <- i ** 2 + sqrt(i)
  k
}

data(ToothGrowth)

binaryPredictorModel <- glm(len ~ supp, data=ToothGrowth)
gaussianPredictorModel <- glm(len ~ dose, data=ToothGrowth)



summary(interactionPredictorModel)


df3 <- data.frame(x = 1:3, y = c("a", "b", "c"), stringsAsFactors = FALSE)

df3[1]
df3["x"]


is.data.frame(df3[1])

is.list(df3[1])


df3[[2]]


df3$x


typeof(df3$x)
is.vector(df3$x)

df3[1, 2]

df3[1, "y"]

df3[2, ]

df3[ , 1]


df3[ , 1, drop = FALSE]


is.vector(df3[, 2])
## TRUE
is.data.frame(df3[2, ])
## TRUE
is.data.frame(df3[, 2, drop = FALSE])


# create an example vector
v1 <- c("a", "b", "c", "d")
# select the third element
v1[3]
## [1] "c"

v1 <- c("a", "b", "c", "d")
v1[c(1, 3)]
## [1] "a" "c"

v1[-1]
# [1] "b" "c" "d"
v1[-c(1,3)]

v1=="c"
# [1] FALSE FALSE TRUE FALSE
which(v1=="c")
# [1] 3


v <- 1:3
names(v) <- c("one", "two", "three")
v
v["two"]

v[c(TRUE, FALSE, TRUE)]
## one three
## 1  3
v[c(FALSE, TRUE)]
## two
## 2
v[TRUE]
## one
## 1
# recycled to 'c(FALSE, TRUE, FALSE)'
# recycled to 'c(TRUE, TRUE, TRUE)'
# two three
#  2   3
v[FALSE]
# handy to discard elements but save the vector's type and basic structure
## named integer(0)

## a sample matrix
mat <- matrix(1:6, nrow = 2, dimnames = list(c("row1", "row2"), c("col1", "col2", "col3")))

mat[ , 3]
## row1 row2
## 5  6
mat[1, ]
# col1 col2 col3
# 1    3    5

mat[ , 'col1']
# row1 row2
# 1 2

## This selects the first row as a vector
class(mat[1, ])
# [1] "integer"
## Whereas this selects the first row as a 1x3 matrix:
class(mat[1, , drop = F])
# [1] "matrix"

mat[1:2, 2:3]

ind = rbind(c(1, 1), c(1, 3), c(2, 3), c(2, 1))
ind

mat[ind]


l1 <- list(c(1, 2, 3), 'two' = c("a", "b", "c"), list(10, 20))

l1[1]
## [[1]]
## [1] 1 2 3
l1['two']
## $two
## [1] "a" "b" "c"
l1[[2]]
## [1] "a" "b" "c"
l1[['two']]
## [1] "a" "b" "c"

l1[c(3, 1)]
## [[1]]
## [[1]][[1]]
## [1] 10
##
## [[1]][[2]]
## [1] 20
##

l1[[c(3, 1)]]
## [1] 10


l1$two
## [1] "a" "b" "c"


l1$t
## [1] "a" "b" "c"


l1[["t"]]
## NULL
l1[["t", exact = FALSE]]
## [1] "a" "b" "c"


l1$t
## [1] "a" "b" "c"
## Warning message:
## In l1$t : partial match of 't' to 'two'

x <- 11:20
x[c(2,4,6)]
x[c(-1,-3)]
x[c(rep(TRUE,5),rep(FALSE,5))]
x[c(TRUE,FALSE)]
x[c(TRUE,FALSE,FALSE)]


x = structure(1:5, class = "myClass")
x[c(3, 2, 4)]
## [1] 3 2 4
'[.myClass' = function(x, i) cat(sprintf("We'd expect '%s[%s]' to be returned but this a custom `[`
method and should have a `?[.myClass` help page for its behaviour\n", deparse(substitute(x)),
                                         deparse(substitute(i))))
x[c(3, 2, 4)]
## We'd expect 'x[c(3, 2, 4)]' to be returned but this a custom `[` method and should have a
## `?[.myClass` help page for its behavior
## NULL

.subset(x, c(3, 2, 4))
## [1] 3 2 4

#Load the forecast package
library(forecast)
#Generate an AR1 process of length n (from Waitperson & Metrical)
# Set up variables
set.seed(1234)
n <- 1000
x <- matrix(0,1000,1)
w <- rnorm(n)
# loop to create x
for (t in 2:n) x[t] <- 0.7 * x[t-1] + w[t]
plot(x,type='l')
acf(x)

acf(fit$resid)

library(foreach)
fcst <- foreach(fit, h = 100)

dnorm(x, mean = 0, sd = 1, log = FALSE)
rnorm(n, mean = 0, sd = 1)
# collapse ...
dnorm(0)

# normal
rnorm(10)


# liked of tools of develop
rnorm(10, mean=4, sd= 3)


# Binomial(n = 5, p = 0.5) probabilities
n <- 5; p<- 0.5; x <- 0:n
dbinom(x,n,p)
# [1] 0.03125 0.15625 0.31250 0.31250 0.15625 0.03125
#To verify the total probability is 1
sum(dbinom(x,n,p))
# [1] 1

x <- 0:12
prob <- dbinom(x,12,.5)

n=9; p=.7; x=0:n; prob=dbinom(x,n,p)

# intercept view
n=9; p=.3; x=0:n; prob=dbinom(x,n,p)

# Calculating Probabilities
# P(X <= 2) in a Bin(n=5,p=0.5) distribution
pbinom(2,5,0.5)
# [1] 0.5

# P(X <= 2) = P(X=0) + P(X=1) + P(X=2)
sum(dbinom(0:2,5,0.5))
# [1] 0.5


# P(3<= X <= 5) = P(X=3) + P(X=4) + P(X=5) in a Bin(n=9,p=0.6) dist
sum(dbinom(c(3,4,5),9,0.6))
# [1] 0.4923556


n = 10; p = 0.4; x = 0:n;
prob = dbinom(x,n,p)
cdf = pbinom(x,n,p)
distTable = cbind(x,prob,cdf)
distTable


# Simulation
xVal<-names(table(rbinom(1000,8,.5)))


library(shiny)
# Create the UI
ui <- shinyUI(fluidPage(
  # Application title
  titlePanel("Hello World!")
))
# Create the server function
server <- shinyServer(function(input, output){})
# Run the app
shinyApp(ui = ui, server = server)


library(shiny)
# Define UI for application
shinyUI(fluidPage(
  # Application title
  titlePanel("Hello World!")
))


library(shiny)
# Define server logic
shinyServer(function(input, output){})


library(shiny)
ui <- fluidPage(
  checkboxGroupInput("checkGroup1", label = h3("This is a Checkbox group"),
                                   choices = list("1" = 1, "2" = 2, "3" = 3),
                                   selected = 1),
  fluidRow(column(3, verbatimTextOutput("text_choice")))
)


server <- function(input, output){
  output$text_choice <- renderPrint({
    return(paste0("You have chosen the choice ",input$checkGroup1))})
}

shinyApp(ui = ui, server = server)

library(shiny)
ui <- fluidPage(
  radioButtons("radio",
               label = HTML('<FONT color="red"><FONT size="5pt">Welcome</FONT></FONT><br> <b>Your
favorite color is red ?</b>'),
               choices = list("TRUE" = 1, "FALSE" = 2),
               selected = 1,
               inline = T,
               width = "100%"),
  fluidRow(column(3, textOutput("value"))))
server <- function(input, output){
  output$value <- renderPrint({
    if(input$radio == 1){return('Great !')}
    else{return("Sorry !")}})}
shinyApp(ui = ui, server = server)

library(shiny)
ui <- fluidPage(
  selectInput("id_selectInput",
              label = HTML('<B><FONT size="3">What is your favorite color ?</FONT></B>'),
              multiple = TRUE,
              choices = list("red" = "red", "green" = "green", "blue" = "blue", "yellow" = "yellow"),
              selected = NULL),
  br(), br(),
  fluidRow(column(3, textOutput("text_choice"))))
server <- function(input, output){
  output$text_choice <- renderPrint({
    return(input$id_selectInput)})
}
shinyApp(ui = ui, server = server)


library(shiny)
# Create the UI
ui <- shinyUI(fluidPage(
  titlePanel("Basic widgets"),
  fluidRow(
    column(3,
           h3("Buttons"),
           actionButton("action", label = "Action"),
           br(),
           br(),
           submitButton("Submit")),
    column(3,
           h3("Single checkbox"),
           checkboxInput("checkbox", label = "Choice A", value = TRUE)),
    column(3,
           checkboxGroupInput("checkGroup",
                              label = h3("Checkbox group"),
                              choices = list("Choice 1" = 1,
                                             "Choice 2" = 2, "Choice 3" = 3),
                              selected = 1)),
    column(3,
           dateInput("date",
                     label = h3("Date input"),
                     value = "2014-01-01"))
  ),
  fluidRow(
    column(3,
           dateRangeInput("dates", label = h3("Date range"))),
    column(3,
           fileInput("file", label = h3("File input"))),
    column(3,
           h3("Help text"),
           helpText("Note: help text isn't a true widget,",
                    "but it provides an easy way to add text to",
                    "accompany other widgets.")),
    column(3,
           numericInput("num",
                        label = h3("Numeric input"),
                        value = 1))
  ),
  fluidRow(
    column(3,
           radioButtons("radio", label = h3("Radio buttons"),
                        choices = list("Choice 1" = 1, "Choice 2" = 2,
                                       "Choice 3" = 3),selected = 1)),
    column(3,
           selectInput("select", label = h3("Select box"),
                       choices = list("Choice 1" = 1, "Choice 2" = 2,
                                      "Choice 3" = 3), selected = 1)),
    column(3,
           sliderInput("slider1", label = h3("Sliders"),
                       min = 0, max = 100, value = 50),
           sliderInput("slider2", "",
                       min = 0, max = 100, value = c(25, 75))
    ),
    column(3,
           textInput("text", label = h3("Text input"),
                     value = "Enter text..."))
  )
))
# Create the server function
server <- shinyServer(function(input, output){})
# Run the app
shinyApp(ui = ui, server = server)


data("diamonds")
head(diamonds)


require(sqldf)
sqldf("select * from diamonds limit 10")
# sin(t) sql df
sqldf("select * from diamonds where color = 'E' limit 10")
# s10 
sqldf("select count(*) from diamonds where carat > 1 and color = 'E'")
# view perfect ..
sqldf("select *, count(*) as cnt_big_E_colored_stones from diamonds where carat > 1 and color = 'E'
group by clarity")
# h smile ...
sqldf("select cut,
max(price) from diamonds group by cut")


