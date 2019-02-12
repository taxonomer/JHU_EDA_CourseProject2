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



# Question 3 - Of the four types of sources indicated by the type(point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City
# Which have seen increases in emissions from 1998-2008? use ggplot2 plotting system to make a plot to answer this question.

PED_baltimore_bytype <- PED %>%
                        filter(fips == '24510') %>%
                        group_by(year, type) %>%
                        summarize(Total_Emission = sum(Emissions))

png('./figure/Plot3.png', width = 600, height = 600)

par(mar = c(5,5,5,5))

ggplot(PED_baltimore_bytype, aes(x = factor(year), y = Total_Emission, fill = type)) +
    geom_bar(stat = 'identity') +
    facet_grid(. ~ type) +
    xlab('Year') +
    ylab(expression('PM '[2.5]*'  Emission (in tons)')) +
    ggtitle(expression('Total PM '[2.5]*'  Emission in Baltimore City For Selected Years by Type')) +
    theme(plot.title = element_text(hjust = 0.5)) +
    geom_text(size = 3, vjust=0, aes(label = round(Total_Emission,0))  )

dev.off()

# Answer: Based on the plot, the sources that were seen decrease on the PM2.5 Emission on Baltimore City over the years (1999-2008) are Non-Road, Nonpoint, and On-Road. On the other hand, the Point source was seen an increase in the on the PM2.5 Emission.

