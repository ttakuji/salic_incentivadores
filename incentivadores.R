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
urls <- as_tibble(seq(0,103500,by = 100)) %>% 
  mutate(requisicao = glue('http://api.salic.cultura.gov.br/v1/projetos/?limit=100&offset={value}'))

urls<- urls %>%
  mutate(resposta = map(requisicao, ~fromJSON(.x)),
         funcionou = map_lgl(resposta, ~ifelse(is.null(.x$error), TRUE, FALSE)))

write.csv2(urls, file = "projetos.csv")
saveRDS(urls, file = "projetos.rds")




fromJSON('http://api.salic.cultura.gov.br/v1/projetos/?limit=100&offset=100&')
