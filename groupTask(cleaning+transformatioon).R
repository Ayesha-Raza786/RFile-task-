
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
dim(tourism)
head(tourism)
summary(tourism)

gdp <- WDI(
  indicator = c("NY.GDP.MKTP.CD", "NY.GDP.MKTP.KD.ZG"),
  start = 1995,
  end = 2022
)

gdp <- gdp %>%
  rename(
    gdp = NY.GDP.MKTP.CD,
    gdp_growth = NY.GDP.MKTP.KD.ZG
  )
panel <- merge(tourism, gdp, by = c("iso3c", "year"))

library(dplyr)

panel_clean <- panel %>%
  filter(!is.na(ST.INT.ARVL), !is.na(gdp), !is.na(gdp_growth)) %>%
  filter(!grepl("Africa|Europe|Asia|World|America", country.x)) %>%  # remove regions
  mutate(
    tourism_to_gdp = (ST.INT.ARVL / gdp) * 100
  ) %>%
  select(iso3c, year, country = country.x, tourism_arrivals = ST.INT.ARVL, gdp, gdp_growth, tourism_to_gdp)


library(plm)

pdata <- pdata.frame(panel_clean, index = c("iso3c", "year"))
model <- plm(gdp_growth ~ tourism_to_gdp, data = pdata, model = "within")
summary(model)


summary(panel_clean)
dim(panel_clean)

library(plm)

pdata <- pdata.frame(panel_clean, index = c("iso3c", "year"))

model <- plm(
  gdp_growth ~ tourism_to_gdp,
  data = pdata,
  model = "within"   # fixed effects
)

summary(model)

model_random <- plm(gdp_growth ~ tourism_to_gdp, data = pdata, model = "random")
summary(model_random)

# Hausman Test: Which model is better?
phtest(model, model_random)

colSums(is.na(pdata))
str(pdata)

# 1️ Convert iso3c and year to proper types
panel_clean$iso3c <- as.character(panel_clean$iso3c)
panel_clean$iso3c <- trimws(panel_clean$iso3c)   # remove blank spaces
panel_clean <- panel_clean[panel_clean$iso3c != "", ]  # remove empty levels
panel_clean$year <- as.integer(panel_clean$year)

# 2️ Recreate pdata cleanly
library(plm)
pdata <- pdata.frame(panel_clean, index = c("iso3c", "year"))

# 3️ Re-run both models
model_fixed <- plm(gdp_growth ~ tourism_to_gdp, data = pdata, model = "within")
model_random <- plm(gdp_growth ~ tourism_to_gdp, data = pdata, model = "random")

# 4️ Summaries
summary(model_fixed)
summary(model_random)

# 5️ Hausman test
phtest(model_fixed, model_random)
names(panel_clean)


# Save as CSV file
write.csv(panel_clean, "panel_clean.csv", row.names = FALSE)




