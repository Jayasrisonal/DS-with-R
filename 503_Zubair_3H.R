#Syed Zubair (503) CSE 3H
#Scraping "paytmmall" top mobile brands

# dependency to check access
library(robotstxt)
path <- paths_allowed ("https://paytmmall.com/allsmartphones-llpid-195328?use_mw=1&src=store&from=storefront&page=1&price=35022%2C129900")

#setting website url
url <- "https://paytmmall.com/allsmartphones-llpid-195328?use_mw=1&src=store&from=storefront&page=1&price=35022%2C129900"


#defining packages
library(rvest)
library(dplyr)

#defining a var to url
web <- read_html(url)

#Automating data collection using pipeline
Name <-web%>%html_nodes(".UGUy")%>%html_text()
#scraps_name

Price <-web%>%html_nodes("._1kMS")%>%html_text()
#scraps_price

Offers <-web%>%html_nodes("._2MEo")%>%html_text()
#scraps_offers

#making a table for collected entries
Best_Deals <- data.frame(Name, Price, Offers)
View(Best_Deals)


#saving the table as a csv file
write.csv(Best_Deals, "Best mobile deals in paytm mall.csv")
