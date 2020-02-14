library(rvest)
library(dplyr)

urlPart1 <- "http://www.donga.com/news/search?p="
urlPart3 <- "&query=코로나&check_news=1&more=1&sorting=1&search_date=1&v1=&v2=&range=1"
urls <- NULL

for(x in 0:5){
  urls[x+1] <- paste0(urlPart1, as.character(x*15+1), urlPart3)
}

urls

links <- NULL
for(url in urls){
  html <- read_html(url)
  links <- c(links,html %>%
              html_nodes('.searchCont') %>% 
              html_nodes('a') %>% 
              html_attr('href') %>% 
              unique())
}

links
links <- links[-grep("pdf", links)]

txts <- NULL
for(link in links){
  html <- read_html(link)
  txts <- c(txts, html %>% 
              html_nodes('.article_txt') %>% 
              html_text())
}

txts[3]

news <- txts
news <- gsub("[A-z]", "", news)
news <- gsub("[0-9]", "", news)
news <- gsub("[/;:|)*~'!^-_+<>@#$%&({}]", "", news)
news <- gsub("\r", "", news)
news <- gsub("  \n", "", news)
news <- gsub("..\n", "", news)
news <- gsub(", , ", "", news)
news <- gsub("  ", " ", news)
news

write.table(txts, "news.txt")
