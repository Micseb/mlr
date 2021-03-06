% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/TuneMultiCritControl.R, R/TuneMultiCritControlGrid.R, R/TuneMultiCritControlNSGA2.R, R/TuneMultiCritControlRandom.R
\name{TuneMultiCritControl}
\alias{TuneMultiCritControl}
\alias{TuneMultiCritControlGrid}
\alias{TuneMultiCritControlNSGA2}
\alias{TuneMultiCritControlRandom}
\alias{makeTuneMultiCritControlGrid}
\alias{makeTuneMultiCritControlNSGA2}
\alias{makeTuneMultiCritControlRandom}
\title{Create control structures for multi-criteria tuning.}
\usage{
makeTuneMultiCritControlGrid(same.resampling.instance = TRUE,
  resolution = 10L, log.fun = NULL)

makeTuneMultiCritControlNSGA2(same.resampling.instance = TRUE,
  impute.val = NULL, log.fun = NULL, ...)

makeTuneMultiCritControlRandom(same.resampling.instance = TRUE,
  maxit = 100L, log.fun = NULL)
}
\arguments{
\item{same.resampling.instance}{[\code{logical(1)}]\cr
Should the same resampling instance be used for all evaluations to reduce variance?
Default is \code{TRUE}.}

\item{log.fun}{[\code{function} | \code{NULL}]\cr
Function used for logging. If set to \code{NULL}, the internal default will be used.
Otherwise a function with arguments \code{learner}, \code{resampling}, \code{measures},
\code{par.set}, \code{control}, \code{opt.path}, \code{dob}, \code{x}, \code{y}, \code{remove.nas},
and \code{stage} is expected.
The default displays the performance measures, the time needed for evaluating,
the currently used memory and the max memory ever used before
(the latter two both taken from \code{\link{gc}}).
See the implementation for details.}

\item{impute.val}{[\code{numeric}]\cr
If something goes wrong during optimization (e.g, the learner crashes),
this value is fed back to the tuner, so the tuning algorithm does not abort.
It is not stored in the optimization path, an NA and a corresponding error message are
logged instead.
Note that this value is later multiplied by -1 for maximization measures internally, so you
need to enter a larger positive value for maximization here as well.
Default is the worst obtainable value of the performance measure you optimize for when
you aggregate by mean value, or \code{Inf} instead.
For multi-criteria optimization pass a vector of imputation values, one for each of your measures,
in the same order as your measures.}

\item{...}{[any]\cr
Further control parameters passed to the \code{control} argument of \code{\link[cmaes]{cma_es}} and
\code{tunerConfig} argument of \code{\link[irace]{irace}}.}

\item{maxit}{[\code{integer(1)}]\cr
Number of iterations for random search.
Default is 100.}
}
\value{
[\code{\link{TuneMultiCritControl}}]. The specific subclass is one of
  \code{\link{TuneMultiCritControlGrid}}, \code{\link{TuneMultiCritControlRandom}},
  \code{\link{TuneMultiCritControlNSGA2}}.
}
\description{
The following tuners are available:
\describe{
  \item{makeTuneMultiCritControlGrid}{Grid search. All kinds of parameter types can be handled.
    You can either use their correct param type and \code{resolution},
    or discretize them yourself by always using \code{\link[ParamHelpers]{makeDiscreteParam}}
    in the \code{par.set} passed to \code{\link{tuneParams}}.}
  \item{makeTuneMultiCritControlRandom}{Random search. All kinds of parameter types can be handled.}
  \item{makeTuneMultiCritControlNSGA2}{Evolutionary method \code{\link[mco]{nsga2}}.
    Can handle numeric(vector) and integer(vector) hyperparameters, but no dependencies.
    For integers the internally proposed numeric values are automatically rounded.}
}
}
\seealso{
Other tune_multicrit: \code{\link{plotTuneMultiCritResult}};
  \code{\link{tuneParamsMultiCrit}}
}

