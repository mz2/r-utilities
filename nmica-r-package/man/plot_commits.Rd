\name{plot_commits}
\alias{plot_commits}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ ~~function to do ... ~~ }
\description{
  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plot_commits(commits, count_hidden, aggr_outc, period_count, aggr_hidden = NULL, pdfout_filename = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{commits}{ ~~Describe \code{commits} here~~ }
  \item{count_hidden}{ ~~Describe \code{count_hidden} here~~ }
  \item{aggr_outc}{ ~~Describe \code{aggr_outc} here~~ }
  \item{period_count}{ ~~Describe \code{period_count} here~~ }
  \item{aggr_hidden}{ ~~Describe \code{aggr_hidden} here~~ }
  \item{pdfout_filename}{ ~~Describe \code{pdfout_filename} here~~ }
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
function(commits,count_hidden, aggr_outc, period_count, aggr_hidden=NULL, pdfout_filename=NULL) {
if (!is.null(pdfout_filename)) {pdf(pdfout_filename, width=12,height=12)}
classes <- unique(aggr_outc$Class)
classcolors_outc <- rainbow(length(classes))
classcolors_hid <- rainbow(length(classes),alpha=0.5)
plot(NULL,
        main="Rate vs 'time'",
        ylim=c(0,1),
        xlim=c(0,1),
        ylab="Commit rate",
        xlab=paste("Fraction of simulation steps done thus far",
                "(duration divided to",period_count,"parts)"))
        
plot_aggregate_data(aggr_outc,classes,classcolors_outc,lty=1,type="l",lwd=3)
if (count_hidden &! is.null(aggr_outc)) {
plot_aggregate_data(aggr_hidden,classes,classcolors_hid,lty=0,type="p",lwd=2,pch=19)
  }
legend(0.8, 0.12,classes,fill=classcolors_outc)
if (!is.null(pdfout_filename)) {dev.off()}
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
