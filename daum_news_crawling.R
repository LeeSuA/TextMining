library(rvest)
library(stringr)

title = c()
body = NULL

url_base <-  "https://search.daum.net/search?w=news&DA=PGD&enc=utf8&cluster=y&cluster_page=1&q=%EA%B5%AD%ED%9A%8C&p="

for(i in 1:10)
{
  url_crawl = paste0(url_base, i, sep = "");print(url_crawl)
  t_css = ".f_link_b"
  b_css = ".desc"
  
  hdoc = read_html(url_crawl)
  t_node = html_nodes(hdoc, t_css)                                                                                                                                                                    
  b_node = html_nodes(hdoc, b_css)
  
  title_part = html_text(t_node)
  body_part = html_text(b_node)
  
  title = c(title, title_part)
  body = c(body, body_part)
  
}
news <- cbind(title, body)
write.csv(news, file = "crawltest.csv")
