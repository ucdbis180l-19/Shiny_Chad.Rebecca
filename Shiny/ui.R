

shinyUI(fluidPage(
  
  titlePanel("Plant Vs Worm BLAST"),
  "Using BLAST data that compares the genetic make-up of C.elegans and A.thaliana, we can look at various aspects of that BLAST data and look for trends",
  
  sidebarLayout(
    sidebarPanel(
     sliderInput("pct_ident",
                  "Percent Identity:",
                  min = 0,
                  max = 100,
                  value = c("0","30"), post="%")),
  sidebarLayout(
    sidebarPanel(
      selectInput("data",
                   "Choose a Data Component:",
                  c("Mismatches",
                    "Gaps",
                    "E.Score"))),
    mainPanel(
      plotOutput("pointPlot"))
    ))))

  