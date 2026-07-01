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
  "BRCA cluster list data",
  "Cluster list outputs generated from PTMsToPathways::MakeClusterList() on BRCA phosphoproteomics measurements",
  "3.24",
  "NA",
  "RDA",
  "https://zenodo.org/records/21085648/files/brca_clusterlist_data.rda",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "list",
  "Rda",
  "https://zenodo.org/",
  "records/21085648/files/brca_clusterlist_data.rda",
  "ExperimentHub, PTMsToPathwaysData, BRCA, clustering, phosphoproteomics"
)

md[nrow(md) + 1, ] <- list(
  "BRCA CCCN data",
  "Consensus co-cluster correlation network outputs generated from PTMsToPathways::MakeCorrelationNetwork() on BRCA cluster data",
  "3.24",
  "NA",
  "RDA",
  "https://zenodo.org/records/21085648/files/brca_CCCN_data.rda",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "list",
  "Rda",
  "https://zenodo.org/",
  "records/21085648/files/brca_CCCN_data.rda",
  "ExperimentHub, PTMsToPathwaysData, BRCA, network, phosphoproteomics"
)

md[nrow(md) + 1, ] <- list(
  "BRCA pathway crosstalk data",
  "Pathway crosstalk network objects derived PTMsToPathways::PathwayCrosstalkNetwork() from BRCA PTM clusters and Bioplanet pathways",
  "3.24",
  "NA",
  "RDA",
  "https://zenodo.org/records/21085648/files/BRCA_PCN.data.rda",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "list",
  "Rda",
  "https://zenodo.org/",
  "records/21085648/files/BRCA_PCN.data.rda",
  "ExperimentHub, PTMsToPathwaysData, BRCA, pathway, crosstalk"
)

md[nrow(md) + 1, ] <- list(
  "BRCA mass spectrometry data",
  "Shraink et al. (2022), Supplemental Table S2",
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
  "records/21085648/files/PhosphoDiscoData_mmc9.txt",
  "ExperimentHub, PTMsToPathwaysData, BRCA, phosphoproteomics"
)

md[nrow(md) + 1, ] <- list(
  "BRCA genemania edges",
  "Cluster-filtered GeneMania edges from BRCA clusters",
  "3.24",
  "NA",
  "RDA",
  "https://zenodo.org/records/21085648/files/BRCA_genemania.edges.rda",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "data.frame",
  "Rda",
  "https://zenodo.org/",
  "records/21085648/files/BRCA_genemania.edges.rda",
  "ExperimentHub, PTMsToPathwaysData, BRCA, network, phosphoproteomics"
)

md[nrow(md) + 1, ] <- list(
  "BRCA stringdb edges",
  "Cluster-filtered StringDB edges from BRCA clusters",
  "3.24",
  "NA",
  "RDA",
  "https://zenodo.org/records/21085648/files/BRCA_stringdb.edges.rda",
  1.00,
  "Homo sapiens",
  "9606",
  TRUE,
  "University of Montana Applied Algorithms Lab",
  "Lucia Williams <lucia.williams@umt.edu>",
  "data.frame",
  "Rda",
  "https://zenodo.org/",
  "records/21085648/files/BRCA_stringdb.edges.rda",
  "ExperimentHub, PTMsToPathwaysData, BRCA, network, phosphoproteomics"
)

utils::write.csv(md, metadata_path, row.names = FALSE, quote = TRUE)