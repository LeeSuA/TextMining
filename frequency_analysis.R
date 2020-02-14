library(KoNLP)
library(wordcloud2)
library(dplyr)

useSejongDic()
text = readLines("news.txt")
nouns <- extractNoun(text)
nouns <- unlist(nouns)
nouns <- nouns[nchar(nouns)>=2]
wordFreq <-  table(nouns)
sort(wordFreq, decreasing = T)
wordFreq <- sort(wordFreq, decreasing = T) %>% head(20)
wordcloud2(wordFreq, fontFamily = '맑은 고딕')

library(ggplot2)
barplot(wordFreq)
#ggplot2 생략
