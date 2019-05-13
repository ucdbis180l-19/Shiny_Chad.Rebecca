

shinyUI(fluidPage(
  
  titlePanel("Plant Vs Worm BLAST"),
  "Using BLAST data that compares the genetic make-up of C.elegans and A.thaliana, we can look at various aspects of that BLAST data and look for trends",
  
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

  