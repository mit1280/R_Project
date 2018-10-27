#READ DATA FROM FILE, here program will be read from first line because hader is not there
x<-read.csv("Diesel_Retail_Price_Weekly_Average_by_Region__Beginning_2007.csv",header=FALSE)

#FIND OUT ATTRIBUTES NAMES
names(x)

#NORMALISE DATA, TYPE CASTING DATE->CHARACTER
p<-as.character(x$Date)
s<-as.character(seq(from=as.Date("2007-10-29"),to=as.Date("2018-08-27"),by="week"))

r<-seq(1:length(p))

#ENCODE VALUE OF P USING REFRENCE "S" & "R"
f<-factor(p,s,r)

#ASSIGNE ENCODE VALUE TO REAL DATA
x$Date=as.numeric(f)

#(1)TAKE DATA FOR PREDECT AND TASTE WITH ONE VALUE
p<-x$Date
q<-x$New_York_Average
var(q)
rel<-lm(q~p)
a<-data.frame(p=600)
g<-predict(rel,a)
plot(p,q,type="l",pch=1)

#(2)DIVIDE YOUR SCREEN INTO GRID 1-ROW,2-COLUMNS AND DRAW ACTUAL AND PREDICTED GRAPH(LINEAR)
par(mfrow=c(1,2))
rel<-lm(q~p)
a<-predict(rel,data.frame(p))
cor(a,q)#DEGREE OF LINEARITY BETWEEN TWO VARIABLE
plot(p,a,col="red",pch=2)
plot(p,q,type="l",pch=1)

#(3)POLYNOMIAL REGRATION
rel<-lm(q~p+I(p^2)+I(p^3)+I(p^4)+I(p^5))
a<-predict(rel,data.frame(p))
cor(a,q)#HIGH MEANS MORE ACURATE
lines(p,a,col="blue",pch=2) 

#COMPAIR ALL AT THE SAME TIME
p<-subset(x,select=1)
q<-subset(data.frame(x),select=c(2:4))
pairs(cbind(p,q),labels=c("DATE",c("New_York","Binghamton","Buffalo")))

#REDIRECTING OUTPUT
sink("new.txt")
source("pro1.R")
sink()