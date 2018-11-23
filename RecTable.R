RecTable <- function(x){
   library(gridExtra)
   library(grid)
   
   load('recs.RData')
   
   tbl <- subset(recs, recs$tick == x)
   print(tbl)
   
   png(paste0('R:/David/equity research/',
              x,
              '/',
              format(Sys.Date(), '%Y%m%d'), 
              '_', 
              x, 
              '_recHistory.png'),
       width = 8, height = 2, units = 'in', res = 75)
   
   p <- tableGrob(tbl, rows = NULL)
   grid.arrange(p, top = textGrob("Past Recommendations", 
                                  x = unit(0.01, 'npc'), 
                                  just = 'left',
                                  gp = gpar(fontface = 'bold')))
   dev.off()
   
   
}