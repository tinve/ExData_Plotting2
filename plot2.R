# read data from file
data <- readRDS("summarySCC_PM25.rds")

# select only Baltimor City data
subdata <- subset(data, fips == '24510')

# find total emissions for each year
total <- tapply(subdata$Emissions, subdata$year, sum, na.rm = TRUE)

# launch graphic device
png(filename = 'plot2.png')

# make a plot
barplot(total, main = "PM2.5 emissions in Baltimore City, Maryland",
        xlab = 'year', ylab = "Total PM2.5 emission (tons)")
dev.off()

