\name{fp.target}
\alias{fp.target}
\title{Fry and Pagan's (2011) median target method}
\description{
  Estimates Fry and Pagan's (2011) median target impulse responses
}
\usage{
fp.target(Y=NULL, irfdraws=NULL, nlags=4, constant=TRUE, type="median",
          labels=colnames(Y), target= TRUE, save=FALSE, legend=TRUE,
          bands=c(0.16, 0.84), grid=TRUE, bw=FALSE, maxit=1000)
}

\arguments{
  \item{Y}{A ts object containing the data series used for estimation; this should be of size \eqn{T \times nvar}{T x nvar}.}
 \item{irfdraws}{A \eqn{draws \times steps \times nvar}{draws x steps x nvar} array of posterior impulse responses.}
 \item{nlags}{The number of lags to include of each variable. This should correspond to the number used to generate \code{irfdraws}. The default value is 4.}
 \item{constant}{A logical statement on whether to include an intercept in the model. This should correspond to the value used to generate \code{irfdraws}. The default is 'TRUE'.}
  \item{type}{A string, either "median" or "mean" response, specifying the type of response to be plotted. This should correspond to the value used to generate \code{irfdraws}. The default is "median".}
  \item{labels}{A list of variable labels for impulse response plots, The default are the variable names of the model handed over by colnames(Y).}
 \item{target}{{A logical statement on whether to include the target impulse response, specified in \code{type}, in the graph. If \code{type} correponds to the value used to generate \code{irfdraws}, this will be identical to the impulse responses of the model \code{irfdraws} is evaluating. The default is 'TRUE'.}}
  \item{save}{A logical statement to save the graph in the current working directory. The default is 'FALSE'.}
    \item{legend}{A logical statement on whether or not to generate a legend at the bottom of the graph. The default is 'TRUE'.}
  \item{bands}{A list of length 2 containing the error bands of the impulse responses. If bands='NULL', only IRFs are plotted. The default is c(0.16, 0.84).}
  \item{grid}{A logical statement on whether or not to generate grid lines in the plots. The default is 'TRUE'.}
  \item{bw}{A logical statement on whether or not to generate black and white or colour graphs. The default is 'FALSE'.}
    \item{maxit}{An integer value for the maximum number of iterations of the minimisation routine. The default value is 1000.}
}%end of arguments

\details{This function estimates the Fry and Pagan's (2011) median target impulse responses and plots the resulting impulse responses with error bands. The function evaluates the output of a sign restricted model specified in \code{irfdraws}, by finding the single response and impulse vector that comes closest to the target impulse response specified in \code{type}. The error bands correspond to the model that has generated \code{irfdraws}.
}
\value{
  The function returns a plot of the median target responses with user-selected percentiles.
}

\references{
Fry, R. and Pagan, A. (2011), "Sign restrictions in structural vector autoregressions: A critical review", Journal of Economic Literature, 49, 938-960.
  }


\author{ Christian Danne}
\note{ Users should consult the reference papers and the package vignette for more information.}

\seealso{\code{\link{rfbvar}}, \code{\link{uhlig.reject}}, \code{\link{uhlig.penalty}}, \code{\link{rwz.reject}}, \code{\link{irfplot}}, \code{\link{fevdplot}}.}
\examples{
\dontrun{
# Replication of Figure 6 of Uhlig (2005)

set.seed(12345)
data(uhligdata)

# variable labels for plots
vl <- c("GDP","GDP Deflator","Comm.Pr.Index","Fed Funds Rate",
        "NB Reserves", "Total Reserves")

# sign restrictions
constr <- c(+4,-3,-2,-5)

# estimates the model
model1 <- uhlig.reject(Y=uhligdata, nlags=12, draws=200, subdraws=200, nkeep=1000,
                      KMIN=1, KMAX=6, constrained=constr, constant=FALSE, steps=60)

# get posterior draws
irfs1 <- model1$IRFS

# estimate Fry and Pagan's MT method
fp.target(Y=uhligdata, nlags=12, irfdraws=irfs1, constant=F, type="median",
            labels=vl, target= TRUE, save=FALSE, legend=TRUE,
            bands=c(0.16, 0.84), grid=TRUE, bw=FALSE, maxit=1000)

}
 }
 %check the keywords
\keyword{ ts }
\keyword{ models }
