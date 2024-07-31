library(tidyverse)
library(rvest)

date<-as.character(Sys.Date())

okdiario_text<-read_html("https://okdiario.com/")%>%
  html_nodes(".segmento-link")%>%
  html_text2()

elpais_text<-read_html("https://elpais.com/")%>%
  html_nodes(".c_t a")%>%
  html_text2()

elmundo_text<-  read_html("https://www.elmundo.es/")%>%
  html_nodes(".ue-c-cover-content__link")%>%
  html_text2()

minutos_text<- read_html("https://www.20minutos.es/")%>%
  html_nodes(".media-content a")%>%
  html_text2()

abc_text<-read_html("https://www.abc.es/")%>%
  html_nodes("a")%>%
  html_text2()

publico_text <-read_html("https://www.publico.es/")%>%
  html_nodes(".title a")%>%
  html_text2()

okdiaro<-length(grep("Sánchez", okdiario_text))
elpais<-length(grep("Sánchez", elpais_text))
elmundo<-length(grep("Sánchez", elmundo_text))
minutos<-length(grep("Sánchez", minutos_text))
abc<-length(grep("Sánchez", abc_text))
publico<-length(grep("Sánchez", publico_text))

temp_df<-data.frame(date,okdiaro,elpais,elmundo,minutos,abc,publico)

url<-read.csv("https://raw.githubusercontent.com/pgomba/sanchezometro/main/sanchez_data/sanchez_counter.csv")

sanchez_values<-bind_rows(url,temp_df)




write.csv(sanchez_values,row.names = FALSE,paste0("sanchez_data/sanchez_counter.csv"))