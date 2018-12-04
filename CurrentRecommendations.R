######################################################################
######################################################################
# Returns a data frame of the most recent recommendation on buy list
# securities
######################################################################
######################################################################

CurrentRecommendations <- function(){
   
   library(magrittr)
   library(tidyverse)
   
   load('recs.RData')
   load('buy.list.RData')
   
   most.recent <- recs %>%
      arrange(tick, desc(ddate)) %>%
      distinct(tick, .keep_all = TRUE) %>%
      arrange(tick) %>%
      filter(tick %in% buy.list)
   
   return(most.recent)
   
}