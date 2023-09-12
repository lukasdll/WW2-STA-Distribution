# WW2-STA-Distribution

![WW2 STA Distribution plot](https://i.imgur.com/L7fn17Y.png)

## Table of STA Freq (%) for each range amount
| STA | 0 - 0.0001 BTC | 0.0001 - 0.001 BTC | 0.001 - 0.01 BTC | 0.01 - 0.1 BTC | 0.1 - 1 BTC | 1 - 10 BTC | 10 - 1000 BTC |
|-----|------------|-----------|----------|---------|-------|--------|----------|
| 1   | 19.82       | 30.25      | 40.03    | 50.39   | 59.68  | 69.77   | 78.82     |
| 2   | 16.62       | 21.51      | 23.52    | 25.48   | 24.50  | 20.96   | 17.01     |
| 3   | 12.46       | 14.66      | 14.20    | 12.18   | 9.48   | 6.28    | 3.30      |
| 4   | 10.68       | 9.48       | 9.25     | 5.89    | 4.09   | 2.22    | 0.71      |
| 5   | 8.36        | 7.51       | 4.79     | 2.98    | 1.38   | 0.51    | 0.12      |
| 6   | 6.45        | 5.10       | 3.19     | 1.52    | 0.50   | 0.15    | 0.02      |
| 7   | 5.15        | 3.38       | 2.03     | 0.81    | 0.23   | 0.06    | 0.01      |
| 8   | 4.04        | 2.29       | 1.26     | 0.42    | 0.10   | 0.02    | 0.01      |
| 9   | 3.19        | 1.68       | 0.75     | 0.17    | 0.03   | 0.01    | -         |
| 10  | 2.70        | 1.28       | 0.41     | 0.08    | 0.01   | 0.02    | -         |
| 11  | 10.53       | 2.86       | 0.57     | 0.08    | -      | -       | -         |


## R Code Explanation
### Introduction

The provided R code aims to simulate the distribution of the Same Transaction Allowance (STA) based on different Bitcoin amounts (ranges). The STA value is determined based on a bias percentage associated with each Bitcoin range.
Functions
1. GetRandomBiasedSameTxAllowance

This function calculates a random STA value based on a given bias percentage.

    Input: A percentage (percent) which determines the bias.
    Output: A random STA value between 0 and 100, skewed by the given bias.

2. simulateAllowance

This function simulates the allowance multiple times for different Bitcoin amount ranges.

    Input: Number of runs (simulations) per Bitcoin range (runs). By default, it's set to 10,000.
    Output: A data frame with simulated STA values for each Bitcoin range.

### Simulation Process

    Seven different Bitcoin amounts (rangesBTC) are defined, with values ranging from 0.0001 BTC to 1000 BTC.
    Each Bitcoin amount has an associated bias percentage (percentages), which determines the probability of generating an STA value.
    For each Bitcoin amount, the GetRandomBiasedSameTxAllowance function is called 10,000 times (by default) to simulate STA values.
    Any STA value above 10 is capped at 10, as a user cannot add more than 10 inputs into a CoinJoin.
    All results greater than 10 have been added to STA 10.

### Visualization

The results are visualized using the ggplot2 package. The histogram displays the distribution of STA values for each Bitcoin amount.

    The x-axis represents the STA values (from 0 to 10).
    The y-axis represents the count of occurrences.
    Different Bitcoin amounts are represented by different colors.
