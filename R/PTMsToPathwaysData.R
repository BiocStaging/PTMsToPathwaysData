#' Query PTMsToPathways Data Resources in ExperimentHub
#'
#' Returns ExperimentHub records tagged for PTMsToPathways BRCA data.
#'
#' @return A subsetted \code{ExperimentHub} object.
#' @export
PTMsToPathwaysData <- function() {
  eh <- ExperimentHub::ExperimentHub()
  eh[grepl("PTMsToPathwaysData", eh$Tags)]
}
