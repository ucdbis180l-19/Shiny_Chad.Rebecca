

shinyUI(fluidPage(
  
  titlePanel("Plant Vs Worm BLAST"),
  
  sidebarLayout(
    sidebarPanel(
     sliderInput("pct_ident",
                  "Percent Identity:",
                  min = 14,
                  max = 100,
                  value = 30, post="%")),
  sidebarLayout(
    sidebarPanel(
      selectInput("data",
                   "Choose One:",
                  c("Mismatches",
                    "Gaps",
                    "E.Score"))),
    mainPanel(
      plotOutput("pointPlot"))
    ))))

  