\name{uhlig.reject}
\alias{uhlig.reject}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Uhlig's (2005) rejection method}
\description{
  Identifies stuctural shocks using Uhlig's (2005) rejection method and estimates a
  Bayesian vector autoregression model with a flat Normal inverted-Wishart prior.
}
\usage{
uhlig.reject(Y=NULL, nlags=4, draws=200, subdraws=200, nkeep=1000,
             KMIN=1, KMAX=4, constrained=NULL, constant=TRUE, steps=24)
}
%- maybe also 'usage' for other objects documented here.

\arguments{
  \item{Y}{A ts object containing the data series used for estimation; this should be of size \eqn{T \times nvar}{T x nvar}.}
  \item{nlags}{The number of lags to include of each variable. The default value is 4.}
  \item{draws}{An integer value for the number of Markov Chain Monte Carlo (MCMC) sampling replications. The default value is 200.}
  \item{subdraws}{An integer value for the number of sub-draws over the rejection routine. The default value is 200.}
  \item{nkeep}{An integer value for the number of desired MCMC draws that meet the imposed sign restrictions. The default value is 1000.}
  \item{KMIN}{An integer value for the first period of the impulse responses to which the sign restrictions apply. The default value is 1.}
  \item{KMAX}{An integer value for the last period of the impulse responses to which the sign restrictions apply. The default value is 4.}
    \item{constrained}{A list of sign restrictions of length \eqn{<= nvar}{<= nvar}. The first entry of the list characterises the shock of interest. You MUST specify a sign restriction for the shock of interest.}
  \item{constant}{A logical statement on whether to include an intercept in the model. The default is 'TRUE'.}
  \item{steps}{An integer value for the horizon of the impulse response calculations. The default value is 24.}
}%end of arguments

\details{ This function estimates a BVAR model using a flat Normal inverted-Wishart prior. Structural shocks are identified using Uhlig's (2005) rejection method. The size of the shock is one standard deviation. \code{uhlig.reject} is a partial identification method. Only one shock of interest is identified at a time by the sign restrictions provided. The MCMC routine stops when either enough draws have been found that satisfy the sign restrictions (specified in \code{nkeep}) or the maximum number of \code{draws} has been reached.

Sign restrictions are specified as follows: The first entry of \code{constrained} is the shock of interest corresponding to the column of the variable in \eqn{Y}{Y}. You MUST specify a sign restriction for the shock of interest on itself. Restrictions of the shock of interest on other variables are optional. The sign of the entry in the list corresponds to the direction of the sign, e.g. >0 or <0. Variables that are not listed in \code{constrained} remain unconstrained. In the example below, the shock of interest is the 4th variable (FED funds rate) in \eqn{Y}{Y}. The sign indicates that the effect on itself is contrained to be positive. The responses of the 2nd, 3rd, and 5th variable in the model to a positive FED funds rate shock is restricted to be negative. The responses of the 1st and 6th variable are unconstrained.
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
   Uhlig, H. (2005), "What Are the Effects of Monetary Policy on Output? Results from an Agnostic Identification Procedure", Journal of Monetary Economics, 52, 381-419.
  }

\author{ Christian Danne}
\note{ Users should consult the reference papers and the package vignette for more information.}

\seealso{\code{\link{rfbvar}}, \code{\link{uhlig.penalty}}, \code{\link{rwz.reject}}, \code{\link{fp.target}}, \code{\link{irfplot}}, \code{\link{fevdplot}}.}
\examples{
\dontrun{
# Replication of Figure 6 of Uhlig (2005)

set.seed(12345)
data(uhligdata)

# variable labels for plots
vl <- c("GDP","GDP Deflator","Comm.Pr.Index","Fed Funds Rate",
        "NB Reserves", "Total Reserves")

# sign restrictions
# shock of interest enters first.
# you MUST provide a restriction for the shock of interest
# restriction variable 4 is >0
# 2nd, 3rd, and 5th variable are <0.
# 1st and 6th variable are unrestricted
constr <- c(+4,-3,-2,-5)

# estimates the model
model1 <- uhlig.reject(Y=uhligdata, nlags=12, draws=200, subdraws=200, nkeep=1000, KMIN=1,
                        KMAX=6, constrained=constr, constant=FALSE, steps=60)

# get posterior draws
irfs1 <- model1$IRFS

# plot impulse response functions
irfplot(irfdraws=irfs1,type="median", labels=vl, save=FALSE, bands=c(0.16, 0.84),
        grid=TRUE, bw=FALSE)

}
 }
 %check the keywords
\keyword{ ts }
\keyword{ models }
