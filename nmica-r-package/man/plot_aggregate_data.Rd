\name{plot_aggregate_data}
\alias{plot_aggregate_data}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ ~~function to do ... ~~ }
\description{
  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plot_aggregate_data(aggr, classes, classcolors, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{aggr}{ ~~Describe \code{aggr} here~~ }
  \item{classes}{ ~~Describe \code{classes} here~~ }
  \item{classcolors}{ ~~Describe \code{classcolors} here~~ }
  \item{\dots}{ ~~Describe \code{\dots} here~~ }
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
function(aggr,classes,classcolors,...) {

for (i in 1:length(classes)) {
    rates <- aggr$x[aggr$Class \%in\% classes[i]]
    plot.xy(xy.coords(x=(1:length(rates))/length(rates),y=rates),
            col=classcolors[i],...)
  }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
