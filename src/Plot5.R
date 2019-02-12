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



# Question 5 - How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
SCC_mv <- unique(SCC[grep('Mobile.*Vehicles', SCC$EI.Sector),'SCC'])

PED_mv_baltimore <- PED %>%
                    filter(SCC %in% SCC_mv ) %>%
                    filter(fips == '24510') %>% 
                    group_by(year) %>%
                    summarize(Total_Emission = sum(Emissions))

png('./figure/Plot5.png', width = 600, height = 600)

par(mar = c(5,5,5,5))

ggplot(PED_mv_baltimore, aes(x = factor(year), y = Total_Emission)) +
    geom_bar(stat = 'identity', fill="steelblue") +
    xlab('Year') +
    ylab(expression('PM '[2.5]*'  Emission (in tons)')) +
    ggtitle(expression('Total PM '[2.5]*'  Emission in Baltimore From Motor Vehicle Sources')) +
    theme(plot.margin = unit(c(1,1,1,1),'cm')) +
    theme(plot.title = element_text(hjust = 0.5)) +
    geom_text(size = 3, vjust=0, aes(label = round(Total_Emission,0))  )

dev.off()

# Answer: Based on the plot, the PM2.5 Emission in Baltimore from Motor Vehicle Sources has decreased from 1999 to 2008