install.packages("rJava")
install.packages("DBI")
install.packages("RJDBC")
install.packages("XML")
install.packages("memoise")
install.packages("KoNLP")
install.packages("wordcloud")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("ggmap")
install.packages("rvest")
install.packages("RColorBrewer")
install.packages("data.table")
install.packages("dplyr")
install.packages("reshape")
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
library(reshape) (edited)

drv <- JDBC(
  
  "oracle.jdbc.driver.OracleDriver",
  
  "C:\\oraclexe\\app\\oracle\\product\\11.2.0\\server\\jdbc\\lib\\ojdbc6.jar"
  
)

conn <- dbConnect(drv,
                  
                  "jdbc:oracle:thin:@localhost:1521:xe",
                  
                  "hr",
                  
                  "oracle")

###접속코드
# COUNTRIES   cnt
# DEPARTMENTS dep
# EMPLOYEES emp
# EMP_DETAILS_VIEW  empd
# JOBS job
# JOB_HISTORY jobh
# LOCATIONS loc
# REGIONS   reg     #ctrl+shift+c 

tab <-dbGetQuery(conn, "SELECT * FROM TAB")
tname <- tab$TNAME
tname

cnt <- data.frame(dbGetQuery(conn, "SELECT * FROM COUNTRIES"))
dep <- data.frame(dbGetQuery(conn, "SELECT * FROM DEPARTMENTS"))
emp <- data.frame(dbGetQuery(conn, "SELECT * FROM EMPLOYEES"))
empd <- data.frame(dbGetQuery(conn, "SELECT * FROM EMP_DETAILS_VIEW"))
job <- data.frame(dbGetQuery(conn, "SELECT * FROM JOBS"))
jobh <- data.frame(dbGetQuery(conn, "SELECT * FROM JOB_HISTORY"))
loc <- data.frame(dbGetQuery(conn, "SELECT * FROM LOCATIONS"))
reg <- data.frame(dbGetQuery(conn, "SELECT * FROM REGIONS"))

view(cnt)

