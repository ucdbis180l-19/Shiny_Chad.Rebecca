
library(shiny)
library(tidyverse)
library(stringr)
blast_data <- read_tsv("plant_vs_worm.blastout_v2.1.gz",
                       col_names=c("query_id",
                                   "subject_id",
                                   "pct_ident",
                                   "len",
                                   "mis",
                                   "gaps",
                                   "qb",
                                   "qe",
                                   "sb",
                                   "se",
                                   "E",
                                   "Score"))

shinyServer(function(input, output) {
  output$pointPlot <- renderPlot({
    pl <- ggplot(data = blast_data,

                 
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 aes_string(x="len",
                            y="Score",
                            color=input$pct_ident
                 )
    )
    
     # draw the boxplot for the specified trait
           pl + geom_point()
  })
})

