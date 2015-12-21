\name{irfplot}
\alias{irfplot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plotting impulse responses with error bands from VAR posterior draws}
\description{
  Generates plots of impulse responses with error bands from VAR posterior draws
}
\usage{
irfplot(irfdraws=NULL,type="median", labels=unlist(dimnames(irfdraws)[3]),
        save=FALSE, bands=c(0.16, 0.84), grid=TRUE, bw=FALSE)
}

\arguments{
 \item{irfdraws}{A \eqn{draws \times steps \times nvar}{draws x steps x nvar} array of posterior impulse responses.}
  \item{type}{A string, either "median" or "mean" response, specifying the type of response to be plotted. The default is "median".}
  \item{labels}{A list of variable labels for impulse response plots. The default are the variable names of the model.}
  \item{save}{A logical statement to save the graph in the current working directory. The default is 'FALSE'.}
  \item{bands}{A list of length 2 containing the error bands of the impulse responses. If bands='NULL', only IRFs are plotted. The default is c(0.16, 0.84).}
  \item{grid}{A logical statement on whether or not to generate grid lines in the plots. The default is 'TRUE'.}
  \item{bw}{A logical statement on whether or not to generate black and white or colour graphs. The default is 'FALSE'.}
}%end of arguments

\details{This function generates plots of impulse responses with error bands from VAR posterior draws produced by a Bayesian VAR model.
}
\value{
  The function returns a plot of the IRFs with user-selected percentiles.
}

\author{ Christian Danne}
\note{ Users should consult the reference papers and the package vignette for more information.}

\seealso{\code{\link{fp.target}}, \code{\link{fevdplot}}.}
\examples{
\dontrun{
# Replication of Figure 5 of Uhlig (2005)

set.seed(12345)
data(uhligdata)

# variable labels for plots
vl <- c("GDP","GDP Deflator","Comm.Pr.Index","Fed Funds Rate",
        "NB Reserves", "Total Reserves")

# estimates the model
model0 <- rfbvar(Y=uhligdata, nlags=12, draws=1000, constant=FALSE,
                  steps=60, shock=4)

# get posterior draws
irfs0 <- model0$IRFS

# plot impulse response functions
irfplot(irfdraws=irfs0, type="mean", labels=vl, save=FALSE, bands=c(0.16, 0.84),
        grid=TRUE, bw=FALSE)

}
 }
 %check the keywords
\keyword{ ts }
\keyword{ models }
