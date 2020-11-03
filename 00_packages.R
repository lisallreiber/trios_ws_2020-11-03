require(devtools) || install.packages("devtools")
library("devtools")

require(pacman) || install.packages("pacman")
library("pacman") 

# packages from github
# require(formr) || devtools::install_github("rubenarslan/formr")

pacman::p_load(
  codebook, # package to generate automated codebooks
  forcats, # working with factors
  here, # for working with paths within r-projects
  janitor, # home of the tabyl function, package for data cleanign and exploring
  knitr, # markdown related package
  labelled, # package for working with labelled data
  rmarkdown, # markdown related package
  sjlabelled, # package for working with labelled data
  stringr, # package for working manupulation of strings
  rio, # package for importing data
  tidyr, # package for data wrangling
  usethis, #package to manage/resolve package conflicts
  ggplot2, # package for data visualization
  dplyr, # package to wrangle data
  tidylog) # prints helpful descriptions when you wrangle data

