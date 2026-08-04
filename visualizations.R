# visualizations.R
#
# A small gallery of ggplot2 visualisations covering four common chart
# types, built on R's built-in `mtcars` dataset so this runs standalone
# with no external file needed. Each plot is saved to the `plots/`
# folder as a PNG.

library(ggplot2)
library(dplyr)

dir.create("plots", showWarnings = FALSE)

data <- mtcars %>%
  mutate(cyl = factor(cyl))  # treat cylinder count as a category for grouping/colour

# --- 1. Scatter plot with a linear trend line --------------------------------
# Relationship between engine weight and fuel efficiency.

p1 <- ggplot(data, aes(x = wt, y = mpg, colour = cyl)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE, colour = "grey40", linetype = "dashed") +
  labs(
    title = "Fuel Efficiency vs. Weight",
    x = "Weight (1000 lbs)", y = "Miles per Gallon", colour = "Cylinders"
  ) +
  theme_minimal()

ggsave("plots/scatter_mpg_vs_weight.png", p1, width = 6, height = 4)

# --- 2. Boxplot ---------------------------------------------------------------
# Distribution of fuel efficiency grouped by cylinder count.

p2 <- ggplot(data, aes(x = cyl, y = mpg, fill = cyl)) +
  geom_boxplot() +
  labs(title = "MPG Distribution by Cylinder Count", x = "Cylinders", y = "Miles per Gallon") +
  theme_minimal() +
  theme(legend.position = "none")

ggsave("plots/boxplot_mpg_by_cyl.png", p2, width = 6, height = 4)

# --- 3. Bar chart --------------------------------------------------------------
# Average horsepower by cylinder count.

p3 <- data %>%
  group_by(cyl) %>%
  summarise(avg_hp = mean(hp)) %>%
  ggplot(aes(x = cyl, y = avg_hp, fill = cyl)) +
  geom_col() +
  labs(title = "Average Horsepower by Cylinder Count", x = "Cylinders", y = "Average Horsepower") +
  theme_minimal() +
  theme(legend.position = "none")

ggsave("plots/bar_avg_hp_by_cyl.png", p3, width = 6, height = 4)

# --- 4. Histogram ----------------------------------------------------------------
# Distribution of fuel efficiency across all cars.

p4 <- ggplot(data, aes(x = mpg)) +
  geom_histogram(binwidth = 2, fill = "steelblue", colour = "white") +
  labs(title = "Distribution of Fuel Efficiency", x = "Miles per Gallon", y = "Count") +
  theme_minimal()

ggsave("plots/histogram_mpg.png", p4, width = 6, height = 4)

cat("Saved 4 plots to the plots/ folder.\n")
