# this file contains descriptions and/or scripts to create the data files in the
# PTMsToPathwaysData package. The data files are used in the vignettes of the
# PTMsToPathways package and organized by which PTMsToPathways vignette they are
# used in.

# Getting started with PTMsToPathways vignette:
#   AlldataPTMs.txt is a table of PTM intensities for over 9,000 PTMs and 69 experimental conditions.
#    ex_full_ptm_table.rda is a dataframe of the above file, created like so:
ex_full_ptm_table <- utils::read.table("AlldataPTMs.txt", sep = "\t", skip = 0,
                                 fill = T, quote = "\"", dec = ".",
                                 comment.char = "", stringsAsFactors = F)
save(ex_full_ptm_table)

# Raw data processing vignette:

# phospho_cleaned_mapped.txt is the output of a mass spectrometry experiment measuring PTM intensities.
# file_path <- "path/to/your/file.txt"
newphos <- utils::read.table(file_path, sep = "\t", skip = 0, header = TRUE,
                             blank.lines.skip = T, fill = T, quote = "\"", dec = ".",
                             comment.char = "", stringsAsFactors = F)
save(newphos)

# Cytoscape graphing vignette:

#   FunctionKey.txt is a mapping from genes to their functions.
#    function_key.rda is a dataframe of the above file.
function_key <- read.table(
  file = "inst/extdata/FunctionKey.txt",
  header = TRUE,
  sep = "\t",
  comment.char = "#",
  na.strings = "",
  quote = "",
  stringsAsFactors = FALSE,
  fill = TRUE
)

save(function_key)

# BRCA Networks vignette:

#  bioplanet_pathway_June2025.csv is a list of pathways downloaded from BioPlanet.
# bioplanet_pathways.rda is a dataframe of the above.

# BRCA Data Provenance for PTMsToPathwaysData

#  PhosphoDiscoData_mmc9.txt is downloaded from https://pmc.ncbi.nlm.nih.gov/articles/PMC10416063/, Supplementary Table S2

# The rest of the data are processed using functions from the PTMsToPathways package and described in the 
# BRCA data vignette there. The following script also 

# Process the BRCA phosphoproteomics data for use in the vignette
file_path <- system.file("extdata", "PhosphoDiscoData_mmc9.txt", package = "PTMsToPathways")
newphos <- utils::read.table(file_path, header = TRUE,
                               stringsAsFactors = FALSE, sep = "\t", comment.char = "#",
                               na.strings = "", quote = "", fill = TRUE)
 newphos$Amino.Acid <- sapply(newphos$variable_sites_names, function(x) substring (x, 1, 1))
 newphos$Site <- trimws(substring(newphos$variable_sites_names, 2))
 newphos$Site <- sub("[a-z]$", "", newphos$Site)
  newphos$Peptide.Name <- mapply(
   name.peptide, genes = newphos$gene_symbol,
   sites =  newphos$Site, aa = newphos$Amino.Acid)
phosdata <- newphos[, 3:ncol(newphos), ]
rownames(phosdata) <- newphos$Peptide.Name
phosdata <- phosdata[, !(names(phosdata) %in% c("gene_symbol", "variable_sites_names", "Amino.Acid", "Site", "Peptide.Name"))]
ptmtable <- phosdata
set.seed(88)
brca_clusterlist_data <- MakeClusterList(ptmtable,
                                    keeplength = 3, toolong = 3.5)
brca_CCCN_data <- MakeCorrelationNetwork(adj.consensus.matrix,
                                    ptm.correlation.matrix)

save(brca_clusterlist_data)
save(brca_CCCN_data)

# Get stringDB data from local file.
# brca_CCCN_data is the data just created above
gene.cccn.edges <- brca_CCCN_data[[2]]
gene.cccn.nodes <- brca_CCCN_data[[3]]
# this local file path will need to be changed
string_db_filepath <- "~/Downloads/string_hs_hugo.tsv"
BRCA_stringdb.edges <- GetSTRINGdb.edges(gene.cccn.edges,
                              gene.cccn.nodes,
                              local                  = TRUE,
                              string.local.path      = string_db_filepath
)
save(BRCA_stringdb.edges)

# Get GeneMania data from local file.
genemania_db_filepath <- "~/Downloads/hs_interactions_hugo.tsv"
BRCA_genemania.edges <- GetGeneMANIA.edges (gm.all.edges.path,
                                gene.cccn.nodes,
                                local                = TRUE,
                                genemania.local.path = genemania_db_filepath,
                                gm.interaction.types = c("Pathway", "Physical Interactions", "Predicted"))
save(BRCA_genemania.edges)

# Make PCN
bioplanet.file <- system.file("extdata", "bioplanet_pathway_June2025.csv", package = "PTMsToPathways")
# clusters are already made in brca_clusterlist_data, so we can just use those
common.clusters <- brca_clusterlist_data[[1]]
BRCA_PCN.data <- BuildPathwayCrosstalkNetwork(common.clusters, bioplanet.file)
save(BRCA_PCN.data)

