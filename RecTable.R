
RecTable <- function(x){
   
   library(dplyr)
   library(magrittr)
   
   load('recs.RData')
   
   xx <- recs %>% 
      select(cdate,
             tick, 
             price.target, 
             lower.eval, 
             lower.buy,
             upper.buy,
             upper.eval) %>%
      filter(tick == x) %>%
      set_rownames(.[,'cdate']) %>%
      select(price.target,
             lower.eval,
             lower.buy,
             upper.buy,
             upper.eval) %>%
      set_colnames(c('Price Target',
                     'Lower Eval',
                     'Lower Buy',
                     'Upper Buy',
                     'Upper Eval'))
   
   return(xx)
}