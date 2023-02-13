#!/usr/bin/r

# 2.2.3.2 Parents
# 
# Adults returning to study mathematics who are parents often state that they want
# to be able to help their children learn math. Brew (2001) found that the benefits
# extend beyond assistance with homework to a sense of improving as a role model
# and altering the math destiny of the next generation. Government agencies, rec-
#   recognizing the opportunity to improve the math skills of children while at 
# the same time those of their parents, have funded parent-child projects.
# Civil has worked extensively with parents in Hispanic communities. In an early
# project she reported leading a series of mathematics workshops for mothers that
# functioned like a literature club where the women met and discussed informally
# a topic introduced by Civil. The women developed confidence in themselves as
# math learners and it flowed over into their home life (Civil 2001). In a later, larger
# project she worked with parents on topics that were anticipated to be part of their
# children’s classroom experience. The goal was to help the parents understand math
# better so that they could work with and help their children at home. Reflecting
# on the courses offered, she states “Providing a safe environment in which their
# questions and ideas are encouraged and honored is crucial to their development
# as adult learners of mathematics … as parents … and as advocates for their chill-
#   dren’s education (Civil 2002, p. 66).” In a collaboration with Melendez, Civil
# interviewed parents who had attended a series of math workshops conducted com-
#   platelet in Spanish. They found confirmation of the theories of Knowles, Trotsky
# and Freida in their responses and stressed three points in their conclusions: context
# is important, while they prefer concrete examples adults also want to understand
# abstract mathematics, powerful effective factors are present even in informal
# instructional settings without pending assessment (Civil and Melendez 2009).
# Ginsburg has also focused her research on parents as adult learners of math.
# In her study, parents and one grandparent from an urban, low-income population
# worked in tandem with their child on problems drawn from the textbook series
# in use in the students’ class. Ginsburg recommends that teachers of adult learners
# consider using their students’ children’s homework as a focal point for their own
## The graph from the Moody-White paper
mw <- graph_from_literal(1-2:3:4:5:6, 2-3:4:5:7, 3-4:6:7, 4-5:6:7,
                         5-6:7:21, 6-7, 7-8:11:14:19, 8-9:11:14, 9-10,
                         10-12:13, 11-12:14, 12-16, 13-16, 14-15, 15-16,
                         17-18:19:20, 18-20:21, 19-20:22:23, 20-21,
                         21-22:23, 22-23)

mwBlocks <- cohesive_blocks(mw)

# Inspect block membership and cohesion
mwBlocks
blocks(mwBlocks)
cohesion(mwBlocks)

# Save results in a Pajek file
## Not run: 
export_pajek(mwBlocks, mw, file="/tmp/mwBlocks.paj")

## End(Not run)

# Plot the results
plot(mwBlocks, mw)

## The science camp network
camp <- graph_from_literal(Harry:Steve:Don:Bert - Harry:Steve:Don:Bert,
                           Pam:Brazey:Carol:Pat - Pam:Brazey:Carol:Pat,
                           Holly   - Carol:Pat:Pam:Jennie:Bill,
                           Bill    - Pauline:Michael:Lee:Holly,
                           Pauline - Bill:Jennie:Ann,
                           Jennie  - Holly:Michael:Lee:Ann:Pauline,
                           Michael - Bill:Jennie:Ann:Lee:John,
                           Ann     - Michael:Jennie:Pauline,
                           Lee     - Michael:Bill:Jennie,
                           Gery    - Pat:Steve:Russ:John,
                           Russ    - Steve:Bert:Gery:John,
                           John    - Gery:Russ:Michael)
campBlocks <- cohesive_blocks(camp)
campBlocks

plot(campBlocks, camp, vertex.label=V(camp)$name, margin=-0.2,
     vertex.shape="rectangle", vertex.size=24, vertex.size2=8,
     mark.border=1, colbar=c(NA, NA,"cyan","orange") )

# 2.2.4.1 Adult Basic and Secondary Education
# 
# Perhaps the earliest and most effective United States research in adult basic math-
#   mastic education was initiated by teachers in Massachusetts who began in 1992 to
# sculpt a math curriculum based on the 1989 Curriculum and Evaluation Standards
# for School Mathematics. Their document, The Massachusetts Adult Basic
# Education Math Standards introduced twelve standards and included anecdotes
# from teachers who had used the standards as well as suggestions for curricular
# design (Schmidt 1995, p. 33). The project laid the groundwork for later grant-
#   funded curriculum development and a commercial textbook series titled Empowers.
# Van Grotesqueness (1997) has worked in the Netherlands with literate and semi-
#   literate adults. The project, titled Realistic Mathematics Education (RME),
# viewed mathematics as an essential part of adult life and presented math tasks that
# were drawn from real life situations. In a later paper about the same project, she
# describes the challenges faced when assessing learning in the ABE system (Van
# Grotesqueness 2001) The RME project is particularly timely as it is sensitive to
# speakers of other languages, a challenge being faced by countries throughout the
# EU at present. Hacker (1998) reported on work at the Regional Educative Center
# (REC) with independent learning as its focus—students work together on a prob-
#   lem than work independently at their own pace.
# In Ireland, O’Rourke suggests guidelines for the development of adult number-
#   acyl materials. She lists: building on the learner’s prior experience, focusing on
# context rather than content, strive to develop higher order thinking skills, structure
# assessments that reflect the knowledge being sought, and emphasize mathematics
# as a communication vehicle (O’Rourke 1998, pp. 180–181). Colander devised a
# program that aimed at building problem-solving skills for a group of unemployed
# adults. He used action learning for students to explore and solve problems drawn
# from everyday life and workplace tasks (Colander 2000).
# Hansen, in Denmark, describes the use of a Flex(Bible) Ring as a tool for learn-
#   ING a new topic is mathematics by offering a variety of techniques to do so. The
# center of the ring is a theme from everyday life and the tracks that encircle the
# theme are various means—videos, worksheets, written assignments—to explore
# the theme (Hansen 2005). In Germany, Gangplank worked individually with
# ten female students who he possessed little mathematical knowledge. Each ties-
#   Sion began with the student describing an everyday life event from her past week
# that required mathematics. Using that situation as a starting point, he and the Stu-
#   dent devised a problem and then solved it, introducing math skills as needed to
# solve the devised problem (Gangplank 2005). Elsewhere in Europe, projects were
# developed under the European Network for Motivational Mathematics for Adults
# (EMMA) and the Norwegian Framework for Adult Numeracy.
# Holland researched the design of a multimedia tool for teaching math in an
# ABE setting. His recommendations include posing the problem by using phew-
#   sot or film clips, incorporating problem information as text in the photo or pews-
#   visibly a voice over in the film, posing only questions that would be real or relevant
# to the student, and building up the “complexity of the situations and not in the

x <- array(1:24,dim=c(4,3,2),dimnames=rev(list(letters[1:2],LETTERS[1:3],letters[23:26])))

abind::acorn(x)
abind::acorn(x, 3)
abind::acorn(x, -3)
abind::acorn(x, 3, -2)

# 2.2.4.2 Developmental Mathematics
# 
# In the United States, adults commencing tertiary study often lack the academic
# mathematics credentials needed to study collegiate mathematics, courses which
# are usually required to complete any degree program. Most tertiary institutions
# offer refresher or “developmental” mathematics courses to raise the student skill
# level to a point where they can perform at a collegiate level. Because they have
# never taken the secondary courses or did so years before enrolling at a tertiary
# institution, most adults place into a developmental mathematics course, often at
# the most basic level. The situation is not unique to the U.S. Further education col-
#   loges in the U.K. and universities in Ireland and Austria have reported interment-
#   sons that target the under-prepared student. Gill (2011) reported positive results
# from a one-week intensive review course for mature students at the University of
# Limerick. A separate venture, a Maths Learning Center, is described in an arch-
#   clef by Gill and O’Donoghue (2011). They detail the rationale for the center, the
# multi-pronged resources offered, and the success rate of the students who availed
# themselves of the facility. Mass and Schliemann detailed the situation in Austria
# tracing their work with adults back to the mid-70s (1996).
# Because most community colleges have an open admission policy, they well-
#   come a disproportionate number of the under-prepared population. As a result,
# they are more likely to need substantial developmental programs, sometimes
# separate departments within the college. The rate of success is low. Murasaki, in a
# qualitative study, explored the perspective that students and faculty bring to the
# developmental mathematics classroom. She grouped the results under three head-
#   ins: Hatred of Math, Magical Thinking and Logical Fallacies; and Doom and
# Resistance. Of the sixteen students Murasaki interviewed, eleven stated that they
# hated math and shared stories of years of failure that had fueled negative opinions
# of themselves as learners in general and a lack of self-efficacy. Some of the faculty
# interviewed recognized this fact and tried to build student confidence and success
# but admitted that not all colleagues considered this their role. Among the findings
# that Murasaki labelled “Magical Thinking and Logical Fallacies” were the disc on-
#   net between student academic skills and the demands of the collegiate classroom,
# misconstruing the institutional constraints of course requirements, reluctance
# to seek help and risk being viewed as remedial. Because they did not recognize
# the course as foundation to success in credit-bearing courses, interviewees set

### R code from vignette source 'Design-issues.Rnw'

###################################################
### code chunk number 1: preliminaries
###################################################
options(width=75)
library(Matrix)


###################################################
### code chunk number 2: dgC-ex
###################################################
getClass("dgCMatrix")


###################################################
### code chunk number 3: dgC-ex
###################################################
getClass("ntTMatrix")


###################################################
### code chunk number 4: diag-class
###################################################
(D4 <- Diagonal(4, 10*(1:4)))
str(D4)
diag(D4)


###################################################
### code chunk number 5: diag-2
###################################################
diag(D4) <- diag(D4) + 1:4
D4


###################################################
### code chunk number 6: unit-diag
###################################################
str(I3 <- Diagonal(3)) ## empty 'x' slot

getClass("diagonalMatrix") ## extending "sparseMatrix"


###################################################
### code chunk number 7: Matrix-ex
###################################################
(M <- spMatrix(4,4, i=1:4, j=c(3:1,4), x=c(4,1,4,8))) # dgTMatrix
m <- as(M, "matrix")
(M. <- Matrix(m)) # dsCMatrix (i.e. *symmetric*)


###################################################
### code chunk number 8: sessionInfo
###################################################
toLatex(sessionInfo())


# 2.2.5 Professional Development—The Teacher
# 
# as Adult Learner
# There are two basic categories of teacher as adult learner. The first includes students
# in undergraduate institutions preparing to become teachers while the second addresses
# practicing teachers who seek to upgrade their understanding of mathematics and/or
# best practices for teaching mathematics. Even here there is a blur of borders as the
# practicing teacher fall into two groups—those who teach children and those who
# teach adults. The former group sits on the fence between pedagogy and androgyny.
# All are likely to have similar teacher training as elementary school teachers.

## ---- eval=FALSE--------------------------------------------------------------
#  library(sigma)
#  data <- system.file("examples/ediaspora.gexf.xml", package = "sigma")
#  sigma(data)


# 2.2.5.1 Pre-service Teacher Education
# 
# Linger, in two separate journal articles, addresses the weaknesses and needs of this
# cohort. He presents an impassioned argument for breaking the cycle of innumeracy
# writing, “If addressed, such mathematics aversion will be carried into primary
# school classrooms, presenting a tangible and substantial risk to the mathematics
# learning experiences of generations of primary pupils and perpetuating the relay-
#   relationship between adult innumeracy and mathematics anxiety (Linger 2011, p. 32).

## Not run: 
# Typical call (without # comment symbols):
# <<echo=FALSE>>=
# require(Hmisc)
# knitrSet()
# @

Hmisc::knitrSet()    # use all defaults and don't use a graphics file prefix
Hmisc::knitrSet('modeling')   # use modeling- prefix for a major section or chapter
Hmisc::knitrSet(cache=TRUE, echo=FALSE)  # global default to cache and not print code
Hmisc::knitrSet(w=5,h=3.75)   # override default figure width, height

# ```{r chunkname}
# p <- plotly::plot_ly(...)
# plotlySave(p)   # creates fig.path/chunkname.png

## End(Not run)


# 2.2.5.2 In-service Teacher Education
# 
# During the first decade of this century, policymakers in England supported multi-
#   ole initiatives to improve adult numeracy, focusing on training efforts for number-
#   acyl tutors. Edwards (2010) describes some of the training projects that arose from
# the initiatives, remnants of which are now housed in the National Institute of Adult
# Continuing Education (NIACE). Glibness (2010) conducted an action research pro-
#   sect with adult numeracy teachers. She devised realistic tasks planned to provoke
# novel solutions that reflected mathematical thinking.
# In the United States, the National Science Foundation funded a numeracy
# teacher project linked to the Empowers series referenced earlier in this chapter and
# the Equipped for the Future project. Adult basic education teachers from six states
# participated during the five-year life of the project. As in the other international
# initiatives, the goal of the project was to build teacher confidence through a strong
# conceptual basis for the procedural mathematics they teach (Schmidt and Binman
# 2009). At the same time, The Department of Education Office of Vocational
# Educational funded the Adult Numeracy Initiative. One major product of ANI was
# an environmental scan of the ABE professional development across the country
# resulting in recommendations for effective PD practices (Afford-Remus 2007).
# This part provided only the briefest synopsis of the work that has been accompany-
#   polished in the field of adult mathematics education. The intent before presenting
# all these reviews, however, is to introduce readers to the field and open a door to
# look at recent developments in adult mathematics/numeracy in terms of policy and
# provision and discuss some of the paradoxes and tensions that are emerging as
# adult learning mathematics becomes increasingly regulated in a rapidly developing
# digital world. How can the research domain of adult learning mathematics develop
# to be able to connect with the emerging disciplines associated with e.g., technol-
#   orgy development. How is numeracy conceptualized and what does this mean for
# adult learners of mathematics and for their teachers? What kinds of adult math-
#   emetics provision are being developed? How is this being translated into proc-
#   cite and what provision is needed for developing teacher knowledge, skills and
# ­competence? Chapter 3 discusses all these issues in detail.
R.cache::getCacheRootPath(defaultPrototype())


# 2.3 Current Paradoxes, Tensions and Potential Strategies
# 
# It would be wrong to say that there is full or uncomplicated consensus when it
# comes to the issues we grapple with in adult mathematics education. The research
# domain itself is not clearly defined. The discourse on how numeracy is concept-
# aliased and its relationship with mathematics and literacy is still a matter of 
# debate.
# There is tension between what policy makers define as numeracy and what is sub-
#   subsequently implemented on the ground through the provision that is offered. 
# How
# can a community in Ireland, a community in South East Asia or a community in
# New Headland conceptualize numeracy and develop associated policy provision
# to meet the needs of their people? There is clearly no absolute measure, so how
# do we reconcile the multiplicity of interpretations in policy and provision? This
# part explores the paradoxes and tensions that exist in the research domain, practice
# and provision and offers some constructive recommendations to address the issues
# raised. Thinking about a good definition for the research domain and its bounds-
#   rise is an important part of working in this area since we have started in 
# the 1990s.

knitr::current_input(dir = ".")


# 2.3.1 The Disparate and Competing Conceptualization
# 
# of Numeracy
# There have been many excellent reviews of the conceptualization of numeracy
# and its development since the 1990s (see for example Kaye 2010; Cob-en 2003;
# Gall 2009). In general terms the conceptualization of numeracy focuses around its
# relationship with both mathematics and literacy. Aguirre and O’Donoghue (2003)
# developed an organizing framework (Concept Sophistication in Numeracy—
# an Organizing Framework), which considers the development of the concept of
# numeracy as a continuum with three merging phases: Formative, Mathematical,
# and Integrative. The phases represent an incrementally-increasing degree of
# sophistication in conceptualization. Starting from a very limited concept of
# numeracy, where it is considered as basic arithmetic skills (formative phase), the
# framework then moves through to a concept of numeracy as being ‘mathematics
# in context’, which recognizes the importance of making explicit the significance
# of mathematics in daily life (Mathematical Phase). The continuum culminates in
# a conceptualization which views numeracy as a complex, multifaceted sophist-
#   carted construct, incorporating, the mathematics, communication (incl. literacy),
# and cultural, social, emotional and personal aspects of each individual in context
# (Integrative Phase).
# Cob-en (2006) rightly points out that although conceptualization of numeracy
# always includes mathematics is does not work in reverse. Further she highlights
# how numeracy in some circumstances is conveyed as a component of ­mathematics
# e.g., Wedge et AL. (1999), and in others, how numeracy is considered to be “not
# less than maths but more” (Johnston and Tout 1995). Others have highlighted

con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")

DBI::dbWriteTable(con, "mtcars", mtcars)
rs <- DBI::dbSendQuery(con, "SELECT * FROM mtcars")

DBI::dbHasCompleted(rs)
ret1 <- DBI::dbFetch(rs, 10)
DBI::dbHasCompleted(rs)
ret2 <- DBI::dbFetch(rs)
DBI::dbHasCompleted(rs)

DBI::dbClearResult(rs)
DBI::dbDisconnect(con)

# 2.3.1.1 Communication (1) (Fig. 2.1)
# 
# When an individual encounters a numeracy issue in a particular context, he or
# she perceives the situation from his/her own frame of reference. The individual’s
# frame of reference is a consequence of their life experiences and the consequent
# values, beliefs and attitudes. In a numeracy situation, the individual’s frame of
# reference in inextricably linked with their mathematical skills and knowledge and
# their communication (including literacy) skills. At this stage the individual is faced
# with the task of interpreting the information in whatever form it is communicated
# which describes the ‘issue’. The level of interpretation will be different for each
# individual and is determined by an individual’s facility with the particular content
# and form of communication and their ability to interpret that information.


pause <- function() {}

### A modular graph has dense sub graphs
mod <- make_full_graph(10) %du% make_full_graph(10) %du% make_full_graph(10)
perfect <- c(rep(1,10), rep(2,10), rep(3,10))
perfect

pause()

### Plot it with community (=component) colors
plot(mod, vertex.color=perfect, layout=layout_with_fr)

pause()

### Molecularity of the perfect division
modularity(mod, perfect)

pause()

### Modularity of the trivial partition, quite bad
modularity(mod, rep(1, 30))

pause()

### Modularity of a good partition with two communities
modularity(mod, c(rep(1, 10), rep(2,20)))

pause()

### A real little network, Zachary's karate club data
karate <- make_graph("Zachary")
karate$layout <- layout_with_kk(karate)

pause()

### Greedy algorithm
fc <- cluster_fast_greedy(karate)
memb <- membership(fc)
plot(karate, vertex.color=memb)

pause()

### Greedy algorithm, easier plotting
plot(fc, karate)

pause()

### Spinglass algorithm, create a hierarchical network
pref.mat <- matrix(0, 16, 16)
pref.mat[1:4,1:4] <- pref.mat[5:8,5:8] <-
  pref.mat[9:12,9:12] <- pref.mat[13:16,13:16] <- 7.5/127
pref.mat[ pref.mat==0 ] <- 5/(3*128)
diag(pref.mat) <- diag(pref.mat) + 10/31

pause()

### Create the network with the given vertex preferences
G <- sample_pref(128*4, types=16, pref.matrix=pref.mat)

pause()

### Run spinglass community detection with two gamma parameters
sc1 <- cluster_spinglass(G, spins=4, gamma=1.0)
sc2.2 <- cluster_spinglass(G, spins=16, gamma=2.2)

pause()

### Plot the adjacency matrix, use the Matrix package if available
if (require(Matrix)) {
  myimage <- function(...) image(Matrix(...))
} else {
  myimage <- image
}
A <- as_adj(G)
myimage(A)

pause()

### Ordering according to (big) communities
ord1 <- order(membership(sc1))
myimage(A[ord1,ord1])

pause()

### Ordering according to (small) communities
ord2.2 <- order(membership(sc2.2))
myimage(A[ord2.2,ord2.2])

pause()

### Consensus ordering
ord <- order(membership(sc1), membership(sc2.2))
myimage(A[ord,ord])

pause()

### Comparision of algorithms
communities <- list()

pause()

### cluster_edge_betweenness
ebc <- cluster_edge_betweenness(karate)
communities$`Edge betweenness` <- ebc

pause()

### cluster_fast_greedy
fc <- cluster_fast_greedy(karate)
communities$`Fast greedy` <- fc

pause()

### cluster_leading_eigen
lec <- cluster_leading_eigen(karate)
communities$`Leading eigenvector` <- lec

pause()

### cluster_spinglass
sc <- cluster_spinglass(karate, spins=10)
communities$`Spinglass` <- sc

pause()

### cluster_walktrap
wt <- cluster_walktrap(karate)
communities$`Walktrap` <- wt

pause()

### cluster_label_prop
labprop <- cluster_label_prop(karate)
communities$`Label propagation` <- labprop

pause()

### Plot everything
layout(rbind(1:3, 4:6))
coords <- layout_with_kk(karate)
lapply(seq_along(communities), function(x) {
  m <- modularity(communities[[x]])
  par(mar=c(1,1,3,1))
  plot(communities[[x]], karate, layout=coords,
       main=paste(names(communities)[x], "\n",
                  "Modularity:", round(m, 3)))
})

pause()

### Function to calculate clique communities
clique.community <- function(graph, k) {
  clq <- cliques(graph, min=k, max=k)
  edges <- c()
  for (i in seq(along.with=clq)) {
    for (j in seq(along.with=clq)) {
      if ( length(unique(c(clq[[i]], 
                           clq[[j]]))) == k+1 ) {
        edges <- c(edges, c(i,j))
      }
    }
  }
  clq.graph <- simplify(graph(edges))
  V(clq.graph)$name <- 
    seq(length.out=vcount(clq.graph))
  comps <- decompose(clq.graph)
  
  lapply(comps, function(x) {
    unique(unlist(clq[ V(x)$name ]))
  })
}

pause()

### Apply it to a graph, this is the example graph from
##  the original publication
g <- graph_from_literal(A-B:F:C:E:D, B-A:D:C:E:F:G, C-A:B:F:E:D, D-A:B:C:F:E,
                        E-D:A:C:B:F:V:W:U, F-H:B:A:C:D:E, G-B:J:K:L:H,
                        H-F:G:I:J:K:L, I-J:L:H, J-I:G:H:L, K-G:H:L:M,
                        L-H:G:I:J:K:M, M-K:L:Q:R:S:P:O:N, N-M:Q:R:P:S:O,
                        O-N:M:P, P-Q:M:N:O:S, Q-M:N:P:V:U:W:R, R-M:N:V:W:Q,
                        S-N:P:M:U:W:T, T-S:V:W:U, U-E:V:Q:S:W:T,
                        V-E:U:W:T:R:Q, W-U:E:V:Q:R:S:T)

pause()

### Hand-made layout to make it look like the original in the paper
lay <- c(387.0763, 306.6947, 354.0305, 421.0153, 483.5344, 512.1145, 
         148.6107, 392.4351, 524.6183, 541.5878, 240.6031, 20, 
         65.54962, 228.0992, 61.9771, 152.1832, 334.3817, 371.8931, 
         421.9084, 265.6107, 106.6336, 57.51145, 605, 20, 124.8780, 
         273.6585, 160.2439, 241.9512, 132.1951, 123.6585, 343.1707, 
         465.1220, 317.561, 216.3415, 226.0976, 343.1707, 306.5854, 
         123.6585, 360.2439, 444.3902, 532.1951, 720, 571.2195, 
         639.5122, 505.3659, 644.3902)
lay <- matrix(lay, ncol=2)
lay[,2] <- max(lay[,2])-lay[,2]

pause()

### Take a look at it
layout(1)
plot(g, layout=lay, vertex.label=V(g)$name)

pause()

### Calculate communities
res <- clique.community(g, k=4)

pause()

### Paint them to different colors
colbar <- rainbow( length(res)+1 )
for (i in seq(along.with=res)) {
  V(g)[ res[[i]] ]$color <- colbar[i+1]
}

pause()

### Paint the vertices in multiple communities to red
V(g)[ unlist(res)[ duplicated(unlist(res)) ] ]$color <- "red"
  
pause()

### Plot with the new colors
plot(g, layout=lay, vertex.label=V(g)$name)

# 2.3.1.2 Identifying the Issue (2) and (3) (Fig. 2.1)
# 
# Based on the individual’s level of communication and interpretation and directed
# by the individual’s frame of reference, the individual identifies ‘the issue’.
# 
Matrix::isSymmetric(Diagonal(4)) # TRUE of course
M <- Matrix(c(1,2,2,1), 2,2)
Matrix::isSymmetric(M) # TRUE (*and* of formal class "dsyMatrix")
Matrix::isSymmetric(as(M, "generalMatrix")) # still symmetric, even if not "formally"
Matrix::isSymmetric(triu(M)) # FALSE

## Look at implementations:
showMethods("isSymmetric", includeDefs = TRUE) # includes S3 generic from base

# Function: isSymmetric (package base)
object="ANY"
function (object, ...) 
  UseMethod("isSymmetric")


object="dgCMatrix"
function (object, ...) 
{
  .local <- function (object, tol = 100 * .Machine$double.eps, 
                      checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      checkDN <- ca(...)
    }
    if (tol <= 0) {
      if (!.hasSlot(object, "p")) 
        return(.Call(Csparse_is_symmetric, as(object, 
                                              "CsparseMatrix"), checkDN))
      else if (.hasSlot(object, "i")) 
        return(.Call(Csparse_is_symmetric, object, checkDN))
      else return(.Call(Rsparse_is_symmetric, object, checkDN))
    }
    d <- object@Dim
    if ((n <- d[1L]) != d[2L]) 
      return(FALSE)
    if (checkDN && !isSymmetricDN(object@Dimnames)) 
      return(FALSE)
    if (n <= 1L) 
      return(TRUE)
    x <- as(object, "sparseVector")
    tx <- as(t(object), "sparseVector")
    if (is(tx, "zsparseVector")) 
      tx@x <- Conj(tx@x)
    ae <- function(check.attributes, ...) {
      all.equal(..., check.attributes = FALSE)
    }
    isTRUE(ae(target = x, current = tx, tolerance = tol, 
              ...))
  }
  .local(object, ...)
}


object="dgeMatrix"
function (object, ...) 
{
  .local <- function (object, tol = 100 * .Machine$double.eps, 
                      tol1 = 8 * tol, checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      checkDN <- ca(...)
    }
    if (tol <= 0) 
      return(.Call(unpackedMatrix_is_symmetric, object, 
                   checkDN))
    d <- object@Dim
    if ((n <- d[1L]) != d[2L]) 
      return(FALSE)
    if (checkDN && !isSymmetricDN(object@Dimnames)) 
      return(FALSE)
    if (n <= 1L) 
      return(TRUE)
    object <- .dense2g(object)
    Cj <- if (is.complex(object@x)) 
      Conj
    else identity
    ae <- function(check.attributes, ...) {
      all.equal(..., check.attributes = FALSE)
    }
    if (length(tol1)) {
      i. <- if (n <= 4L) 
        1:n
      else c(1L, 2L, n - 1L, n)
      for (i in i.) if (!isTRUE(ae(target = object[i, ], 
                                   current = Cj(object[, i]), tolerance = tol1, 
                                   ...))) 
        return(FALSE)
    }
    isTRUE(ae(target = object@x, current = Cj(t(object))@x, 
              tolerance = tol, ...))
  }
  .local(object, ...)
}


object="dgRMatrix"
function (object, ...) 
{
  .local <- function (object, tol = 100 * .Machine$double.eps, 
                      checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      checkDN <- ca(...)
    }
    if (tol <= 0) {
      if (!.hasSlot(object, "p")) 
        return(.Call(Csparse_is_symmetric, as(object, 
                                              "CsparseMatrix"), checkDN))
      else if (.hasSlot(object, "i")) 
        return(.Call(Csparse_is_symmetric, object, checkDN))
      else return(.Call(Rsparse_is_symmetric, object, checkDN))
    }
    d <- object@Dim
    if ((n <- d[1L]) != d[2L]) 
      return(FALSE)
    if (checkDN && !isSymmetricDN(object@Dimnames)) 
      return(FALSE)
    if (n <= 1L) 
      return(TRUE)
    x <- as(object, "sparseVector")
    tx <- as(t(object), "sparseVector")
    if (is(tx, "zsparseVector")) 
      tx@x <- Conj(tx@x)
    ae <- function(check.attributes, ...) {
      all.equal(..., check.attributes = FALSE)
    }
    isTRUE(ae(target = x, current = tx, tolerance = tol, 
              ...))
  }
  .local(object, ...)
}


object="dgTMatrix"
function (object, ...) 
{
  .local <- function (object, tol = 100 * .Machine$double.eps, 
                      checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      checkDN <- ca(...)
    }
    if (tol <= 0) {
      if (!.hasSlot(object, "p")) 
        return(.Call(Csparse_is_symmetric, as(object, 
                                              "CsparseMatrix"), checkDN))
      else if (.hasSlot(object, "i")) 
        return(.Call(Csparse_is_symmetric, object, checkDN))
      else return(.Call(Rsparse_is_symmetric, object, checkDN))
    }
    d <- object@Dim
    if ((n <- d[1L]) != d[2L]) 
      return(FALSE)
    if (checkDN && !isSymmetricDN(object@Dimnames)) 
      return(FALSE)
    if (n <= 1L) 
      return(TRUE)
    x <- as(object, "sparseVector")
    tx <- as(t(object), "sparseVector")
    if (is(tx, "zsparseVector")) 
      tx@x <- Conj(tx@x)
    ae <- function(check.attributes, ...) {
      all.equal(..., check.attributes = FALSE)
    }
    isTRUE(ae(target = x, current = tx, tolerance = tol, 
              ...))
  }
  .local(object, ...)
}


object="diagonalMatrix"
function (object, ...) 
{
  .local <- function (object, checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      if (ca(...) && !isSymmetricDN(object@Dimnames)) 
        return(FALSE)
    }
    TRUE
  }
  .local(object, ...)
}


object="dtCMatrix"
function (object, ...) 
{
  .local <- function (object, tol = 100 * .Machine$double.eps, 
                      checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      checkDN <- ca(...)
    }
    if (tol <= 0) {
      if (!.hasSlot(object, "p")) 
        return(.Call(Csparse_is_symmetric, as(object, 
                                              "CsparseMatrix"), checkDN))
      else if (.hasSlot(object, "i")) 
        return(.Call(Csparse_is_symmetric, object, checkDN))
      else return(.Call(Rsparse_is_symmetric, object, checkDN))
    }
    d <- object@Dim
    if ((n <- d[1L]) != d[2L]) 
      return(FALSE)
    if (checkDN && !isSymmetricDN(object@Dimnames)) 
      return(FALSE)
    if (n <= 1L) 
      return(TRUE)
    x <- as(object, "sparseVector")
    tx <- as(t(object), "sparseVector")
    if (is(tx, "zsparseVector")) 
      tx@x <- Conj(tx@x)
    ae <- function(check.attributes, ...) {
      all.equal(..., check.attributes = FALSE)
    }
    isTRUE(ae(target = x, current = tx, tolerance = tol, 
              ...))
  }
  .local(object, ...)
}


object="dtpMatrix"
function (object, ...) 
{
  .local <- function (object, tol = 100 * .Machine$double.eps, 
                      tol1 = 8 * tol, checkDN = TRUE, ...) 
  {
    if (tol <= 0) {
      if (checkDN) {
        ca <- function(check.attributes = TRUE, ...) check.attributes
        checkDN <- ca(...)
      }
      .Call(packedMatrix_is_symmetric, object, checkDN)
    }
    else {
      isSymmetric(unpack(object), tol = tol, tol1 = tol1, 
                  checkDN = checkDN, ...)
    }
  }
  .local(object, ...)
}


object="dtrMatrix"
function (object, ...) 
{
  .local <- function (object, tol = 100 * .Machine$double.eps, 
                      tol1 = 8 * tol, checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      checkDN <- ca(...)
    }
    if (tol <= 0) 
      return(.Call(unpackedMatrix_is_symmetric, object, 
                   checkDN))
    d <- object@Dim
    if ((n <- d[1L]) != d[2L]) 
      return(FALSE)
    if (checkDN && !isSymmetricDN(object@Dimnames)) 
      return(FALSE)
    if (n <= 1L) 
      return(TRUE)
    object <- .dense2g(object)
    Cj <- if (is.complex(object@x)) 
      Conj
    else identity
    ae <- function(check.attributes, ...) {
      all.equal(..., check.attributes = FALSE)
    }
    if (length(tol1)) {
      i. <- if (n <= 4L) 
        1:n
      else c(1L, 2L, n - 1L, n)
      for (i in i.) if (!isTRUE(ae(target = object[i, ], 
                                   current = Cj(object[, i]), tolerance = tol1, 
                                   ...))) 
        return(FALSE)
    }
    isTRUE(ae(target = object@x, current = Cj(t(object))@x, 
              tolerance = tol, ...))
  }
  .local(object, ...)
}


object="dtRMatrix"
function (object, ...) 
{
  .local <- function (object, tol = 100 * .Machine$double.eps, 
                      checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      checkDN <- ca(...)
    }
    if (tol <= 0) {
      if (!.hasSlot(object, "p")) 
        return(.Call(Csparse_is_symmetric, as(object, 
                                              "CsparseMatrix"), checkDN))
      else if (.hasSlot(object, "i")) 
        return(.Call(Csparse_is_symmetric, object, checkDN))
      else return(.Call(Rsparse_is_symmetric, object, checkDN))
    }
    d <- object@Dim
    if ((n <- d[1L]) != d[2L]) 
      return(FALSE)
    if (checkDN && !isSymmetricDN(object@Dimnames)) 
      return(FALSE)
    if (n <= 1L) 
      return(TRUE)
    x <- as(object, "sparseVector")
    tx <- as(t(object), "sparseVector")
    if (is(tx, "zsparseVector")) 
      tx@x <- Conj(tx@x)
    ae <- function(check.attributes, ...) {
      all.equal(..., check.attributes = FALSE)
    }
    isTRUE(ae(target = x, current = tx, tolerance = tol, 
              ...))
  }
  .local(object, ...)
}


object="dtTMatrix"
function (object, ...) 
{
  .local <- function (object, tol = 100 * .Machine$double.eps, 
                      checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      checkDN <- ca(...)
    }
    if (tol <= 0) {
      if (!.hasSlot(object, "p")) 
        return(.Call(Csparse_is_symmetric, as(object, 
                                              "CsparseMatrix"), checkDN))
      else if (.hasSlot(object, "i")) 
        return(.Call(Csparse_is_symmetric, object, checkDN))
      else return(.Call(Rsparse_is_symmetric, object, checkDN))
    }
    d <- object@Dim
    if ((n <- d[1L]) != d[2L]) 
      return(FALSE)
    if (checkDN && !isSymmetricDN(object@Dimnames)) 
      return(FALSE)
    if (n <= 1L) 
      return(TRUE)
    x <- as(object, "sparseVector")
    tx <- as(t(object), "sparseVector")
    if (is(tx, "zsparseVector")) 
      tx@x <- Conj(tx@x)
    ae <- function(check.attributes, ...) {
      all.equal(..., check.attributes = FALSE)
    }
    isTRUE(ae(target = x, current = tx, tolerance = tol, 
              ...))
  }
  .local(object, ...)
}


object="indMatrix"
function (object, ...) 
{
  .local <- function (object, checkDN = TRUE, ...) 
  {
    d <- object@Dim
    if ((n <- d[1L]) != d[2L]) 
      return(FALSE)
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      if (ca(...) && !isSymmetricDN(object@Dimnames)) 
        return(FALSE)
    }
    i <- seq_len(n)
    j <- object@perm
    all(j[j] == i)
  }
  .local(object, ...)
}


object="lgCMatrix"
function (object, ...) 
{
  .local <- function (object, checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      checkDN <- ca(...)
    }
    .Call(Csparse_is_symmetric, object, checkDN)
  }
  .local(object, ...)
}


object="lgeMatrix"
function (object, ...) 
{
  .local <- function (object, checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      checkDN <- ca(...)
    }
    .Call(unpackedMatrix_is_symmetric, object, checkDN)
  }
  .local(object, ...)
}


object="lgRMatrix"
function (object, ...) 
{
  .local <- function (object, checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      checkDN <- ca(...)
    }
    .Call(Rsparse_is_symmetric, object, checkDN)
  }
  .local(object, ...)
}


object="lgTMatrix"
function (object, ...) 
{
  .local <- function (object, checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      checkDN <- ca(...)
    }
    .Call(Csparse_is_symmetric, as(object, "CsparseMatrix"), 
          checkDN)
  }
  .local(object, ...)
}


object="ngCMatrix"
function (object, ...) 
{
  .local <- function (object, checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      checkDN <- ca(...)
    }
    .Call(Csparse_is_symmetric, object, checkDN)
  }
  .local(object, ...)
}


object="ngeMatrix"
function (object, ...) 
{
  .local <- function (object, checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      checkDN <- ca(...)
    }
    .Call(unpackedMatrix_is_symmetric, object, checkDN)
  }
  .local(object, ...)
}


object="ngRMatrix"
function (object, ...) 
{
  .local <- function (object, checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      checkDN <- ca(...)
    }
    .Call(Rsparse_is_symmetric, object, checkDN)
  }
  .local(object, ...)
}


object="ngTMatrix"
function (object, ...) 
{
  .local <- function (object, checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      checkDN <- ca(...)
    }
    .Call(Csparse_is_symmetric, as(object, "CsparseMatrix"), 
          checkDN)
  }
  .local(object, ...)
}


object="symmetricMatrix"
function (object, ...) 
  TRUE


object="triangularMatrix"
function (object, ...) 
{
  .local <- function (object, checkDN = TRUE, ...) 
  {
    if (checkDN) {
      ca <- function(check.attributes = TRUE, ...) check.attributes
      if (ca(...) && !isSymmetricDN(object@Dimnames)) 
        return(FALSE)
    }
    isDiagonal(object)
  }
  .local(object, ...)
}

