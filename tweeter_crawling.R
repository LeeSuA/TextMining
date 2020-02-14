install.packages("twitteR")
install.packages("ROAuth")
install.packages("devtools")
install.packages("rjson")
install.packages("bit64")
install.packages("httr")

library("twitteR")
library("dplyr")



##Obama

#tweets_Obama <- searchTwitter("Obama", lang = "en", n = 1000) #이미 가져온 파일(Obama.rda) 부분 코드
#tweets_Obama <- twListToDF(tweets_Obama) #이미 가져온 파일 부분 코드

Obama <- tweets_Obama
names(tweets_Obama)

tweets_Obama <- twListToDF(tweets_Obama)
Obama_text <- tweets_Obama$text

Obama_text <- gsub("\\W", " ", Obama_text)
Obama_text <- gsub("RT", "", Obama_text)

Obama_df <- as.data.frame(Obama_text)
length(Obama_df);
length(Obama_text)

head(Obama_text)


#Trump
Trump <- tweets_Trump

tweets_Trump <- twListToDF(tweets_Trump)
Trump_text <- tweets_Trump$text

Trump_text <- gsub("\\W", " ", Trump_text)
Trump_text <- gsub("RT", "", Trump_text)

Trump_df <- as.data.frame(Obama_text)

head(Trump_text)
