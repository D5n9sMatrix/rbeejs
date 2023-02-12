#!/usr/bin/r

# example data
test_sentences <- c("The quick brown fox quickly", "jumps over the lazy dog")

sub("brown","red", test_sentences)
#[1] "The quick red fox quickly"
# "jumps over the lazy dog"

sub("quick", "fast", test_sentences)
#[1] "The fast red fox quickly"

gsub("quick", "fast", test_sentences)
#[1] "The fast red fox fastly"
# "jumps over the lazy dog"

# example data
test_sentences <- c("The quick brown fox", "jumps over the lazy dog")
grepl("fox", test_sentences, perl = TRUE)
#[1] TRUE FALSE


searchCorpus <- function(corpus, pattern) {
  return(tm_index(corpus, FUN = function(x) {
    grepl(pattern, x, ignore.case = TRUE, perl = TRUE)
  }))
}

dat <- c(1, 2, 2, 2, 3, 1, 4, 4, 1, 1)


r <- rle(dat)
r
# Run Length Encoding
# lengths: int [1:6] 1 3 1 1 2 2
# values : num [1:6] 1 2 3 1 4 1

r$values
# [1] 1 2 3 1 4 1


r$lengths
# [1] 1 3 1 1 2 2


(dat <- data.frame(x = c(1, 1, 2, 2, 2, 1), y = 1:6))

(r <- rle(dat$x))
# Run Length Encoding
# lengths: int [1:3] 2 3 1
# values : num [1:3] 1 2 1

(run.id <- rep(seq_along(r$lengths), r$lengths))
# [1] 1 1 2 2 2 3

data.frame(x=r$values, meanY=tapply(dat$y, run.id, mean))
#
#x mean Y
# 1 1 1.5
# 2 2 4.0
# 3 1 6.0


set.seed(144)
dat <- sample(rep(0:1, c(1, 1e5)), 1e7, replace=TRUE)
table(dat)

rle.df <- with(rle(dat), data.frame(values, lengths))
dim(rle.df)
# [1] 207 2
head(rle.df)


decompressed <- rep(rle.df$values, rle.df$lengths)


identical(decompressed, dat)
# [1] TRUE


rle.obj <- rle(dat)
class(rle.obj)
# [1] "rle"# create a rle object here
dat.inv <- inverse.rle(rle.obj)# apply the inverse.rle on the rle object


identical(dat.inv, dat)
# [1] TRUE


library(data.table)
(DT <- data.table(x = c(1, 1, 2, 2, 2, 1), y = 1:6))


rleid(DT$x)
# [1] 1 1 2 2 2 3


DT[,mean(y),by=.(x, rleid(x))]
#
#x rleid V1
# 1: 1 1 1.5
# 2: 2 2 4.0
# 3: 1 3 6.0


repeatedCosPlusOne <- function(first, len) {
  x <- numeric(len)
  x[1] <- first
  for (i in 2:len) {
    x[i] <- cos(x[i-1] + 1)
  }
  return(x)
}

library(Rcpp)
cppFunction("NumericVector repeatedCosPlusOneRcpp(double first, int len) {
NumericVector x(len);
x[0] = first;
for (int i=1; i < len; ++i) {
x[i] = cos(x[i-1]+1);
}
return x;
}")

all.equal(repeatedCosPlusOne(1, 1e6), repeatedCosPlusOneRcpp(1, 1e6))
# [1] TRUE
system.time(repeatedCosPlusOne(1, 1e6))
#
# user system elapsed
# 1.274  0.015 1.310
system.time(repeatedCosPlusOneRcpp(1, 1e6))
#
# user system elapsed
# 0.028 0.001 0.030


# cos(x_{i-1} + 1):
repeatedCosPlusOne <- function(first, len) {
   # GoalKicker.com – R Notes for Professionals
    x <- numeric(len)
    x[1] <- first
    for (i in 2:len) {
      x[i] <- cos(x[i-1] + 1)
    }
    return(x)
}

library(compiler)
repeatedCosPlusOneCompiled <- cmpfun(repeatedCosPlusOne)
# The resulting function will often be signiﬁcantly faster while still returning 
# the same results:
all.equal(repeatedCosPlusOne(1, 1e6), repeatedCosPlusOneCompiled(1, 1e6))
# [1] TRUE
system.time(repeatedCosPlusOne(1, 1e6))
#
# user system elapsed
#
# 1.175 0.014 1.201
system.time(repeatedCosPlusOneCompiled(1, 1e6))
#
# user system elapsed
#
# 0.339 0.002 0.341

iterFunc <- function(init, n, func) {
  funcs <- replicate(n, func)
  Reduce(function(., f) f(.), funcs, init = init, accumulate = TRUE)
}
repeatedCosPlusOne_vec <- function(first, len) {
  iterFunc(first, len - 1, function(.) cos(. + 1))
}

library(microbenchmark)
microbenchmark(
  repeatedCosPlusOne(1, 1e4),
  repeatedCosPlusOne_vec(1, 1e4)
)


require(maps)
map()


require(maps)
map(col = "cornflowerblue")


require(maps)
map(fill = TRUE, col = c("cornflowerblue"))


require(maps)
map(fill = TRUE, col = c("cornflowerblue", "limegreen", "hotpink"))


require(maps)
if(require(mapproj)) {
  # Malaprop is used for projection="polyclinic"
  # color US county map by 2009 unemployment rate
  # match counties to map using FIPS county codes
  # Based on J's solution to the "Plethora Challenge"
  # Code improvements by Hack-R (hack-r.github.io)
  # load data
  # unkempt includes data for some counties not on the "lower 48 states" county
  # map, such as those in Alaska, Hawaii, Puerile Rico, and some tiny Virginia
  # cities
  data(unemp)
  data(county.fips)
  # define color buckets
  colors = c("paleturquoise", "skyblue", "cornflowerblue", "blueviolet", "hotpink", "darkgrey")
  unemp$colorBuckets <- as.numeric(cut(unemp$unemp, c(0, 2, 4, 6, 8, 10, 100)))

  leg.txt <- c("<2%", "2-4%", "4-6%", "6-8%", "8-10%", ">10%")
  # align data with map definitions by (partial) matching state,county
  # names, which include multiple polygons for some counties
  cnty.fips <- county.fips$fips[match(map("county", plot=FALSE)$names,
                                      county.fips$polyname)]
  colorsmatched <- unemp$colorBuckets[match(cnty.fips, unemp$fips)]
  # draw map
  par(mar=c(1, 1, 2, 1) + 0.1)
  map("county", col = colors[colorsmatched], fill = TRUE, resolution = 0,
      lty = 0, projection = "polyconic")
  map("state", col = "white", fill = FALSE, add = TRUE, lty = 1, lwd = 0.1,
      projection="polyconic")
  title("unemployment by county, 2009")
  legend("topright", leg.txt, horiz = TRUE, fill = colors, cex=0.6)
}

require(googleVis)
G4 <- gvisGeoChart(CityPopularity, locationvar='City', colorvar='Popularity',
                   options=list(region='US', height=350,
                                displayMode='markers',
                                www.dbooks.orgcolorAxis="{values:[200,400,600,800],
colors:[\'red', \'pink\', \'orange',\'green']}")
)
plot(G4)

library(maps)
dfb <- world.cities[world.cities$country.etc=="Brazil",]
dfb$poph <- paste(dfb$name, "Pop", round(dfb$pop/1e6,2), " millions")
dfb$q <- with(dfb, cut(pop, quantile(pop), include.lowest = T))
levels(dfb$q) <- paste(c("1st", "2nd", "3rd", "4th"), "Quantile")
dfb$q <- as.ordered(dfb$q)
ge <- list(
  scope = 'south america',
  showland = TRUE,
  landcolor = toRGB("gray85"),
  subunitwidth = 1,
  countrywidth = 1,
  subunitcolor = toRGB("white"),
  countrycolor = toRGB("white")
)


library(shiny)
server <- function(input, output, session){
  output$my_leaf <- renderLeaflet({
    leaflet() %>%
      addProviderTiles('Hydda.Full') %>%
      setView(lat = -37.8, lng = 144.8, zoom = 10)
  })
}

v = "A"
w = c("A", "A")


setequal(v, w)


x = c(1, 2, 3)
y = c(2, 4)
union(x, y)
# 1 2 3 4
intersect(x, y)
# 2
setdiff(x, y)
# 1 3


X = c(1, 1, 2)
Y = c(4, 5)
expand.grid(X, Y)


m = do.call(expand.grid, lapply(list(X, Y), unique))



m$p = with(m, Var1*Var2)



uX = unique(X)
uY = unique(Y)
outer(setNames(uX, uX), setNames(uY, uY), `*`)



v = "A"
w = c("A", "A")
w %in% v
# TRUE TRUE
v %in% w
# TRUE


c(1, NA) %in% c(1, 2, 3, 4)
# TRUE FALSE


x = c(2, 1, 1, 2, 1)
unique(x)
# 2 1



duplicated(x)
# FALSE FALSE TRUE TRUE TRUE


xtab_set <- function(A, B){
  both <- union(A, B)
  inA <- both %in% A
  inB <- both %in% B
  return(table(inA, inB))
}
A = 1:20
B = 10:30
xtab_set(A, B)

library(tibble)
mtcars_tbl <- as_data_frame(mtcars)


# Note - This is R code.
# cppFunction in Rcpp allows for rapid testing.
require(Rcpp)
# Creates a function that multiples each element in a vector
# Returns the modified vector.
cppFunction("
NumericVector exfun(NumericVector x, int i){
x = x*i;
return x;
}")

# Calling function in R
exfun(1:5, 3)


# Use evalCpp to evaluate C++ expressions
evalCpp("std::numeric_limits<double>::max()")
## [1] 1.797693e+308

require(Rcpp)
# GoalKicker.com – R Notes for Professionals
# Compile File
sourceCpp("/home/denis/CommaProjects/rbeejs/language/matrix/gnu/rcpp/muRcpp.cpp")
# Make some sample data
x = 1:5
all.equal(muRcpp(x), mean(x))
## TRUE
all.equal(varRcpp(x), var(x))
## TRUE

sample(5)
# [1] 4 5 3 1 2


sample(10:15)
# [1] 11 15 12 10 14 13

randperm(a, k)
# Generates one random permutation of k of the elements a, if a is a vector,
# or of 1:a if a is a single integer.
# a: integer or numeric vector of some length n.
# k: integer, smaller as a or length(a).
# Examples
library(pracma)
randperm(1:10, 3)
# [1] 3 7 9
randperm(10, 10)
# [1] 4 5 10 8 2
randperm(seq(2, 10, by=2))
# [1] 6 4 10 2 8

runif(5, min=0, max=10)
# [1] 4.680491 7.669724 1.389745 4.785377 3.963346

rnorm(5, mean=0, sd=1)
# [1] -0.3513677 -0.2403913 -1.2177945  0.1652712 -0.7241812


rbinom(5, size=10, prob=0.5)
# [1] 4 5 7 4 6


rhyper(5, m=3, n=10, k=5)
# [1] 1 0 1 1 1

rnbinom(5, size=10, prob=0.8)
# [1] 3 1 3 4 2


rpois(5, lambda=2)
# [1] 1 0 4 1 6


rexp(5, rate=1.5)
# [1] 0.01104451 0.02485204 0.07096384 0.62249139 0.15404995

rlogis(5, location=0, scale=1)
# [1]  0.7950946 -0.6353491 -2.0232973  0.9926317  0.0340884

rchisq(5, df=15)
# [1]  8.771155 21.191665 21.626991 17.379262 27.779313


rbeta(5, shape1=1, shape2=0.5)
# [1] 0.15899664 0.27787375 0.08915929 0.91832345 0.59771496


rgamma(5, shape=3, scale=0.5)
# [1] 0.4318052 0.4364566 0.8724249 1.0277091 4.9704122


rcauchy(5, location=0, scale=1)
# [1] -1.6206298 -0.1170863  2.2332367  0.8645598 -0.8041506


rlnorm(5, meanlog=0, sdlog=1)
# [1] 1.1105432 2.1362239 1.0061038 0.4681233 1.2915109


rweibull(5, shape=0.5, scale=1)
# [1] 0.25668917 0.04758215 0.03988465 0.88649426 0.94324362


rwilcox(5, 10, 20)
# [1] 130  60 118 105 107


rmultinom(5, size=5, prob=c(0.1,0.1,0.8))
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    0    1    0    1    1
# [2,]    1    0    0    1    0
# [3,]    4    4    5    3    4

sample(1:10,5)
# [1] 6 9 2 7 10
sample(1:10,5)
# [1] 7 6 1 2 10

rnorm(5)
# [1]  0.8317197 -1.1276886  0.6360756 -0.3074093  0.4347388
rnorm(5)
# [1] 0.38984324 -0.62124058 -2.21469989 1.12493092 -0.04493361


set.seed(1)
sample(letters,2)
# [1] "g" "j"
set.seed(1)
sample(letters,2)
# [1] "g" "j"


set.seed(1)
rexp(5)
# [1] 0.7551818 1.1816428 0.1457067 0.1397953 0.4360686
set.seed(1)
rexp(5)
# [1] 0.7551818 1.1816428 0.1457067 0.1397953 0.4360686

parallel::detectCores(all.tests = FALSE, logical = TRUE)
# [1] 4
parallelCluster <- parallel::makeCluster(parallel::detectCores())


data <- mtcars
yfactor <- 'cyl'
zlevels <- sort(unique(data[[yfactor]]))
datay <- data[,1]
dataz <- data[,2]
datax <- data[,3:11]
fitmodel <- function(zlevel, datax, datay, dataz) {
  glm.fit(x = datax[dataz == zlevel,], y = datay[dataz == zlevel])
}


fitmodel <- function (x, i, j, by, keyby, with = TRUE, nomatch = getOption("datatable.nomatch", 
                                                                           NA), mult = "all", roll = FALSE, rollends = if (roll == 
                                                                                                                           "nearest") c(TRUE, TRUE) else if (roll >= 0) c(FALSE, TRUE) else c(TRUE, 
                                                                                                                                                                                              FALSE), which = FALSE, .SDcols, verbose = getOption("datatable.verbose"), 
                      allow.cartesian = getOption("datatable.allow.cartesian"), 
                      drop = NULL, on = NULL) 
{
  if (!cedta()) {
    Nargs = nargs() - (!missing(drop))
    ans = if (Nargs < 3L) {
      `[.data.frame`(x, i)
    }
    else if (missing(drop)) 
      `[.data.frame`(x, i, j)
    else `[.data.frame`(x, i, j, drop)
    if (!missing(i) & is.data.table(ans)) 
      setkey(ans, NULL)
    return(ans)
  }
  if (!missing(verbose)) {
    stopifnot(isTRUEorFALSE(verbose))
    oldverbose = options(datatable.verbose = verbose)
    on.exit(options(oldverbose))
  }
  .global$print = ""
  missingby = missing(by) && missing(keyby)
  if (!missing(keyby)) {
    if (!missing(by)) 
      stop("Provide either by= or keyby= but not both")
    if (missing(j)) {
      warning("Ignoring keyby= because j= is not supplied")
      keyby = NULL
    }
    by = bysub = substitute(keyby)
    keyby = TRUE
  }
  else {
    if (!missing(by) && missing(j)) {
      warning("Ignoring by= because j= is not supplied")
      by = NULL
    }
    by = bysub = if (missing(by)) 
      NULL
    else substitute(by)
    keyby = FALSE
  }
  bynull = !missingby && is.null(by)
  byjoin = !is.null(by) && is.symbol(bysub) && bysub == ".EACHI"
  naturaljoin = FALSE
  names_x = names(x)
  if (missing(i) && !missing(on)) {
    tt = eval.parent(.massagei(substitute(on)))
    if (!is.list(tt) || !length(names(tt))) {
      warning("When on= is provided but not i=, on= must be a named list or data.table|frame, and a natural join (i.e. join on common names) is invoked. Ignoring on= which is '", 
              class(tt)[1L], "'.")
      on = NULL
    }
    else {
      i = tt
      naturaljoin = TRUE
    }
  }
  if (missing(i) && missing(j)) {
    tt_isub = substitute(i)
    tt_jsub = substitute(j)
    if (!is.null(names(sys.call())) && tryCatch(!is.symbol(tt_isub), 
                                                error = function(e) TRUE) && tryCatch(!is.symbol(tt_jsub), 
                                                                                      error = function(e) TRUE)) {
      warning("i and j are both missing so ignoring the other arguments. This warning will be upgraded to error in future.")
    }
    return(x)
  }
  if (!mult %chin% c("first", "last", "all")) 
    stop("mult argument can only be 'first', 'last' or 'all'")
  missingroll = missing(roll)
  if (length(roll) != 1L || is.na(roll)) 
    stop("roll must be a single TRUE, FALSE, positive/negative integer/double including +Inf and -Inf or 'nearest'")
  if (is.character(roll)) {
    if (roll != "nearest") 
      stop("roll is '", roll, "' (type character). Only valid character value is 'nearest'.")
  }
  else {
    roll = if (isTRUE(roll)) 
      +Inf
    else as.double(roll)
  }
  force(rollends)
  if (!is.logical(rollends)) 
    stop("rollends must be a logical vector")
  if (length(rollends) > 2L) 
    stop("rollends must be length 1 or 2")
  if (length(rollends) == 1L) 
    rollends = rep.int(rollends, 2L)
  .unsafe.opt()
  missingnomatch = missing(nomatch)
  if (is.null(nomatch)) 
    nomatch = 0L
  if (!is.na(nomatch) && nomatch != 0L) 
    stop("nomatch= must be either NA or NULL (or 0 for backwards compatibility which is the same as NULL)")
  nomatch = as.integer(nomatch)
  if (!is.logical(which) || length(which) > 1L) 
    stop("which= must be a logical vector length 1. Either FALSE, TRUE or NA.")
  if ((isTRUE(which) || is.na(which)) && !missing(j)) 
    stop("which==", which, " (meaning return row numbers) but j is also supplied. Either you need row numbers or the result of j, but only one type of result can be returned.")
  if (!is.na(nomatch) && is.na(which)) 
    stop("which=NA with nomatch=0 would always return an empty vector. Please change or remove either which or nomatch.")
  if (!with && missing(j)) 
    stop("j must be provided when with=FALSE")
  irows = NULL
  notjoin = FALSE
  rightcols = leftcols = integer()
  optimizedSubset = FALSE
  ..syms = NULL
  av = NULL
  jsub = NULL
  if (!missing(j)) {
    jsub = replace_dot_alias(substitute(j))
    root = if (is.call(jsub)) 
      as.character(jsub[[1L]])[1L]
    else ""
    if (root == ":" || (root %chin% c("-", "!") && jsub[[2L]] %iscall% 
                        "(" && jsub[[2L]][[2L]] %iscall% ":") || ((!length(av <- all.vars(jsub)) || 
                                                                   all(substring(av, 1L, 2L) == "..")) && root %chin% 
                                                                  c("", "c", "paste", "paste0", "-", "!") && missingby)) {
      with = FALSE
      if (length(av)) {
        for (..name in av) {
          name = substring(..name, 3L)
          if (name == "") 
            stop("The symbol .. is invalid. The .. prefix must be followed by at least one character.")
          if (!exists(name, where = parent.frame())) {
            stop("Variable '", name, "' is not found in calling scope. Looking in calling scope because you used the .. prefix.", 
                 if (exists(..name, where = parent.frame())) 
                   paste0(" Variable '..", name, "' does exist in calling scope though, so please just removed the .. prefix from that variable name in calling scope.")
                 else "")
          }
          else if (exists(..name, where = parent.frame())) {
            warning("Both '", name, "' and '..", name, 
                    "' exist in calling scope. Please remove the '..", 
                    name, "' variable in calling scope for clarity.")
          }
        }
        ..syms = av
      }
    }
    else if (is.name(jsub)) {
      if (substring(jsub, 1L, 2L) == "..") 
        stop("Internal error:  DT[, ..var] should be dealt with by the branch above now.")
      if (!with && !exists(as.character(jsub), where = parent.frame())) 
        stop("Variable '", jsub, "' is not found in calling scope. Looking in calling scope because you set with=FALSE. Also, please use .. symbol prefix and remove with=FALSE.")
    }
    if (root == "{") {
      if (length(jsub) == 2L) {
        jsub = jsub[[2L]]
        root = if (is.call(jsub)) 
          as.character(jsub[[1L]])[1L]
        else ""
      }
      else if (length(jsub) > 2L && jsub[[2L]] %iscall% 
               ":=") {
        stop("You have wrapped := with {} which is ok but then := must be the only thing inside {}. You have something else inside {} as well. Consider placing the {} on the RHS of := instead; e.g. DT[,someCol:={tmpVar1<-...;tmpVar2<-...;tmpVar1*tmpVar2}")
      }
    }
    if (root == "eval" && !any(all.vars(jsub[[2L]]) %chin% 
                               names_x)) {
      jsub = eval(jsub[[2L]], parent.frame(), parent.frame())
      if (is.expression(jsub)) 
        jsub = jsub[[1L]]
      root = if (is.call(jsub)) {
        jsub = replace_dot_alias(jsub)
        as.character(jsub[[1L]])[1L]
      }
      else ""
    }
    if (root == ":=") {
      allow.cartesian = TRUE
      if (!missing(i) && keyby) 
        stop(":= with keyby is only possible when i is not supplied since you can't setkey on a subset of rows. Either change keyby to by or remove i")
      if (!missingnomatch) {
        warning("nomatch isn't relevant together with :=, ignoring nomatch")
        nomatch = 0L
      }
    }
  }
  dupdiff = function(x, y) x[!x %chin% y]
  if (!missing(i)) {
    xo = NULL
    isub = substitute(i)
    if (identical(isub, NA)) {
      isub = NA_integer_
    }
    isnull_inames = FALSE
    restore.N = remove.N = FALSE
    if (exists(".N", envir = parent.frame(), inherits = FALSE)) {
      old.N = get(".N", envir = parent.frame(), inherits = FALSE)
      locked.N = bindingIsLocked(".N", parent.frame())
      if (locked.N) 
        eval(call("unlockBinding", ".N", parent.frame()))
      assign(".N", nrow(x), envir = parent.frame(), inherits = FALSE)
      restore.N = TRUE
    }
    else {
      assign(".N", nrow(x), envir = parent.frame(), inherits = FALSE)
      remove.N = TRUE
    }
    if (isub %iscall% "eval") {
      isub = eval(.massagei(isub[[2L]]), parent.frame(), 
                  parent.frame())
      if (is.expression(isub)) 
        isub = isub[[1L]]
    }
    if (isub %iscall% "!") {
      notjoin = TRUE
      if (!missingnomatch) 
        stop("not-join '!' prefix is present on i but nomatch is provided. Please remove nomatch.")
      nomatch = 0L
      isub = isub[[2L]]
      if (isub %iscall% "(" && !is.name(isub[[2L]])) 
        isub = isub[[2L]]
    }
    if (is.null(isub)) 
      return(null.data.table())
    if (length(o <- .prepareFastSubset(isub = isub, x = x, 
                                       enclos = parent.frame(), notjoin = notjoin, verbose = verbose))) {
      optimizedSubset = TRUE
      notjoin = o$notjoin
      i = o$i
      on = o$on
      nomatch = 0L
      mult = "all"
    }
    else if (!is.name(isub)) {
      ienv = new.env(parent = parent.frame())
      if (getOption("datatable.optimize") >= 1L) 
        assign("order", forder, ienv)
      i = tryCatch(eval(.massagei(isub), x, ienv), error = function(e) {
        if (grepl(":=.*defined for use in j.*only", 
                  e$message)) 
          stop("Operator := detected in i, the first argument inside DT[...], but is only valid in the second argument, j. Most often, this happens when forgetting the first comma (e.g. DT[newvar := 5] instead of DT[ , new_var := 5]). Please double-check the syntax. Run traceback(), and debugger() to get a line number.")
        else .checkTypos(e, names_x)
      })
    }
    else {
      i = try(eval(isub, parent.frame(), parent.frame()), 
              silent = TRUE)
      if (inherits(i, "try-error")) {
        col = try(eval(isub, x), silent = TRUE)
        msg = if (inherits(col, "try-error")) 
          " and it is not a column name either."
        else paste0(" but it is a column of type ", 
                    typeof(col), ". If you wish to select rows where that column contains TRUE", 
                    ", or perhaps that column contains row numbers of itself to select, try DT[(col)], DT[DT$col], or DT[col==TRUE] is particularly clear and is optimized.")
        stop(as.character(isub), " is not found in calling scope", 
             msg, " When the first argument inside DT[...] is a single symbol (e.g. DT[var]), data.table looks for var in calling scope.")
      }
    }
    if (restore.N) {
      assign(".N", old.N, envir = parent.frame())
      if (locked.N) 
        lockBinding(".N", parent.frame())
    }
    if (remove.N) 
      rm(list = ".N", envir = parent.frame())
    if (is.matrix(i)) {
      if (is.numeric(i) && ncol(i) == 1L) {
        i = as.integer(i)
      }
      else {
        stop("i is invalid type (matrix). Perhaps in future a 2 column matrix could return a list of elements of DT (in the spirit of A[B] in FAQ 2.14). Please report to data.table issue tracker if you'd like this, or add your comments to FR #657.")
      }
    }
    if (is.logical(i)) {
      if (notjoin) {
        notjoin = FALSE
        i = !i
      }
    }
    if (is.null(i)) 
      return(null.data.table())
    if (is.character(i)) {
      isnull_inames = TRUE
      i = data.table(V1 = i)
    }
    else if (identical(class(i), "list") && length(i) == 
             1L && is.data.frame(i[[1L]])) {
      i = as.data.table(i[[1L]])
    }
    else if (identical(class(i), "data.frame")) {
      i = as.data.table(i)
    }
    else if (identical(class(i), "list")) {
      isnull_inames = is.null(names(i))
      i = as.data.table(i)
    }
    if (is.data.table(i)) {
      if (missing(on)) {
        if (!haskey(x)) {
          stop("When i is a data.table (or character vector), the columns to join by must be specified using 'on=' argument (see ?data.table), by keying x (i.e. sorted, and, marked as sorted, see ?setkey), or by sharing column names between x and i (i.e., a natural join). Keyed joins might have further speed benefits on very large data due to x being sorted in RAM.")
        }
      }
      else if (identical(substitute(on), as.name(".NATURAL"))) {
        naturaljoin = TRUE
      }
      if (naturaljoin) {
        common_names = intersect(names_x, names(i))
        len_common_names = length(common_names)
        if (!len_common_names) 
          stop("Attempting to do natural join but no common columns in provided tables")
        if (verbose) {
          which_cols_msg = if (len_common_names == length(x)) 
            " all 'x' columns"
          else paste(":", brackify(common_names))
          cat("Joining but 'x' has no key, natural join using", 
              which_cols_msg, "\n", sep = "")
        }
        on = common_names
      }
      if (!missing(on)) {
        on_ops = .parse_on(substitute(on), isnull_inames)
        on = on_ops[[1L]]
        ops = on_ops[[2L]]
        if (any(ops > 1L)) {
          allow.cartesian = TRUE
        }
        rightcols = colnamesInt(x, names(on), check_dups = FALSE)
        leftcols = colnamesInt(i, unname(on), check_dups = FALSE)
      }
      else {
        rightcols = chmatch(key(x), names_x)
        leftcols = if (haskey(i)) 
          chmatch(head(key(i), length(rightcols)), names(i))
        else seq_len(min(length(i), length(rightcols)))
        rightcols = head(rightcols, length(leftcols))
        ops = rep(1L, length(leftcols))
      }
      if (notjoin && (byjoin || mult != "all")) {
        notjoin = FALSE
        if (verbose) {
          last.started.at = proc.time()
          cat("not-join called with 'by=.EACHI'; Replacing !i with i=setdiff_(x,i) ...")
          flush.console()
        }
        orignames = copy(names(i))
        i = setdiff_(x, i, rightcols, leftcols)
        if (verbose) {
          cat("done in", timetaken(last.started.at), 
              "\n")
          flush.console()
        }
        setnames(i, orignames[leftcols])
        setattr(i, "sorted", names(i))
      }
      i = .shallow(i, retain.key = TRUE)
      ans = bmerge(i, x, leftcols, rightcols, roll, rollends, 
                   nomatch, mult, ops, verbose = verbose)
      xo = ans$xo
      if (length(ans$indices)) 
        setorder(setDT(ans[1L:3L]), indices)
      allLen1 = ans$allLen1
      f__ = ans$starts
      len__ = ans$lens
      allGrp1 = all(ops == 1L)
      indices__ = if (length(ans$indices)) 
        ans$indices
      else seq_along(f__)
      if (is.na(which)) {
        w = if (notjoin) 
          f__ != 0L
        else is.na(f__)
        return(if (length(xo)) fsort(xo[w], internal = TRUE) else which(w))
      }
      if (mult == "all") {
        nqbyjoin = byjoin && length(ans$indices) && 
          !allGrp1
        if (!byjoin || nqbyjoin) {
          if (verbose) {
            last.started.at = proc.time()
            cat("Constructing irows for '!byjoin || nqbyjoin' ... ")
            flush.console()
          }
          irows = if (allLen1) 
            f__
          else vecseq(f__, len__, if (allow.cartesian || 
                                      notjoin || !anyDuplicated(f__, incomparables = c(0L, 
                                                                                       NA_integer_))) {
            NULL
          }
          else as.double(nrow(x) + nrow(i)))
          if (verbose) {
            cat(timetaken(last.started.at), "\n")
            flush.console()
          }
          if (identical(nomatch, 0L) && allLen1) 
            irows = irows[irows != 0L]
        }
        else {
          if (length(xo) && missing(on)) 
            stop("Internal error. Cannot by=.EACHI when joining to a secondary key, yet")
          if (length(irows)) 
            stop("Internal error. irows has length in by=.EACHI")
        }
        if (nqbyjoin) {
          irows = if (length(xo)) 
            xo[irows]
          else irows
          xo = setorder(setDT(list(indices = rep.int(indices__, 
                                                     len__), irows = irows)))[["irows"]]
          ans = .Call(CnqRecreateIndices, xo, len__, 
                      indices__, max(indices__), nomatch)
          f__ = ans[[1L]]
          len__ = ans[[2L]]
          allLen1 = FALSE
          irows = NULL
          if (any_na(as_list(xo))) 
            xo = xo[!is.na(xo)]
        }
      }
      else {
        if (!byjoin) {
          irows = f__
          if (identical(nomatch, 0L)) 
            irows = irows[len__ > 0L]
        }
      }
      if (length(xo) && length(irows)) {
        irows = xo[irows]
        if (mult == "all" && !allGrp1) {
          if (verbose) {
            last.started.at = proc.time()
            cat("Reorder irows for 'mult==\"all\" && !allGrp1' ... ")
            flush.console()
          }
          irows = setorder(setDT(list(indices = rep.int(indices__, 
                                                        len__), irows = irows)))[["irows"]]
          if (verbose) {
            cat(timetaken(last.started.at), "\n")
            flush.console()
          }
        }
      }
      if (optimizedSubset) {
        if (!.Call(CisOrderedSubset, irows, nrow(x))) {
          if (verbose) {
            last.started.at = proc.time()[3L]
            cat("Reordering", length(irows), "rows after bmerge done in ... ")
            flush.console()
          }
          if (length(irows) < 1e+06) {
            irows = fsort(irows, internal = TRUE)
          }
          else {
            irows = as.integer(fsort(as.numeric(irows)))
          }
          if (verbose) {
            cat(round(proc.time()[3L] - last.started.at, 
                      3L), "secs\n")
            flush.console()
          }
        }
        leftcols = integer(0L)
        rightcols = integer(0L)
        i = irows
      }
    }
    else {
      if (!missing(on)) {
        stop("logical error. i is not a data.table, but 'on' argument is provided.")
      }
      if (!is.logical(i) && !is.numeric(i)) 
        stop("i has evaluated to type ", typeof(i), 
             ". Expecting logical, integer or double.")
      if (is.logical(i)) {
        if (length(i) == 1L && isTRUE(unname(i))) {
          irows = i = NULL
        }
        else if (length(i) <= 1L) {
          irows = i = integer(0L)
        }
        else if (length(i) == nrow(x)) {
          irows = i = which(i)
        }
        else stop("i evaluates to a logical vector length ", 
                  length(i), " but there are ", nrow(x), " rows. Recycling of logical i is no longer allowed as it hides more bugs than is worth the rare convenience. Explicitly use rep(...,length=.N) if you really need to recycle.")
      }
      else {
        irows = as.integer(i)
        irows = .Call(CconvertNegAndZeroIdx, irows, 
                      nrow(x), is.null(jsub) || root != ":=")
      }
    }
    if (notjoin) {
      if (byjoin || !is.integer(irows) || is.na(nomatch)) 
        stop("Internal error: notjoin but byjoin or !integer or nomatch==NA")
      irows = irows[irows != 0L]
      if (verbose) {
        last.started.at = proc.time()[3L]
        cat("Inverting irows for notjoin done in ... ")
        flush.console()
      }
      i = irows = if (length(irows)) 
        seq_len(nrow(x))[-irows]
      else NULL
      if (verbose) 
        cat(round(proc.time()[3L] - last.started.at, 
                  3L), "sec\n")
      leftcols = integer()
      rightcols = integer()
    }
    if (which) 
      return(if (is.null(irows)) seq_len(nrow(x)) else irows)
  }
  else {
    i = NULL
  }
  names_i = names(i)
  byval = NULL
  xnrow = nrow(x)
  xcols = xcolsAns = icols = icolsAns = integer()
  xdotcols = FALSE
  non_sdvars = character(0L)
  if (missing(j)) {
    if (!length(x)) 
      return(null.data.table())
    if (!length(leftcols)) {
      if (is.null(irows)) 
        return(shallow(x))
      else return(.Call(CsubsetDT, x, irows, seq_along(x)))
    }
    else {
      jisvars = names_i[-leftcols]
      tt = jisvars %chin% names_x
      if (length(tt)) 
        jisvars[tt] = paste0("i.", jisvars[tt])
      if (length(duprightcols <- rightcols[duplicated(rightcols)])) {
        nx = c(names_x, names_x[duprightcols])
        rightcols = chmatchdup(names_x[rightcols], nx)
        nx = make.unique(nx)
      }
      else nx = names_x
      ansvars = make.unique(c(nx, jisvars))
      icols = c(leftcols, seq_along(i)[-leftcols])
      icolsAns = c(rightcols, seq.int(length(nx) + 1L, 
                                      length.out = ncol(i) - length(unique(leftcols))))
      xcols = xcolsAns = seq_along(x)[-rightcols]
    }
    ansvals = chmatch(ansvars, nx)
  }
  else {
    if (is.data.table(i)) {
      idotprefix = paste0("i.", names_i)
      xdotprefix = paste0("x.", names_x)
    }
    else idotprefix = xdotprefix = character(0L)
    if (is.null(jsub)) 
      return(NULL)
    if (!with && jsub %iscall% ":=") {
      if (is.null(names(jsub)) && is.name(jsub[[2L]])) {
        warning("with=FALSE together with := was deprecated in v1.9.4 released Oct 2014. Please wrap the LHS of := with parentheses; e.g., DT[,(myVar):=sum(b),by=a] to assign to column name(s) held in variable myVar. See ?':=' for other examples. As warned in 2014, this is now a warning.")
        jsub[[2L]] = eval(jsub[[2L]], parent.frame(), 
                          parent.frame())
      }
      else {
        warning("with=FALSE ignored, it isn't needed when using :=. See ?':=' for examples.")
      }
      with = TRUE
    }
    if (!with) {
      if (jsub %iscall% c("!", "-") && length(jsub) == 
          2L) {
        notj = TRUE
        jsub = jsub[[2L]]
      }
      else notj = FALSE
      while (jsub %iscall% "(") jsub = as.list(jsub)[[-1L]]
      if (jsub %iscall% ":" && length(jsub) == 3L) {
        j = eval(jsub, setattr(as.list(seq_along(x)), 
                               "names", names_x), parent.frame())
      }
      else {
        names(..syms) = ..syms
        j = eval(jsub, lapply(substring(..syms, 3L), 
                              get, pos = parent.frame()), parent.frame())
      }
      if (is.logical(j)) 
        j <- which(j)
      if (!length(j) && !notj) 
        return(null.data.table())
      if (is.factor(j)) 
        j = as.character(j)
      if (is.character(j)) {
        if (notj) {
          if (anyNA(idx <- chmatch(j, names_x))) 
            warning("column(s) not removed because not found: ", 
                    brackify(j[is.na(idx)]))
          w = !names_x %chin% j
          ansvars = names_x[w]
          ansvals = which(w)
        }
        else {
          ansvars = j
          ansvals = chmatch(ansvars, names_x)
        }
        if (!length(ansvals)) 
          return(null.data.table())
        if (!length(leftcols)) {
          if (!anyNA(ansvals)) 
            return(.Call(CsubsetDT, x, irows, ansvals))
          else stop("column(s) not found: ", paste(ansvars[is.na(ansvals)], 
                                                   collapse = ", "))
        }
      }
      else if (is.numeric(j)) {
        j = as.integer(j)
        if (any(w <- (j > ncol(x)))) 
          stop("Item ", which.first(w), " of j is ", 
               j[which.first(w)], " which is outside the column number range [1,ncol=", 
               ncol(x), "]")
        j = j[j != 0L]
        if (any(j < 0L)) {
          if (any(j > 0L)) 
            stop("j mixes positives and negatives")
          j = seq_along(x)[j]
        }
        if (notj) 
          j = seq_along(x)[if (length(j)) 
            -j
            else TRUE]
        if (!length(j)) 
          return(null.data.table())
        return(.Call(CsubsetDT, x, irows, j))
      }
      else {
        stop("When with=FALSE, j-argument should be of type logical/character/integer indicating the columns to select.")
      }
    }
    else {
      bynames = NULL
      allbyvars = NULL
      if (byjoin) {
        bynames = names_x[rightcols]
      }
      else if (!missingby) {
        bysubl = as.list.default(bysub)
        bysuborig = bysub
        if (is.name(bysub) && !(bysub %chin% names_x)) {
          bysub = eval(bysub, parent.frame(), parent.frame())
          if (is.atomic(bysub)) 
            bysubl = list(bysuborig)
          else bysubl = as.list.default(bysub)
        }
        if (length(bysubl) && identical(bysubl[[1L]], 
                                        quote(eval))) {
          bysub = eval(bysubl[[2L]], parent.frame(), 
                       parent.frame())
          bysub = replace_dot_alias(bysub)
          if (is.expression(bysub)) 
            bysub = bysub[[1L]]
          bysubl = as.list.default(bysub)
        }
        else if (bysub %iscall% c("c", "key", "names", 
                                  "intersect", "setdiff")) {
          tt = eval(bysub, parent.frame(), parent.frame())
          if (!is.character(tt)) 
            stop("by=c(...), key(...) or names(...) must evaluate to 'character'")
          bysub = tt
        }
        else if (is.call(bysub) && !(bysub[[1L]] %chin% 
                                     c("list", "as.list", "{", ".", ":"))) {
          bysub = as.call(c(as.name("("), list(bysub)))
          bysubl = as.list.default(bysub)
        }
        else if (bysub %iscall% ".") 
          bysub[[1L]] = quote(list)
        if (mode(bysub) == "character") {
          if (length(grep(",", bysub, fixed = TRUE))) {
            if (length(bysub) > 1L) 
              stop("'by' is a character vector length ", 
                   length(bysub), " but one or more items include a comma. Either pass a vector of column names (which can contain spaces, but no commas), or pass a vector length 1 containing comma separated column names. See ?data.table for other possibilities.")
            bysub = strsplit(bysub, split = ",")[[1L]]
          }
          backtick_idx = grep("^[^`]+$", bysub)
          if (length(backtick_idx)) 
            bysub[backtick_idx] = paste0("`", bysub[backtick_idx], 
                                         "`")
          backslash_idx = grep("\\", bysub, fixed = TRUE)
          if (length(backslash_idx)) 
            bysub[backslash_idx] = gsub("\\", "\\\\", 
                                        bysub[backslash_idx], fixed = TRUE)
          bysub = parse(text = paste0("list(", paste(bysub, 
                                                     collapse = ","), ")"))[[1L]]
          bysubl = as.list.default(bysub)
        }
        allbyvars = intersect(all.vars(bysub), names_x)
        orderedirows = .Call(CisOrderedSubset, irows, 
                             nrow(x))
        bysameorder = byindex = FALSE
        if (!bysub %iscall% ":" && all(vapply_1b(bysubl, 
                                                 is.name))) {
          bysameorder = orderedirows && haskey(x) && 
            length(allbyvars) && identical(allbyvars, 
                                           head(key(x), length(allbyvars)))
          if (!bysameorder && keyby && !length(irows) && 
              isTRUE(getOption("datatable.use.index"))) {
            tt = paste0(c(allbyvars, ""), collapse = "__")
            w = which.first(substring(paste0(indices(x), 
                                             "__"), 1L, nchar(tt)) == tt)
            if (!is.na(w)) {
              byindex = indices(x)[w]
              if (!length(getindex(x, byindex))) {
                if (verbose) 
                  cat("by index '", byindex, "' but that index has 0 length. Ignoring.\n", 
                      sep = "")
                byindex = FALSE
              }
            }
          }
        }
        if (is.null(irows)) {
          if (bysub %iscall% ":" && length(bysub) == 
              3L && is.name(bysub[[2L]]) && is.name(bysub[[3L]])) {
            byval = eval(bysub, setattr(as.list(seq_along(x)), 
                                        "names", names_x), parent.frame())
            byval = as.list(x)[byval]
          }
          else byval = eval(bysub, x, parent.frame())
        }
        else {
          if (!is.integer(irows)) 
            stop("Internal error: irows isn't integer")
          if (!is.na(nomatch)) 
            irows = irows[irows != 0L]
          if (length(allbyvars)) {
            if (verbose) 
              cat("i clause present and columns used in by detected, only these subset:", 
                  paste(allbyvars, collapse = ","), "\n")
            xss = x[irows, allbyvars, with = FALSE, 
                    nomatch = nomatch, mult = mult, roll = roll, 
                    rollends = rollends]
          }
          else {
            if (verbose) 
              cat("i clause present but columns used in by not detected. Having to subset all columns before evaluating 'by': '", 
                  deparse(by), "'\n", sep = "")
            xss = x[irows, nomatch = nomatch, mult = mult, 
                    roll = roll, rollends = rollends]
          }
          if (bysub %iscall% ":" && length(bysub) == 
              3L) {
            byval = eval(bysub, setattr(as.list(seq_along(xss)), 
                                        "names", names(xss)), parent.frame())
            byval = as.list(xss)[byval]
          }
          else byval = eval(bysub, xss, parent.frame())
          xnrow = nrow(xss)
        }
        if (!length(byval) && xnrow > 0L) {
          bysameorder = FALSE
          byval = list()
          bynames = allbyvars = NULL
        }
        else bynames = names(byval)
        if (is.atomic(byval)) {
          if (is.character(byval) && length(byval) <= 
              ncol(x) && !(is.name(bysub) && bysub %chin% 
                           names_x)) {
            stop("'by' appears to evaluate to column names but isn't c() or key(). Use by=list(...) if you can. Otherwise, by=eval", 
                 deparse(bysub), " should work. This is for efficiency so data.table can detect which columns are needed.")
          }
          else {
            byval = list(byval)
            bysubl = c(as.name("list"), bysuborig)
            if (is.name(bysuborig)) 
              bynames = as.character(bysuborig)
            else bynames = names(byval)
          }
        }
        if (!is.list(byval)) 
          stop("'by' or 'keyby' must evaluate to a vector or a list of vectors (where 'list' includes data.table and data.frame which are lists, too)")
        if (length(byval) == 1L && is.null(byval[[1L]])) 
          bynull = TRUE
        if (!bynull) 
          for (jj in seq_len(length(byval))) {
            if (!typeof(byval[[jj]]) %chin% ORDERING_TYPES) 
              stop("column or expression ", jj, " of 'by' or 'keyby' is type ", 
                   typeof(byval[[jj]]), ". Do not quote column names. Usage: DT[,sum(colC),by=list(colA,month(colB))]")
          }
        tt = vapply_1i(byval, length)
        if (any(tt != xnrow)) 
          stop(gettextf("The items in the 'by' or 'keyby' list are length(s) (%s). Each must be length %d; the same length as there are rows in x (after subsetting if i is provided).", 
                        paste(tt, collapse = ","), xnrow, domain = "R-data.table"))
        if (is.null(bynames)) 
          bynames = rep.int("", length(byval))
        if (length(idx <- which(!nzchar(bynames))) && 
            !bynull) {
          if (is.name(bysubl[[1L]]) && bysubl[[1L]] == 
              "{") 
            bysubl = bysubl[[length(bysubl)]]
          for (jj in idx) {
            byvars = all.vars(bysubl[[jj + 1L]], functions = TRUE)
            if (length(byvars) == 1L) 
              tt = byvars
            else {
              tt = grep("^eval$|^[^[:alpha:]. ]", byvars, 
                        invert = TRUE, value = TRUE)
              tt = if (length(tt)) 
                tt[1L]
              else all.vars(bysubl[[jj + 1L]])[1L]
            }
            if (length(byvars) > 1L && tt %chin% all.vars(jsub, 
                                                          FALSE)) {
              bynames[jj] = deparse(bysubl[[jj + 1L]])
              if (verbose) 
                cat("by-expression '", bynames[jj], 
                    "' is not named, and the auto-generated name '", 
                    tt, "' clashed with variable(s) in j. Therefore assigning the entire by-expression as name.\n", 
                    sep = "")
            }
            else bynames[jj] = tt
          }
          if (any(duplicated(bynames))) {
            bynames = make.unique(bynames)
          }
        }
        setattr(byval, "names", bynames)
      }
      jvnames = NULL
      drop_dot = function(x) {
        if (length(x) != 1L) 
          stop("Internal error: drop_dot passed ", length(x), 
               " items")
        if (identical(substring(x <- as.character(x), 
                                1L, 1L), ".") && x %chin% c(".N", ".I", ".GRP", 
                                                            ".NGRP", ".BY")) 
          substring(x, 2L)
        else x
      }
      do_j_names = function(q) {
        if (!is.call(q) || !is.name(q[[1L]])) 
          return(q)
        if (q[[1L]] %chin% c("list", ".")) {
          q[[1L]] = quote(list)
          qlen = length(q)
          if (qlen > 1L) {
            nm = names(q[-1L])
            if (is.null(nm)) 
              nm = rep.int("", qlen - 1L)
            for (jj in which(nm == "")) {
              thisq = q[[jj + 1L]]
              if (missing(thisq)) 
                stop(gettextf("Item %d of the .() or list() passed to j is missing", 
                              jj, domain = "R-data.table"))
              if (is.name(thisq)) 
                nm[jj] = drop_dot(thisq)
            }
            if (!is.null(jvnames) && any(idx <- nm != 
                                         jvnames)) 
              warning("Different branches of j expression produced different auto-named columns: ", 
                      brackify(sprintf("%s!=%s", nm[idx], 
                                       jvnames[idx])), "; using the most \"last\" names", 
                      call. = FALSE)
            jvnames <<- nm
            setattr(q, "names", NULL)
          }
          return(q)
        }
        if (q[[1L]] == "{") {
          if (!is.null(q[[qlen <- length(q)]])) 
            q[[qlen]] = do_j_names(q[[qlen]])
          return(q)
        }
        if (q[[1L]] == "if") {
          if (!is.null(q[[3L]])) 
            q[[3L]] = do_j_names(q[[3L]])
          if (length(q) == 4L && !is.null(q[[4L]])) 
            q[[4L]] = do_j_names(q[[4L]])
          return(q)
        }
        return(q)
      }
      if (is.name(jsub)) {
        if (jsub != ".SD") 
          jvnames = drop_dot(jsub)
      }
      else jsub = do_j_names(jsub)
      av = all.vars(jsub, TRUE)
      use.I = ".I" %chin% av
      if (any(c(".SD", "eval", "get", "mget") %chin% av)) {
        if (missing(.SDcols)) {
          ansvars = sdvars = dupdiff(names_x, union(bynames, 
                                                    allbyvars))
          ansvals = chmatchdup(ansvars, names_x)
        }
        else {
          colsub = substitute(.SDcols)
          if (colsub %iscall% c("!", "-")) {
            negate_sdcols = TRUE
            colsub = colsub[[2L]]
          }
          else negate_sdcols = FALSE
          while (colsub %iscall% "(") colsub = as.list(colsub)[[-1L]]
          if (colsub %iscall% ":" && length(colsub) == 
              3L) {
            .SDcols = eval(colsub, setattr(as.list(seq_along(x)), 
                                           "names", names_x), parent.frame())
          }
          else {
            if (colsub %iscall% "patterns") {
              .SDcols = Reduce(intersect, do_patterns(colsub, 
                                                      names_x))
            }
            else {
              .SDcols = eval(colsub, parent.frame(), 
                             parent.frame())
              if (is.function(.SDcols)) {
                .SDcols = lapply(x, .SDcols)
                if (any(idx <- vapply_1i(.SDcols, length) > 
                        1L | vapply_1c(.SDcols, typeof) != 
                        "logical" | vapply_1b(.SDcols, anyNA))) 
                  stop("When .SDcols is a function, it is applied to each column; the output of this function must be a non-missing boolean scalar signalling inclusion/exclusion of the column. However, these conditions were not met for: ", 
                       brackify(names(x)[idx]))
                .SDcols = unlist(.SDcols, use.names = FALSE)
              }
            }
          }
          if (anyNA(.SDcols)) 
            stop(".SDcols missing at the following indices: ", 
                 brackify(which(is.na(.SDcols))))
          if (is.logical(.SDcols)) {
            ansvals = which_(rep(.SDcols, length.out = length(x)), 
                             !negate_sdcols)
            ansvars = sdvars = names_x[ansvals]
          }
          else if (is.numeric(.SDcols)) {
            .SDcols = as.integer(.SDcols)
            if (length(unique(sign(.SDcols))) > 1L) 
              stop(".SDcols is numeric but has both +ve and -ve indices")
            if (any(idx <- abs(.SDcols) > ncol(x) | 
                    abs(.SDcols) < 1L)) 
              stop(".SDcols is numeric but out of bounds [1, ", 
                   ncol(x), "] at: ", brackify(which(idx)))
            ansvars = sdvars = if (negate_sdcols) 
              dupdiff(names_x[-.SDcols], bynames)
            else names_x[.SDcols]
            ansvals = if (negate_sdcols) 
              setdiff(seq_along(names(x)), c(.SDcols, 
                                             which(names(x) %chin% bynames)))
            else .SDcols
          }
          else {
            if (!is.character(.SDcols)) 
              stop(".SDcols should be column numbers or names")
            if (!all(idx <- .SDcols %chin% names_x)) 
              stop("Some items of .SDcols are not column names: ", 
                   brackify(.SDcols[!idx]))
            ansvars = sdvars = if (negate_sdcols) 
              setdiff(names_x, c(.SDcols, bynames))
            else .SDcols
            ansvals = chmatch(ansvars, names_x)
          }
        }
        allcols = c(names_x, xdotprefix, names_i, idotprefix)
        non_sdvars = setdiff(intersect(av, allcols), 
                             c(bynames, ansvars))
        if (any(c("get", "mget") %chin% av)) {
          if (verbose) 
            cat(gettextf("'(m)get' found in j. ansvars being set to all columns. Use .SDcols or a single j=eval(macro) instead. Both will detect the columns used which is important for efficiency.\nOld ansvars: %s \n", 
                         brackify(ansvars), domain = "R-data.table"))
          if (jsub %iscall% ":=" && is.symbol(jsub[[2L]])) {
            jsub_lhs_symbol = as.character(jsub[[2L]])
            if (jsub_lhs_symbol %chin% non_sdvars) {
              sdvars = setdiff(sdvars, jsub_lhs_symbol)
            }
          }
          if (missing(.SDcols)) {
            ansvars = setdiff(allcols, bynames)
          }
          else {
            ansvars = union(ansvars, setdiff(setdiff(allcols, 
                                                     ansvars), bynames))
          }
          non_sdvars = setdiff(ansvars, sdvars)
          ansvals = chmatch(ansvars, names_x)
          if (verbose) 
            cat(gettextf("New ansvars: %s \n", brackify(ansvars), 
                         domain = "R-data.table"))
        }
        else if (length(non_sdvars)) {
          ansvars = union(ansvars, non_sdvars)
          ansvals = chmatch(ansvars, names_x)
        }
      }
      else {
        if (!missing(.SDcols)) 
          warning("This j doesn't use .SD but .SDcols has been supplied. Ignoring .SDcols. See ?data.table.")
        allcols = c(names_x, xdotprefix, names_i, idotprefix)
        ansvars = sdvars = setdiff(intersect(av, allcols), 
                                   bynames)
        if (verbose) 
          cat("Detected that j uses these columns:", 
              if (!length(ansvars)) 
                "<none>"
              else paste(ansvars, collapse = ","), "\n")
        ansvals = chmatch(ansvars, names_x)
      }
      lhs = NULL
      newnames = NULL
      suppPrint = identity
      if (length(av) && av[1L] == ":=") {
        if (.Call(C_islocked, x)) 
          stop(".SD is locked. Using := in .SD's j is reserved for possible future use; a tortuously flexible way to modify by group. Use := in j directly to modify by group by reference.")
        suppPrint = function(x) {
          .global$print = address(x)
          x
        }
        if (is.null(names(jsub))) {
          if (length(jsub) != 3L) 
            stop("In `:=`(col1=val1, col2=val2, ...) form, all arguments must be named.")
          lhs = jsub[[2L]]
          jsub = jsub[[3L]]
          if (is.name(lhs)) {
            lhs = as.character(lhs)
          }
          else {
            lhs = eval(lhs, parent.frame(), parent.frame())
          }
        }
        else {
          lhs = names(jsub)[-1L]
          if (any(lhs == "")) 
            stop("In `:=`(col1=val1, col2=val2, ...) form, all arguments must be named.")
          names(jsub) = ""
          jsub[[1L]] = as.name("list")
        }
        av = all.vars(jsub, TRUE)
        if (!is.atomic(lhs)) 
          stop("LHS of := must be a symbol, or an atomic vector (column names or positions).")
        if (is.character(lhs)) {
          m = chmatch(lhs, names_x)
        }
        else if (is.numeric(lhs)) {
          m = as.integer(lhs)
          if (any(m < 1L | ncol(x) < m)) 
            stop("LHS of := appears to be column positions but are outside [1,ncol] range. New columns can only be added by name.")
          lhs = names_x[m]
        }
        else stop("LHS of := isn't column names ('character') or positions ('integer' or 'numeric')")
        if (all(!is.na(m))) {
          cols = as.integer(m)
          newnames = NULL
          if (identical(irows, integer())) {
            if (verbose) {
              cat("No rows match i. No new columns to add so not evaluating RHS of :=\n")
              cat("Assigning to 0 row subset of", nrow(x), 
                  "rows\n")
            }
            .Call(Cassign, x, irows, NULL, NULL, NULL)
            .global$print = address(x)
            return(invisible(x))
          }
        }
        else {
          newnames = setdiff(lhs, names_x)
          m[is.na(m)] = ncol(x) + seq_len(length(newnames))
          cols = as.integer(m)
          if ((ok <- selfrefok(x, verbose = FALSE)) == 
              0L) 
            warning("Invalid .internal.selfref detected and fixed by taking a (shallow) copy of the data.table so that := can add this new column by reference. At an earlier point, this data.table has been copied by R (or was created manually using structure() or similar). Avoid names<- and attr<- which in R currently (and oddly) may copy the whole data.table. Use set* syntax instead to avoid copying: ?set, ?setnames and ?setattr. If this message doesn't help, please report your use case to the data.table issue tracker so the root cause can be fixed or this message improved.")
          if ((ok < 1L) || (truelength(x) < ncol(x) + 
                            length(newnames))) {
            DT = x
            n = length(newnames) + eval(getOption("datatable.alloccol"))
            name = substitute(x)
            if (is.name(name) && ok && verbose) {
              cat("Growing vector of column pointers from truelength ", 
                  truelength(x), " to ", n, ". A shallow copy has been taken, see ?setalloccol. Only a potential issue if two variables point to the same data (we can't yet detect that well) and if not you can safely ignore this. To avoid this message you could setalloccol() first, deep copy first using copy(), wrap with suppressWarnings() or increase the 'datatable.alloccol' option.\n")
              if (ok == -1L) 
                cat("Note that the shallow copy will assign to the environment from which := was called. That means for example that if := was called within a function, the original table may be unaffected.\n")
            }
            setalloccol(x, n, verbose = verbose)
            if (is.name(name)) {
              assign(as.character(name), x, parent.frame(), 
                     inherits = TRUE)
            }
            else if (name %iscall% c("$", "[[") && is.name(name[[2L]])) {
              k = eval(name[[2L]], parent.frame(), parent.frame())
              if (is.list(k)) {
                origj = j = if (name[[1L]] == "$") 
                  as.character(name[[3L]])
                else eval(name[[3L]], parent.frame(), 
                          parent.frame())
                if (is.character(j)) {
                  if (length(j) != 1L) 
                    stop("Cannot assign to an under-allocated recursively indexed list -- L[[i]][,:=] syntax is only valid when i is length 1, but it's length ", 
                         length(j))
                  j = match(j, names(k))
                  if (is.na(j)) 
                    stop("Internal error -- item '", 
                         origj, "' not found in names of list")
                }
                .Call(Csetlistelt, k, as.integer(j), 
                      x)
              }
              else if (is.environment(k) && exists(as.character(name[[3L]]), 
                                                   k)) {
                assign(as.character(name[[3L]]), x, 
                       k, inherits = FALSE)
              }
            }
          }
        }
      }
    }
    if (length(ansvars)) {
      w = ansvals
      if (length(rightcols) && missingby) {
        w[w %in% rightcols] = NA
      }
      if (any(xdotprefixvals <- ansvars %chin% xdotprefix)) {
        w[xdotprefixvals] = chmatch(ansvars[xdotprefixvals], 
                                    xdotprefix)
        xdotcols = TRUE
      }
      if (!any(wna <- is.na(w))) {
        xcols = w
        xcolsAns = seq_along(ansvars)
        icols = icolsAns = integer()
      }
      else {
        if (!length(leftcols)) 
          stop("Internal error -- column(s) not found: ", 
               paste(ansvars[wna], collapse = ", "))
        xcols = w[!wna]
        xcolsAns = which(!wna)
        map = c(seq_along(i), leftcols)
        names(map) = c(names_i, names_x[rightcols])
        w2 = map[ansvars[wna]]
        if (any(w2na <- is.na(w2))) {
          ivars = paste0("i.", names_i)
          ivars[leftcols] = names_i[leftcols]
          w2[w2na] = chmatch(ansvars[wna][w2na], ivars)
          if (any(w2na <- is.na(w2))) {
            ivars[leftcols] = paste0("i.", ivars[leftcols])
            w2[w2na] = chmatch(ansvars[wna][w2na], ivars)
            if (any(w2na <- is.na(w2))) 
              stop("Internal error -- column(s) not found: ", 
                   paste(ansvars[wna][w2na], sep = ", "))
          }
        }
        icols = w2
        icolsAns = which(wna)
      }
    }
  }
  SDenv = new.env(parent = parent.frame())
  SDenv$strptime = function(x, ...) {
    warning("strptime() usage detected and wrapped with as.POSIXct(). This is to minimize the chance of assigning POSIXlt columns, which use 40+ bytes to store one date (versus 8 for POSIXct). Use as.POSIXct() (which will call strptime() as needed internally) to avoid this warning.")
    as.POSIXct(base::strptime(x, ...))
  }
  syms = all.vars(jsub)
  syms = syms[substring(syms, 1L, 2L) == ".."]
  syms = syms[substring(syms, 3L, 3L) != "."]
  for (sym in syms) {
    if (sym %chin% names_x) {
      next
    }
    getName = substring(sym, 3L)
    if (!exists(getName, parent.frame())) {
      if (exists(sym, parent.frame())) 
        next
      stop("Variable '", getName, "' is not found in calling scope. Looking in calling scope because this symbol was prefixed with .. in the j= parameter.")
    }
    assign(sym, get(getName, parent.frame()), SDenv)
  }
  if (missingby || bynull || (!byjoin && !length(byval))) {
    if (length(ansvars)) {
      if (!(length(i) && length(icols))) {
        if (!identical(xcolsAns, seq_along(xcolsAns)) || 
            length(xcols) != length(xcolsAns) || length(ansvars) != 
            length(xcolsAns)) {
          stop("Internal error: xcolAns does not pass checks: ", 
               length(xcolsAns), length(ansvars), length(xcols), 
               paste(xcolsAns, collapse = ","))
        }
        ans = if (with && is.null(irows)) 
          shallow(x, xcols)
        else .Call(CsubsetDT, x, irows, xcols)
        setattr(ans, "names", ansvars)
      }
      else {
        if (is.null(irows)) {
          stop("Internal error: irows is NULL when making join result at R level. Should no longer happen now we use CsubsetDT earlier.")
        }
        ans = vector("list", length(ansvars))
        ii = rep.int(indices__, len__)
        for (s in seq_along(icols)) {
          target = icolsAns[s]
          source = icols[s]
          ans[[target]] = .Call(CsubsetVector, i[[source]], 
                                ii)
        }
        for (s in seq_along(xcols)) {
          target = xcolsAns[s]
          source = xcols[s]
          ans[[target]] = .Call(CsubsetVector, x[[source]], 
                                irows)
        }
        setattr(ans, "names", ansvars)
        if (haskey(x)) {
          keylen = which.first(!key(x) %chin% ansvars) - 
            1L
          if (is.na(keylen)) 
            keylen = length(key(x))
          len = length(rightcols)
          chk = if (len && !missing(on)) 
            !identical(head(key(x), len), names(on))
          else FALSE
          if ((keylen > len || chk) && !.Call(CisOrderedSubset, 
                                              irows, nrow(x))) {
            keylen = if (!chk) 
              len
            else 0L
          }
          ichk = is.data.table(i) && haskey(i) && identical(head(key(i), 
                                                                 length(leftcols)), names_i[leftcols])
          if (keylen && (ichk || is.logical(i) || (.Call(CisOrderedSubset, 
                                                         irows, nrow(x)) && ((roll == FALSE) || length(irows) == 
                                                                             1L)))) 
            setattr(ans, "sorted", head(key(x), keylen))
        }
        setattr(ans, "class", class(x))
        setattr(ans, "row.names", .set_row_names(nrow(ans)))
        setalloccol(ans)
      }
      if (!with || missing(j)) 
        return(ans)
      SDenv$.SDall = ans
      SDenv$.SD = if (length(non_sdvars)) 
        shallow(SDenv$.SDall, sdvars)
      else SDenv$.SDall
      SDenv$.N = nrow(ans)
    }
    else {
      SDenv$.SDall = SDenv$.SD = null.data.table()
      SDenv$.N = if (is.null(irows)) 
        nrow(x)
      else if (!length(irows) || identical(max(irows), 
                                           0L)) 
        0L
      else length(irows)
    }
    SDenv$.I = if (!missing(j) && use.I) 
      seq_len(SDenv$.N)
    else 0L
    SDenv$.GRP = 1L
    SDenv$.NGRP = 1L
    .Call(C_lock, SDenv$.SD)
    .Call(C_lock, SDenv$.SDall)
    lockBinding(".SD", SDenv)
    lockBinding(".SDall", SDenv)
    lockBinding(".N", SDenv)
    lockBinding(".I", SDenv)
    lockBinding(".GRP", SDenv)
    lockBinding(".NGRP", SDenv)
    for (ii in ansvars) assign(ii, SDenv$.SDall[[ii]], SDenv)
    if (is.name(jsub) && is.null(lhs) && !exists(jsubChar <- as.character(jsub), 
                                                 SDenv, inherits = FALSE)) {
      stop("j (the 2nd argument inside [...]) is a single symbol but column name '", 
           jsubChar, "' is not found. Perhaps you intended DT[, ..", 
           jsubChar, "]. This difference to data.frame is deliberate and explained in FAQ 1.1.")
    }
    jval = eval(jsub, SDenv, parent.frame())
    .Call(C_unlock, jval)
    if (is.null(irows)) {
      if (!is.list(jval)) {
        jcpy = address(jval) %in% vapply_1c(SDenv$.SD, 
                                            address)
        if (jcpy) 
          jval = copy(jval)
      }
      else if (address(jval) == address(SDenv$.SD)) {
        jval = copy(jval)
      }
      else if (length(jcpy <- which(vapply_1c(jval, address) %chin% 
                                    vapply_1c(SDenv, address)))) {
        for (jidx in jcpy) jval[[jidx]] = copy(jval[[jidx]])
      }
      else if (jsub %iscall% "get") {
        jval = copy(jval)
      }
    }
    if (!is.null(lhs)) {
      .Call(Cassign, x, irows, cols, newnames, jval)
      return(suppPrint(x))
    }
    if ((is.call(jsub) && jsub[[1L]] != "get" && is.list(jval) && 
         !is.object(jval)) || !missingby) {
      if (!is.null(irows) && (identical(irows, integer(0L)) && 
                              !bynull || length(irows) && !anyNA(irows) && 
                              all(irows == 0L))) 
        jval = lapply(jval, `[`, 0L)
      if (is.atomic(jval)) {
        setattr(jval, "names", NULL)
        jval = list(jval)
      }
      if (!is.null(jvnames) && !all(jvnames == "")) 
        setattr(jval, "names", jvnames)
      jval = as.data.table.list(jval, .named = NULL)
    }
    if (is.data.table(jval)) {
      setattr(jval, "class", class(x))
      if (haskey(x) && all(key(x) %chin% names(jval)) && 
          is.sorted(jval, by = key(x))) 
        setattr(jval, "sorted", key(x))
      if (any(sapply(jval, is.null))) 
        stop("Internal error: j has created a data.table result containing a NULL column")
    }
    return(jval)
  }
  o__ = integer()
  if (".N" %chin% ansvars) 
    stop("The column '.N' can't be grouped because it conflicts with the special .N variable. Try setnames(DT,'.N','N') first.")
  if (".I" %chin% ansvars) 
    stop("The column '.I' can't be grouped because it conflicts with the special .I variable. Try setnames(DT,'.I','I') first.")
  SDenv$.iSD = NULL
  SDenv$.xSD = NULL
  SDenv$print = function(x, ...) {
    base::print(x, ...)
    NULL
  }
  SDenv$.SDall = SDenv$.SD = null.data.table()
  SDenv$.N = vector("integer", 1L)
  SDenv$.GRP = vector("integer", 1L)
  SDenv$`-.POSIXt` = function(e1, e2) {
    if (inherits(e2, "POSIXt")) {
      if (verbose && !exists("done_units_report", parent.frame())) {
        cat("\nNote: forcing units=\"secs\" on implicit difftime by group; call difftime explicitly to choose custom units")
        assign("done_units_report", TRUE, parent.frame())
      }
      return(difftime(e1, e2, units = "secs"))
    }
    else return(base::`-.POSIXt`(e1, e2))
  }
  if (byjoin) {
    if (!is.data.table(i)) 
      stop("logical error. i is not data.table, but mult='all' and 'by'=.EACHI")
    byval = i
    bynames = if (missing(on)) 
      head(key(x), length(leftcols))
    else names(on)
    allbyvars = NULL
    bysameorder = haskey(i) || (is.sorted(f__) && ((roll == 
                                                      FALSE) || length(f__) == 1L))
    xjisvars = intersect(av, names_x[rightcols])
    jisvars = if (any(c("get", "mget") %chin% av)) 
      names_i
    else intersect(gsub("^i[.]", "", setdiff(av, xjisvars)), 
                   names_i)
    if (length(jisvars)) {
      tt = min(nrow(i), 1L)
      SDenv$.iSD = i[tt, jisvars, with = FALSE]
      for (ii in jisvars) {
        assign(ii, SDenv$.iSD[[ii]], SDenv)
        assign(paste0("i.", ii), SDenv$.iSD[[ii]], SDenv)
      }
    }
  }
  else {
    if (missingby) 
      stop("Internal error: by= is missing")
    if (length(byval) && length(byval[[1L]])) {
      if (!bysameorder && isFALSE(byindex)) {
        if (verbose) {
          last.started.at = proc.time()
          cat("Finding groups using forderv ... ")
          flush.console()
        }
        o__ = forderv(byval, sort = keyby, retGrp = TRUE)
        bysameorder = orderedirows && !length(o__)
        if (verbose) {
          cat(timetaken(last.started.at), "\n")
          last.started.at = proc.time()
          cat("Finding group sizes from the positions (can be avoided to save RAM) ... ")
          flush.console()
        }
        f__ = attr(o__, "starts", exact = TRUE)
        len__ = uniqlengths(f__, xnrow)
        if (verbose) {
          cat(timetaken(last.started.at), "\n")
          flush.console()
        }
        if (!bysameorder && !keyby) {
          if (verbose) {
            last.started.at = proc.time()
            cat("Getting back original order ... ")
            flush.console()
          }
          firstofeachgroup = o__[f__]
          if (length(origorder <- forderv(firstofeachgroup))) {
            f__ = f__[origorder]
            len__ = len__[origorder]
          }
          if (verbose) {
            cat(timetaken(last.started.at), "\n")
            flush.console()
          }
        }
        if (!orderedirows && !length(o__)) 
          o__ = seq_len(xnrow)
      }
      else {
        if (verbose) 
          last.started.at = proc.time()
        if (bysameorder) {
          if (verbose) {
            cat("Finding groups using uniqlist on key ... ")
            flush.console()
          }
          f__ = uniqlist(byval)
        }
        else {
          if (!is.character(byindex) || length(byindex) != 
              1L) 
            stop("Internal error: byindex not the index name")
          if (verbose) {
            cat("Finding groups using uniqlist on index '", 
                byindex, "' ... ", sep = "")
            flush.console()
          }
          o__ = getindex(x, byindex)
          if (is.null(o__)) 
            stop("Internal error: byindex not found")
          f__ = uniqlist(byval, order = o__)
        }
        if (verbose) {
          cat(timetaken(last.started.at), "\n")
          last.started.at = proc.time()
          cat("Finding group sizes from the positions (can be avoided to save RAM) ... ")
          flush.console()
        }
        len__ = uniqlengths(f__, xnrow)
        if (verbose) {
          cat(timetaken(last.started.at), "\n")
          flush.console()
        }
      }
    }
    else {
      f__ = NULL
      len__ = 0L
      bysameorder = TRUE
    }
  }
  if (length(xcols)) {
    SDenv$.SDall = .Call(CsubsetDT, x, if (length(len__)) seq_len(max(len__)) else 0L, 
                         xcols)
    if (xdotcols) 
      setattr(SDenv$.SDall, "names", ansvars[xcolsAns])
    SDenv$.SD = if (length(non_sdvars)) 
      shallow(SDenv$.SDall, sdvars)
    else SDenv$.SDall
  }
  if (nrow(SDenv$.SDall) == 0L) {
    setattr(SDenv$.SDall, "row.names", c(NA_integer_, 0L))
    setattr(SDenv$.SD, "row.names", c(NA_integer_, 0L))
  }
  .Call(C_lock, SDenv$.SD)
  .Call(C_lock, SDenv$.SDall)
  lockBinding(".SD", SDenv)
  lockBinding(".SDall", SDenv)
  lockBinding(".N", SDenv)
  lockBinding(".GRP", SDenv)
  lockBinding(".iSD", SDenv)
  SDenv$.NGRP = length(f__)
  lockBinding(".NGRP", SDenv)
  GForce = FALSE
  if (getOption("datatable.optimize") >= 1L && (is.call(jsub) || 
                                                (is.name(jsub) && jsub %chin% c(".SD", ".N")))) {
    oldjsub = jsub
    funi = 1L
    .massageSD = function(jsub) {
      txt = as.list(jsub)[-1L]
      if (length(names(txt)) > 1L) 
        .Call(Csetcharvec, names(txt), 2L, "")
      fun = txt[[2L]]
      if (fun %iscall% "function") {
        thisfun = paste0("..FUN", funi)
        assign(thisfun, eval(fun, SDenv, SDenv), SDenv)
        lockBinding(thisfun, SDenv)
        txt[[1L]] = as.name(thisfun)
      }
      else {
        if (is.character(fun)) 
          fun = as.name(fun)
        txt[[1L]] = fun
      }
      ans = vector("list", length(sdvars) + 1L)
      ans[[1L]] = as.name("list")
      for (ii in seq_along(sdvars)) {
        txt[[2L]] = as.name(sdvars[ii])
        ans[[ii + 1L]] = as.call(txt)
      }
      jsub = as.call(ans)
      jvnames = sdvars
      list(jsub, jvnames)
    }
    if (is.name(jsub)) {
      if (jsub == ".SD") {
        jsub = as.call(c(quote(list), lapply(sdvars, 
                                             as.name)))
        jvnames = sdvars
      }
    }
    else if (length(as.character(jsub[[1L]])) == 1L) {
      subopt = length(jsub) == 3L && (jsub[[1L]] == "[" || 
                                        (jsub[[1L]] == "[[" && is.name(jsub[[2L]]) && 
                                           eval(call("is.atomic", jsub[[2L]]), x, parent.frame()))) && 
        (is.numeric(jsub[[3L]]) || jsub[[3L]] == ".N")
      headopt = jsub[[1L]] == "head" || jsub[[1L]] == 
        "tail"
      firstopt = jsub[[1L]] == "first" || jsub[[1L]] == 
        "last"
      if ((length(jsub) >= 2L && jsub[[2L]] == ".SD") && 
          (subopt || headopt || firstopt)) {
        if (headopt && length(jsub) == 2L) 
          jsub[["n"]] = 6L
        jsub = as.call(c(quote(list), lapply(sdvars, 
                                             function(x) {
                                               jsub[[2L]] = as.name(x)
                                               jsub
                                             })))
        jvnames = sdvars
      }
      else if (jsub[[1L]] == "lapply" && jsub[[2L]] == 
               ".SD" && length(xcols)) {
        deparse_ans = .massageSD(jsub)
        jsub = deparse_ans[[1L]]
        jvnames = deparse_ans[[2L]]
      }
      else if (jsub[[1L]] == "c" && length(jsub) > 1L) {
        optfuns = c("max", "min", "mean", "length", 
                    "sum", "median", "sd", "var")
        is_valid = TRUE
        any_SD = FALSE
        jsubl = as.list.default(jsub)
        oldjvnames = jvnames
        jvnames = NULL
        for (i_ in 2L:length(jsubl)) {
          this = jsub[[i_]]
          if (is.name(this)) {
            if (this == ".SD") {
              any_SD = TRUE
              jsubl[[i_]] = lapply(sdvars, as.name)
              jvnames = c(jvnames, sdvars)
            }
            else if (this == ".N") {
              jvnames = c(jvnames, gsub("^[.]([N])$", 
                                        "\\1", this))
            }
            else {
              is_valid = FALSE
              break
            }
          }
          else if (is.call(this)) {
            if (this[[1L]] == "lapply" && this[[2L]] == 
                ".SD" && length(xcols)) {
              any_SD = TRUE
              deparse_ans = .massageSD(this)
              funi = funi + 1L
              jsubl[[i_]] = as.list(deparse_ans[[1L]][-1L])
              jvnames = c(jvnames, deparse_ans[[2L]])
            }
            else if (this[[1L]] == "list") {
              if (length(this) > 1L) {
                jl__ = as.list(jsubl[[i_]])[-1L]
                jn__ = if (is.null(names(jl__))) 
                  rep("", length(jl__))
                else names(jl__)
                idx = unlist(lapply(jl__, function(x) is.name(x) && 
                                      x == ".I"))
                if (any(idx)) 
                  jn__[idx & (jn__ == "")] = "I"
                jvnames = c(jvnames, jn__)
                jsubl[[i_]] = jl__
              }
            }
            else if (this %iscall% optfuns && length(this) > 
                     1L) {
              jvnames = c(jvnames, if (is.null(names(jsubl))) "" else names(jsubl)[i_])
            }
            else if (length(this) == 3L && (this[[1L]] == 
                                            "[" || this[[1L]] == "head") && this[[2L]] == 
                     ".SD" && (is.numeric(this[[3L]]) || this[[3L]] == 
                               ".N")) {
              any_SD = TRUE
              jsubl[[i_]] = lapply(sdvars, function(x) {
                this[[2L]] = as.name(x)
                this
              })
              jvnames = c(jvnames, sdvars)
            }
            else if (any(all.vars(this) == ".SD")) {
              is_valid = FALSE
              break
            }
            else {
              is_valid = FALSE
              break
            }
          }
          else {
            is_valid = FALSE
            break
          }
        }
        if (!is_valid || !any_SD) {
          jvnames = oldjvnames
          jsub = oldjsub
          jsubl = as.list.default(jsubl)
        }
        else {
          setattr(jsubl, "names", NULL)
          jsub = as.call(unlist(jsubl, use.names = FALSE))
          jsub[[1L]] = quote(list)
        }
      }
    }
    if (verbose) {
      if (!identical(oldjsub, jsub)) 
        cat("lapply optimization changed j from '", 
            deparse(oldjsub), "' to '", deparse(jsub, 
                                                width.cutoff = 200L, nlines = 1L), "'\n", 
            sep = "")
      else cat("lapply optimization is on, j unchanged as '", 
               deparse(jsub, width.cutoff = 200L, nlines = 1L), 
               "'\n", sep = "")
    }
    dotN = function(x) is.name(x) && x == ".N"
    if (getOption("datatable.optimize") >= 2L && !is.data.table(i) && 
        !byjoin && length(f__) && !length(lhs)) {
      if (!length(ansvars) && !use.I) {
        GForce = FALSE
        if ((is.name(jsub) && jsub == ".N") || (jsub %iscall% 
                                                "list" && length(jsub) == 2L && jsub[[2L]] == 
                                                ".N")) {
          GForce = TRUE
          if (verbose) 
            cat("GForce optimized j to '", deparse(jsub, 
                                                   width.cutoff = 200L, nlines = 1L), "'\n", 
                sep = "")
        }
      }
      else {
        .gforce_ok = function(q) {
          if (dotN(q)) 
            return(TRUE)
          if (!(is.call(q) && is.symbol(q[[1L]]) && 
                is.symbol(q[[2L]]) && (q1 <- q[[1L]]) %chin% 
                gfuns)) 
            return(FALSE)
          if (!(q2 <- q[[2L]]) %chin% names(SDenv$.SDall) && 
              q2 != ".I") 
            return(FALSE)
          if ((length(q) == 2L || identical("na", substring(names(q)[3L], 
                                                            1L, 2L))) && (!q1 %chin% c("head", "tail"))) 
            return(TRUE)
          length(q) == 3L && length(q3 <- q[[3L]]) == 
            1L && is.numeric(q3) && ((q1 %chin% c("head", 
                                                  "tail") && q3 == 1L) || ((q1 == "[" || (q1 == 
                                                                                            "[[" && eval(call("is.atomic", q[[2L]]), 
                                                                                                         envir = x))) && q3 > 0L))
        }
        if (jsub[[1L]] == "list") {
          GForce = TRUE
          for (ii in seq.int(from = 2L, length.out = length(jsub) - 
                             1L)) {
            if (!.gforce_ok(jsub[[ii]])) {
              GForce = FALSE
              break
            }
          }
        }
        else GForce = .gforce_ok(jsub)
        if (GForce) {
          if (jsub[[1L]] == "list") 
            for (ii in seq_along(jsub)[-1L]) {
              if (dotN(jsub[[ii]])) 
                next
              jsub[[ii]][[1L]] = as.name(paste0("g", 
                                                jsub[[ii]][[1L]]))
              if (length(jsub[[ii]]) == 3L) 
                jsub[[ii]][[3L]] = eval(jsub[[ii]][[3L]], 
                                        parent.frame())
            }
          else {
            jsub[[1L]] = as.name(paste0("g", jsub[[1L]]))
            if (length(jsub) == 3L) 
              jsub[[3L]] = eval(jsub[[3L]], parent.frame())
          }
          if (verbose) 
            cat("GForce optimized j to '", deparse(jsub, 
                                                   width.cutoff = 200L, nlines = 1L), "'\n", 
                sep = "")
        }
        else if (verbose) 
          cat("GForce is on, left j unchanged\n")
      }
    }
    if (!GForce && !is.name(jsub)) {
      nomeanopt = FALSE
      oldjsub = jsub
      if (jsub[[1L]] == "list") {
        todo = sapply(jsub, `%iscall%`, "mean")
        if (any(todo)) {
          w = which(todo)
          jsub[w] = lapply(jsub[w], .optmean)
        }
      }
      else if (jsub[[1L]] == "mean") {
        jsub = .optmean(jsub)
      }
      if (nomeanopt) {
        warning("Unable to optimize call to mean() and could be very slow. You must name 'na.rm' like that otherwise if you do mean(x,TRUE) the TRUE is taken to mean 'trim' which is the 2nd argument of mean. 'trim' is not yet optimized.", 
                immediate. = TRUE)
      }
      if (verbose) {
        if (!identical(oldjsub, jsub)) 
          cat("Old mean optimization changed j from '", 
              deparse(oldjsub), "' to '", deparse(jsub, 
                                                  width.cutoff = 200L, nlines = 1L), "'\n", 
              sep = "")
        else cat("Old mean optimization is on, left j unchanged.\n")
      }
      assign("Cfastmean", Cfastmean, SDenv)
    }
  }
  else if (verbose) {
    if (getOption("datatable.optimize") < 1L) 
      cat("All optimizations are turned off\n")
    else cat("Optimization is on but left j unchanged (single plain symbol): '", 
             deparse(jsub, width.cutoff = 200L, nlines = 1L), 
             "'\n", sep = "")
  }
  if (byjoin) {
    groups = i
    grpcols = leftcols
    jiscols = chmatch(jisvars, names_i)
    xjiscols = chmatch(xjisvars, names_x)
    SDenv$.xSD = x[min(nrow(i), 1L), xjisvars, with = FALSE]
    if (!missing(on)) 
      o__ = xo
    else o__ = integer(0L)
  }
  else {
    groups = byval
    grpcols = seq_along(byval)
    jiscols = NULL
    xjiscols = NULL
  }
  lockBinding(".xSD", SDenv)
  grporder = o__
  if (length(irows) && !isTRUE(irows) && !GForce) {
    if (length(o__) && length(irows) != length(o__)) 
      stop("Internal error: length(irows)!=length(o__)")
    o__ = if (length(o__)) 
      irows[o__]
    else irows
  }
  if (is.null(lhs)) 
    cols = NULL
  if (!length(f__)) {
    f__ = len__ = 0L
  }
  if (verbose) {
    last.started.at = proc.time()
    cat("Making each group and running j (GForce ", GForce, 
        ") ... ", sep = "")
    flush.console()
  }
  if (GForce) {
    thisEnv = new.env()
    for (ii in ansvars) assign(ii, x[[ii]], thisEnv)
    assign(".N", len__, thisEnv)
    if (use.I) 
      assign(".I", seq_len(nrow(x)), thisEnv)
    ans = gforce(thisEnv, jsub, o__, f__, len__, irows)
    gi = if (length(o__)) 
      o__[f__]
    else f__
    g = lapply(grpcols, function(i) groups[[i]][gi])
    ans = c(g, ans)
  }
  else {
    ans = .Call(Cdogroups, x, xcols, groups, grpcols, jiscols, 
                xjiscols, grporder, o__, f__, len__, jsub, SDenv, 
                cols, newnames, !missing(on), verbose)
  }
  MAX_DEPTH = 5L
  runlock = function(x, current_depth = 1L) {
    if (is.list(x) && current_depth <= MAX_DEPTH) {
      if (inherits(x, "data.table")) 
        .Call(C_unlock, x)
      else return(lapply(x, runlock, current_depth = current_depth + 
                           1L))
    }
    return(invisible())
  }
  runlock(ans)
  if (verbose) {
    cat(timetaken(last.started.at), "\n")
    flush.console()
  }
  if (!is.null(lhs)) {
    if (any(names_x[cols] %chin% key(x))) 
      setkey(x, NULL)
    attrs = attr(x, "index", exact = TRUE)
    skeys = names(attributes(attrs))
    if (!is.null(skeys)) {
      hits = unlist(lapply(paste0("__", names_x[cols]), 
                           function(x) grep(x, skeys, fixed = TRUE)))
      hits = skeys[unique(hits)]
      for (i in seq_along(hits)) setattr(attrs, hits[i], 
                                         NULL)
    }
    if (keyby) {
      cnames = as.character(bysubl)[-1L]
      cnames = gsub("^`|`$", "", cnames)
      if (all(cnames %chin% names_x)) {
        if (verbose) {
          last.started.at = proc.time()
          cat("setkey() after the := with keyby= ... ")
          flush.console()
        }
        setkeyv(x, cnames)
        if (verbose) {
          cat(timetaken(last.started.at), "\n")
          flush.console()
        }
      }
      else warning("The setkey() normally performed by keyby= has been skipped (as if by= was used) because := is being used together with keyby= but the keyby= contains some expressions. To avoid this warning, use by= instead, or provide existing column names to keyby=.\n")
    }
    return(suppPrint(x))
  }
  if (is.null(ans)) {
    ans = as.data.table.list(lapply(groups, "[", 0L))
    setnames(ans, seq_along(bynames), bynames)
    return(ans)
  }
  setattr(ans, "row.names", .set_row_names(length(ans[[1L]])))
  setattr(ans, "class", class(x))
  if (is.null(names(ans))) {
    if (is.null(jvnames)) 
      jvnames = character(length(ans) - length(bynames))
    if (length(bynames) + length(jvnames) != length(ans)) 
      stop("Internal error: jvnames is length ", length(jvnames), 
           " but ans is ", length(ans), " and bynames is ", 
           length(bynames))
    ww = which(jvnames == "")
    if (any(ww)) 
      jvnames[ww] = paste0("V", ww)
    setattr(ans, "names", c(bynames, jvnames))
  }
  else {
    setnames(ans, seq_along(bynames), bynames)
  }
  if (byjoin && keyby && !bysameorder) {
    if (verbose) {
      last.started.at = proc.time()
      cat("setkey() afterwards for keyby=.EACHI ... ")
      flush.console()
    }
    setkeyv(ans, names(ans)[seq_along(byval)])
    if (verbose) {
      cat(timetaken(last.started.at), "\n")
      flush.console()
    }
  }
  else if (keyby || (haskey(x) && bysameorder && (byjoin || 
                                                  (length(allbyvars) && identical(allbyvars, head(key(x), 
                                                                                                  length(allbyvars))))))) {
    setattr(ans, "sorted", names(ans)[seq_along(grpcols)])
  }
  setalloccol(ans)
}

worker <- function(zlevel) {
  fitmodel(zlevel,datax, datay, dataz)
}
