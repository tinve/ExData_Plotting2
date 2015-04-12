# read data from files
data <- readRDS("summarySCC_PM25.rds")
sccode <- readRDS("Source_Classification_Code.rds")

# select codes of motor vehicles
codes <- sccode$SCC[grepl(sccode$SCC.Level.Two, pattern = '[Vv]ehicle')]

# select only data from these sources and only from Baltimor City
subdata <- subset(data, data$SCC %in% codes & fips == '24510')

# find total emissions for each year
total <- tapply(subdata$Emissions, subdata$year, sum, na.rm = TRUE)

# launch graphic device
png(filename = 'plot5.png')

# make a plot
barplot(total,
        main = 'PM2.5 emissions of motor vehicle sources \n in Baltimore City, Maryland',
        xlab = 'year', ylab = "Total PM2.5 emission (tons)")
dev.off()

