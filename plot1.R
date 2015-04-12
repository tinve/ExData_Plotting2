# read data from file
data <- readRDS("summarySCC_PM25.rds")

# find total emissions for each year
total <- tapply(data$Emissions, data$year, sum, na.rm = TRUE)

# launch graphic device
png(filename = 'plot1.png')

# make a plot
barplot(total, main = 'PM2.5 emissions in the US',
        xlab = 'year', ylab = "Total PM2.5 emission (tons)")
dev.off()
                