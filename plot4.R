# read data from files
data <- readRDS("summarySCC_PM25.rds")
sccode <- readRDS("Source_Classification_Code.rds")

# select codes of combustion coal sources
codes <- sccode$SCC[grepl(sccode$Short.Name, pattern = '[Cc]omb+.+[Cc]oal')]

# select only data from these sources
subdata <- subset(data, data$SCC %in% codes)

# find total emissions for each year
total <- tapply(subdata$Emissions, subdata$year, sum, na.rm = TRUE)

# launch graphic device
png(filename = 'plot4.png')

# make a plot
barplot(total, main = 'PM2.5 emissions of combustion coal sources in the US',
        xlab = 'year', ylab = "Total PM2.5 emission (tons)")
dev.off()

