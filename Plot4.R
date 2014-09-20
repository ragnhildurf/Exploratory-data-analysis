# Exploratory data analysis
# Project 2
# Author: Ragnhildur G. Finnbjornsdottir
# Date: 20. september 2014
##############################

setwd("./EDA_Project2")

nei <- readRDS("./summarySCC_PM25.rds")
scc <- readRDS("./Source_Classification_Code.rds")

###############################################################

# # Plot 4:
# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

# Subset the data for emissions only from sourses with "coal"
coalnei <- subset(nei, grepl("coal", scc$Short.Name, ignore.case = TRUE))

agg <- aggregate(Emissions ~ year, data = coalnei, FUN = sum)

# Make the total PM2.5 emission amount more reader friendly
agg$Emissions <- round(agg$Emissions/1000)

# Create descriptive plot
qplot(year, Emissions, data = agg, geom ="path",
      xlab = "Year", 
      ylab = expression("Total PM"[2.5]* " emissions (x1000 tons)"),
      main = expression("PM"[2.5]* " emissions from coal combustion-related sources"))

# Save figure to png
dev.copy(png, "plot4.png", height = 480, width = 480)
dev.off()