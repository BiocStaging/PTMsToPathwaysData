#' PTMsToPathwaysData: ExperimentHub Data for PTMsToPathways
#'
#' Companion ExperimentHub data package for PTMsToPathways. It provides raw,
#' intermediate, and derived data resources used in the PTMsToPathways
#' vignettes and examples.
#'
#' Available data resources include:
#' 
#' Getting started vignette:
#' - `AlldataPTMs.txt` and `ex_full_ptm_table.rda`
#'
#' Raw data processing vignette:
#' - `phospho_cleaned_mapped.txt` and `newphos.rda`
#'
#' Cytoscape graphing vignette:
#' - `FunctionKey.txt` and `function_key.rda`
#'
#' BRCA Networks vignette:
#' - `bioplanet_pathway_June2025.csv` and `bioplanet_pathways.rda`
#' - `PhosphoDiscoData_mmc9.txt`
#' - `brca_clusterlist_data.rda`
#' - `brca_CCCN_data.rda`
#' - `BRCA_stringdb.edges.rda`
#' - `BRCA_genemania.edges.rda`
#' - `BRCA_PCN.data.rda`
#'
#' Use [PTMsToPathwaysData()] to query the ExperimentHub records registered by
#' this package.
#'
#' @examples
#' eh <- ExperimentHub::ExperimentHub()
#' # can be fixed when PTMsToPathwaysData is on Bioconductor
#' # query(eh, "PTMsToPathwaysData")
#'
#' @name PTMsToPathwaysData-package
#' @docType package
#' @keywords package
"_PACKAGE"