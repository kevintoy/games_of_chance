raw_data <- read.csv("~/chance in traditional cultures/games of chance/data_combined.csv")

#remove outliers:
raw_data[9,4]<-NA
raw_data[49,5]<-NA


#scatterplot with groups

library(ggplot2)
ggplot(raw_data,aes(X1_over_chance,odds,fill=type_updated))+
  geom_point(aes(color=type_updated,shape=type_updated),position=position_jitter(h=0.15,w=0.15),alpha = 0.8, size = 3)+
  theme(legend.title = element_text(colour="black", size=20))+
  theme(legend.text = element_text(colour="black", size=20))+
  theme(axis.text=element_text(size=20),axis.title=element_text(size=20))+
  xlim(9,40)+
  ylim(9,40)+
  geom_abline(intercept = 0)+
  coord_fixed(ratio = 1)+
  labs(x=expression(1/"chance of winning"),y="odds",fill="source type")+
  scale_fill_discrete(name = "source type", labels = c("A", "B", "C"))
  
#bar chart of different types of descriptions of flower lottery
  #tally numbers
tapply(as.factor(raw_data$too_many_choices),raw_data$type_updated,summary)
library(tidyr)
desc_data<-read.csv("~/chance in traditional cultures/games of chance/types_of_description_of_huahui.csv")
data_long<-gather(desc_data,description_type,count,superstition:too_many_choices)

data_long$description_type<-factor(data_long$description_type,levels=c('house_advantage','too_many_choices','house_cheating','people_stupid','women_involved','customers_losing','superstition'))

ggplot(data_long, aes(x = X, y = count, fill = description_type)) + 
  geom_bar(position="dodge",stat = "identity")

