% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xml2_funs.R
\name{xml2_extract_health_records}
\alias{xml2_extract_health_records}
\title{Extract records from health data}
\usage{
xml2_extract_health_records(health_data, step_size = 1e+05)
}
\arguments{
\item{health_data}{list from \code{import_health_data()}}

\item{step_size}{num how many records to grab each step}
}
\value{
tibble of health records
}
\description{
Extract records from health data
}
