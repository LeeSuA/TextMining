pos.word <- scan("positive-words.txt", what ="character", comment.char = ";")

neg.word <- scan("negative-words.txt", what ="character", comment.char = ";")

library(plyr)
library(dplyr)
library(stringr)

score.sentiment = function(sentences, pos.words, neg.words, .progress='none') #사용자 정의 함수
  
{
  
  scores = laply(sentences, function(sentence, pos.words, neg.words) {
    
    sentence = gsub('[^A-z ]','', sentence)
    
    sentence = tolower(sentence);
    
    word.list = str_split(sentence, '\\s+');
    
    words = unlist(word.list);
    
    pos.matches = match(words, pos.words);
    
    neg.matches = match(words, neg.words);
    
    pos.matches = !is.na(pos.matches);
    
    neg.matches = !is.na(neg.matches);
    
    score = sum(pos.matches) - sum(neg.matches);
    
    return(score);
    
  }, pos.words, neg.words, .progress=.progress );
  
  scores.df = data.frame(score=scores, text=sentences);
  
  return(scores.df);
  
}
Obama_scores <- score.sentiment(Obama_text, pos.word, neg.word, .progress = 'text')

# str(Obama_scores)

Obama_scores$score

hist(Obama_scores$score)


Trump_scores <- score.sentiment(Trump_text, pos.word, neg.word, .progress = 'text')

Trump_scores$score

hist(Trump_scores$score)


a <- dim(Obama_scores)[1] 

b <- dim(Trump_scores)[1]


alls <- rbind( as.data.frame(cbind(type=rep("Obama",a), score = Obama_scores[ , 1])),
               
               as.data.frame(cbind(type=rep("Trump",b), score = Trump_scores[ , 1])))

str(alls)

alls$score <- strtoi(alls$score)


# install.packages("ggplot2")

library(ggplot2)

ggplot(alls, aes(x=score, color = type)) +
  
  geom_density(size=1)
