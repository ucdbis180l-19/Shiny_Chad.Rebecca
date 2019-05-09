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

shinyUI(fluidPage(
  titlePanel("Old Faithful Geyser Data"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("Score",
                  "Score:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    mainPanel(
      plotOutput("boxPlot")
    )
  )
))

  