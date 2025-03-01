% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_comparisons.R
\name{plot_cco}
\alias{plot_cco}
\title{\code{plot_comparisons()} is an alias to \code{plot_comparisons()}}
\usage{
plot_cco(
  model,
  variables = NULL,
  condition = NULL,
  by = NULL,
  newdata = NULL,
  type = "response",
  vcov = NULL,
  conf_level = 0.95,
  wts = NULL,
  comparison = "difference",
  transform = NULL,
  rug = FALSE,
  gray = FALSE,
  draw = TRUE,
  ...
)
}
\arguments{
\item{model}{Model object}

\item{condition}{Conditional predictions
\itemize{
\item Character vector (max length 3): Names of the predictors to display.
\item Named list (max length 3): List names correspond to predictors. List elements can be:
\itemize{
\item Numeric vector
\item Function which returns a numeric vector or a set of unique categorical values
\item Shortcut strings for common reference values: "minmax", "quartile", "threenum"
}
\item 1: x-axis. 2: color/shape. 3: facets.
\item Numeric variables in positions 2 and 3 are summarized by Tukey's five numbers \code{?stats::fivenum}
}}

\item{by}{Marginal predictions
\itemize{
\item Character vector (max length 3): Names of the categorical predictors to marginalize across.
\item 1: x-axis. 2: color. 3: facets.
}}

\item{newdata}{When \code{newdata} is \code{NULL}, the grid is determined by the \code{condition} argument. When \code{newdata} is not \code{NULL}, the argument behaves in the same way as in the \code{predictions()} function.}

\item{type}{string indicates the type (scale) of the predictions used to
compute contrasts or slopes. This can differ based on the model
type, but will typically be a string such as: "response", "link", "probs",
or "zero". When an unsupported string is entered, the model-specific list of
acceptable values is returned in an error message. When \code{type} is \code{NULL}, the
first entry in the error message is used by default.}

\item{vcov}{Type of uncertainty estimates to report (e.g., for robust standard errors). Acceptable values:
\itemize{
\item FALSE: Do not compute standard errors. This can speed up computation considerably.
\item TRUE: Unit-level standard errors using the default \code{vcov(model)} variance-covariance matrix.
\item String which indicates the kind of uncertainty estimates to return.
\itemize{
\item Heteroskedasticity-consistent: \code{"HC"}, \code{"HC0"}, \code{"HC1"}, \code{"HC2"}, \code{"HC3"}, \code{"HC4"}, \code{"HC4m"}, \code{"HC5"}. See \code{?sandwich::vcovHC}
\item Heteroskedasticity and autocorrelation consistent: \code{"HAC"}
\item Mixed-Models degrees of freedom: "satterthwaite", "kenward-roger"
\item Other: \code{"NeweyWest"}, \code{"KernHAC"}, \code{"OPG"}. See the \code{sandwich} package documentation.
}
\item One-sided formula which indicates the name of cluster variables (e.g., \code{~unit_id}). This formula is passed to the \code{cluster} argument of the \code{sandwich::vcovCL} function.
\item Square covariance matrix
\item Function which returns a covariance matrix (e.g., \code{stats::vcov(model)})
}}

\item{conf_level}{numeric value between 0 and 1. Confidence level to use to build a confidence interval.}

\item{wts}{string or numeric: weights to use when computing average contrasts or slopes. These weights only affect the averaging in \verb{avg_*()} or with the \code{by} argument, and not the unit-level estimates themselves. Internally, estimates and weights are passed to the \code{weighted.mean()} function.
\itemize{
\item string: column name of the weights variable in \code{newdata}. When supplying a column name to \code{wts}, it is recommended to supply the original data (including the weights variable) explicitly to \code{newdata}.
\item numeric: vector of length equal to the number of rows in the original data or in \code{newdata} (if supplied).
}}

\item{transform}{A function applied to unit-level adjusted predictions and confidence intervals just before the function returns results. For bayesian models, this function is applied to individual draws from the posterior distribution, before computing summaries.}

\item{rug}{TRUE displays tick marks on the axes to mark the distribution of raw data.}

\item{gray}{FALSE grayscale or color plot}

\item{draw}{\code{TRUE} returns a \code{ggplot2} plot. \code{FALSE} returns a \code{data.frame} of the underlying data.}

\item{...}{Additional arguments are passed to the \code{predict()} method
supplied by the modeling package.These arguments are particularly useful
for mixed-effects or bayesian models (see the online vignettes on the
\code{marginaleffects} website). Available arguments can vary from model to
model, depending on the range of supported arguments by each modeling
package. See the "Model-Specific Arguments" section of the
\code{?marginaleffects} documentation for a non-exhaustive list of available
arguments.}
}
\value{
A \code{ggplot2} object or data frame (if \code{draw=FALSE})
}
\description{
This alias is kept for backward compatibility.
}
\section{Model-Specific Arguments}{


Some model types allow model-specific arguments to modify the nature of
marginal effects, predictions, marginal means, and contrasts. Please report
other package-specific \code{predict()} arguments on Github so we can add them to
the table below.

https://github.com/vincentarelbundock/marginaleffects/issues\tabular{llll}{
   Package \tab Class \tab Argument \tab Documentation \cr
   \code{brms} \tab \code{brmsfit} \tab \code{ndraws} \tab \link[brms:posterior_predict.brmsfit]{brms::posterior_predict} \cr
    \tab  \tab \code{re_formula} \tab \link[brms:posterior_predict.brmsfit]{brms::posterior_predict} \cr
   \code{lme4} \tab \code{merMod} \tab \code{re.form} \tab \link[lme4:predict.merMod]{lme4::predict.merMod} \cr
    \tab  \tab \code{allow.new.levels} \tab \link[lme4:predict.merMod]{lme4::predict.merMod} \cr
   \code{glmmTMB} \tab \code{glmmTMB} \tab \code{re.form} \tab \link[glmmTMB:predict.glmmTMB]{glmmTMB::predict.glmmTMB} \cr
    \tab  \tab \code{allow.new.levels} \tab \link[glmmTMB:predict.glmmTMB]{glmmTMB::predict.glmmTMB} \cr
    \tab  \tab \code{zitype} \tab \link[glmmTMB:predict.glmmTMB]{glmmTMB::predict.glmmTMB} \cr
   \code{mgcv} \tab \code{bam} \tab \code{exclude} \tab \link[mgcv:predict.bam]{mgcv::predict.bam} \cr
   \code{robustlmm} \tab \code{rlmerMod} \tab \code{re.form} \tab \link[robustlmm:rlmerMod-class]{robustlmm::predict.rlmerMod} \cr
    \tab  \tab \code{allow.new.levels} \tab \link[robustlmm:rlmerMod-class]{robustlmm::predict.rlmerMod} \cr
   \code{MCMCglmm} \tab \code{MCMCglmm} \tab \code{ndraws} \tab  \cr
}
}

\examples{
mod <- lm(mpg ~ hp + wt, data = mtcars)
plot_predictions(mod, condition = "wt")

mod <- lm(mpg ~ hp * wt * am, data = mtcars)
plot_predictions(mod, condition = c("hp", "wt"))

plot_predictions(mod, condition = list("hp", wt = "threenum"))

plot_predictions(mod, condition = list("hp", wt = range))

}
\keyword{internal}
