\name{surv.land.obs.base}
\alias{surv.land.obs.base}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimates survival using landmark estimation
}
\description{
Estimates the probability of survival past some specified time using landmark estimation for an observational study setting}
\usage{
surv.land.obs.base(tl, dl, tt, landmark, short = NULL, z.cov = NULL, 
ps.weights, weight.perturb = NULL, perturb.ps = FALSE, bw = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tl}{
observed event time of primary outcome, equal to min(T, C) where T is the event time and C is the censoring time.
}
  \item{dl}{
event indicator, equal to I(T<C) where T is the event time and C is the censoring time.
}
  \item{tt}{
the time of interest, function estimates the probability of survival past this time	
}
  \item{landmark}{
the landmark time
}
  \item{short}{
a matrix of intermediate event information, there should be two columns for each intermediate event, the first column contains the observed intermediate event time, equal to min(TS, C) where TS is the event time and C is the censoring time, and the second column contains the event indicator, equal to I(TS<C)}
  \item{z.cov}{
matrix of baseline covariate information}
  \item{ps.weights}{
propensity score (or inverse probability of treatment) weights
}
  \item{weight.perturb}{
a n by x matrix of weights where n = length of tl; used for perturbation-resampling, default is null. If var or conf.int is TRUE and weight.perturb is not provided, the function generates exponential(1) weights. 
}
  \item{perturb.ps}{
TRUE or FALSE indicating whether the weight.perturb matrix includes the perturbed propensity score (or inverse probability of treatment) weights
}
  \item{bw}{
bandwidth used for kernel estimation, default is NULL}
}
\value{
estimate of survival at the specified time
}
\author{
Layla Parast }
\keyword{internal}
\keyword{survival}
\keyword{nonparametric}