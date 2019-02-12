# Please set Working Directory to Project Directory(JHU_EDA_CourseProject2)



# Please ignore these lines if package(s) is/are already installed & loaded in your environment
remove(list=ls())
cat("\014")

R.version.string
update.packages(ask = FALSE)

library(dplyr)


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



# Question 2 - Have total emissions from PM2.5 decreased in Baltimore City, Maryland (fips =='24510') from 1999 to 2008
# Use the base plotting system to make a plot answering this question

PED_baltimore <-PED %>%
                filter(fips == '24510') %>% 
                group_by(year) %>%
                summarize(Total_Emission = sum(Emissions))

png('./figure/Plot2.png', width = 400, height = 400)
    
    par(mar = c(5,5,5,5))
    p <- barplot(height = PED_baltimore$Total_Emission,
                 names.arg = PED_baltimore$year,
                 xlab = 'Year',
                 ylab = expression('PM '[2.5]*'  Emission (in tons)'),
                 main = expression('Total PM '[2.5]*'  Emission in Baltimore City For Selected Years'),
                 col = 'deepskyblue',
                 ylim = c(0,max(PED_baltimore$Total_Emission)+1000))
    
    text (x = p,
          y = round(PED_baltimore$Total_Emission,0),
          label = round(PED_baltimore$Total_Emission,0),
          pos = 3,
          cex = 1,
          col = 'black')

dev.off()

# Answer: Based on the plot, the PM2.5 Emission in the Baltimore City declined in the four years of observation (1999, 2002, 2005, 2008)

