#libraries
library(tidyverse)
library(jsonlite)
library(RCurl)
library(httr)
library(glue)
library(tidyr)




# urls<- as_tibble( seq(0,94300, by = 100)) %>% 
#   mutate(requisicao = glue('http://api.salic.cultura.gov.br/v1/incentivadores/?limit=100&offset={value}'))
# 
# urls<- urls %>% 
#   mutate(resposta = map(requisicao, ~fromJSON(.x)),
#          funcionou = map_lgl(resposta, ~ifelse(is.null(.x$error), TRUE, FALSE)))
# 
# 
# saveRDS(urls, file = "incentivadores.rds")
# 

#103500
#ramificar o código em 4 map 


urls <- as_tibble(seq(0,20700,by = 100)) %>% 
  mutate(requisicao = glue('http://api.salic.cultura.gov.br/v1/projetos/?limit=100&offset={value}'))

urls<- urls %>%
  mutate(resposta = map(requisicao, ~fromJSON(.x)),
         funcionou = map_lgl(resposta, ~ifelse(is.null(.x$error), TRUE, FALSE)))


saveRDS(urls, file = "projetos1.rds")



urls <- as_tibble(seq(20700,41400,by = 100)) %>% 
  mutate(requisicao = glue('http://api.salic.cultura.gov.br/v1/projetos/?limit=100&offset={value}'))

urls<- urls %>%
  mutate(resposta = map(requisicao, ~fromJSON(.x)),
         funcionou = map_lgl(resposta, ~ifelse(is.null(.x$error), TRUE, FALSE)))


saveRDS(urls, file = "projetos2.rds")


urls <- as_tibble(seq(41400,62100,by = 100)) %>% 
  mutate(requisicao = glue('http://api.salic.cultura.gov.br/v1/projetos/?limit=100&offset={value}'))

urls<- urls %>%
  mutate(resposta = map(requisicao, ~fromJSON(.x)),
         funcionou = map_lgl(resposta, ~ifelse(is.null(.x$error), TRUE, FALSE)))


saveRDS(urls, file = "projetos3.rds")

urls <- as_tibble(seq(62100,82800,by = 100)) %>% 
  mutate(requisicao = glue('http://api.salic.cultura.gov.br/v1/projetos/?limit=100&offset={value}'))

urls<- urls %>%
  mutate(resposta = map(requisicao, ~fromJSON(.x)),
         funcionou = map_lgl(resposta, ~ifelse(is.null(.x$error), TRUE, FALSE)))


saveRDS(urls, file = "projetos4.rds")

urls <- as_tibble(seq(82800,103500,by = 100)) %>% 
  mutate(requisicao = glue('http://api.salic.cultura.gov.br/v1/projetos/?limit=100&offset={value}'))

urls<- urls %>%
  mutate(resposta = map(requisicao, ~fromJSON(.x)),
         funcionou = map_lgl(resposta, ~ifelse(is.null(.x$error), TRUE, FALSE)))


saveRDS(urls, file = "projetos5.rds")

