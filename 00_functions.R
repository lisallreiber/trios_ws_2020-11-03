# functions

#' 
#' data = input data
#' var_name = string that specifies the variable name
#' tidy = if TRUE: output is a tibble, if FALSE: output is just printed
show_table <- function(.data = igene_lab, var_name, tidy = TRUE){
  
  # requires tables_list and tables_list_l
  index <- which(names(tables_list) == {{var_name}})
  outcome <- paste0("[", {{var_name}}, "] ", names(tables_list_l[index]))
  
  if (tidy == FALSE) {
    names(tables_list_l[[index]])[1] <- outcome
    tables_list_l[[index]]
  } else {
    sym_outcome <- sym(outcome)
    tables_list_l[[index]] %>%
      as_tibble() %>%
      select(!!outcome := 1, everything())
  }
}

#' function that specifically imports soep data from a pre-defines local path to the soep data
#' output:  imported soep dataset
#' path = character vector with the relative path to the soep data
#' dataset = string with ending of the datafile (e.g. .dta)
#' test = option (default false) to import a test dataset with a smaller amount of rows
#' size = specification of the number of rows to import (default = 500)
import_soep <- function(dataset = "ppath.dta", path = path_soepisv34, test = FALSE, size = 500) {
  
  imported_data <- rio::import(paste0({{path}}, {{dataset}}))
  
  if (test == TRUE){
    test_data <- imported_data %>% filter(row_number() <=  size)
    return(test_data)
  }
  return(imported_data)
}

#' tidylog_on
#' wrapper for the tidylog on and off options
tidylog_on <- function(){
    options("tidylog.display" = NULL)
}
  

tidylog_off <- function(){
    options("tidylog.display" = list())
}  
