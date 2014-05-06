# Unzip 'household_power_consumption.zip' into working directory, creating: household_power_consumption.txt .
# Read input file (requires 'egrep' on local system, e.g. as available Linux and OSX) into an R data.frame .
df_hpc = read.csv(pipe("egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt"), sep=";", header=TRUE, na.strings=c("?"), stringsAsFactors=FALSE)

# Set date/time to POSIXlt
df_hpc$DateTime <- apply(df_hpc[, c("Date", "Time")], 1, paste, collapse = " ")
df_hpc$DateTime <- strptime(df_hpc$DateTime, format="%d/%m/%Y %H:%M:%S")

# Create plot and output to PNG file.
# width=480 pixels, height=480 pixels.
png(filename='plot3.png', width=480, height=480)
plot(df_hpc$DateTime, df_hpc$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(df_hpc$DateTime, df_hpc$Sub_metering_2, type="l", col="red")
lines(df_hpc$DateTime, df_hpc$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()

