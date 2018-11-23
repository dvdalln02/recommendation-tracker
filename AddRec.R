library(magrittr)

AddRec <- function(
   tick, pt, leval, ueval, lbuy = NA, ubuy = NA, date = Sys.Date()) {
   
   load('recs.RData')
   
   if(tick %in% names(recs)){
      recs <- ExistingTick(tick, pt, leval, ueval, lbuy, ubuy, date)
   } else {
      recs <- NewTick(tick, pt, leval, ueval, lbuy, ubuy, date)
   }
   
   save(recs, file = 'recs.RData')
   save(recs, file = paste0(format(Sys.Date(), '%Y%m%d'), '_recs.RData'))
}

ExistingTick <- function(tick, pt, leval, ueval, lbuy, ubuy, date){
   
   print('existing')
   
   new.entry <- data.frame(
      date         = date %>% as.Date('%Y%m%d'),
      price.target = pt,
      lower.eval   = leval,
      upper.eval   = ueval,
      lower.buy    = lbuy,
      upper.buy    = ubuy)
   
   recs[[tick]] <- rbind(new.entry, recs[[tick]])
   
   return(recs)
}

NewTick <- function(tick, pt, leval, ueval, lbuy, ubuy, date){
   
   print('new entry')
   
   recs[[tick]] <- data.frame(
      date         = date %>% as.Date('%Y%m%d'),
      price.target = pt,
      lower.eval   = leval,
      upper.eval   = ueval,
      lower.buy    = lbuy,
      upper.buy    = ubuy)
   
   return(recs)
   
}