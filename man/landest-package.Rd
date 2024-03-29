\name{landest-package}
\alias{landest-package}
\alias{landest}
\docType{package}
\title{
Survival and treatment effect estimation
}
\description{
Provides functions to estimate the probability of survival past some specified time and the treatment effect, defined as the difference in survival at the specified time, using Kaplan-Meier estimation, landmark estimation for a randomized trial setting, inverse probability of treatment weighted (IPTW) Kaplan-Meier estimation, and landmark estimation for an observational study setting. The landmark estimation approaches provide improved efficiency by incorporating intermediate event information and are robust to model misspecification. The IPTW Kaplan-Meier approach and landmark estimation in an observational study setting approach account for potential selection bias.
}
%~~ An overview of how to use the package, including the most important functions ~~

\author{
Layla Parast
}
\references{
Kaplan, E. L., & Meier, P. (1958). Nonparametric estimation from incomplete observations. Journal of the American Statistical Association, 53(282), 457-481.

Xie, J., & Liu, C. (2005). Adjusted Kaplan-Meier estimator and log-rank test with inverse probability of treatment weighting for survival data. Statistics in Medicine, 24(20), 3089-3110.

Parast, L., Tian, L., & Cai, T. (2014). Landmark Estimation of Survival and Treatment Effect in a Randomized Clinical Trial. Journal of the American Statistical Association, 109(505), 384-394.

Parast, L. & Griffin B.A. (2017). Landmark Estimation of Survival and Treatment Effects in Observational Studies. Lifetime Data Analysis, 23:161-182.

}

\keyword{ package }
\keyword{ survival}

\examples{
data(example_rct)
delta.km(tl=example_rct$TL, dl = example_rct$DL, treat = example_rct$treat, tt=2)
#executable but takes time
#delta.land.rct(tl=example_rct$TL, dl = example_rct$DL, treat = example_rct$treat, tt=2, 
#landmark = 1, short = cbind(example_rct$TS,example_rct$DS), z.cov = as.matrix(example_rct$Z))
data(example_obs)
delta.iptw.km(tl=example_obs$TL, dl = example_obs$DL, treat = example_obs$treat, tt=2,
cov.for.ps = as.matrix(example_obs$Z)) 
#executable but takes time
#delta.land.obs(tl=example_obs$TL, dl = example_obs$DL, treat = example_obs$treat, tt=2, 
#landmark = 1, short = cbind(example_obs$TS,example_obs$DS), z.cov = as.matrix(example_obs$Z),
#cov.for.ps = as.matrix(example_obs$Z))
}
