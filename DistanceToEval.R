DistancesToEval <- function(){
   
   source('CurrentRecommendations.R')
   
   library(tidyverse)
   
   library(Rblpapi)
   blpConnect()
   
   current.rec <- CurrentRecommendations()
   
   current.rec$px <- current.rec$tick %>% 
      toupper %>%
      paste('US Equity') %>%
      bdp('PX_LAST') %>%
      extract2('PX_LAST')
   
   foo <- current.rec %>%
      select(ends_with('eval')) %>%
      subtract(current.rec$px) %>%
      set_colnames()
      
   current.rec <- current.rec %>%
      arrange(distToEval)
      
   
}