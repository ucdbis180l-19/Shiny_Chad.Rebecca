
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
    filter(blast_data, pct_ident >= input$pct_ident, pct_ident < input$pct_ident+1) %>%
    ggplot(         aes_string(x="len",
                    y="Score", color="pct_ident")) +
                    geom_point()      })
})

