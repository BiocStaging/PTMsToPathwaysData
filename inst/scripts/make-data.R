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
# func_key.local.path = "path/to/your_function_key.txt"
function_key <- read.table(
  file = func.key.local.path
  header = TRUE,
  sep = "\t",
  comment.char = "#",
  na.strings = "",
  quote = "",
  stringsAsFactors = FALSE,
  fill = TRUE
)

save(function_key)

# Full outputs from PTMsToPathways functions:
# MakeClusterList, MakeCorrelationNetwork, BuildClusterFilteredNetwork, and BuildPathwayCrosstalkNetwork

set.seed(1)
full_MCL_output = MakeClusterList(ex_full_ptm_table)
save(full_MCL_output, file = "full_MCL_output.rda")

fullCCCN.data = MakeCorrelationNetwork(adj.consensus.matrix, ptm.correlation.matrix)
save(fullCCCN.data, file = 'full_CCCN_output.rda')

stringdb.edges = GetSTRINGdb.edges(gene.cccn.matrix, gene.cccn.nodes)

# gm.local.path = "path/to/your_hugo.tsv"
genemania.edges = GetGeneMANIA.edges("unneeded", gene.cccn.nodes, local = TRUE, genemania.local.path = gm.local.path)

# kse.local.path = "path/to/your_kinase_substrate_dataset.txt"
kinsub.edges <- GetKinsub.edges(kse.local.path, gene.cccn.nodes)
network.list = BuildClusterFilteredNetwork(gene.cccn.edges, stringdb.edges, genemania.edges, kinsub.edges)
save(network.list, file = "full_CFN_output.rda")

# bioplanet.local.path = "path/to/your_bioplanet_file.csv"
PCN.data = BuildPathwayCrosstalkNetwork(common.clusters, bioplanet.file)
save(PCN.data, "full_PCN_data.rda")

# BRCA Networks vignette:

#  bioplanet_pathway_June2025.csv is a list of pathways downloaded from BioPlanet.
# bioplanet_pathways.rda is a dataframe of the above.

# BRCA Data Provenance for PTMsToPathwaysData

#  PhosphoDiscoData_mmc9.txt is downloaded from https://pmc.ncbi.nlm.nih.gov/articles/PMC10416063/, Supplementary Table S2

# The rest of the data are processed using functions from the PTMsToPathways package and described in the
# BRCA data vignette there. The following script also

# Process the BRCA phosphoproteomics data for use in the vignette
# phosphodisco.data.path = "path/to/your_local_PhosphoDiscoData_mmc9.txt"
newphos <- utils::read.table(phosphodisco.data.path, header = TRUE,
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
# local.string.db.filepath <- "your/local/string_hs_hugo.tsv"
BRCA_stringdb.edges <- GetSTRINGdb.edges(gene.cccn.edges,
                              gene.cccn.nodes,
                              local                  = TRUE,
                              string.local.path      = local.string.db.filepath
)
save(BRCA_stringdb.edges)

# Get GeneMania data from local file.
# this local file path will need to be changed
# local.genemania.filepath <- "your/local/genemania.tsv"
BRCA_genemania.edges <- GetGeneMANIA.edges (gm.all.edges.path,
                                gene.cccn.nodes,
                                local                = TRUE,
                                genemania.local.path = local.genemania.filepath,
                                gm.interaction.types = c("Pathway", "Physical Interactions", "Predicted"))
save(BRCA_genemania.edges)

# Make PCN
# bioplanet.local.path = "path/to/your_bioplanet_file.csv"
# clusters are already made in brca_clusterlist_data, so we can just use those
common.clusters <- brca_clusterlist_data[[1]]
BRCA_PCN.data <- BuildPathwayCrosstalkNetwork(common.clusters, bioplanet.local.path)
save(BRCA_PCN.data)
