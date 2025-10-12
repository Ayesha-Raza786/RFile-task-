This project explores the relationship between international tourism arrivals and economic growth across multiple countries from 1995 to 2022.
The data combines official statistics from the United Nations World Tourism Organization (UNWTO) and the World Bank’s World Development Indicators (WDI).
The main objective is to evaluate how tourism activity influences national economic growth using panel data econometric models.
# Tourism and Economic Growth Analysis


---

## Dataset Sources

| Dataset | Source | Description |
|----------|---------|-------------|
| Tourism Data | UNWTO via World Bank (WDI) | Annual international tourist arrivals by country |
| GDP Data | World Bank (WDI) | Annual GDP (current US$) and GDP growth rate (%) |
| Coverage | 1995–2022 | Data availability varies by country |

The data were accessed directly in R using the **WDI** package for consistency and reliability.

---

## Data Cleaning
The datasets were cleaned and standardized to ensure accuracy and comparability across countries.

- Standardized country names using ISO3 codes.  
- Removed missing values for countries with incomplete records.  
- Checked and removed duplicates using country-year identifiers.  
- Examined extreme values to confirm they represented valid economic data.  
- Verified variable names and data types for consistency.  

After cleaning, the dataset included approximately 217 countries and more than 4,900 valid observations.

---

## Data Transformation
The cleaned tourism and GDP datasets were merged and transformed into a structured, analysis-ready format.

1. Merged both datasets on **country**, **ISO3 code**, and **year**.  
2. Created a new variable **Tourism-to-GDP Ratio** = (Tourism Arrivals / GDP) to represent tourism’s share in each economy.  
3. Converted the data into a **panel format** (country-year pairs) for use in fixed and random effects models.  
4. Verified that all variables were numeric and contained no missing values.  
5. Accepted an **unbalanced panel structure**, as not all countries had complete yearly data.

---

## Analytical Process
The dataset was analyzed in R using the **plm** package.  
Two panel regression models were estimated:

- **Fixed Effects Model:** Measures within-country changes over time.  
- **Random Effects Model:** Captures both within- and between-country variations.  
- **Hausman Test:** Used to select the most consistent model.

The Hausman test indicated that the **Fixed Effects Model** was more appropriate, suggesting that country-specific characteristics influence the relationship between tourism and economic growth.

---

## Project Structure

