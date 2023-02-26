tidy_health_records <- function(health_records, record_type = NULL) {

  # error if no type argument
  if (is.null(type)) {
    stop('record_type argument is NULL; a type must be supplied')
  }

  # tidy heart rate
  if (type == 'HKQuantityTypeIdentifierHeartRate') {
    subsetted <- health_records %>%
      dplyr::filter(type == record_type) %>%
      dplyr::mutate(dplyr::across(dplyr::matches('Date'), lubridate::ymd_hms)) %>%
      dplyr::mutate(value = as.numeric(value),
                    start_hour = lubridate::hour(startDate),
                    start_dow = weekdays(startDate, abbreviate = TRUE),
                    start_weekend = dplyr::if_else(start_dow %in% c('Sat', 'Sun'), TRUE, FALSE),
                    start_month = months(startDate, abbreviate = TRUE))

  }

}
