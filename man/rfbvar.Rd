\name{rfbvar}
\alias{rfbvar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Recursive BVAR with a flat Normal inverted-Wishart prior}
\description{Bayesian vector autoregression (BVAR) model with a flat Normal inverted-Wishart prior. Shocks are identified using a Cholesky decomposition.
}
\usage{
rfbvar(Y=NULL, nlags=4, draws=1000, constant=TRUE, steps=24, shock=1)
}
%- maybe also 'usage' for other objects documented here.

\arguments{
 \item{Y}{A ts object containing the data series used for estimation; this should be of size \eqn{T \times nvar}{T x nvar}.}
  \item{nlags}{The number of lags to include of each variable. The default value is 4.}
  \item{draws}{An integer value for the number of Markov Chain Monte Carlo (MCMC) sampling replications. The default value is 1000.}
  \item{constant}{A logical statement on whether to include an intercept in the model. The default is 'TRUE'.}
  \item{steps}{An integer value for the horizon of the impulse response calculations. The default value is 24.}
  \item{shock}{An integer value specifiying for which shock the impulse responses are calculated. The number corresponds to the variable ordering in Y. The default value is 1.}
}%end of arguments

\details{This function estimates a BVAR model using a flat Normal inverted-Wishart prior. Shocks are identified using a Cholesky decomposition. The ordering in the decomposition corresponds to the ordering of the variables in \eqn{Y}{Y}. The size of the shock is one standard deviation. Posterior draws are only returned for the variable specified in \code{shock}. In order to get the remaining impulse responses, re-run the model for different values of \code{shock} (see example below).
}
\value{
  A list of the posterior draws, which contains:
  \item{IRFS}{A \eqn{draws \times steps \times nvar}{draws x steps x nvar} array of posterior impulse responses.}
   \item{FEVDS}{A \eqn{draws \times steps \times nvar}{draws x steps x nvar} array of posterior forecast error variance decompositions.}
\item{SHOCKS}{A \eqn{draws \times T-nlags}{draws x  (T-nlags)} array of posterior draws of the model's shocks.}
  \item{Bdraws }{A \eqn{draws \times nvar}{draws x  nvar} array of posterior draws of the model coefficients.}
    \item{Sdraws }{A \eqn{draws \times nvar}{draws x  nvar x nvar} array of posterior draws of the model's variance-covariance matrix.}
}

\references{
Canova, F. (2007), Methods for Applied Macroeconomic Research, Princeton, NJ: Princeton University Press.
  }

\author{Christian Danne}
\note{Users should consult the reference papers and the package vignette for more information.}

\seealso{\code{\link{uhlig.reject}}, \code{\link{uhlig.penalty}}, \code{\link{rwz.reject}}, \code{\link{fp.target}}, \code{\link{irfplot}}, \code{\link{fevdplot}}.}
\examples{
\dontrun{
# Replication of Figure 5 of Uhlig (2005)

set.seed(12345)
data(uhligdata)

# variable labels for plots
vl <- c("GDP","GDP Deflator","Comm.Pr.Index","Fed Funds Rate",
        "NB Reserves", "Total Reserves")

# FED funds rate shock
model0 <- rfbvar(Y=uhligdata, nlags=12, draws=1000, constant=FALSE,
                  steps=60, shock=4)

# plot impulse response functions
irfplot(irfdraws=model0$IRFS, type="median", labels=vl, save=FALSE, bands=c(0.16, 0.84),
        grid=TRUE, bw=FALSE)
}
 }
 %check the keywords
\keyword{ ts }
\keyword{ models }
