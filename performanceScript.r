#Sets working directory to location of relevant files
setwd("S:/Users/Dean's PC/workspace/EAA_CA2")

#reads result.dat into a table variable, taking into account the header of the file
performanceData <- read.table("results.dat", header=TRUE)

#Time - 10seconds as that is the period the data is captures by bash script
T <- 10

#Utilisation - Captured by subtracting the CPU Idle time from 100. ie 20% idle means utilisation is 80% (100 - 20 = 80)
UI <- (100-performanceData$IDLE)

#System Throughput - (XO) is acheived from dividing total completed transactions(CO) by the time (T)
XO <- (performanceData$CO/T)

#Service demand - Utilisation divided by System throughput
DI <- (UI / XO)

#Response Time - Total users divided by throughput
R <- (performanceData$N / XO)

#dev.new() opens a new window to display plot. Means all plots are generated at the same time on screen
dev.new()

#pch sets vertices to be solid bullet points. Colour of the points is determine depending on the value of UI. Green is low, yellow medium, red is high utilisation
plot(UI, pch=20, main="Utilisation (UI)", xlab="Number of Users (N)", ylab="Utilisation (%)", col=ifelse(UI >= 90, "red3", ifelse(UI <= 30, "green4", "gold3")))

dev.new()
plot(DI, pch=20, main="Service Demand (Di)", xlab="Number of Users (N)", ylab="Average time spent obtaining service" , col="dodgerblue4")

dev.new()
plot(XO, pch=20, main="Throughput (XO)", xlab="Number of Users (N)", ylab="Transactions per second" , col="green4",)

dev.new()
plot(R, pch=20, main="Response Time (R)", xlab="Number of Users (N)", ylab="Seconds" , col=ifelse(R >= 0.9, "red3", ifelse(R <= 0.3, "green4", "gold3")))
