#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
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


# Define server logic required to draw a boxplot
shinyServer(function(input, output) {
  
  # Expression that generates a boxplot. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$pointPlot <- renderPlot({
    
    # set up the plot
    pl <- ggplot(data = blast_data,
                mapping = aes (x=len,y=Score, colour=input$pct_ident)) +
                geom_point(size=2) +
                xlab("Alignment Length") +
                ggtitle("worm vs fly protein BLAST") + 
                ylim(0, 2500) +
                xlim(0, 2000) +
                theme(plot.title = element_text(size=rel(1.9))) +
                theme(axis.title.x = element_text(size=16)) +
                theme(axis.title.y = element_text(size=16)) +
                theme(legend.key.height = unit(.8, "cm"))+
                theme(legend.key.width = unit(.8,"cm"))+
                theme_grey(base_size=16)+
                scale_color_continuous(name="Percent_Identity")
                         
    
   # ggplot(data=q3blastdata, mapping = aes(x=len,y=Score, colour=pct_ident)) +
    #  geom_point(size=2) +
     # xlab("Alignment Length") +
    #  ggtitle("worm vs fly protein BLAST") + 
    #  ylim(0, 2500) +
    #  xlim(0, 2000) +
      #  theme(plot.title = element_text(size=rel(1.9))) +
    #  theme(axis.title.x = element_text(size=16)) +
    ##  theme(axis.title.y = element_text(size=16)) +
  #    theme(legend.key.height = unit(.8, "cm"))+
  #    theme(legend.key.width = unit(.8,"cm"))+
  #    theme_grey(base_size=16)+
  #    scale_color_continuous(name="Percent_Identity")
   
    
    
    
     # draw the boxplot for the specified trait
    pl + geom_point()
  })
})
