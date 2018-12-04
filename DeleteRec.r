DeleteRec <- function(n=1){
   load('recs.RData')
   recs <- recs[-n,]
   save(recs, file = 'recs.RData')
}