# data load
pacman::p_load(RODBC, RMySQL, RPostgreSQL, RSQLite, foreign)
pacman::p_install_gh("hadley/readxl")

# data manipulation
pacman::p_load(plyr, dplyr, data.table, tidyr, stringr, lubridate, gsubfn, readr)

# data visualization
pacman::p_load(ggplot2, graphics, ggvis) 
pacman::p_install_gh('ramnathv/htmlwidgets')
pacman::p_install_gh('rstudio/leaflet')
pacman::p_install_gh('bwlewis/rthreejs')
pacman::p_install_gh('htmlwidgets/sparkline')
pacman::p_load(dygraphs, DT, DiagrammeR, networkD3, googleVis)

# data modelling
pacman::p_load(car, mgcv, lme4, nlme, randomForest, multcomp, vcd, glmnet, survival, caret)

# reports
pacman::p_load(shiny, xtable, knitr, rmarkdown)

# spatial data
pacman::p_load(sp, maptools, maps, ggmap, rgdal)

# time series
pacman::p_load(zoo, quantmod)

# High performance R code
pacman::p_load(Rcpp, parallel)

# Work with the web
pacman::p_load(XML, jsonlite, httr)

# Write R packages
pacman::p_load(devtools, testthat, roxygen2)

