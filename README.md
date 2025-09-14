
<!-- README.md is generated from README.Rmd. -->

# Extinction Threatens to Cause Morphological and Ecological Homogenization in Sharks

<!-- badges: start -->
<!-- badges: end -->

This GitHub repository contains the code used to analyse all
datasets presented in **Extinction Threatens to Cause Morphological and Ecological Homogenization in Sharks**

by Mohamad Bazzi, Warwick L. Lloyd, Jun Ebersole, Phillip C. Sternes, Jood A. Al Aswad, Jonathan L. Payne

Code written and maintained by Mohamad Bazzi 
<br/>
Contact:
<bazzi@stanford.edu> and <mohammmed_bazzi@hotmail.com>

## Access .Rdata

Larger assets can be accessed from within a report using
[`piggyback`](https://github.com/ropensci/piggyback)!

``` r
# Install and load R package
require(piggyback)

# Create temporary directory and load .Rdata into R environment,
pb_download(file = "default.RData",dest = tempdir(),repo = "mohabazzi/carcharhinus-project",tag = "v.01")
load(file = file.path(tempdir(),"default.RData"))
```
