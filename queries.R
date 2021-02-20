install.packages("RMySQL")
install.packages("ggplot2")
library(dbplyr)
library(pool)
library(dplyr)
library(RMySQL)
suppressMessages(suppressWarnings(library(ggplot2)))

my_db <- dbPool(
  RMySQL::MySQL(), 
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest"
)
DataDB <- dbGetQuery(my_db, "select * from CountryLanguage")


DataDB
paises <-  DataDB %>% filter(Language  == "Spanish" ) 
paises

ggplot(paises[, ], 
       aes(x = Percentage , y = CountryCode , colour =paises$ IsOfficial )) + 
  geom_point()  + 
  theme_dark() + ggtitle("paises")



