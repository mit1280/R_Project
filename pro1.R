x<-read.csv("Diesel_Retail_Price_Weekly_Average_by_Region__Beginning_2007.csv")
a<-c(x$New_York_Average)	
b<-c(x$Binghamton_Average)
c<-c(x$Buffalo_Average)
a=mean(a,rm.NA=T)
b=mean(b,rm.NA=T)
c=mean(c,rm.NA=T)
p<-c("New_York_Average","Binghamton_Average","Buffalo_Average")
q<-c(a,b,c)
paste(p,"is",q,collapse=" and, ")


