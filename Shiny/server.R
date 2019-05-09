
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
                         
    pl + geom_point()
  })
})

R version 3.5.3 (2019-03-11) -- "Great Truth"
Copyright (C) 2019 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> shiny::runApp('Shiny')
Loading required package: shiny

Listening on http://127.0.0.1:3481
── Attaching packages ────────────────────────── tidyverse 1.2.1 ──
✔ ggplot2 3.1.1       ✔ purrr   0.3.2  
✔ tibble  2.1.1       ✔ dplyr   0.8.0.1
✔ tidyr   0.8.3       ✔ stringr 1.4.0  
✔ readr   1.3.1       ✔ forcats 0.4.0  
── Conflicts ───────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
Warning: Error in : 'plant_vs_worm.blastout_v2.1.gz' does not exist in current working directory ('/home/ubuntu/2_Documents/UCD-BIS180L/2_Labs/Shinyapp/Shiny_Chad.Rebecca/Shiny').
  51: stop
  50: check_path
  49: standardise_path
  48: read_delimited
  47: read_tsv


> library(shiny)
> library(tidyverse)
> library(stringr)
> blast_data <- read_tsv("plant_vs_worm.blastout_v2.1.gz",
+                        col_names=c("query_id",
+                                    "subject_id",
+                                    "pct_ident",
+                                    "len",
+                                    "mis",
+                                    "gaps",
+                                    "qb",
+                                    "qe",
+                                    "sb",
+                                    "se",
+                                    "E",
+                                    "Score"))
Parsed with column specification:
cols(
  query_id = col_character(),
  subject_id = col_character(),
  pct_ident = col_double(),
  len = col_double(),
  mis = col_double(),
  gaps = col_double(),
  qb = col_double(),
  qe = col_double(),
  sb = col_double(),
  se = col_double(),
  E = col_double(),
  Score = col_double()
)
> runApp('Shiny')

Listening on http://127.0.0.1:3481
Warning: Error in : 'plant_vs_worm.blastout_v2.1.gz' does not exist in current working directory ('/home/ubuntu/2_Documents/UCD-BIS180L/2_Labs/Shinyapp/Shiny_Chad.Rebecca/Shiny').
  51: stop
  50: check_path
  49: standardise_path
  48: read_delimited
  47: read_tsv


> runApp('Shiny')

Listening on http://127.0.0.1:3481
Parsed with column specification:
cols(
  query_id = col_character(),
  subject_id = col_character(),
  pct_ident = col_double(),
  len = col_double(),
  mis = col_double(),
  gaps = col_double(),
  qb = col_double(),
  qe = col_double(),
  sb = col_double(),
  se = col_double(),
  E = col_double(),
  Score = col_double()
)
Parsed with column specification:
cols(
  query_id = col_character(),
  subject_id = col_character(),
  pct_ident = col_double(),
  len = col_double(),
  mis = col_double(),
  gaps = col_double(),
  qb = col_double(),
  qe = col_double(),
  sb = col_double(),
  se = col_double(),
  E = col_double(),
  Score = col_double()
)


> runApp('Shiny')

Listening on http://127.0.0.1:3481
Parsed with column specification:
cols(
  query_id = col_character(),
  subject_id = col_character(),
  pct_ident = col_double(),
  len = col_double(),
  mis = col_double(),
  gaps = col_double(),
  qb = col_double(),
  qe = col_double(),
  sb = col_double(),
  se = col_double(),
  E = col_double(),
  Score = col_double()
)
Parsed with column specification:
cols(
  query_id = col_character(),
  subject_id = col_character(),
  pct_ident = col_double(),
  len = col_double(),
  mis = col_double(),
  gaps = col_double(),
  qb = col_double(),
  qe = col_double(),
  sb = col_double(),
  se = col_double(),
  E = col_double(),
  Score = col_double()
)
Warning: Removed 6 rows containing missing values (geom_point).
Warning: Removed 6 rows containing missing values (geom_point).


> 