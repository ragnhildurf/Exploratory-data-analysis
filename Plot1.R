# Exploratory data analysis
# Project 2
# Author: Ragnhildur G. Finnbjornsdottir
# Date: 20. september 2014
##############################

setwd("./EDA_Project2")

nei <- readRDS("./summarySCC_PM25.rds")
scc <- readRDS("./Source_Classification_Code.rds")

#################################################

# Plot 1:
# Have total emissions from PM2.5 decreased in the United States from 1999 to 
# 2008? Using the base plotting system, make a plot showing the total PM2.5 
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Aggregate the emissions for each year
agg <- aggregate(Emissions ~ year, data = nei, FUN = sum)

# Make the total PM2.5 emission amount more reader friendly
agg$Emissions <- round(agg$Emissions/1000)

# Fix margins so titles fit
par(mar=c(5.1, 5.1, 4.1, 2.1))

# Plot barplot for total emissions for each year. Give appropriate labels
barplot(agg$Emissions, names.arg=agg$year, 
        xlab="Year", 
        ylab=expression("Total PM"[2.5]* " emissions (x1000 tons)"), 
        main=expression("Total PM"[2.5]* " emissions from all sources in USA"),
        col=5)

# Save figure to png
dev.copy(png, "plot1.png", height = 480, width = 480)
dev.off()