library(rJava)
library(DBI)
library(RJDBC)
library(XML)
library(memoise)
library(KoNLP)
library(wordcloud)
library(dplyr)
library(ggplot2)
library(ggmap)
library(rvest)
library(RColorBrewer)
library(data.table)
library(reshape) 
library(stringr)
getwd()
setwd("C:\\R\\PRO180728")
KoNLP::useSejongDic()
txt <- readLines("seoul.txt")

txt <- str_replace_all(txt, "\\w"," ")
nouns <- KoNLP::extractNoun(txt)

wordcount <- table(unlist(nouns))
df <- as.data.frame(wordcount, stringsAsFactors = F)
df <- rename(df, words=Varl, freq=Freq)#
df <- filter(df,nchar(word) >= 2)










place <- sapply(txt,extractNoun,USE.NAMES = F)
place
temp <- unlist(place)
place <- filter(function(x)(nchar(x)>=3),txt)
place <- gsub("이상","",place)
place
write(unlist(place))
test <- brewer.pal(9,place)
wordcloud(names(table(place)),
          freg = table(place),
          scale = c(5,1),
          rot.per = 0.25,
          min.freq = 1,
          random.order = F,
          random.color = T,
          colors = test)






