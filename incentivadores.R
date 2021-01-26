#libraries
library(tidyverse)
library(jsonlite)
library(RCurl)
library(httr)
library(glue)
library(tidyr)




urls<- as_tibble( seq(100,200, by = 100)) %>% 
  mutate(requisicao = glue('http://api.salic.cultura.gov.br/v1/incentivadores/?limit=100&offset={value}'))

urls<- urls %>% 
  mutate(resposta = map(requisicao, ~fromJSON(.x)),
         funcionou = map_lgl(resposta, ~ifelse(is.null(.x$error), TRUE, FALSE)))


saveRDS(urls, file = "incentivadores.rds")

