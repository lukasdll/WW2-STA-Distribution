# Ensure the ggplot2 package is installed
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}

# Load the ggplot2 package
library(ggplot2)

# Function to get random biased same transaction allowance
GetRandomBiasedSameTxAllowance <- function(percent) {
  for (num in 0:100) {
    if (sample(1:100, 1) <= percent) {
      return(num)
    }
  }
  return(0)
}

# Function to simulate the allowance multiple times
simulateAllowance <- function(runs=10000) {
  rangesBTC <- c(0.0001, 0.001, 0.01, 0.1, 1, 10, 1000) # 1000 BTC as an upper bound
  percentages <- c(20, 30, 40, 50, 60, 70, 80)
  
  results <- data.frame(toRegisterBTC=rep(rangesBTC, each=runs), sameTxAllowance=integer(length(rangesBTC) * runs))
  
  for (i in 1:(length(rangesBTC))) {
    for (j in 1:runs) {
      allowance <- GetRandomBiasedSameTxAllowance(percentages[i])
      # Cap the allowance at 10
      results$sameTxAllowance[(i-1)*runs + j] <- min(10, allowance)
    }
  }
  return(results)
}

# Simulate and store results
results <- simulateAllowance()

# Visualization
custom_labels <- c("0.0001 BTC", "0.001 BTC", "0.01 BTC", "0.1 BTC", "1 BTC", "10 BTC", "1000 BTC")

print(
  ggplot(results, aes(x=sameTxAllowance, fill=as.factor(toRegisterBTC))) +
    geom_histogram(position="identity", bins=10, alpha=0.5) + # set bins to 10 for distinct bins for each value 0-10
    labs(title="Distribution of SameTxAllowance by toRegister Range", 
         x="SameTxAllowance", 
         y="Count",
         fill="toRegister Range (in BTC)") +
    scale_fill_manual(values = scales::hue_pal()(7), labels = custom_labels) +
    scale_x_continuous(breaks = 0:10) + # Explicitly set x-axis breaks to get ticks for each amount
    theme_minimal()
)

# Calculate and print percentages for each range
calculatePercentage <- function(data) {
  percentages <- list()
  
  rangesBTC <- unique(data$toRegisterBTC)
  
  for (range in rangesBTC) {
    subset_data <- data[data$toRegisterBTC == range,]
    freq_table <- table(subset_data$sameTxAllowance)
    total <- sum(freq_table)
    proportions <- as.data.frame(freq_table) / total * 100
    percentages[[as.character(range)]] <- proportions
  }
  
  return(percentages)
}

# Calculate percentages
percentages <- calculatePercentage(results)

# Print percentages
for (range in names(percentages)) {
  cat(paste("\nFor range", range, "BTC:\n"))
  print(percentages[[range]])
}

#dev.off() # You can uncomment this if you wish to close the graphics device
