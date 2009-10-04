\name{calc_aggr_outc}
\alias{calc_aggr_outc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ ~~function to do ... ~~ }
\description{
  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
calc_aggr_outc(commits, count_hidden = T)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{commits}{ ~~Describe \code{commits} here~~ }
  \item{count_hidden}{ ~~Describe \code{count_hidden} here~~ }
}
\details{
  ~~ If necessary, more details than the description above ~~
}
\value{
  ~Describe the value returned
  If it is a LIST, use
  \item{comp1 }{Description of 'comp1'}
  \item{comp2 }{Description of 'comp2'}
  ...
}
\references{ ~put references to the literature/web site here ~ }
\author{ ~~who you are~~ }
\note{ ~~further notes~~ 

 ~Make other sections like Warning with \section{Warning }{....} ~
}
\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(commits, count_hidden=T) {
if (!count_hidden) {
return(aggregate(commits$outc[commits$hidden == "false"],
                list(Class = commits$class[commits$hidden == "false"],
                Period = commits$period[commits$hidden == "false"]),
                mean))
  } else {
return(aggregate(commits$outc,
                    list(Class = commits$class,
                    Period = commits$period),
                    mean))
  }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
