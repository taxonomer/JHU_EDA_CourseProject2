# JHU Exploratory Data Analysis Course Project 2

## Introduction

The goal of this project is to use the data from PM2.5 Emissions to answer 6 analytical questions.

## Data

### Emissions Data
This course project uses data from PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. The following are the variables:

<li>fips      : A five-digit number (represented as a string) indicating the U.S. county
</li>
<li>SCC       : The name of the source as indicated by a digit string (see source code classification table)
</li><li>Pollutant : A string indicating the pollutant
</li><li>Emissions : Amount of PM2.5 emitted, in tons
</li><li>type      : The type of source (point, non-point, on-road, or non-road)
</li><li>year      : The year of emissions recorded</li>

### Source Classification Code

Source Classification Code Table (Source_Classification_Code.rds): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.

## Questions and Answers

Question 1 - Have total emissions from PM2.5 decreased in the US from 1999 - 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

Answer: Based on the plot, the PM2.5 Emission in the US declined in the four years of observation from 1999 to 2008. (see Plot 1)

Question 2 - Have total emissions from PM2.5 decreased in Baltimore City, Maryland (fips =='24510') from 1999 to 2008. Use the base plotting system to make a plot answering this question.

Answer: Based on the plot, the PM2.5 Emission in the Baltimore City declined in the four years of observation from 1999 to 2008. (see Plot2)

Question 3 - Of the four types of sources indicated by the type(point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City. Which have seen increases in emissions from 1998-2008? use ggplot2 plotting system to make a plot to answer this question.

Answer: Based on the plot, the sources that were seen decrease on the PM2.5 Emission on Baltimore City over the years (1999-2008) are Non-Road, Nonpoint, and On-Road. On the other hand, the Point source was seen an increase in the PM2.5 Emission. (see Plot3)

Question 4 - Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008.

Answer: Based on the plot, the PM2.5 Emission from coal combustion-related sources has decreased from 1999 to 2008 (see Plot4)

Question 5 - How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

Answer: Based on the plot, the PM2.5 Emission in Baltimore from Motor Vehicle Sources has decreased from 1999 to 2008 (see Plot5)

Question 6 - Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicles in Los Angeles County (fips=='06037'). Which city has seen greater changes over time in motor vehicles emissions?

Answer: Based on the plot, the PM2.5 Emission from Motor Vehicle Sources in Baltimore City has shown greater change (a decrease) over time from 1999-2008. The Los Angeles City on the other hand has shown an increase of emission from 1999-2008 (see Plot6)




