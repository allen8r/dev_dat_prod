library(shiny)
library(plotly)

natByAge <- read.csv('NCHS_-_Birth_Rates__by_Age_of_Mother__United_States__1940-2013.csv',
                na.strings = "*")

natality <- read.csv("NCHS_natality.csv",
                     na.strings = "*")

