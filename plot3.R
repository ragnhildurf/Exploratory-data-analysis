# Exploratory data analysis
# Project 2
# Author: Ragnhildur G. Finnbjornsdottir
# Date: 20. september 2014
##############################

setwd("./EDA_Project2")

nei <- readRDS("./summarySCC_PM25.rds")
scc <- readRDS("./Source_Classification_Code.rds")

########################################################
# Plot 3: 
# Of the four types of sources indicated by the type (point, nonpoint, 
# onroad, nonroad) variable, which of these four sources have seen decreases in 
# emissions from 1999–2008 for Baltimore City? Which have seen increases in 
# emissions from 1999–2008? Use the ggplot2 plotting system to make a plot 
# answer this question.

# Subset the data for only Boltimore city
Marynei <- subset(nei, (nei$fips == "24510"))

# Aggregate the emissions for each type of source
agg <- aggregate(Emissions ~ year + type, data = Marynei, FUN = sum)


# Create descriptive plot
library(ggplot2)

qplot(year, Emissions, data = agg, col = type, geom ="path",
      xlab = "Year", 
      ylab = expression("Total PM"[2.5]* " emissions"),
      main = expression("Total PM"[2.5]* " emissions in Baltimore city"))

# Save figure to png
dev.copy(png, "plot3.png", height = 480, width = 480)
dev.off()
