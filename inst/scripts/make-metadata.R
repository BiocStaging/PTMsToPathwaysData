# Build metadata rows explicitly to match inst/extdata/metadata.csv exactly.
metadata_path <- file.path("inst", "extdata", "metadata.csv")
md <- data.frame(
  Title = character(0),
  Description = character(0),
  BiocVersion = character(0),
  Genome = character(0),
  SourceType = character(0),
  SourceUrl = character(0),
  SourceVersion = character(0),
  Species = character(0),
  TaxonomyId = character(0),
  Coordinate_1_based = character(0),
  DataProvider = character(0),
  Maintainer = character(0),
  RDataClass = character(0),
  DispatchClass = character(0),
  Location_Prefix = character(0),
  RDataPath = character(0),
  Tags = character(0),
  stringsAsFactors = FALSE
)

md[nrow(md) + 1, ] <- list(
  "Full PTM intensity data",
  "Table of PTM intensities for over 9000 PTMs across 69 experimental conditions used in the PTMsToPathways getting started vignette",
  "3.24",
  "NA",
  "TXT",
  "https://zenodo.org/records/21140693/files/AlldataPTMs.txt",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "data.frame",
  "FilePath",
  "https://zenodo.org/",
  "records/21140693/files/AlldataPTMs.txt",
  "ExperimentHub, PTMsToPathwaysData, PTM, getting started, phosphoproteomics"
)

md[nrow(md) + 1, ] <- list(
  "Full PTM intensity table",
  "Data frame version of AlldataPTMs.txt for the PTMsToPathways getting started vignette",
  "3.24",
  "NA",
  "RDA",
  "https://zenodo.org/records/21140693/files/ex_full_ptm_table.rda",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "data.frame",
  "Rda",
  "https://zenodo.org/",
  "records/21140693/files/ex_full_ptm_table.rda",
  "ExperimentHub, PTMsToPathwaysData, PTM, getting started, phosphoproteomics"
)

md[nrow(md) + 1, ] <- list(
  "Cleaned phosphoproteomics input data",
  "Mapped phosphoproteomics intensities used as raw input for the PTMsToPathways raw data processing vignette",
  "3.24",
  "NA",
  "TXT",
  "https://zenodo.org/records/21140693/files/phospho_cleaned_mapped.txt",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "data.frame",
  "FilePath",
  "https://zenodo.org/",
  "records/21140693/files/phospho_cleaned_mapped.txt",
  "ExperimentHub, PTMsToPathwaysData, PTM, preprocessing, phosphoproteomics"
)

md[nrow(md) + 1, ] <- list(
  "Processed phosphoproteomics data",
  "Data frame version of phospho_cleaned_mapped.txt for the PTMsToPathways raw data processing vignette",
  "3.24",
  "NA",
  "RDA",
  "https://zenodo.org/records/21140693/files/newphos.rda",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "data.frame",
  "Rda",
  "https://zenodo.org/",
  "records/21140693/files/newphos.rda",
  "ExperimentHub, PTMsToPathwaysData, PTM, preprocessing, phosphoproteomics"
)

md[nrow(md) + 1, ] <- list(
  "Function key data",
  "Gene-to-function mapping used in the PTMsToPathways Cytoscape graphing vignette",
  "3.24",
  "NA",
  "TXT",
  "https://zenodo.org/records/21140693/files/FunctionKey.txt",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "data.frame",
  "FilePath",
  "https://zenodo.org/",
  "records/21140693/files/FunctionKey.txt",
  "ExperimentHub, PTMsToPathwaysData, Cytoscape, function mapping, network"
)

md[nrow(md) + 1, ] <- list(
  "Function key table",
  "Data frame version of FunctionKey.txt for the PTMsToPathways Cytoscape graphing vignette",
  "3.24",
  "NA",
  "RDA",
  "https://zenodo.org/records/21140693/files/function_key.rda",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "data.frame",
  "Rda",
  "https://zenodo.org/",
  "records/21140693/files/function_key.rda",
  "ExperimentHub, PTMsToPathwaysData, Cytoscape, function mapping, network"
)

md[nrow(md) + 1, ] <- list(
  "BioPlanet pathway file",
  "Pathway list from BioPlanet used in the PTMsToPathways BRCA Networks vignette",
  "3.24",
  "NA",
  "CSV",
  "https://zenodo.org/records/21140693/files/bioplanet_pathway_June2025.csv",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "data.frame",
  "FilePath",
  "https://zenodo.org/",
  "records/21140693/files/bioplanet_pathway_June2025.csv",
  "ExperimentHub, PTMsToPathwaysData, BRCA, pathway, BioPlanet"
)

md[nrow(md) + 1, ] <- list(
  "BioPlanet pathway table",
  "Data frame version of bioplanet_pathway_June2025.csv for the PTMsToPathways BRCA Networks vignette",
  "3.24",
  "NA",
  "RDA",
  "https://zenodo.org/records/21140693/files/bioplanet_pathways.rda",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "data.frame",
  "Rda",
  "https://zenodo.org/",
  "records/21140693/files/bioplanet_pathways.rda",
  "ExperimentHub, PTMsToPathwaysData, BRCA, pathway, BioPlanet"
)

md[nrow(md) + 1, ] <- list(
  "BRCA cluster list data",
  "Cluster list outputs generated from PTMsToPathways::MakeClusterList() on BRCA phosphoproteomics measurements",
  "3.24",
  "NA",
  "RDA",
  "https://zenodo.org/records/21140693/files/brca_clusterlist_data.rda",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "list",
  "Rda",
  "https://zenodo.org/",
  "records/21140693/files/brca_clusterlist_data.rda",
  "ExperimentHub, PTMsToPathwaysData, BRCA, clustering, phosphoproteomics"
)

md[nrow(md) + 1, ] <- list(
  "BRCA CCCN data",
  "Consensus co-cluster correlation network outputs generated from PTMsToPathways::MakeCorrelationNetwork() on BRCA cluster data",
  "3.24",
  "NA",
  "RDA",
  "https://zenodo.org/records/21140693/files/brca_CCCN_data.rda",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "list",
  "Rda",
  "https://zenodo.org/",
  "records/21140693/files/brca_CCCN_data.rda",
  "ExperimentHub, PTMsToPathwaysData, BRCA, network, phosphoproteomics"
)

md[nrow(md) + 1, ] <- list(
  "BRCA pathway crosstalk data",
  "Pathway crosstalk network objects derived PTMsToPathways::PathwayCrosstalkNetwork() from BRCA PTM clusters and Bioplanet pathways",
  "3.24",
  "NA",
  "RDA",
  "https://zenodo.org/records/21140693/files/BRCA_PCN.data.rda",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "list",
  "Rda",
  "https://zenodo.org/",
  "records/21140693/files/BRCA_PCN.data.rda",
  "ExperimentHub, PTMsToPathwaysData, BRCA, pathway, crosstalk"
)

md[nrow(md) + 1, ] <- list(
  "BRCA mass spectrometry data",
  "Schraink et al. (2022) Supplemental Table S2",
  "3.24",
  "NA",
  "XLS/XLSX",
  "https://pmc.ncbi.nlm.nih.gov/articles/PMC10416063/",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "data.frame",
  "FilePath",
  "https://zenodo.org/",
  "records/21140693/files/PhosphoDiscoData_mmc9.txt",
  "ExperimentHub, PTMsToPathwaysData, BRCA, phosphoproteomics"
)

md[nrow(md) + 1, ] <- list(
  "BRCA genemania edges",
  "Cluster-filtered GeneMania edges from BRCA clusters",
  "3.24",
  "NA",
  "RDA",
  "https://zenodo.org/records/21140693/files/BRCA_genemania.edges.rda",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "data.frame",
  "Rda",
  "https://zenodo.org/",
  "records/21140693/files/BRCA_genemania.edges.rda",
  "ExperimentHub, PTMsToPathwaysData, BRCA, network, phosphoproteomics"
)

md[nrow(md) + 1, ] <- list(
  "BRCA stringdb edges",
  "Cluster-filtered StringDB edges from BRCA clusters",
  "3.24",
  "NA",
  "RDA",
  "https://zenodo.org/records/21140693/files/BRCA_stringdb.edges.rda",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "data.frame",
  "Rda",
  "https://zenodo.org/",
  "records/21140693/files/BRCA_stringdb.edges.rda",
  "ExperimentHub, PTMsToPathwaysData, BRCA, network, phosphoproteomics"
)

utils::write.csv(md, metadata_path, row.names = FALSE, quote = TRUE)