#' Import Apple Health data
#' @param path chr path to exported data
#' @param type chr type of data; currently only supports 'xml'
#' @return object of classes XMLInternalDocument and XMLAbstractDocument
#' @export
import_health_data <- function(path, type = 'xml') {
  if (type == 'xml') {
    XML::xmlParse(path)
  } else {
    stop('currently only support xml')
  }
}
