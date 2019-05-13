#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

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
  titlePanel("Plant Vs Worm BLAST"),
    sidebarLayout(
      sidebarPanel(
        sliderInput
        (
          "pct_ident",
          "Percent Identity:",
          min = 14,
          max = 100,
          value = 30)
        ),
  sidebarLayout(
    sidebarPanel(
      radioButtons("E",
                  "E-value:", 
                  c("A", "B","C"))
    ),
    
    mainPanel(
      plotOutput("pointPlot")
    )
  )
)))

  