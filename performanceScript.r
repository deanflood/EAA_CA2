setwd("S:/Users/Dean's PC/workspace/EAA_CA2")

performanceData <- read.table("results.dat", header=TRUE)

UI <- (100-performanceData$IDLE)
X0 <- (performanceData$CO/10)
Di <- (UI / X0)
R <- (performanceData$N / X0)

dev.new()
plot(UI, main="Utilisation (UI)", xlab="Number of Users (N)", ylab="Utilisation (%)")

dev.new()
plot(Di, main="Service Demand (Di)", xlab="Number of Users (N)", ylab="Average time spent obtaining service")

dev.new()
plot(X0, main="Throughput (X0)", xlab="Number of Users (N)", ylab="Transactions per second")

dev.new()
plot(R, main="Response Time (R)", xlab="Number of Users (N)", ylab="Seconds")
