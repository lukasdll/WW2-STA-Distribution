# WW2-STA-Distribution

![WW2 STA Distribution plot](https://i.imgur.com/L7fn17Y.png)


## For range 0.0001 BTC:
| STA | Freq (%) |
|-----|----------|
| 1   | 19.82    |
| 2   | 16.62    |
| 3   | 12.46    |
| 4   | 10.68    |
| 5   | 8.36     |
| 6   | 6.45     |
| 7   | 5.15     |
| 8   | 4.04     |
| 9   | 3.19     |
| 10  | 2.70     |
| 11  | 10.53    |

## For range 0.001 BTC:
| STA | Freq (%) |
|-----|----------|
| 1   | 30.25    |
| 2   | 21.51    |
| 3   | 14.66    |
| 4   | 9.48     |
| 5   | 7.51     |
| 6   | 5.10     |
| 7   | 3.38     |
| 8   | 2.29     |
| 9   | 1.68     |
| 10  | 1.28     |
| 11  | 2.86     |

## For range 0.01 BTC:
| STA | Freq (%) |
|-----|----------|
| 1   | 40.03    |
| 2   | 23.52    |
| 3   | 14.20    |
| 4   | 9.25     |
| 5   | 4.79     |
| 6   | 3.19     |
| 7   | 2.03     |
| 8   | 1.26     |
| 9   | 0.75     |
| 10  | 0.41     |
| 11  | 0.57     |

## For range 0.1 BTC:
| STA | Freq (%) |
|-----|----------|
| 1   | 50.39    |
| 2   | 25.48    |
| 3   | 12.18    |
| 4   | 5.89     |
| 5   | 2.98     |
| 6   | 1.52     |
| 7   | 0.81     |
| 8   | 0.42     |
| 9   | 0.17     |
| 10  | 0.08     |
| 11  | 0.08     |

## For range 1 BTC:
| STA | Freq (%) |
|-----|----------|
| 1   | 59.68    |
| 2   | 24.50    |
| 3   | 9.48     |
| 4   | 4.09     |
| 5   | 1.38     |
| 6   | 0.50     |
| 7   | 0.23     |
| 8   | 0.10     |
| 9   | 0.03     |
| 10  | 0.01     |

## For range 10 BTC:
| STA | Freq (%) |
|-----|----------|
| 1   | 69.77    |
| 2   | 20.96    |
| 3   | 6.28     |
| 4   | 2.22     |
| 5   | 0.51     |
| 6   | 0.15     |
| 7   | 0.06     |
| 8   | 0.02     |
| 9   | 0.01     |
| 10  | 0.02     |

## For range 1000 BTC:
| STA | Freq (%) |
|-----|----------|
| 1   | 78.82    |
| 2   | 17.01    |
| 3   | 3.30     |
| 4   | 0.71     |
| 5   | 0.12     |
| 6   | 0.02     |
| 7   | 0.01     |
| 8   | 0.01     |

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
