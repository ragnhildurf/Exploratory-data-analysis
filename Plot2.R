# Exploratory data analysis
# Project 2
# Author: Ragnhildur G. Finnbjornsdottir
# Date: 20. september 2014
##############################

setwd("./EDA_Project2")

nei <- readRDS("./summarySCC_PM25.rds")
scc <- readRDS("./Source_Classification_Code.rds")

################################################

# Plot 2: 
# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to 
# make a plot answering this question.

# Subset the data for only Boltimore city
Marynei <- subset(nei, (nei$fips == "24510"))

# Aggregate the data for total emission per year
agg <- aggregate(Emissions ~ year , data = Marynei, FUN = sum)

# Fix margins so titles fit
par(mar=c(5.1, 5.1, 4.1, 2.1))

# Create barplot
barplot(agg$Emissions, names.arg = agg$year, 
        xlab = "Year", 
        ylab = expression("Total PM"[2.5]* " emissions"),
        main = expression("Total PM"[2.5]* " emissions in Baltimore city"),
        col = 15)

# Save figure to png
dev.copy(png, "plot2.png", height = 480, width = 480)
dev.off()