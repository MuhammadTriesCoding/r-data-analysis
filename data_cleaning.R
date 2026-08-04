# data_cleaning.R
#
# A tidy-data cleaning workflow in R: takes a deliberately messy dataset
# (missing values, inconsistent casing, duplicate rows) and cleans it
# using dplyr's pipe-based syntax. Mirrors the same problem tackled in
# Python (see ../python-projects/sales_data_analysis.py) to show the
# equivalent workflow in R.

library(dplyr)
library(stringr)

# --- Generate a small, deliberately messy sales dataset -------------------

raw_data <- tibble(
  order_id   = c(1, 2, 3, 4, 5, 6, 7, 8, 8, 9, 10),
  product    = c("Widget", "Gadget", "widget", "Gizmo", "Gadget",
                 "Widget", NA, "Gizmo", "Gizmo", "Gadget", "Widget"),
  quantity   = c(3, 1, 2, NA, 4, 2, 5, 1, 1, 3, NA),
  unit_price = c(9.99, 19.99, 9.99, 14.50, 19.99,
                 9.99, 14.50, 14.50, 14.50, 19.99, 9.99),
  region     = c("North", "South", "north", "East", "South",
                 "North", "West", "East", "East", "South", "North")
)

cat("Raw dataset:", nrow(raw_data), "rows\n")
cat("Rows with missing values:", sum(!complete.cases(raw_data)), "\n")
cat("Duplicate rows:", sum(duplicated(raw_data)), "\n\n")

# --- Clean the data ---------------------------------------------------------

clean_data <- raw_data %>%
  distinct() %>%                                   # drop exact duplicates
  mutate(
    product = str_to_title(str_trim(product)),      # normalize casing/whitespace
    region  = str_to_title(str_trim(region))
  ) %>%
  filter(!is.na(product), !is.na(quantity)) %>%      # drop rows missing essentials
  mutate(total = quantity * unit_price)              # derived column

cat("=== Cleaned dataset ===\n")
print(clean_data)

# --- Summarise ---------------------------------------------------------------

cat("\n=== Revenue by product ===\n")
clean_data %>%
  group_by(product) %>%
  summarise(revenue = sum(total)) %>%
  arrange(desc(revenue)) %>%
  print()

cat("\n=== Revenue by region ===\n")
clean_data %>%
  group_by(region) %>%
  summarise(revenue = sum(total)) %>%
  arrange(desc(revenue)) %>%
  print()

cat("\n=== Overall summary ===\n")
cat("Total orders:", nrow(clean_data), "\n")
cat("Total revenue: $", round(sum(clean_data$total), 2), "\n")
cat("Average order value: $", round(mean(clean_data$total), 2), "\n")
