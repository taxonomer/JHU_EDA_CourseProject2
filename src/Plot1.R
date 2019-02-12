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



# Question 1 - Have total emissions from PM2.5 decreased in the US from 1999 - 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008

PED_total <-PED %>%
            group_by(year) %>%
            summarize(Total_Emission = sum(Emissions))

png('./figure/Plot1.png', width = 400, height = 400)

    par(mar = c(5,5,5,5))
    p <- barplot(height = PED_total$Total_Emission/1000000,
                 names.arg = PED_total$year,
                 xlab = 'Year',
                 ylab = expression('PM '[2.5]*'  Emission (in million tons)'),
                 main = expression('Total PM '[2.5]*'  Emission in U.S. For Selected Years'),
                 col = 'deepskyblue',
                 ylim = c(0,max(PED_total$Total_Emission/1000000)+1))

    text (x = p,
          y = round(PED_total$Total_Emission/1000000,1),
          label = round(PED_total$Total_Emission/1000000,1),
          pos = 3,
          cex = 1,
          col = 'black')

dev.off()

# Answer: Based on the plot, the PM2.5 Emission in the US declined in the four years of observation (1999, 2002, 2005, 2008)

