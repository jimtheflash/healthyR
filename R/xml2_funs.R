#' read health data
#' @param path chr path to xml file
#' @param type chr file type; default 'xml' and only supports xml for now
#' @return xml document; see \code{xml2::read_xml()}
xml2_import_health_data <- function(path, type = 'xml') {
  if (type == 'xml') {
    health_data <- xml2::read_xml(path)
  } else {
    stop('only supports xml')
  }

  return(health_data)
}

#' Extract records from health data
#' @param health_data list from \code{import_health_data()}
#' @param step_size num how many records to grab each step
#' @return tibble of health records
xml2_extract_health_records <- function(health_data, step_size = 100000) {

  recs <- xml2::xml_find_all(health_data, "//Record")
  vecs <- lapply(recs, xml2::xml_attrs)

  # loop through all the vectors and parse
  # TODO: find a more efficient way
  output <- list()
  for (i in seq(1, length(vecs), step_size)) {

    first_record <- i
    last_record <- i + step_size - 1

    if (last_record > length(vecs)) {
      last_record <- length(vecs)
    }
    # TODO: add verbose flag
    message(Sys.time(), ' grabbing records ', first_record, ' through ', last_record)

    rec_indices <- first_record:last_record

    subset_recs <- dplyr::bind_rows(vecs[rec_indices])
    output <- dplyr::bind_rows(output, subset_recs)

  }

  return(output)

}
