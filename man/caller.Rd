% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/func.R
\name{caller}
\alias{caller}
\title{Get Name of Calling Function}
\usage{
caller(n = 1)
}
\arguments{
\item{n}{How many frames to go up in the call stack}
}
\value{
Name of the calling function
}
\description{
Returns the name of a calling function as string, i.e. if function \code{g} calls function \code{f} and function \code{f} calls \code{caller(2)}, then string \code{"g"} is returned.
}
\details{
Be careful when using \code{caller(n)} as input to other functions. Due to R's non-standard-evaluation (NES) mechanism it is possible that the function is not executed directly by that function but instead passed on to other functions, i.e. the correct number of frames to go up cannot be predicted a priori. Solutions are to evaluate the function first, store the result in a variable and then pass the variable to the function or to just try out the required number of frames to go up in an interactive session. For further examples see section Examples.
}
\examples{
# Here we want to return a list of all variables created inside a function
f <- function(a = 1, b = 2) {
    x <- 3
    y <- 4
    return(locals(without = formalArgs(caller(4))))
    # We need to go 4 frames up, to catch the formalArgs of `f`, because the
    # `caller(4)` argument is not evaluated directly be `formalArgs`.
}
f() # returns either list(x = 3, y = 4) or list(y = 4, x = 3)

# The same result could have been achieved as follows
g <- function(a = 1, b = 2) {
    x <- 3
    y <- 4
    func <- caller(1)
    return(locals(without = c("func", formalArgs(func))))
}
g() # returns either list(x = 3, y = 4) or list(y = 4, x = 3)
}
\keyword{func}
