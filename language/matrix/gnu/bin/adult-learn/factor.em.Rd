\name{factor.em}
\alias{factor.em}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
factor.em(param, cyy)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{param}{
%%     ~~Describe \code{param} here~~
}
  \item{cyy}{
%%     ~~Describe \code{cyy} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (param, cyy) 
{
    param.new <- rep(NA, 45)
    beta.vec <- param[1:36]
    beta.mat <- matrix(beta.vec, 4, 9)
    tau2 <- param[37:45]
    tau2.mat <- diag(tau2)
    inv.quantity <- solve(tau2.mat + t(beta.mat) \%*\% beta.mat)
    small.delta <- inv.quantity \%*\% t(beta.mat)
    big.delta <- diag(4) - beta.mat \%*\% inv.quantity \%*\% t(beta.mat)
    cyy.inverse <- t(small.delta) \%*\% cyy \%*\% small.delta + big.delta
    cyy.mat <- t(small.delta) \%*\% cyy
    beta.new <- matrix(0, 4, 9)
    beta.p1 <- solve(cyy.inverse[1:3, 1:3]) \%*\% cyy.mat[1:3, 
        1:4]
    beta.p2 <- solve(cyy.inverse[c(1, 2, 4), c(1, 2, 4)]) \%*\% 
        cyy.mat[c(1, 2, 4), 5:9]
    beta.new[1:3, 1:4] <- beta.p1
    beta.new[c(1, 2, 4), 5:9] <- beta.p2
    tau.p1 <- diag(cyy)[1:4] - diag(t(cyy.mat[1:3, 1:4]) \%*\% 
        solve(cyy.inverse[1:3, 1:3]) \%*\% cyy.mat[1:3, 1:4])
    tau.p2 <- diag(cyy)[5:9] - diag(t(cyy.mat[c(1, 2, 4), 5:9]) \%*\% 
        solve(cyy.inverse[c(1, 2, 4), c(1, 2, 4)]) \%*\% cyy.mat[c(1, 
        2, 4), 5:9])
    tau.new <- c(tau.p1, tau.p2)
    param.new <- c(as.numeric(beta.new), tau.new)
    param <- param.new
    return(param.new)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
