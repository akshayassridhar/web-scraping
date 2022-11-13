library(rvest)
library(dplyr)
library(robotstxt)

Path<-paths_allowed("https://www.amazon.in/gp/most-gifted/watches/")

link<-("https://www.amazon.in/gp/most-gifted/watches/")
web<-read_html(link)

ranking<-web%>% html_nodes(".zg-bdg-text") %>% html_text()
name<-web%>% html_nodes("._cDEzb_p13n-sc-css-line-clamp-3_g3dy1") %>% html_text()
price<-web%>% html_nodes("#gridItemRoot .a-text-normal .a-row") %>% html_text()

View(ranking)
View(name)
View(price)

amazon.watches <- data.frame(ranking, name, price)

View(amazon.watches)

write.csv(amazon.watches, "amazon_watches.csv")
