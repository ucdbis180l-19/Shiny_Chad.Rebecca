#  "Using BLAST data that compares the genetic make-up of C.elegans and A.thaliana, we can look at various aspects of that BLAST data and look for trends",

shinyUI(                                 # Start of the User Interface 
  fluidPage(                             # Page layout
    titlePanel(                          # --Visual title of page 
      "Plant Vs Worm BLAST"),            # ----actual name
    sidebarLayout(                       # First interactive machine
      sidebarPanel(                      # --creates area in visualisation
        sliderInput(                     # ----designates as slider
          "pct_ident",                   # ------calls this data
          "Percent Identity:",           # ------visual-first printout
          min = 0,                       # ------perameters for range
          max = 100,                     # ------perameters for range
          value = c("0","30"),           # ------number of values to be created within range
          post="%")                      # ------visual-last printout
        ),                               #
      sidebarLayout(                     # Second interactive machine
        sidebarPanel(                    # --Claims- designates specific area for visualisation
          selectInput(                   # ----general assignements for machine
            "data",                      # ------calls this data
            "Choose a Data Component:",  # ------VISUAL-prints this first
            c(                           # ------creates lables names
              "Mismatches",              # --------
              "Gaps",                    # --------
              "E.Score")                 # --------
          )                              # 
        ),                               # 
        mainPanel(                       # --interacts points to show according to choice from second machine
          plotOutput(                    # ------
            "pointPlot")                 # ------sendso to plotpoint
        )
      )
    )
  )
)

  