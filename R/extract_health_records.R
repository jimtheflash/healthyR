#' Extract Records from health_data object
#' @param health_data output from \code{import_health_data()}
#' @return data.frame
#' @export
extract_health_records <- function(health_data) {
  XML:::xmlAttrsToDataFrame(health_data["//Record"])
}
