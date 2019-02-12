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



# Question 6 - Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicles in Los Angeles County (fips=='06037').
# Which city has seen greater changes over time in motor vehicles emissions. 
SCC_mv <- unique(SCC[grep('Mobile.*Vehicles', SCC$EI.Sector),'SCC'])

PED_mv <- PED %>%
    filter(SCC %in% SCC_mv ) %>%
    filter(fips == '24510' | fips == '06037') %>% 
    mutate(city = ifelse(fips == '24510','Baltimore City', 'Los Angeles County') ) %>% 
    group_by(year, city) %>%
    summarize(Total_Emission = sum(Emissions))

png('./figure/Plot6.png', width = 600, height = 600)

par(mar = c(5,5,5,5))

ggplot(PED_mv, aes(x = factor(year), y = Total_Emission, fill = city, label = round(Total_Emission,0))) +
    geom_bar(stat = 'identity') +
    facet_grid(city ~ .) +
    xlab('Year') +
    ylab(expression('PM '[2.5]*'  Emission (in tons)')) +
    ggtitle(expression('Total PM '[2.5]*'  Emission in Baltimore & Los Angeles From Motor Vehicle Sources')) +
    theme(plot.margin = unit(c(1,1,1,1),'cm')) +
    theme(plot.title = element_text(hjust = 0.5)) +
    geom_text(size = 3, vjust=0, aes(label = round(Total_Emission,0))  )

dev.off()

# Answer: Based on the plot, the PM2.5 Emission from Motor Vehicle Sources in Baltimore City has shown greater change (a decrease) over time from 1999-2008. The Los Angeles City on the other hand has shown an increase of emission from 1999-2008