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

# ExistingTick <- function(tick, pt, leval, ueval, lbuy, ubuy, date){
#    
#    print('existing')
#    
#    new.entry <- data.frame(
#       date         = date %>% as.Date('%Y%m%d'),
#       price.target = pt,
#       lower.eval   = leval,
#       upper.eval   = ueval,
#       lower.buy    = lbuy,
#       upper.buy    = ubuy)
#    
#    recs <- rbind(new.entry, recs[[tick]])
#    
#    return(recs)
# }
# 
# NewTick <- function(tick, pt, leval, ueval, lbuy, ubuy, date){
#    
#    print('new entry')
#    
#    recs[[tick]] <- data.frame(
#       date         = date %>% as.Date('%Y%m%d'),
#       price.target = pt,
#       lower.eval   = leval,
#       upper.eval   = ueval,
#       lower.buy    = lbuy,
#       upper.buy    = ubuy)
#    
#    return(recs)
#    
# }