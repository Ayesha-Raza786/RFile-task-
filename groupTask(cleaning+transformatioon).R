# Install once
install.packages("WDI")
install.packages("dplyr")

library(WDI)
library(dplyr)

# Tourism arrivals data (1995–2022)
tourism <- WDI(
  indicator = "ST.INT.ARVL",
  start = 1995,
  end = 2022
)

# GDP data (1995–2022)
gdp <- WDI(
  indicator = c("NY.GDP.MKTP.CD", "NY.GDP.MKTP.KD.ZG"),
  start = 1995,
  end = 2022
)
