# Exploratory data analysis
# Project 2
# Author: Ragnhildur G. Finnbjornsdottir
# Date: 20. september 2014
##############################

setwd("./EDA_Project2")

nei <- readRDS("./summarySCC_PM25.rds")
scc <- readRDS("./Source_Classification_Code.rds")

#################################################
# Plot 5:
# How have emissions from motor vehicle sources changed from 1999–2008 in 
# Baltimore City?

# Subset the data for only Boltimore city and source "ON-ROAD"
Marymot <- subset(nei, (nei$fips == "24510" & nei$type == "ON-ROAD"))

# Total emissions for each year
agg <- aggregate(Emissions ~ year, data = Marymot, FUN = sum)

# Create descriptive plot
barplot(agg$Emissions, names.arg = agg$year, 
        xlab = "Year", 
        ylab = expression("Total PM"[2.5]* " emissions"),
        main = expression("ON-ROAD PM"[2.5]* " emissions in Baltimore"),
        col = agg$year)


# Save figure to png
dev.copy(png, "plot5.png", height = 480, width = 480)
dev.off()