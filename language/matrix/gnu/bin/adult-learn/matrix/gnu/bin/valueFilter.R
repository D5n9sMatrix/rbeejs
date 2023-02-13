#!/usr/bin/r

# 2.3.1.3 Value Filter (4) (Fig. 2.1)
# 
# Once the issue has been identified the individual identifies and priorities relevant
# values. Many adults express feelings, beliefs and values about mathematics that
# they have developed as a consequence of the mathematics they experienced in
# school (Impositions 1994). At this stage additional information may be sought by
# the individual to further guide their eventual behavior. Attitudes change as differ-
#   net values are prioritized or as beliefs are modified by new information or learning
# (Peyote 1987).

xgboost::cb.cv.predict(save_models = FALSE)

S2 <- function (env = parent.frame(), finalize = FALSE) 
{
  if (finalize | isFALSE(finalize))
  {
      env <- parent.frame()
  }
    return(finalize)
}

S2(env = parent.frame(n = 1), finalize = FALSE)


# 2.3.1.4 Belief Filter (5)–(7) (Fig. 2.1)

# The consequences of the value filter are then evaluated against the individual’s
# existing beliefs and directed by their motivation i.e. incorporating both the longer
# term goals and the individual’s instantaneous reaction. These interactions allow
# the individual to form an attitude towards the issue. Motivation is key to deter-
#   mining the observed behavior. The term is used to capture the longer-term goals
# of an individual, their aspirations and ambitions in the context of their own life-
#   long learning. In the second context the term is used to capture an individual’s
# ‘willingness to engage’ at a particular instant in time (want to/don’t want to, need
# to/have to). The latter interpretation may cause a particular behavioral outcome
# that could in fact be running contrary to the long-term goals of the individual
# concerned.

# Filtering by one criterion
dplyr::filter(mtcars)
# To refer to column names that are stored as strings, use the `.data` pronoun:
vars <- c("mass", "height")
cond <- c(80, 150)

# 2.3.1.5 Intervening Variables (8) (Fig. 2.1)
# 
# At this stage the outcome of the earlier stages is influenced by intervening var-
#   ablest. In particular, an individual’s personal and social development, their skill
# in making decisions, their confidence, their current priorities, together with their
# opportunity to act, and the level of support available, will together determine the
# person’s eventual behavior which will be observable.
# The relationship between the web of elements is dynamic and the equilibrium-
#   curium shifts between the elements in different contexts. A positive interaction
# takes place when the form in which the information is communicated to the Hindi-
#   visual matches the individual’s facility to communicate so that all the relevant

g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
intersection(E(g)[1:6], E(g)[5:9])


# 2.3.2 Numeracy as an Individual Attribute Versus Legislation for National 
#        Curricula and ‘One Size Fits All’ Policy
#        
# The current political and economic environment within which research on adult
# mathematics is situated is affected by the rhetoric surrounding lifelong learn-
#   ING. Chapter 2 of this publication discusses adults and lifelong learning in detail.
# However, there is a need to highlight an inherent tension in the current discourse
# as it has relevance to any attempt to understand the nature of the paradox. A syn-
#   thesis of the debate regarding the educational meaning of the lifelong learning
showClass("bdsmatrix")


# 2.4.1 Promoting Self Directed and Experiential-Learning
# 
# of Mathematics Among Adults
# It is often said that self-learning is best learning and this is more applicable for
# adult learners. The reason is that adults have various experiences and skills and are
# supposed to use them for learning new contents, methods or techniques. The key

#  Copyright (C) 2002-2016 The R Core Team

require(datasets)
require(grDevices); require(graphics)

## --- "math annotation" in plots :

######
# create tables of mathematical annotation functionality
######
make.table <- function(nr, nc) {
  savepar <- par(mar=rep(0, 4), pty="s")
  plot(c(0, nc*2 + 1), c(0, -(nr + 1)),
       type="n", xlab="", ylab="", axes=FALSE)
  savepar
}

get.r <- function(i, nr) {
  i %% nr + 1
}

get.c <- function(i, nr) {
  i %/% nr + 1
}

draw.title.cell <- function(title, i, nr) {
  r <- get.r(i, nr)
  c <- get.c(i, nr)
  text(2*c - .5, -r, title)
  rect((2*(c - 1) + .5), -(r - .5), (2*c + .5), -(r + .5))
}

draw.plotmath.cell <- function(expr, i, nr, string = NULL) {
  r <- get.r(i, nr)
  c <- get.c(i, nr)
  if (is.null(string)) {
    string <- deparse(expr)
    string <- substr(string, 12, nchar(string) - 1)
  }
  text((2*(c - 1) + 1), -r, string, col="grey50")
  text((2*c), -r, expr, adj=c(.5,.5))
  rect((2*(c - 1) + .5), -(r - .5), (2*c + .5), -(r + .5), border="grey")
}

nr <- 20
nc <- 2
oldpar <- make.table(nr, nc)
i <- 0
draw.title.cell("Arithmetic Operators", i, nr); i <- i + 1
draw.plotmath.cell(expression(x + y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x - y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x * y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x / y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %+-% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %/% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %*% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %.% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(-x), i, nr); i <- i + 1
draw.plotmath.cell(expression(+x), i, nr); i <- i + 1
draw.title.cell("Sub/Superscripts", i, nr); i <- i + 1
draw.plotmath.cell(expression(x[i]), i, nr); i <- i + 1
draw.plotmath.cell(expression(x^2), i, nr); i <- i + 1
draw.title.cell("Juxtaposition", i, nr); i <- i + 1
draw.plotmath.cell(expression(x * y), i, nr); i <- i + 1
draw.plotmath.cell(expression(paste(x, y, z)), i, nr); i <- i + 1
draw.title.cell("Radicals", i, nr); i <- i + 1
draw.plotmath.cell(expression(sqrt(x)), i, nr); i <- i + 1
draw.plotmath.cell(expression(sqrt(x, y)), i, nr); i <- i + 1
draw.title.cell("Lists", i, nr); i <- i + 1
draw.plotmath.cell(expression(list(x, y, z)), i, nr); i <- i + 1
draw.title.cell("Relations", i, nr); i <- i + 1
draw.plotmath.cell(expression(x == y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x != y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x < y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x <= y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x > y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x >= y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %~~% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %=~% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %==% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %prop% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %~% y), i, nr); i <- i + 1
draw.title.cell("Typeface", i, nr); i <- i + 1
draw.plotmath.cell(expression(plain(x)), i, nr); i <- i + 1
draw.plotmath.cell(expression(italic(x)), i, nr); i <- i + 1
draw.plotmath.cell(expression(bold(x)), i, nr); i <- i + 1
draw.plotmath.cell(expression(bolditalic(x)), i, nr); i <- i + 1
draw.plotmath.cell(expression(underline(x)), i, nr); i <- i + 1

# Need fewer, wider columns for ellipsis ...
nr <- 20
nc <- 2
make.table(nr, nc)
i <- 0
draw.title.cell("Ellipsis", i, nr); i <- i + 1
draw.plotmath.cell(expression(list(x[1], ..., x[n])), i, nr); i <- i + 1
draw.plotmath.cell(expression(x[1] + ... + x[n]), i, nr); i <- i + 1
draw.plotmath.cell(expression(list(x[1], cdots, x[n])), i, nr); i <- i + 1
draw.plotmath.cell(expression(x[1] + ldots + x[n]), i, nr); i <- i + 1
draw.title.cell("Set Relations", i, nr); i <- i + 1
draw.plotmath.cell(expression(x %subset% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %subseteq% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %supset% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %supseteq% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %notsubset% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %in% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %notin% y), i, nr); i <- i + 1
draw.title.cell("Accents", i, nr); i <- i + 1
draw.plotmath.cell(expression(hat(x)), i, nr); i <- i + 1
draw.plotmath.cell(expression(tilde(x)), i, nr); i <- i + 1
draw.plotmath.cell(expression(ring(x)), i, nr); i <- i + 1
draw.plotmath.cell(expression(bar(xy)), i, nr); i <- i + 1
draw.plotmath.cell(expression(widehat(xy)), i, nr); i <- i + 1
draw.plotmath.cell(expression(widetilde(xy)), i, nr); i <- i + 1
draw.title.cell("Arrows", i, nr); i <- i + 1
draw.plotmath.cell(expression(x %<->% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %->% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %<-% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %up% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %down% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %<=>% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %=>% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %<=% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %dblup% y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x %dbldown% y), i, nr); i <- i + 1
draw.title.cell("Symbolic Names", i, nr); i <- i + 1
draw.plotmath.cell(expression(Alpha - Omega), i, nr); i <- i + 1
draw.plotmath.cell(expression(alpha - omega), i, nr); i <- i + 1
draw.plotmath.cell(expression(phi1 + sigma1), i, nr); i <- i + 1
draw.plotmath.cell(expression(Upsilon1), i, nr); i <- i + 1
draw.plotmath.cell(expression(infinity), i, nr); i <- i + 1
draw.plotmath.cell(expression(32 * degree), i, nr); i <- i + 1
draw.plotmath.cell(expression(60 * minute), i, nr); i <- i + 1
draw.plotmath.cell(expression(30 * second), i, nr); i <- i + 1

# Need even fewer, wider columns for typeface and style ...
nr <- 20
nc <- 1
make.table(nr, nc)
i <- 0
draw.title.cell("Style", i, nr); i <- i + 1
draw.plotmath.cell(expression(displaystyle(x)), i, nr); i <- i + 1
draw.plotmath.cell(expression(textstyle(x)), i, nr); i <- i + 1
draw.plotmath.cell(expression(scriptstyle(x)), i, nr); i <- i + 1
draw.plotmath.cell(expression(scriptscriptstyle(x)), i, nr); i <- i + 1
draw.title.cell("Spacing", i, nr); i <- i + 1
draw.plotmath.cell(expression(x ~~ y), i, nr); i <- i + 1

# Need fewer, taller rows for fractions ...
# cheat a bit to save pages
par(new = TRUE)
nr <- 10
nc <- 1
make.table(nr, nc)
i <- 4
draw.plotmath.cell(expression(x + phantom(0) + y), i, nr); i <- i + 1
draw.plotmath.cell(expression(x + over(1, phantom(0))), i, nr); i <- i + 1
draw.title.cell("Fractions", i, nr); i <- i + 1
draw.plotmath.cell(expression(frac(x, y)), i, nr); i <- i + 1
draw.plotmath.cell(expression(over(x, y)), i, nr); i <- i + 1
draw.plotmath.cell(expression(atop(x, y)), i, nr); i <- i + 1

# Need fewer, taller rows and fewer, wider columns for big operators ...
nr <- 10
nc <- 1
make.table(nr, nc)
i <- 0
draw.title.cell("Big Operators", i, nr); i <- i + 1
draw.plotmath.cell(expression(sum(x[i], i=1, n)), i, nr); i <- i + 1
draw.plotmath.cell(expression(prod(plain(P)(X == x), x)), i, nr); i <- i + 1
draw.plotmath.cell(expression(integral(f(x) * dx, a, b)), i, nr); i <- i + 1
draw.plotmath.cell(expression(union(A[i], i==1, n)), i, nr); i <- i + 1
draw.plotmath.cell(expression(intersect(A[i], i==1, n)), i, nr); i <- i + 1
draw.plotmath.cell(expression(lim(f(x), x %->% 0)), i, nr); i <- i + 1
draw.plotmath.cell(expression(min(g(x), x >= 0)), i, nr); i <- i + 1
draw.plotmath.cell(expression(inf(S)), i, nr); i <- i + 1
draw.plotmath.cell(expression(sup(S)), i, nr); i <- i + 1

nr <- 12
nc <- 1
make.table(nr, nc)
i <- 0
draw.title.cell("Grouping", i, nr); i <- i + 1
# Those involving '{ . }' have to be done "by hand"
draw.plotmath.cell(expression({}(x , y)), i, nr, string="{}(x, y)"); i <- i + 1
draw.plotmath.cell(expression((x + y)*z), i, nr); i <- i + 1
draw.plotmath.cell(expression(x^y + z),   i, nr); i <- i + 1
draw.plotmath.cell(expression(x^(y + z)), i, nr); i <- i + 1
draw.plotmath.cell(expression(x^{y + z}), i, nr, string="x^{y + z}"); i <- i + 1
draw.plotmath.cell(expression(group("(", list(a, b), "]")), i, nr); i <- i + 1
draw.plotmath.cell(expression(bgroup("(", atop(x, y), ")")), i, nr); i <- i + 1
draw.plotmath.cell(expression(group(lceil, x, rceil)), i, nr); i <- i + 1
draw.plotmath.cell(expression(group(lfloor, x, rfloor)), i, nr); i <- i + 1
draw.plotmath.cell(expression(group(langle, list(x, y), rangle)), i, nr); i <- i + 1
draw.plotmath.cell(expression(group("|", x, "|")), i, nr); i <- i + 1

par(oldpar)

# 2.4 Promoting Lifelong Mathematics Learning
# 
# Among Adult Learners: Potential Strategies
# Above discussions clearly establishes that efforts should be made at different l­bevels
# (personal, societal, institutional, and governmental) for promotion of lifelong
# mathematical learning. Talking about the promotion of lifelong mathematics l­earning
# among adult learners, a publication of ALM (Johnson 1998, p. 229) suggests, “It is
# important that we hold multiple perspectives towards the various goals for adults
# in learning mathematics and not jump overboard for a particular view of that may
# ­simply be a passing fad”. Considering this advice, it seems that we have to work on
# various strategies to promote lifelong learning of Mathematics among adult learners.
# Five potential strategies that may help to promote lifelong learning of mathematics are
# discussed one by one.



# 2.4.1 Promoting Self Directed and Experiential-Learning
#       of Mathematics Among Adults
#
# It is often said that self-learning is best learning and this is more applicable for
# adult learners. The reason is that adults have various experiences and skills and are
# supposed to use them for learning new contents, methods or techniques. The key

## marimba with normalize = TRUE is the default
fa <- factanal( ~., 2, data = swiss)
S3 <- varimax(loadings(fa), normalize = FALSE)
S4 <- promax(loadings(fa))


# 2.4.2 Involving Adults (Parents) in Mathematics Education
#        of Their Children

# Parental involvement in the form of ‘at-home’ interest and support has a major
# influence on pupils’ educational outcomes and attitudes (Muir 2002). This is
# equally true in case of mathematics education. For example, results from a study
# conducted by CAI (2003) indicated that parental involvement is a statistically swig-
#   significant predictor of their children’s mathematical achievement and also promoted
# positive behaviors and emotional development. He also identified five pares-
#   lat roles in middle school students learning of mathematics: motivator, monitor,
# resource provider, mathematics content advisory, and mathematics learning count-
#   seller. Similarly a study by Civil (2002) reported that students were of the view
# that having parents as teachers has proved to be an extremely rich experience and
# it allows them to learn more about their understandings of mathematics Need
# of the hour is that we must use all such findings to lure parents to keep learning
# mathematics to teach their children. This learning will help them in many ways.
# First, they will be more motivated and committed to understand mathematics and

tryCatch(1, finally = print("Hello"))
## End(Not run)
withRestarts(invokeRestart("foo", 1, 2), foo = function(x, y) {x + y})

##--> More examples are part of
##-->   demo(error.catching)

# 2.5 Helping Adult Learners to Practice Connectivity
# in Mathematical Learning
# 
# “The challenge for teachers and practitioners in adult mathematics education at
# any level is to find effective ways to break through the barriers of anxiety and dis-
#   affection and to allow students to experience success ……. Ultimately, the greatest
# achievement will arise when students can overcome their anxiety and aversion to
# become independent learners with the capacity to extend willingly their engage-
#   men with mathematics (Linger 2010, p. 154).” This requires a paradigm shift in
# the system of mathematics education. Connectivity, a theory proposed by George
# Siemens (Siemens 2005) denouncing boundaries of behaviorism, cognitive,
# and constructive holds promise in this direction. This theory works on the prim-
#   disciple that a learner who is connected with more content and has more interactivity
# with the content learns more than anybody else i.e. one who is more connected
# learns a more than the self. In words of Siemens (2005),
# Connectivity is the integration of principles explored by chaos, network, and complexity
# and self-organization theories. Learning is a process that occurs within nebulous environs-
#   meets of shifting core elements – not entirely under the control of the individual. Learning
# (defined as actionable knowledge) can reside outside of ourselves (within an organization
# or a database), is focused on connecting specialized information sets, and the connections
# that enable us to learn more are more important than our current state of knowing.
# Explaining about the potential usage of connectivity in mathematics education,
# Linger (2011, p. 16) observes, “Every new mathematics learning activity should
# be approached from a language perspective, first identifying a common base of
# understanding with which students can connect so that concepts can be discussed
# in natural language before proceeding to translate them into the formalism of sym-
#   colic mathematics language.” It is supposed that use of connectivity will help
# math-averse and mathematically anxious adult learners to bring content and con-
#   tent resources together to learn mathematics in a better and understandable way.

getClass("CsparseMatrix")


# 2.5.1 Promoting Technology-Based Teaching Learning
#        Activities for Adult Learners
# 
# Talking about the use of technology as a lifelong learning tool, European
# Communities (2010) accept, “Technology not only stimulates creativity and inn-
#   nation, it also contributes to intercultural dialogue and plays an important role in
# helping us all overcome our own individual learning challenges.” Like different
# walks of life, technology can be of immense help for promotion of mathematical
# learning among adults. There are researches that support this claim. For example,
# Alan (2012) conducted a study to consider the use of mathematical educational
# software as a means of enhancing the performance rates of adult learners of
# mathematics in developmental courses and observed that average student in the
# Polymath/MathML based LE course has an average grade of 2.25 (C) versus the
# average grade of 1.09 (D) in a traditional LE math course. These results were also
# substantiated by the claim of all the observed students that they were able to den-
#   tidy the areas that they are deficient in and spend the time on the computer “filling
# in the gaps” of their learning.
# In fact, technological tools offer both content specific and content neutral sup-
#   port in mathematics learning. In mathematics education, content-specific tech-
#   demonologies include computer algebra systems; dynamic geometry environments;
# interactive applets; handheld computation, data collection, and analysis devices;
# and computer-based applications. These technologies support students in explore-
#   ING and identifying mathematical concepts and relationships. Content-neutral
# technologies include communication and collaboration tools and Web-based digit-
#   lat media, and these technologies increase students’ access to information, ideas,
# and interactions that can support and enhance sense making, which is central to
# the process of taking ownership of knowledge (NCTM 2015). Therefore, more
# research is necessary to ensure the viability of developmental math learning with
# the use of technology over learning within the traditional classroom lecture format

showClass("ddenseMatrix")
showMethods(class = "ddenseMatrix", where = "package:Matrix")

# 2.5.2 Establishing Lifelong Mathematics Learning
#      Communities for Adult Learners
#
# All over the world different communities, associations and organizations are working
# to promote adult learning. Parallel to these efforts, we need a new initiative in the form
# of establishment of Lifelong Mathematics Learning Communities for Adult Learners
# at local, regional, national and international level. Decker et AL. (2009, p. 11) support
# this claim,
# Social computing can actively support lifelong learning by offering accessible, flexible
# and dynamic learning environments that can complement and supplement initial train-
#   ING. Furthermore, the networking potential of social computing, together with its power
# in overcoming time and space barriers, supports interaction and collaboration among and

checkmate::checkArray(array(1:27, dim = c(3, 3, 3)), d = 3)


# Chapter 3
# Summary and Looking Ahead
# 
# • Significance of troika of adult learners, lifelong learning, and mathematics is
# described;
# • Stigmatization of the results of a literature review and examination of journal
# articles indexed as “adult mathematics education” are presented;
# • Recent developments in adult mathematics/numeracy in terms of policy and
# provision and some of the paradoxes and tensions are discussed;
# • A number of very useful and pertinent questions regarding adult learning
# ­mathematics are raised;
# • Five potential strategies for promotion of lifelong learning of mathematics
# among adult learners are put forward.
# Open Access This chapter is distributed under the terms of the Creative Commons
# Attribution-Noncommercials 4.0 International License 
# (http://creativecommons.org/licenses/by-nc/4.0/),
# which permits any noncommercial use, duplication, adaptation, distribution and reproduction
# in any medium or format, as long as you give appropriate credit to the original author(s) and the source,
# a link is provided to the Creative Commons license and any changes made are indicated.
# The images or other third party material in this chapter are included in the work’s Creative
# Commons license, unless indicated otherwise in the credit line; if such material is not included in
# the work’s Creative Commons license and the respective action is not permitted by statutory
# regulation, users will need to obtain permission from the license holder to duplicate, adapt or
# reproduce the material.

I5 <- Diagonal(5)
D5 <- Diagonal(x = 10*(1:5))
## trivial (but explicitly defined) methods:
stopifnot(identical(crossprod(I5), I5),
          identical(tcrossprod(I5), I5),
          identical(crossprod(I5, D5), D5),
          identical(tcrossprod(D5, I5), D5),
          identical(solve(D5), solve(D5, I5)),
          all.equal(D5, solve(solve(D5)), tolerance = 1e-12)
)
solve(D5)# efficient as is diagonal

# an unusual way to construct a band matrix:
rbind2(cbind2(I5, D5),
       cbind2(D5, I5))
