library("data.table")

# Read Data & Take a summary #
Household_power_cons <- data.table::fread("~/Me_Myself_I/Egitim/Coursera/The_Data_Scientist_Toolbox/EDA/Week1/household_power_consumption.txt", sep=";", na.strings="?")
head(Household_power_cons)
summary(Household_power_cons)

# Date conversion
Household_power_cons[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Selecting the between 2007-02-01 and 2007-02-02
Household_power_sub<- Household_power_cons[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Converting Global_active_power to numeric

Household_power_sub[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
Household_power_sub[, Sub_metering_1 := lapply(.SD, as.numeric), .SDcols = c("Sub_metering_1")]
Household_power_sub[, Sub_metering_2 := lapply(.SD, as.numeric), .SDcols = c("Sub_metering_2")]
Household_power_sub[, Sub_metering_3 := lapply(.SD, as.numeric), .SDcols = c("Sub_metering_3")]
Household_power_sub[, Global_reactive_power := lapply(.SD, as.numeric), .SDcols = c("Global_reactive_power")]
Household_power_sub[, Voltage := lapply(.SD, as.numeric), .SDcols = c("Voltage")]

# Setting png conditions and par

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

#plot 1

plot(x=Household_power_sub[, dateTime], y=Household_power_sub[, Global_active_power], type="l", xlab="", ylab= "Global Active Power")

#plot 2

plot(x=Household_power_sub[, dateTime], y=Household_power_sub[, Voltage], type="l", xlab="", ylab= "Voltage")

#plot 3

plot(Household_power_sub[, dateTime], Household_power_sub[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(Household_power_sub[, dateTime], Household_power_sub[, Sub_metering_2],col="red")
lines(Household_power_sub[, dateTime], Household_power_sub[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=1, bty="n")

#plot 4 

plot(x=Household_power_sub[, dateTime], y=Household_power_sub[, Global_reactive_power], type="l", xlab="", ylab= "Global_reactive_power")

dev.off()
