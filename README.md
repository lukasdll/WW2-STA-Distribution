# WW2-STA-Distribution

![WW2 STA Distribution plot](https://i.imgur.com/L7fn17Y.png)

R Code Explanation
Introduction

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

Simulation Process

    Seven different Bitcoin amounts (rangesBTC) are defined, with values ranging from 0.0001 BTC to 1000 BTC.
    Each Bitcoin amount has an associated bias percentage (percentages), which determines the probability of generating an STA value.
    For each Bitcoin amount, the GetRandomBiasedSameTxAllowance function is called 10,000 times (by default) to simulate STA values.
    Any STA value above 10 is capped at 10, as a user cannot add more than 10 inputs into a CoinJoin.

Visualization

The results are visualized using the ggplot2 package. The histogram displays the distribution of STA values for each Bitcoin amount.

    The x-axis represents the STA values (from 0 to 10).
    The y-axis represents the count of occurrences.
    Different Bitcoin amounts are represented by different colors.

Key Takeaways

    The visualization allows users to understand how STA values are distributed based on different Bitcoin amounts.
    By observing the histogram, users can infer the likelihood of a particular STA value for a given Bitcoin amount.
