% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lambda_init.R
\name{lambda_init}
\alias{lambda_init}
\title{Initial lambda value of Whittaker smoother}
\usage{
lambda_init(y, param = NULL)
}
\arguments{
\item{y}{Numeric vector}

\item{param}{linear Regression coefficients of lambda simulating Equation.}
}
\description{
This function is only suitable for 16-day EVI time-series.
}
\examples{
library(phenofit)
data("MOD13A1")

dt <- tidy_MOD13.gee(MOD13A1$dt)
st <- MOD13A1$st

sitename <- dt$site[1]
d      <- dt[site == sitename, ] # get the first site data
lambda <- lambda_init(d$y)
}
