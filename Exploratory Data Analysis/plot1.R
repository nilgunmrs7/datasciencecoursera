library("data.table")

# Read Data & Take a summary #
Household_power_cons <- data.table::fread("~/Me_Myself_I/Egitim/Coursera/The_Data_Scientist_Toolbox/EDA/Week1/household_power_consumption.txt", sep=";", na.strings="?")
head(Household_power_cons)
summary(Household_power_cons)

# Change Date Column to Date Type
Household_power_cons[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Selecting the between 2007-02-01 and 2007-02-02
Household_power_sub<- Household_power_cons[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#Converting Global_active_power to numeric

Household_power_sub[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Setting png conditions

png("plot1.png", width=480, height=480)

# Plot 1

hist(Household_power_sub[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


dev.off()


