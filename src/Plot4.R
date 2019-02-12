# Please set Working Directory to Project Directory(JHU_EDA_CourseProject2)



# Please ignore these lines if package(s) is/are already installed & loaded in your environment
remove(list=ls())
cat("\014")

R.version.string
update.packages(ask = FALSE)

library(dplyr)
library(ggplot2)


# Read data
PED <- readRDS('./data/summarySCC_PM25.rds')
SCC <- readRDS('./data/Source_Classification_Code.rds')


# Profile the data
View(PED)
View(SCC)
str(PED)
str(SCC)
sapply(PED, function(x) {
    if (is.numeric(x)) return(summary(x))
    if (is.factor(x)) return(head(table(x)))
    if (is.character(x)) return(head(table(x)))
})

sapply(PED, function(x) {
    if (is.numeric(x)) return(summary(x))
    if (is.factor(x)) return(head(table(x)))
    if (is.character(x)) return(head(table(x)))
})



# Question 4 - Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008

SCC_coalcomb <- unique(SCC[grep('Fuel Comb.*Coal', SCC$EI.Sector),'SCC'])

PED_coalcomb <- PED %>%
                filter(SCC %in% SCC_coalcomb ) %>%
                group_by(year) %>%
                summarize(Total_Emission = sum(Emissions))

png('./figure/Plot4.png', width = 600, height = 600)

par(mar = c(5,5,5,5))

ggplot(PED_coalcomb, aes(x = factor(year), y = Total_Emission/1000)) +
    geom_bar(stat = 'identity', fill="steelblue") +
    xlab('Year') +
    ylab(expression('PM '[2.5]*'  Emission (in thousand tons)')) +
    ggtitle(expression('Total PM '[2.5]*'  Emission in US From Coal Combustion Related Sources')) +
    theme(plot.margin = unit(c(1,1,1,1),'cm')) +
    theme(plot.title = element_text(hjust = 0.5)) +
    geom_text(size = 3, vjust=0, aes(label = round(Total_Emission/1000,0))  )

dev.off()

# Answer: Based on the plot, the PM2.5 Emission from coal combustion-related sources has decreased from 1999 to 2008