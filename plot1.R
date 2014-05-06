# Unzip 'household_power_consumption.zip' into working directory, creating: household_power_consumption.txt .
# Read input file (requires 'egrep' on local system, e.g. as available Linux and OSX) into an R data.frame .
df_hpc = read.csv(pipe("egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt"), sep=";", header=TRUE, na.strings=c("?"), stringsAsFactors=FALSE)

# Create plot and output to PNG file.
# width=480 pixels, height=480 pixels.
png(filename="plot1.png", width=480, height=480)
hist(df_hpc$Global_active_power, col="red", main="Global Active Poewr", xlab="Global Active Power (kilowatts)")
dev.off()

