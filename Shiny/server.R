
library(shiny)
library(tidyverse)
library(stringr)
blast_data <- read_tsv("plant_vs_worm.blastout_v2.1.gz",
                       col_names=c("query_id",
                                   "subject_id",
                                   "pct_ident",
                                   "len",
                                   "Mismatches",
                                   "Gaps",
                                   "qb",
                                   "qe",
                                   "sb",
                                   "se",
                                   "E",
                                   "Score"))

shinyServer(function(input, output) {
  output$pointPlot <- renderPlot({
    filter(blast_data, pct_ident >= input$pct_ident, pct_ident < input$pct_ident+1) %>%
    ggplot(         aes_string(x="len", y="Score", fill=input$data)) +
                    geom_point() +
                    scale_x_continuous(name="Sequence Length",limits=c(0,2500)) +
                    scale_y_continuous(name="Alignment Score",limits=c(0,4000))
                    })})
