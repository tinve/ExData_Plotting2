library(ggplot2)

# read data from files
data <- readRDS("summarySCC_PM25.rds")
sccode <- readRDS("Source_Classification_Code.rds")

# select codes of motor vehicles
codes <- sccode$SCC[grepl(sccode$SCC.Level.Two, pattern = '[Vv]ehicle')]

# select only data from these sources and only from Baltimor or LA
subdata <- subset(data, data$SCC %in% codes & (fips == '24510' | fips == '06037'))

# rename factor levels of location
subdata$fips <- as.factor(subdata$fips)
levels(subdata$fips) <- c('Los Angeles County', 'Baltimor City')

# find total emissions for each year and each location
total <- aggregate(Emissions ~ year + fips, subdata, sum)

# launch graphic device
png(filename = 'plot6.png')

# make a plot
g <- qplot(year, Emissions, data = total, col = fips, geom = "line",
      main = "PM2.5 emissions from motor vehicles")
print(g)
dev.off()

