library(ggplot2)

# read data from file
data <- readRDS("summarySCC_PM25.rds")

# select only Baltimor City data
subdata <- subset(data, fips == '24510')

# find total emissions for each year and each source
total <- aggregate(Emissions ~ year + type, subdata, sum)

# launch graphic device
png(filename = 'plot3.png')

# make a plot
g <- qplot(year, Emissions, data = total, col = type, geom = "line",
      main = "PM2.5 emissions in Baltimor City, Maryland")
print(g)
dev.off()

