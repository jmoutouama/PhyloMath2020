
#Function to get a tree from a group or taxa from rotl the Open Tree of Life data by Brian C. O’Meara

GetTreeFromOpenTree <- function(taxon) {
  library(rotl)
  library(ape)
  
  taxon.id <- tnrs_match_names(taxon)$ott_id
  
  # Now get Open Tree's current best estimate of the phylogeny for the group
  # They call this the tree of life; we can get the subtree for just this group.
  taxon.tree <- tol_subtree(ott_id=taxon.id)
  
  # Let's plot the tree:
  plot.phylo(taxon.tree, type="fan", cex=0.2)
  print(paste("The taxon tree has ", Ntip(taxon.tree), " terminals and ",
              Nnode(taxon.tree), " internal nodes out of ",Ntip(taxon.tree)-2,
              " possible, which means it is ",
              round(100*(Nnode(taxon.tree)-1)/(Ntip(taxon.tree)-3), 2),
              "% resolved", sep=""))
  
  }
  

