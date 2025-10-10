library(ggplot2)

# 1. Exploring the trees dataset (built-in)
head(penguins)  # Preview: mpg, cyl, disp, hp, etc.
View(penguins)
install.packages("palmerpenguins")
library(palmerpenguins)
data("penguins")

# Histogram
hist(penguins$body_mass_g, main="Distribution of Penguin Body Mass", col="lightblue")

# Boxplot
boxplot(penguins$bill_length_mm ~ penguins$species, main="Bill Length by Species")

# Bar chart
library(ggplot2)
ggplot(penguins, aes(x=species)) + geom_bar(fill="skyblue") + ggtitle("Count of Penguins per Species")

#bivariate
ggplot(penguins, aes(x=bill_length_mm, y=flipper_length_mm, color=species)) +
  geom_point() + ggtitle("Bill Length vs Flipper Length")

# Boxplot comparison
ggplot(penguins, aes(x=sex, y=body_mass_g, fill=species)) +
  geom_boxplot() + ggtitle("Body Mass by Sex and Species")


# Pair plot
library(GGally)
ggpairs(penguins, columns = 3:6, aes(color = species))

# Multiple regression
model <- lm(body_mass_g ~ bill_length_mm + flipper_length_mm + sex, data=penguins)
summary(model)

# 3D scatter plot
library(plotly)
plot_ly(penguins, x = ~bill_length_mm, y = ~flipper_length_mm, z = ~body_mass_g, color = ~species, type = "scatter3d", mode = "markers")

