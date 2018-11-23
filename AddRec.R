library(magrittr)

# recs <- matrix(ncol = 7, nrow = 0) %>%
#    data.frame() %>%
#    set_colnames(c('date',
#                   'tick',
#                   'price.target',
#                   'lower.eval',
#                   'lower.buy',
#                   'upper.buy',
#                   'upper.eval'))
# 
# save(recs, file = 'recs.RData')

AddRec <- function(
   tick, pt, leval, ueval, lbuy = NA, ubuy = NA, date = Sys.Date()) {
   
   load('recs.RData')
   
   new.entry <- data.frame(
      date         = date %>% as.character %>% as.Date('%Y%m%d'),
      tick         = tick,
      price.target = pt,
      lower.eval   = leval,
      lower.buy    = lbuy,
      upper.buy    = ubuy,
      upper.eval   = ueval)
   
   recs <- rbind(new.entry, recs)
   
   save(recs, file = 'recs.RData')
   save(recs, file = paste0(format(Sys.Date(), '%Y%m%d'), '_recs.RData'))
}

DeleteRec <- function(n=1){
   load('recs.RData')
   recs <- recs[-n,]
   save(recs, file = 'recs.RData')
}