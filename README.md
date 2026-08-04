# r-data-analysis

Data cleaning, visualisation, and exploratory analysis in R — using the tidyverse (dplyr, ggplot2, stringr).

## Overview

This repo collects R work built through self-directed practice — following R-Ladies Sydney tutorials, VizWhiz, and the CMU Statistical Reasoning Unit materials — applying tidy-data principles to cleaning, visualising, and exploring data.

## What's inside

- **`data_cleaning.R`** — A tidy-data cleaning workflow using dplyr's pipe syntax (`%>%`): deduplication, text normalization, handling missing values, and deriving new columns. Mirrors the equivalent project in Python (`../python-projects/sales_data_analysis.py`) to show the same workflow in R.
- **`visualizations.R`** — A gallery of four ggplot2 chart types (scatter plot with trend line, boxplot, bar chart, histogram) built on R's built-in `mtcars` dataset, saving each plot to a `plots/` folder.
- **`exploratory_analysis.R`** — An exploratory data analysis pass: summary statistics, grouped comparisons, and a correlation matrix — the standard first step before modelling.

## Concepts demonstrated

- Tidy data principles and the `%>%` pipe workflow
- Data cleaning: deduplication, string normalization, missing value handling
- Grouped aggregation and summary statistics
- Data visualisation with ggplot2 (scatter, boxplot, bar, histogram)
- Correlation analysis

## Running the code

Requires R with the tidyverse packages installed:

```r
install.packages(c("dplyr", "ggplot2", "stringr"))
```

Then run each script from the R console or terminal:

```bash
Rscript data_cleaning.R
Rscript visualizations.R
Rscript exploratory_analysis.R
```

`visualizations.R` and `exploratory_analysis.R` use R's built-in `mtcars` dataset, so they run standalone with no external file needed.


## Background

Written using R and RStudio as part of self-directed data analysis practice. This repo is part of a broader portfolio spanning object-oriented programming (Java), relational databases (SQL), functional programming (Haskell), formal verification (Dafny), and general-purpose Python — see [profile](https://github.com/MuhammadTriesCoding) for the rest.
