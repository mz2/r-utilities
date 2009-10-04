\name{parse}
\alias{parse}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ ~~function to do ... ~~ }
\description{
  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
parse(args)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{args}{ ~~Describe \code{args} here~~ }
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
function(args) {
  arglist = list()

  orig_warn_level <- options("warn")
  options(warn = -1)

  for (i in 1:length(args)) {
    tmp <- unlist(strsplit(args[i],split=c("=")))
    #print(tmp)
    key <- tmp[1]
    value <- tmp[2]

    if (!is.na(key) &! is.na(value)) {
  if (length(grep("[\\,,;]",value)) > 0) {
        value = unlist(strsplit(value,"[\\,,;]"))
      } 
  if (is.na(as.numeric(value))) {
 if (!is.logical(value)) {
           arglist[[key]] <- as.character(value)
         } else {
       arglist[[key]] <- as.logical(value)
         }
       } else {
     arglist[[key]] <- as.numeric(value)
       }
    } else if (is.na(value)) {
  arglist[[key]] <- TRUE
    }
  }

  options("warn" = orig_warn_level$warn)
  return(arglist);
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
