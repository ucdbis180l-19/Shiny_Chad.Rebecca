library(shiny)
library(tidyverse)
library(stringr)

blast_data <- read_tsv(                  # create proper labled table data
  "plant_vs_worm.blastout_v2.1.gz",      # Adds title to overall project
  col_names=c(                           # starts title name designation
    "query_id",
    "subject_id",
    "pct_ident",
    "len",
    "Mismatches",
    "Gaps",
    "qb",
    "qe",
    "sb",
    "se",
    "E.Score",
    "Score")
  )

shinyServer(                                  # Starts background data tasks
  function(input, output){                    # interface between user and created program
    output$pointPlot <- renderPlot({          # Creates graphical plot
      filter(                                 # User Function-- choose variable data from data frame
        blast_data,                           # --dataframe used
        pct_ident >= input$pct_ident[1],      # --input peramiters
        pct_ident <= input$pct_ident[2]) %>%  # --input peramiters
      ggplot(                                 # Generates general graph
        aes_string(                           # --general graph data specifics
          x="len",                            #   --x axis data pull
          y="Score",                          #   --y axis data pull
          color=input$data)) +                #   --(x,y) point representation data pull
        geom_point() +                        # --generates scatter plot graph
        scale_x_continuous(                   # --x axis vatiation peramiters
          name="Sequence Length",             #   --name of x axis
          limits=c(                           #   --x axis scale range perameters
            0,                                #   
            2500)) +                          #   
        scale_y_continuous(                   # --y axis variation perameters
          name="Alignment Score",             #   --name of x axis
          limits=c(                           #   --x axis scale range perameters
            0,
            4000))
    })
  }
)
