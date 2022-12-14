% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tbl_reg_summary.R
\name{tbl_reg_summary}
\alias{tbl_reg_summary}
\title{Data Summary Table}
\usage{
tbl_reg_summary(
  data,
  by = NULL,
  label = NULL,
  statistic = NULL,
  digits = NULL,
  type = NULL,
  value = NULL,
  missing = c("no", "yes", "ifany"),
  missing_text = NULL,
  sort = NULL,
  percent = NULL,
  include = everything()
)
}
\arguments{
\item{data}{A data frame}

\item{by}{A column name (quoted or unquoted) in \code{data.} Summary statistics
will be calculated separately for each level of the by variable
(e.g. \code{by = trt}). If \code{NULL}, summary statistics are calculated using all observations.}

\item{label}{List of formulas specifying variables labels,
e.g. \code{list(age ~ "Age", stage ~ "Path T Stage")}.  If a
variable's label is not specified here, the label attribute
(\code{attr(data$age, "label")}) is used.  If
attribute label is \code{NULL}, the variable name will be used.}

\item{statistic}{List of formulas specifying types of summary statistics
to display for each variable.}

\item{digits}{List of formulas specifying the number of decimal
places to round summary statistics. If not specified,
\code{tbl_summary} guesses an appropriate number of decimals to round statistics.
When multiple statistics are displayed for a single variable, supply a vector
rather than an integer.  For example, if the
statistic being calculated is \code{"{mean} ({sd})"} and you want the mean rounded
to 1 decimal place, and the SD to 2 use \code{digits = list(age ~ c(1, 2))}. User
may also pass a styling function: \code{digits = age ~ style_sigfig}}

\item{type}{List of formulas specifying variable types.
Accepted values are \code{c("continuous", "continuous2", "categorical", "dichotomous")},
e.g. \code{type = list(age ~ "continuous", female ~ "dichotomous")}.
If type not specified for a variable, the function will default to an appropriate summary type.}

\item{value}{List of formulas specifying the value to display for dichotomous
variables. gtsummary selectors, e.g. \code{all_dichotomous()}, cannot be used with this argument.}

\item{missing}{Indicates whether to include counts of \code{NA} values in the table.
Allowed values are \code{"no"} (never display NA values),
\code{"ifany"} (only display if any NA values), and \code{"always"}
(includes NA count row for all variables). Default is \code{"ifany"}.}

\item{missing_text}{String to display for count of missing observations.
Default is \code{"Unknown"}.}

\item{sort}{List of formulas specifying the type of sorting to perform for
categorical data. Options are \code{frequency} where results are sorted in
descending order of frequency and \code{alphanumeric},
e.g. \code{sort = list(everything() ~ "frequency")}}

\item{percent}{Indicates the type of percentage to return. Must be one of
\code{"column"}, \code{"row"}, or \code{"cell"}. Default is \code{"column"}.}

\item{include}{variables to include in the summary table. Default is \code{everything()}}
}
\value{
a 'tbl_reg_summary' object
}
\description{
Function wraps \code{gtsummary::tbl_summary()} to create a data summary
table often seen in regulatory submissions. Continuous variable summaries
are shown on multiple lines with additional summary statistics and percentages
are shown for categorical variables; precision levels estimated based on values observed.
}
\section{Example Output}{

\if{html}{Example 1}

\if{html}{\figure{tbl_reg_summary_ex1.png}{options: width=65\%}}
}

\examples{
tbl_reg_summary_ex1 <-
  df_patient_characteristics \%>\%
  tbl_reg_summary(by = trt, include = c(marker, status))

}
\seealso{
See \href{https://www.danieldsjoberg.com/gtsummary/reference/tbl_summary.html}{\code{gtsummary::tbl_summary()}} help file

See \href{https://www.danieldsjoberg.com/gtsummary/articles/tbl_summary.html}{vignette} for detailed tutorial
}
