\name{surv.land.obs}
\alias{surv.land.obs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimates survival using landmark estimation
}
\description{
Estimates the probability of survival past some specified time using landmark estimation for an observational study setting
}
\usage{
surv.land.obs(tl, dl, tt, landmark, short = NULL, z.cov = NULL, var = FALSE, 
conf.int = FALSE, ps.weights, weight.perturb = NULL, perturb.ps = FALSE, 
perturb.vector = FALSE, bw = NULL)
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
  \item{var}{
TRUE or FALSE; indicates whether a variance estimate for survival is requested, default is FALSE.
}
  \item{conf.int}{
TRUE or FALSE; indicates whether a 95\% confidence interval for survival is requested, default is FALSE.
}
  \item{ps.weights}{
propensity score (or inverse probability of treatment) weights
}
  \item{weight.perturb}{
a n by x matrix of weights where n = length of tl; used for perturbation-resampling, default is null. If var or conf.int is TRUE and weight.perturb is not provided, the function generates exponential(1) weights. 
}
  \item{perturb.ps}{
TRUE or FALSE indicating whether the weight.perturb matrix includes the perturbed propensity score (or inverse probability of treatment) weights
}
  \item{perturb.vector}{
TRUE or FALSE; indicates whether a vector of the perturbed values of the survival estimate is requested, default is FALSE. This argument is ignored if both var and conf.int are FALSE. }
  \item{bw}{
bandwidth used for kernel estimation, default is NULL
}
}
\details{
See documentation for delta.land.obs for details.
}
\value{
A list is returned:
 \item{S.estimate}{the estimate of survival at the time of interest, \eqn{\hat{S}(t) = P(T>t)}}
 \item{S.var }{the variance estimate of \eqn{\hat{S}(t)}; if var = TRUE or conf.int = TRUE}
 \item{conf.int.normal.S}{a vector of size 2; the 95\% confidence interval for \eqn{\hat{S}(t)} based on a normal approximation; if conf.int = TRUE}
 \item{conf.int.quantile.S}{a vector of size 2; the 95\% confidence interval for \eqn{\hat{S}(t)} based on sample quantiles of the perturbed values, described above; if conf.int = TRUE} 
\item{perturb.vector}{a vector of size x where x is the number of columns of the provided weight.perturb matrix (or x=500 if weight.perturb is not provided); the perturbed values of \eqn{\hat{S}(t)}; if perturb.vector = TRUE and either var=TRUE or conf.int = TRUE}
}
\references{
Parast, L. & Griffin B.A. (2017). Landmark Estimation of Survival and Treatment Effects in Observational Studies. Lifetime Data Analysis, 23:161-182.
}
\author{
Layla Parast
}
\examples{
data(example_obs)
W.weight = ps.wgt.fun(treat = example_obs$treat, cov.for.ps = as.matrix(example_obs$Z))	
example_obs.treat = example_obs[example_obs$treat == 1,]
#executable but takes time
#surv.land.obs(tl=example_obs.treat$TL, dl = example_obs.treat$DL, tt=2, landmark = 1, 
#short = cbind(example_obs.treat$TS,example_obs.treat$DS), z.cov = example_obs.treat$Z, 
#ps.weights = W.weight[example_obs$treat == 1])
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{survival}
\keyword{nonparametric}
\keyword{robust}