# exploratory_analysis.R
#
# An exploratory data analysis (EDA) pass over R's built-in `mtcars`
# dataset: summary statistics, grouped comparisons, and a correlation
# matrix — the standard first pass before modelling anything.

library(dplyr)

data <- mtcars

cat("=== Dataset overview ===\n")
cat("Rows:", nrow(data), " Columns:", ncol(data), "\n")
str(data)

cat("\n=== Summary statistics ===\n")
print(summary(data))

cat("\n=== Fuel efficiency by cylinder count ===\n")
data %>%
  group_by(cyl) %>%
  summarise(
    n         = n(),
    mean_mpg  = round(mean(mpg), 2),
    sd_mpg    = round(sd(mpg), 2),
    min_mpg   = min(mpg),
    max_mpg   = max(mpg)
  ) %>%
  print()

cat("\n=== Correlation matrix (selected variables) ===\n")
vars_of_interest <- data %>% select(mpg, wt, hp, disp, qsec)
correlations <- round(cor(vars_of_interest), 2)
print(correlations)

cat("\n=== Strongest correlations with mpg ===\n")
mpg_correlations <- correlations["mpg", ]
mpg_correlations <- sort(mpg_correlations[names(mpg_correlations) != "mpg"], decreasing = TRUE)
print(mpg_correlations)

cat("\nInterpretation: mpg correlates most strongly (in either direction) with",
    names(which.max(abs(mpg_correlations))),
    "— consistent with heavier, higher-displacement cars being less fuel efficient.\n")
