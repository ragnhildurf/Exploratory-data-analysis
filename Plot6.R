# Exploratory data analysis
# Project 2
# Author: Ragnhildur G. Finnbjornsdottir
# Date: 20. september 2014
##############################

setwd("./EDA_Project2")

nei <- readRDS("./summarySCC_PM25.rds")
scc <- readRDS("./Source_Classification_Code.rds")

#################################################
# Plot 6:
# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# Subset the data for only Boltimore city and source "ON-ROAD"
Marymot <- subset(nei, (nei$fips == "24510" & nei$type == "ON-ROAD"))

# Subset the data for only LA, Cal and source "ON-ROAD"
LAmot <- subset(nei, (nei$fips == "06037" & nei$type == "ON-ROAD"))

# Bind the two subsets together
data <- rbind(Marymot, LAmot)

# Total emissions each year for both cities
agg <- aggregate(Emissions ~ year + fips, data = data, FUN = sum)

# Use more descriptive names
names(agg)[2]  <- "City"

# Put city names in dataset according to fibs
x <- c("24510", "06037")
y <- c("Baltimore", "LA")       
cityID <- data.frame(x, y)

agg$City <- as.character((factor(agg$City, labels = cityID$y))) 

# Create descriptive plot
qplot(year, Emissions, data = agg, color = City, geom ="path",
      xlab = "Year", 
      ylab = expression("PM"[2.5]* " emissions"),
      main = expression("ON-ROAD PM"[2.5]* " emissions in Baltimore and LA"))


# Save figure to png
dev.copy(png, "plot6.png", height = 480, width = 480)
dev.off()