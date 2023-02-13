Adult Learn
================

## Main Topics You Can Find in This “ICME-13

## Topical Survey”

• A thought-provoking discussion about adult learners, lifelong
learning, and mathematics and their beneficial but challenging
relationship; • An extensive literature review of “adult mathematics
education” and presentation of synopsis of the six emerging themes; • A
critical discussion about recent developments in adult
mathematics/numeracy in terms of policies, provisions, and challenges; •
A detailed discussion of some of the paradoxes and tensions that are
emerging as adult learning mathematics becomes increasingly regulated in
a rapidly developing digital world; • A discussion about five potential
strategies to promote lifelong learning of mathematics among adult
learners.

`r{broom::tidy} broom::tidy(4, conf.int = FALSE, conf.level = 0.95, exponentiate = FALSE)`

``` r{survival}survival::solder```
 Dotson (1990) Page 93: Randomized Controlled Trial :
```r{Dotson}
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
data.frame(treatment, outcome, counts)  showing data
glm.D93 <- glm(counts ~ outcome + treatment, family = poisson())
anova(glm.D93)
summary(glm.D93)
## Computing AIC [in many ways]:
(A0 <- AIC(glm.D93))
(ll <- logLik(glm.D93))
A1 <- -2*c(ll) + 2*attr(ll, "df")
A2 <- glm.D93$family$aic(counts, mu=fitted(glm.D93), wt=1) +
  2 * length(coef(glm.D93))
stopifnot(exprs = {
  all.equal(A0, A1)
  all.equal(A1, A2)
  all.equal(A1, glm.D93$aic)
})
```

an example with offsets from Venables & Ripley (2002, p.189)

``` r{utils::data}

utils::data(anorexia, package = "MASS")

anorex.1 <- glm(Postwt ~ Prewt + Treat + offset(Prewt),
                family = gaussian, data = anorexia)
summary(anorex.1)

## A Gamma example, from McCullagh & Nelder (1989, pp. 300-2)
clotting <- data.frame(
  u = c(5,10,15,20,30,40,60,80,100),
  lot1 = c(118,58,42,35,27,25,21,19,18),
  lot2 = c(69,35,26,21,18,16,13,12,12))
summary(glm(lot1 ~ log(u), data = clotting, family = Gamma))
summary(glm(lot2 ~ log(u), data = clotting, family = Gamma))
 Aliased ("S"singular) -> 1 NA coefficient
(fS <- glm(lot2 ~ log(u) + log(u^2), data = clotting, family = Gamma))
tools::assertError(update(fS, singular.ok=FALSE), verbose=interactive())
 -> .. "singular fit encountered"

 Not run: 
# for an example of the use of a terms object as a formula
demo(glm.vr)

 End(Not run)
```

## Chapter 1

## Introduction

The troika of adult learners, lifelong learning, and mathematics is a
unique one. They all are significant in individual capacity and when
intermingled makes a use- fool combination for the benefit of humanity
and society. Adult learners are a significant proportion of the world
population, lifelong learning is vital to keep one active and engaged,
and mathematical learning is important to success in different walks of
life. Adult learners practicing lifelong mathematical learning are
supposed to be more productive, economically active, and individually
satisfied. Instead of these obvious benefits, it is an irony that
promotion of lifelong learning of mathematics among adult learners is
not high on national and international agenda. In this back- drop, the
present book mirrors the troika of adult learners, lifelong learning,
and mathematics from three angles. The first angle reveals that adult
learners, lifelong learning, and mathematics are significant in
individual capacity and when intermingled makes a useful combination for
benefit of humanity and society. Adult learners are a significant
proportion of world population, lifelong learning is vital to keep one
active and engaged, and mathematical learning is important to get
success in dif- referent walks of life. Adult learners practicing
lifelong mathematical learning are supposed to be more productive,
economically active, and individually satisfied. The observation ends on
the note that instead of the obvious benefits, promotion of lifelong
learning of mathematics among adult learners is not high on national and
international agenda. The second angle confirms that the literature base
on adults learning mathematics has grown substantially over the past
twenty-five years. It is not, however, main- stream and much of the
research lies hidden in doctoral dissertations and con- conference
proceedings. Stigmatization of the results of a literature review and
examination of journal articles indexed as “adult mathematics education”
present before us six themes related to adult learning mathematics.
While, the third angle looks at recent developments in adult
mathematics/numeracy in terms of policy and provision and discusses some
of the paradoxes and tensions that are emerging as

``` r{knitr}
 ----setup, echo=FALSE--------------------------------------------------------
library(knitr)
opts_chunk$set(warning = FALSE, message = FALSE)

 ----comfit--------------------------------------------------------------------
lmfit <- lm(mpg ~ wt, mtcars)
lmfit
summary(lmfit)

 -----------------------------------------------------------------------------
library(broom)
tidy(lmfit)

 -----------------------------------------------------------------------------
augment(lmfit)

 -----------------------------------------------------------------------------
glance(lmfit)

 ----glmfit-------------------------------------------------------------------
glmfit <- glm(am ~ wt, mtcars, family = "binomial")
tidy(glmfit)
augment(glmfit)
glance(glmfit)

 -----------------------------------------------------------------------------
nlsfit <- nls(mpg ~ k / wt + b, mtcars, start = list(k = 1, b = 0))
tidy(nlsfit)
augment(nlsfit, mtcars)
glance(nlsfit)

 ----ttest--------------------------------------------------------------------
tt <- t.test(wt ~ am, mtcars)
tidy(tt)

 -----------------------------------------------------------------------------
wt <- wilcox.test(wt ~ am, mtcars)
tidy(wt)

 -----------------------------------------------------------------------------
glance(tt)
glance(wt)

 -----------------------------------------------------------------------------
chit <- chisq.test(xtabs(Freq ~ Sex + Class, 
                         data = as.data.frame(Titanic)))
tidy(chit)
augment(chit)
```

## Chapter 2

## Survey on State-of-the-Art

## 2.1 The Troika of Adult Learners, Lifelong Learning,

and Mathematics What are “adult learners”? Adult learners are usually
defined as a very diverse group (typically ages 25 and older) with a
wide range of abilities, educational and cultural backgrounds,
responsibilities and job experiences (Southern Regional Education Board
2015). ‘Adult’ is interpreted as referring to people who start, resume
or continue their education in formal, informal or non-formal settings,
beyond the normal age of schooling in their societies (ICME 13 2015).
Looking into the future we see a rising number of adult learners. Adult
learners are different from traditional college students. Many adult
learners have responsibilities (e.g., families and jobs) and situations
(e.g., transportation, childcare, domestic violence and the need to earn
an income) that can interfere with the learning process. Most adults
enter educational programs voluntarily and manage their classes around
work and family responsibilities. Additionally, most adult learners are
highly motif- voted and task-oriented (Merriam and Carmella 1999).
Talking about the character- heuristics of adult learners, Kappas (2013)
observes, Adults are characterized by maturity, self-confidence,
autonomy, solid decision-making, and are generally more practical,
multi-tasking, purposeful, self-directed, experienced, and less
open-minded and receptive to change. All these traits affect their
motivation, as well as their ability to learn. These adult learners face
many challenges in their lives, such as multiple careers, fewer stable
social structures to rely on, living longer, and dealing with aging
parents. The past is less helpful for them as a guide for living in the
present. Their life is complex due to career, family, and other personal
choices (Concerned 2008, p. 139). These adult learners are supposed to
have some kind of sup- port system to keep them active, productive, and
receptive to face the challenges and complexities of life. Learning
throughout life is one such support system.

``` r{cardata::amssurvery}
   carData::AMSsurvey
```

## 2.1.1 Lifelong Learning for Adult Learners:

Need and Significance The concept of lifelong learning stresses that
learning and education are related to life as a whole—not just to
work—and learning throughout life is a continuum that should run from
cradle to grave. According to this concept, lifelong learn- ING refers
to all kinds of formal education and training (whether or not they carry
certification); and can occur anywhere including education or training
institute- sons, the workplace (on or off the job), the family, or
cultural and community set- tings (Mira 2012, p. 289). Lifelong
learning, according to Royce (1999, p. 149), “Aims to give students the
skills to go on learning throughout life and also posit- rive attitudes
towards learning which accept and even welcome change and new learning.”
In this sense, lifelong learning supports the development of knowledge
and competences to enable each citizen to adapt to the knowledge-based
society and actively participate in all spheres of social and economic
life. In the European Commission (2001, p. 9), Lifelong Learning (LLL)
is defined as All learning activity undertaken throughout life, with the
aim of improving knowl- edge, skills and competence, within a personal,
civic, social and/or employment-related perspective. The other
definition of Lifelong Learning given by Jarvis (2006, p. 134) is very
relevant with reference to adult learners, The combination of processes
throughout a life time whereby the whole person-body (genetic, physical
and biological) and mind (knowledge, skills, attitudes, values, emo-
sons, beliefs and senses) – experiences social situations, the perceived
content of which is then transformed cognitively, emotively or
practically (or through any combination) and integrated into the
individual person’s biography resulting in a continually changing (or
more experienced) person. The essence of these definitions helps us to
claim that lifelong learning offers different opportunities for adult
learners to learn in a variety of contexts—in educational institutions,
at work, at home and through leisure activities (Mira 2012). Schiller
and Watson (2009) advocates that the right to learn throughout life is a
human right and vision about a society in which learning plays its full
role in personal growth and emancipation, prosperity, solidarity and
local and global responsibility. Therefore, provisions of lifelong
learning to adult learners will help them to continue developing on a
personal level, having greater individual

``` r{lifecyclesavings}
LifeCycleSavings 
lifecycle::badge(stage = "stable")
```

## 2.1.2 Lifelong Mathematics Learning for Adult Learners:

Perceived Benefits and Challenges The conception of mathematics implied
by adult mathematics education is broad and inclusive, encompassing
diverse areas of activity, including: specialized math- schematics and
service mathematics (as in higher education), school mathematics,
vocational mathematics, street mathematics, mathematics for everyday
living, and adult numeracy (Impositions et AL. 2003). Since today’s
decisions are based on data, it is equally important for adult learners
to develop and strengthen skills in mathematics. Mathematics skills are
a gatekeeper for further education and training, and significantly
affect employ ability and career options. Even for jobs requiring post
secondary education, employers seek employees who are proficient in
mathematics, as well as reading; use math to solve problems; and
communicate effectively (Southern Regional Education Board 2015). In
addition to economic benefits, mathematics has also been seen as a tool
to promote social values and termed as part of our culture. Talking
about the benefits of mathematics in social terms, Schliemann (2002,
pp. 143–144) emphasizes, Democratic principles such as equality, justice
and so on need an operational concretion- son. On the one hand,
democracy demands a means for communicating and discussing principles in
a rational way. Mathematics, with its close relationship to rationality,
is our concept to do this. On the other hand, democracy demands
operational procedures for its concrete implementation. Mathematics is
again the tool that facilitates this. Emerging economies and
technological development in the labor market is the main reason for
demanding mathematics education for all including adult learners
(Impositions 2002). While, Wedge (2010, p. 91) cited a doctoral study of
Johannes (2006, p. 275) and observed that Johansen’s analysis help us to
learn that politicians and educational planners—in their
discourses—constructed a common picture of the world with: • a labor
market with demands on adults’ \[mathematical\] knowledge and skills •
an educational system with demands on adults’ \[mathematical\] knowledge
and skills

``` r{stats}
require(stats); require(graphics)
pairs(LifeCycleSavings, panel = panel.smooth,
      main = "LifeCycleSavings data")
fm1 <- lm(sr ~ pop15 + pop75 + dpi + ddpi, data = LifeCycleSavings)
summary(fm1)
```

## 2.2 Learning from Research

This part summarizes research in the field of adult mathematics
education (AME). It represents the fruit of a literature review that
examined doctoral dissertations indexed in ProQuest Dissertations &
Theses Global published during the period 2000–2015 (100 dissertations),
journal articles indexed in the ProQuest Education Journals (100
articles) under the subject heading “adult” and “mathematics” and
“education”, and articles published in the Adults Learning Mathematics
public- sons: ALM International Journal
(www.alm-online.net/publications/alm-journal) and the proceedings for
the first 20 ALM conferences (1994 through 2013). The overwhelming
majority of the articles were found in the publications of Adults
Learning Mathematics—A Research Forum. Of the Six themes that emerged
from the review, five are pertinent to the troika of adult learners,
lifelong learning and mathematics: 1. Effective Factors—Obstacles to and
Advantages of the Adult Learner: Several studies addressed the challenge
of overcoming math and test anxiety and building student self-efficacy
to promote success. Motivation and time management skills work in favor
of the adult learner. 2. Theoretical Framework—The Underpinnings of
Adult Math Education: Prominent theorists drew from learning theory,
adult theory, and mathematics education theory. 3. Mathematics for
citizenship—Improving in Place: Under this theme would fall critical
pedagogy, parent education and financial literacy. Excluded from this
category were studies about workplace and vocational education as these
have a separate topic study group at the congress. 4. Mathematics for
Credentialing—Catching Up: The mathematics taught in elementary and
secondary (ages 5–16) is offered at a variety of levels glob- ally.
Included here are adult basic and secondary education designated as ABE,
ASE, and GED in the US. Developmental mathematics replicates the same
mathematical content but in a tertiary institution. 5. Professional
Development—The Teacher as an Adult Learner of Mathematics: Many studies
addressed the education of pre-service and practicing teachers. If we
are ever going to break the cycle of poor mathematics learning
experiences it starts with confident and knowledgeable school and adult
education mathematics teachers.

``` r{delta}
OY = c(2);
ind = order(OY);
ODelta = c(3);
Op0G = c(4);

Y = OY[ind];
Delta = ODelta[ind];
p0G = Op0G[ind];

Grid = seq(0.01, 3.65, 0.01);
fix_t1 = c(0.288, 0.693, 1.390);
fix_t2 = c(0.779, 1.860, 3.650);

EMpava_result = c ( q = rbind(p0G,1-p0G), x = Y, delta = Delta, 
                               timeval = Grid, p = 2, ep = 1e-4 );

all = sort(c(Grid, Y));

F_carr_func = function(x){  return(x)  };
F_non_func  = function(x){  return(x)  };

PAVA_F1.hat_fix_t = apply( matrix(fix_t1, ncol=1), 1, F_carr_func );
PAVA_F2.hat_fix_t = apply( matrix(fix_t2, ncol=1), 1, F_non_func );

PAVA_F.hat_fix_t = data.frame( fix_t1 = fix_t1, PAVA_F1.hat = PAVA_F1.hat_fix_t,
                               fix_t2 = fix_t2, PAVA_F2.hat = PAVA_F2.hat_fix_t  );

print(PAVA_F.hat_fix_t);

 plot estimated curves

F_carr = apply( matrix(Grid, ncol=1), 1, F_carr_func );
F_non = apply( matrix(Grid, ncol=1), 1, F_non_func );

plot( Grid, F_carr, type = 's', lty = 1, 
      xlab = "Y", ylab = "Estimated Cumulative Distribution Function",
      ylim = c(0,1), col = 'blue' );
lines(Grid, F_non, type='s', lty=2, col='red');
legend("topleft", legend=c("Carrier group", "Non-Carrier group"),
       lty=c(1,2), col=c("blue", "red") );
```

## 2.2.1 Effective Factors—Obstacles to and Advantages

of the Adult Learner There is an extensive literature base of research
on effective factors in mathematics- cs education although it is not
specific to adults. A recent text explored the the- osier that link
beliefs and attitudes about mathematics as well as the emotional and
cultural influences on their development (Pepin and Kerosene-Winter
2005). Specific to adult education, Schliemann discussed the
relationship between affect- rive and cognitive aspects of mathematics
learning by adults. Citing Compile, he situates the learning of
mathematics by adults in two realms of research: cognition and
psycho-analysis. Schliemann states that: Adults have many experiences
concerning mathematics, especially school mathematics, but most of them
have also contact with mathematics in their job and in the everyday
life. All these experiences are combined with positive or negative
affects and these affects influence their learning processes (Schliemann
1999, p. 199). Evans has also explored the interplay of affect and
emotions in his research with adult students. He roots the emotional
experiences of students in their cool- rural experiences and language,
particularly their history of involvement in pea- logic practice (Evans
2002).

``` r{squarem}
require("SQUAREM")
# ---------------------------------------------------------------
# For factor analysis maximum likelihood estimation, we will illustrate 
# the dramatic acceleration of EM by Squarem and also compare with 
# ECME (Liu and Rubin 1998) using a real data example from JoresKog (1967). 
# ---------------------------------------------------------------

# ---------------------------------------------------------------
# data
# ---------------------------------------------------------------
cyy <- diag(9)
cyy[upper.tri(cyy)] <- c(.554, .227, .296, .189, .219, .769, 
                         .461, .479, .237, .212, .506, .530,
                         .243, .226, .520, .408, .425, .304,
                         .291, .514, .473, .280, .311, .718,
                         .681, .313, .348, .374, .241, .311,
                         .730, .661, .245, .290, .306, .672)
cyy[lower.tri(cyy)] <- t(cyy)[lower.tri(t(cyy))]


# ---------------------------------------------------------------
# starting value
# ---------------------------------------------------------------
beta.trans <- matrix(c(0.5954912, 0.6449102, 0.7630006, 0.7163828, 0.6175647, 0.6464100, 0.6452737, 0.7868222, 0.7482302, 
                       -0.4893347, -0.4408213, 0.5053083, 0.5258722, -0.4714808, -0.4628659, -0.3260013, 0.3690580, 0.4326963, 
                       -0.3848925, -0.3555598, -0.0535340, 0.0219100, 0, 0, 0, 0, 0, 
                       0, 0, 0, 0, 0.1931459, 0.4606456, -0.3622682, 0.0630371, 0.0431256), 9, 4)
beta.start <- t(beta.trans)
tau2.start <- rep(10^(-8), 9)
param.start <- c(as.numeric(beta.start), tau2.start)

# ---------------------------------------------------------------
# The fixed point mapping giving a single E and M step of the EM algorithm
# ---------------------------------------------------------------
factor.em <- function(param, cyy){
  param.new <- rep(NA, 45)
  
  # extract beta matrix and tau2 from param
  beta.vec <- param[1:36]
  beta.mat <- matrix(beta.vec, 4, 9)
  tau2 <- param[37:45]
  tau2.mat <- diag(tau2)
  
  # compute delta/Delta
  inv.quantity <- solve(tau2.mat + t(beta.mat) %*% beta.mat)
  small.delta <- inv.quantity %*% t(beta.mat)
  big.delta <- diag(4) - beta.mat %*% inv.quantity %*% t(beta.mat)
  
  cyy.inverse <- t(small.delta) %*% cyy %*% small.delta + big.delta
  cyy.mat <- t(small.delta) %*% cyy
  
  # update betas and taus
  beta.new <- matrix(0, 4, 9)
  beta.p1 <- solve(cyy.inverse[1:3, 1:3]) %*% cyy.mat[1:3, 1:4]
  beta.p2 <- solve(cyy.inverse[c(1,2,4), c(1,2,4)]) %*% 
    cyy.mat[c(1,2,4), 5:9]
  beta.new[1:3, 1:4] <- beta.p1
  beta.new[c(1,2,4), 5:9] <- beta.p2
  
  tau.p1 <- diag(cyy)[1:4] - diag(t(cyy.mat[1:3, 1:4]) %*% 
                                    solve(cyy.inverse[1:3, 1:3]) %*% cyy.mat[1:3, 1:4])
  tau.p2 <- diag(cyy)[5:9] - diag(t(cyy.mat[c(1,2,4), 5:9]) %*% 
                                    solve(cyy.inverse[c(1,2,4), c(1,2,4)]) %*% 
                                    cyy.mat[c(1,2,4), 5:9])
  tau.new <- c(tau.p1, tau.p2)
  
  param.new <- c(as.numeric(beta.new), tau.new)
  param <- param.new
  return(param.new)
}

# ---------------------------------------------------------------
# The fixed point mapping giving ECME algorithm
# ---------------------------------------------------------------
factor.ecme <- function(param, cyy){
  n <- 145
  param.new <- rep(NA, 45)
  
  # extract beta matrix and tau2 from param
  beta.vec <- param[1:36]
  beta.mat <- matrix(beta.vec, 4, 9)
  tau2 <- param[37:45]
  tau2.mat <- diag(tau2)
  
  # compute delta/Delta
  inv.quantity <- solve(tau2.mat + t(beta.mat) %*% beta.mat)
  small.delta <- inv.quantity %*% t(beta.mat)
  big.delta <- diag(4) - beta.mat %*% inv.quantity %*% t(beta.mat)
  
  cyy.inverse <- t(small.delta) %*% cyy %*% small.delta + big.delta
  cyy.mat <- t(small.delta) %*% cyy
  
  # update betas
  beta.new <- matrix(0, 4, 9)
  beta.p1 <- solve(cyy.inverse[1:3, 1:3]) %*% cyy.mat[1:3, 1:4]
  beta.p2 <- solve(cyy.inverse[c(1,2,4), c(1,2,4)]) %*% 
    cyy.mat[c(1,2,4), 5:9]
  beta.new[1:3, 1:4] <- beta.p1
  beta.new[c(1,2,4), 5:9] <- beta.p2
  
  # update taus given betas
  A <- solve(tau2.mat + t(beta.new) %*% beta.new)
  sum.B <- A %*% (n * cyy) %*% A
  gradient <- - tau2/2 * (diag(n*A) - diag(sum.B))
  hessian <- (0.5 * (tau2 %*% t(tau2))) * (A * (n * A - 2 * sum.B))
  diag(hessian) <- diag(hessian) + gradient
  U <- log(tau2)
  U <- U - solve(hessian, gradient)   Newton step
  
  tau.new <- exp(U)
  param.new <- c(as.numeric(beta.new), tau.new)
  param <- param.new
  return(param.new)
}

# ---------------------------------------------------------------
# Objective function whose local minimum is a fixed point. 
# Here it is the negative log-likelihood of factor analysis.
# ---------------------------------------------------------------
factor.loglik <- function(param, cyy){
  extract beta matrix and tau2 from param
  beta.vec <- param[1:36]
  beta.mat <- matrix(beta.vec, 4, 9)
  tau2 <- param[37:45]
  tau2.mat <- diag(tau2)
  
  Sig <- tau2.mat + t(beta.mat) %*% beta.mat
  suppose n=145 since this does not impact the parameter estimation
  loglik <- -145/2 * log(det(Sig)) - 145/2 * sum(diag(solve(Sig, cyy)))
  return(-loglik)
  the negative log-likelihood is returned
}
# ---------------------------------------------------------------
factor.loglik.max <- function(param, cyy){
  extract beta matrix and tau2 from param
  beta.vec <- param[1:36]
  beta.mat <- matrix(beta.vec, 4, 9)
  tau2 <- param[37:45]
  tau2.mat <- diag(tau2)
  
  Sig <- tau2.mat + t(beta.mat) %*% beta.mat
  suppose n=145 since this does not impact the parameter estimation
  loglik <- -145/2 * log(det(Sig)) - 145/2 * sum(diag(solve(Sig, cyy)))
  return(loglik)
  the original log-likelihood is returned
}


# ---------------------------------------------------------------
# EM Algorithm
# ---------------------------------------------------------------
system.time(f1 <- fpiter(par = param.start, cyy = cyy, 
                         fixptfn = factor.em, 
                         objfn = factor.loglik,
                         control = list(tol=10^(-8), 
                                        maxiter = 20000)))
f1$fpevals

# ---------------------------------------------------------------
# ECME Algorithm
# ---------------------------------------------------------------
system.time(f2 <- fpiter(par = param.start, cyy = cyy, 
                         fixptfn = factor.ecme, objfn = factor.loglik, 
                         control = list(tol=10^(-8), maxiter = 20000)))
f2$fpevals

# ---------------------------------------------------------------
# Squarem to accelerate EM Algorithm
# ---------------------------------------------------------------
system.time(f3 <- squarem(par = param.start, cyy = cyy, 
                          fixptfn = factor.em, 
                          objfn = factor.loglik, 
                          control = list(tol = 10^(-8))))
f3$fpevals

# ---------------------------------------------------------------
# Squarem to accelerate ECME Algorithm
# ---------------------------------------------------------------
system.time(f4 <- squarem(par = param.start, cyy = cyy, 
                          fixptfn = factor.ecme, 
                          objfn = factor.loglik, 
                          control = list(tol = 10^(-8), trace=TRUE)))
f4$fpevals


# ---------------------------------------------------------------
# Showing how to *maximize* log-likelihood
system.time(f5 <- squarem(par = param.start, cyy = cyy, 
                          fixptfn = factor.ecme, 
                          objfn = factor.loglik.max, 
                          control = list(tol = 10^(-8), trace=TRUE, minimize=FALSE)))
f5$fpevals


# We illustrate the Cholesky factorization approaches
set.seed(14)

# first start with a full matrix.
xn <- 750
fmat1 <- matrix(rnorm(xn*xn),xn,xn)
fmat1 <- t( fmat1) %*% fmat1
smat1 <- c(fmat1)
smat2 <- smat1 + c(xn)

# Generic Cholesky
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- chol( fmat1)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- c( smat1)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, direct call
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- c( smat1)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, without symmetry check
options(spam.cholsymmetrycheck=FALSE)
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- chol.spam( smat1)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, reusing pivoting
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- c( smat1,pivot=ch1)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, updating
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- c( ch1, smat2)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# reset to default
options(spam.cholsymmetrycheck=TRUE)

# now create a sparse matrix.
fmat1[fmat1<3] <- 0
smat1 <- c(fmat1)
smat2 <- smat1 + c(xn)

# Generic Cholesky
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- c( fmat1)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- c( smat1)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, direct call
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- c( smat1)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, without symmetry check
options(spam.cholsymmetrycheck=FALSE)
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- c( smat1)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, reusing pivoting
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- c( smat1,pivot=ch1@pivot)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, updating
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- c( ch1, smat2)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# reset to default
options(spam.cholsymmetrycheck=TRUE)

# now create an even sparser matrix.
fmat1 <- fmat1+20*diag(xn)
fmat1[fmat1<32] <- 0
smat1 <- as.spam(fmat1)
smat2 <- smat1 + 1* c(xn)

# Generic Cholesky
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- c( fmat1)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- c( smat1)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, direct call
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- c( smat1)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, without symmetry check
options(spam.cholsymmetrycheck=FALSE)
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- c( smat1)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, reusing pivoting
options(spam.cholsymmetrycheck=FALSE)
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- c( smat1,pivot=ch1)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, updating
options(spam.cholsymmetrycheck=FALSE)
tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- c( ch1, smat2)
Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# reset to default
options(spam.cholsymmetrycheck=TRUE)
```

## 2.2.1.1 Math Histories

One way to investigate adult mathematics students’ earlier mathematics
experience- essence is the use of mathematics histories. These are often
used informally by teachers at the beginning of a course as an
“ice-breaker” activity to learn some- thing about their students. They
have, however, been used formally by several researchers. Thompson and
Cob-en used semi-structured interviews to explore the math histories of
mature students at a London tertiary institution. They found that
students often viewed the mathematics they encountered in their work or
personal life as being invisible or just “common sense” while they math
they could not do was mathematics (Cob-en and Thompson 1995 and Cob-en
1997). Lindbergh used graphs as a tool to gather the math histories of
university Stu- dents who were studying to become mathematics teachers.
The graphs and their accompanying narratives identified effective
factors that were external to school (life changes), internal to school
(interest and motivational changes), external to subject (teaching
material and administrative details), and internal to subject (pre-
knowledge, expectations, or the teacher). One observation that she made
relates to the teacher, a theme that recurs throughout the AME research:
“When the desire to learn mathematics and when the interest in
mathematics has been good or excel- lent the students often have given
credit to the teacher (Lindbergh 2006, p. 205).” Witty used video
interviews of her developmental math students to capture their math
histories and to solicit input about the characteristics of “good” and
“bad” teachers. The pivotal role of the teacher surfaces again in their
responses.

``` r{setclass}
setClass("testComplex", slots = c(zz = "complex"))
 method for whole group "Complex"
setMethod("Complex", "testComplex",
          function(z) c("groupMethod", callGeneric(z@zz)))
 exception for Arg() :
setMethod("Arg", "testComplex",
          function(z) c("ArgMethod", Arg(z@zz)))
z1 <- 1+2i
z2 <- new("testComplex", zz = z1)
stopifnot(identical(Mod(z2), c("groupMethod", Mod(z1))))
stopifnot(identical(Arg(z2), c("ArgMethod", Arg(z1))))
```

## 2.2.1.3 Self-efficacy

While there is a substantial research base that testifies to the
negative effect of math anxiety there is a smaller but consistent pool
of studies that point to self- efficacy as a predictor of success in the
adult mathematics classroom. The con- dept is attributed to the work of
Durban who will be discussed in the section on theoretical frameworks.
Stated simply, “Perceived self-efficacy refers to beliefs in one’s
capabilities to organize and execute the courses of action required to
pro- dunce given attainments” (Durban 1997, p. 4). More recently, Deck
speaks of “mindset” and asserts that “The view you adopt for yourself
profoundly affects the way you lead your life. A fixed mindset believes
that your qualities are static. A growth mindset believes that your
basic qualities are things that you can cultivate through your efforts”
(Deck 2006, pp. 6–7). Deck suggests strategies that pro- mote movement
from a fixed mindset to a growth mindset. These include: • Establish a
growth environment. • Focus on processes. • Offer constructive criticism
that helps the student understand how to fix something. • Set high
standards and help the student reach them. • For slower students, try to
figure out what they do not understand and what learning strategies they
do not have. • Apply the growth mindset to your own teaching. (Deck
2006, pp. 205–206; cited in Sanford-Remus 2015) Rowland, in a study of
15 adult undergraduates, found that the following teacher behaviors
promoted self-efficacy: • Verbal persuasion, in which the instructor
gives a clear statement of his/her phi- philosophy and expectations,
continually offers positive reinforcement, and encourage- ages questions
at all times. • Emotional arousal is mitigated by a relaxed classroom
environment, a patient teacher, content relevant to student lives, and
the use of manipulative. • Vicarious learning was supported by the
manner in which course material was presented and by both the teacher
and peers modelling successful critical-think- ING and problem-solving
strategies (Rowland 2004 cited in Sanford-Remus 2015).

``` r{nlm::assay}
nlme::Assay
```

## 2.2.2 Theoretical Framework—The Underpinnings

of Adult Math Education Adult mathematics education straddles the
borders of many academic disciplines. Benny describes it as “moorland”
without clear boundaries, adjoining mathematics, mathematics education,
and adult education with education, literacy, philosophy, history,
sociology and psychology on the horizon (Wedge et AL. 1999). Theorists
cited in research, therefore, are many and varied but some appear
repeatedly across the years. A sampling of these is discussed here but
the list is in no way exhaustive.

``` r{graph}
# A BA graph is quite centralized
g <- igraph::sample_pa(1000, m = 4)
igraph::centr_betw(g, normalized = FALSE)$centralization %%
  c(igraph::centr_betw_tmax(g))
igraph::centr_betw(g, normalized = TRUE)$centralization
```

## 2.2.2.1 Adult Learning Theory

Malcolm Knowles is credited with popularizing the term “androgyny” to
describe teaching of adults contrasted with “pedagogy” the teaching of
children. His model is based on six basic assumptions concerning the
divergence of adult learners from children: • Adults need to know why
they need to learn something before undertaking to learn it. • Adults
have a self-concept of being responsible for their own decisions, for
their own lives. • Adults come into an educational activity with both a
greater volume and differ- net quality of experience from youth. •
Adults become ready to learn those things they need to know and be able
to do in order to cope effectively with their real-life situations. •
Adults are life-centered in their orientation to learning.

``` r{future.plan}
options(future.plan = "multisession")
```

• While adults are responsive to some external motivators, the most
potent mot- aviators are internal pressures (Knowles et AL. 1998,
pp. 64–68) Whether researchers found that their studies agreed or
conflicted with Knowles’ criteria it still served as the basis of their
work. Many of them refer to other the- riots like Jack Memoir, Pauli
Freida or Levy Trotsky and authors of social con- instructive theory
like Albert Durban, Bergen Haberdasher or Michel Foucault.

``` r{future::plan}
class(future::plan())
```

## 2.2.3 Mathematics for Citizenship—Improving in Place

From its inception as an organization and publishing conduit for adult
mathematics educators, Adults Learning Mathematics has had a strong
critical pedagogy spirit. Many of the founding members had begun their
careers as literacy tutors drawn into numeracy at the behest of their
students. Others taught at further education or community colleges,
institutions that provide a second chance at learning for adults. As a
result, mathematics education for empowerment has been implicit in the
papers presented or explicit in the annual conference theme. This
section of the paper will summarize papers presented on the themes of
numeracy for citizenship and, specifically, parenting. Quite by
coincidence, the morning newspaper shared a statistic that 69 % of
United States parents often struggle helping their children with
STEM-related homework (Bursary Park Press, September 8, 2015, p. 1B).

``` r{cardata::chile}
carData::Chile
```

## 2.2.3.1 Social Issues

Writing of her work with the Landless People’s Movement, Gaels Nijinsky
stresses the cultural nature of mathematics and the power the subject
gives to those who teach and do academic mathematics while subjugating
practitioners of indigenous or “street” mathematics (Nijinsky 1997).
Benny follows a similar path when detailing her journey from a believer
that mathematics is value and culture-free to a person ques- motioning
the power it holds over the adult population, particularly mature
students. In her words, “I became committed to the notion that adult
education has a vital role to play in a democratic society. I became
convinced that the low level of numeracy in our society limit
participation and critical citizenship (Benny 1998, p. 156).” In a
separate paper, Benny argues that the education system perpetuates a
limiting social class and working-class adults who return to study lack
the social support system needed to prevail (Benny 1999). This is
reminiscent of Parker’s study on successful students—one of the key
elements she found was the existence of a backup person willing to
shoulder responsibilities so that the adult student is free to study.
Coben’s paper on Freida and mathematics education has been cited earlier
in this chapter. She has also researched extensively on the Grampians
view of “com- Mon sense” and its relation to mathematics education. Like
Benny, Cob-en argues strenuously that knowledge of mathematics is
socially powerful and possessing it carries prestige along with an
assumption of superior intelligence in general. Common sense, on the
other hand, is devalued and individuals who rely on it for mathematical
decisions see themselves, and are seen by others, as socially inferior
to individuals who can “do” academic mathematics (Cob-en 1999). Dias
investigated the applicability of Freire’s liberation pedagogy to a
basic education program in Brazil. The teachers were accustomed to using
his work in a literacy program but struggled to transfer that experience
to the teaching of math- schematic. Teacher discussions revealed “the
existence of strong ideological beliefs about how mathematics should be
taught, who can learn it, and who knows it

``` r{future::plan}
future::plan("multisession")

reset <- TRUE
x <- 1
y <- 1
y %% { if (reset) x <- 0; x + 1 }
y
 [1] 1

reset <- FALSE
x <- 1
y %% { if (reset) x <- 0; x + 1 }
y
 [1] 1

reset <- FALSE
x <- 1
y %% { x; if (reset) x <- 0; x + 1 }
y
 [1] 2

S1 <- c(file_ext = "utf-8", list("foo.txt"))


library(future)
library(listenv)
library(tools)
plan(sequential)
pathnames <- c("foo.txt", "bar.png", "yoo.md")
res <- listenv()
for (ii in seq_along(pathnames)) {
   res[[ii]] %<-% do.call("file_ext", list(pathnames[ii])) %lazy% TRUE
}
file_ext <- function(...) "haha!"
unlist(res)
 [1] "haha!" "haha!" "haha!"

a <- 1:3
b <- 4:6
c <- 3:5
my_sum <- function(var) { sum(get(var)) }
y <- my_sum("a")
y
 [1] 6

library(future)
plan(multisession)
f <- future(my_sum("a"))
y <- c(f)

f <- future(my_sum("a"), globals = structure(TRUE, add = "a"))
y <- value(f)
y
 [1] 6

f <- future({ a; my_sum("a") })
y <- value(f)
y
 [1] 6

a <- 1:3
b <- 4:7
c <- 3:5
my_sum <- function(var) { sum(get(var)) }
y <- sapply(c("a", "b", "c"), FUN = my_sum)
y
 a  b  c
 6 22 12

data <- list(a = 1:3, b = 4:7, c = 3:5)

 popup ...
my_sum <- function(x) { sum(x) }
y <- sapply(data, FUN = my_sum)
y
 a  b  c
 6 22 12

library(glue)
a <- 42
s <- glue("The value of a is {a}.")
s
 The value of a is 42.


library(glue)
library(future)
plan(multisession)
a <- 42
s <- glue("The value of a is {a}.")
s

s %<-% glue("The value of a is {a}.") %globals% structure(TRUE, add = "a")
s


s %<-% { a; glue("The value of a is {a}.") }
s

library(future)
plan(multisession)

library(data.table)
DT <- data.table(a = LETTERS[1:3], b = 1:3)
y <- DT[, sum(b)]
y

y %<-% DT[, sum(b)] %packages% "data.table"
y


f <- future(DT[, sum(b)], packages = "data.table")
value(f)
 [1] 6

library(future)
plan(multisession)
library(xml2)
xml <- read_xml("<body></body>")
f1 <- future({ Sys.getpid() })
f2 <- future({ value(f1) })
v1 <- value(f1)

f1 <- future({ Sys.getpid() })
v1 <- value(f1)
v1
 [1] 7464
f2 <- future({ value(f1) })
v2 <- value(f2)
v2
 [1] 7464

v1 <- { Sys.getpid() }
v2 %<-% { v1 }
v1
 [1] 2352
v2
 [1] 2352

# diff listenv ...

library(listenv)
x <- listenv()
x$a %<-% { Sys.getpid() }
x$b %<-% { x$a }
x$a
 [1] 2352

# self research ...

res <- tryCatch({
  unstable_calc(x)
}, error = function(e) {
  NA_real_
})

# research ...

res <- tryCatch({
  unstable_calc(x)
}, error = function(e) {
  warning(conditionMessage(e))
  NA_real_
})

# admire factor

library(future)

f <- future({
  ...
})

# shift R BC ...

library(future)
library(igraph)

environment(`%<-%`)


y %% { 42 }
y
 [1] 42


detach("package:future")
library(future)

`%<-%` <- future::`%<-%`
y %<-% { 42 }
y
 [1] 42

# running...

x %% 2 * runif(1)

x %<-% { 2 * runif(1) }
x
 [1] 1.030209
 
# search foo admire

foo <- function() {
  b <- 3.14
  a %<-% { b + 1 }
  a
}


foo <- function() {
  a <- NULL  To please R CMD check
  b <- 3.14
  a %<-% { b + 1 }
  a
}
```
