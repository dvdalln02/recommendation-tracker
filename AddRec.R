AddRec <- function(
   tick, pt, leval, ueval, lbuy = NA, ubuy = NA, date = NA) {
   
   library(magrittr)
   
   load('recs.RData')
   
   if(is.na(date)){
      date <- Sys.Date()} else {
         date <- as.Date(date, '%Y%m%d')
      }

   new.entry <- data.frame(
      ddate        = date,
      cdate        = format(date, '%b %d, %Y'),
      tick         = tick,
      price.target = pt,
      lower.eval   = leval,
      lower.buy    = lbuy,
      upper.buy    = ubuy,
      upper.eval   = ueval,
      stringsAsFactors = FALSE)
   
   recs <- rbind(new.entry, recs)
   
   save(recs, file = 'recs.RData')
   save(recs, file = paste0(format(Sys.Date(), '%Y%m%d'), '_recs.RData'))
}

