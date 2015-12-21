\name{uhligdata}
\alias{uhligdata}
\docType{data}
\title{
Monthly US Macroeconomic Time Series
}
\description{
Contains monthly US macro data used by Uhlig (2005) for Real GDP (y), GDP deflator (yd), commodity price index (p), FED funds rate (i), non-borrowed reserves (rnb), and total reserves (rt) from 1965:1 - 2003:12. The data has been downloaded from the RATS website. Original data for the commodity price index was taken from Global Financial Data. The remaining data was taken from FRED. Quarterly time series have been interpolated to monthly frequency using the interpolation methods by Bernanke et al. (1997) and Bernanke and Mihov (1998). For more details see Uhlig (2005).
}

\format{
Multiple time series (\code{mts}) object, series names: "y", "yd", "p", "i", "rnb", "rt". Variables in the data, except the FED funds rate, are the log of the original data series times 100 in line with the transformations of the data of the original paper.
}

\source{Data downloaded from the RATS website:

\url{https://www.estima.com/procs_perl/uhligjme2005.zip}.

Accessed: 2015-11-27.

}

\references{
Bernanke, B.S., Gertler, M., and Watson, M. (1997), "Systematic Monetary Policy and the Effects of Oil Price Shocks", Brookings Papers on Economic Activity, 1, 91-157.

Bernanke, B.S. and Mihov, I. (1998), "Measuring Monetary Policy", Quarterly Journal of Economics, 113, 869-902.

Uhlig, H. (2005), "What Are the Effects of Monetary Policy on Output? Results from an Agnostic Identification Procedure", Journal of Monetary Economics, 52, 381-419.
  }

\author{ Christian Danne}
\note{Users should consult the reference papers and the package vignette for more information.}


\examples{
\dontrun{

# Load and plot data
data(uhligdata)
plot(uhligdata)

}
}



\keyword{datasets}
