# 📊 Exploratory Data Analysis on COVID-19: Deaths and Vaccination with SQL

**Keywords:** SQL, Data Analysis, Our World in Data, COVID-19, Vaccination, Mortality, Data Aggregation, Visualization

---

## 🧭 1. Executive Summary

This project presents a **simple yet structured exploratory analysis** of public data on the COVID-19 pandemic using two datasets from **Our World in Data**: one related to COVID-19 deaths and the other to vaccination campaigns.

The goal is to **practice and demonstrate my SQL skills** by:
- exploring and analyzing real-world datasets,
- performing relevant aggregations (by country, continent, and period),
- identifying general trends between vaccination and mortality,
- delivering clear, interpretable results with business relevance.

---

## 💡 2. Business Problem

**Main question:**

> How have vaccination campaigns influenced the evolution of COVID-19-related deaths across the world?

This question reflects a **data-driven decision-making approach** applied to a public health context:
- understanding how the pandemic evolved over time,  
- observing regional differences,  
- assessing the global impact of vaccination on mortality.  

---

## 🧩 3. Methodology

### 3.1. Data Sources
- [COVID-19 Deaths (Our World in Data)](https://ourworldindata.org/covid-deaths)  
- [COVID-19 Vaccinations (Our World in Data)](https://ourworldindata.org/covid-vaccinations)

Data files used in this project (stored in `/data`):
- `CovidDeaths.xlsx`
- `CovidVaccinations.xlsx`

Each file contains daily country-level data:
- **CovidDeaths:** cases, deaths, population  
- **CovidVaccinations:** administered doses, vaccinated people, vaccination rates  

---

### 3.2. Main SQL Analysis Steps

1. **Descriptive Exploration**
   - Total number of countries and available time period  
   - Total global population represented in the dataset  
   - Global death rate (`total_deaths / population`)  
   - Average vaccination rate by continent  

2. **Data Join**
   - Join between `CovidDeaths` and `CovidVaccinations` on `location` and `date`  
   - Consistency check between both datasets  

3. **Exploratory Analysis**
   - Tracking the evolution of **cumulative deaths** and **total vaccinations** over time  
   - Computing the **average number of daily deaths** before and after vaccination campaigns per country  
   - Ranking countries by:
     - **Highest vaccination rate**  
     - **Lowest death rate**

4. **Visualization**
   - Exporting aggregated results to a Python notebook or Power BI:
     - trend chart: deaths vs. vaccinations (worldwide)  
     - top 10 vaccinated countries vs. their death rates  

---

## 🛠️ 4. Skills & Technologies Used

**Languages & Tools**
- SQL Server (joins, aggregations, grouping functions)
- Excel (initial data preparation)
- Optional: Power BI / Python (visualization)

**Demonstrated Skills**
- Handling real-world datasets
- Intermediate SQL manipulation (GROUP BY, JOIN, simple CTEs)
- Building basic KPIs (rates, averages, rankings)
- Translating insights into business context  

---

## 📈 5. Results & Key Insights

- The evolution of **vaccination campaigns** is generally correlated with a **stabilization and decline in deaths** after 2021 in many regions.  
- Countries with **high vaccination coverage** tend to show **lower death rates per capita** compared to those with slower rollouts.  
- **Regional disparities** (e.g., Africa vs. Europe) highlight inequalities in vaccine access and healthcare infrastructure.  

These findings show how a straightforward SQL-based approach can reveal **global insights from open data**.  

---

## 🚀 6. Next Steps / Future Improvements

- Add additional dimensions such as age groups, government policies, and GDP per capita.  
- Extend the analysis using **Python (pandas, matplotlib)** for advanced temporal visualization.  
- Build a **Power BI dashboard** to summarize results by continent and country.  
- Automate data updates using the **Our World in Data API**.  

---

## 🔁 7. Reproducibility & Transparency

- All datasets are public and freely available through **Our World in Data**.  
- The provided SQL scripts allow for **full reproducibility** of the analysis using the `.xlsx` source files.  
- The project demonstrates a **pragmatic and rigorous approach** to data exploration at an intermediate SQL level.  
