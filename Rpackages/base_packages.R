## install dependencies from terminal libxml2-dev
list.of.packages <- c('tidyverse', 'RPostgreSQL', 'readxl', 'stringr','lubridate', 'readr', 'shiny','rmarkdown','xtable','knitr','devtools')

new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, repos='https://cran.itam.mx/')
