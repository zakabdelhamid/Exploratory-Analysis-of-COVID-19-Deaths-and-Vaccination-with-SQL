# 📊 Exploratory Data Analysis on COVID-19: Deaths and Vaccination with SQL

An end-to-end data analysis project showcasing SQL and Python skills through the exploration of COVID-19 deaths and vaccination datasets from Our World in Data.

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
   - Exporting aggregated results to a Python notebook:
     - trend chart: deaths vs. vaccinations (worldwide)  
     - vaccination and death rate by continent  
     - top 10 countries by vaccination or infection rate  

---

## 🛠️ 4. Skills & Technologies Used

**Languages & Tools**
- SQL Server (joins, aggregations, grouping functions)
- Excel (initial data preparation)
- Python (visualization with Matplotlib)

**Demonstrated Skills**
- Handling real-world datasets
- Intermediate SQL manipulation (GROUP BY, JOIN, simple CTEs)
- Building basic KPIs (rates, averages, rankings)
- Translating insights into business context  

---

## 📈 5. Results & Key Insights

- The datasets analyzed cover the period up to **mid-2021**, corresponding to the early stages of the global vaccination rollout.  
- During this period, **cumulative deaths** continued to rise as vaccinations were just beginning, reflecting overlapping pandemic waves.  
- **North and South America** recorded the highest death rates relative to their populations, followed by **Europe**, while **Asia**, **Africa**, and **Oceania** displayed lower rates.  
- Vaccination coverage and mortality trends varied widely between regions, highlighting **inequalities in healthcare infrastructure and vaccine access**.

---

## 🧭 6. Key Takeaways

- **Temporal limitation:** The available data stops at May 2021, before widespread vaccination coverage, preventing a full view of long-term vaccine effects.  
- **Regional disparities:** Significant gaps exist between continents — higher vaccination and lower mortality in developed regions versus slower progress in others.  
- **Timing effect:** The apparent increase in daily deaths “after vaccination” is explained by the fact that campaigns started during peak infection waves, not by vaccine inefficiency.  
- **Data integrity:** Differences in reporting accuracy and frequency between countries affect the comparability of results.  

---

## 💼 7. Business Recommendations

- **Enhance data governance:**  
  Public health organizations should establish consistent, standardized, and timely COVID-19 reporting practices worldwide to ensure reliable analytics.

- **Invest in monitoring systems:**  
  Develop real-time dashboards integrating vaccination, infection, and mortality metrics to guide rapid decision-making.

- **Promote equitable distribution:**  
  Use data-driven insights to allocate vaccine resources to low-coverage regions, reducing global vulnerability and health inequality.

- **Extend the analytical horizon:**  
  Future analyses should include post-2021 data to measure the long-term correlation between vaccination coverage and reduced mortality.

- **Integrate socioeconomic data:**  
  Combining epidemiological data with demographic and economic indicators would help explain disparities and improve future health crisis management strategies.

---

## 🚀 8. Next Steps / Future Improvements

- Include demographic and economic dimensions (age, GDP, healthcare capacity).  
- Perform time-series forecasting using **Python (pandas, matplotlib, scikit-learn)**.  
- Build an interactive **Power BI or Tableau dashboard**.  
- Automate data collection and updates via the **Our World in Data API**.  

---

## 🔁 9. Reproducibility & Transparency

- All datasets are public and freely available through **Our World in Data**.  
- The provided SQL scripts and Python notebooks ensure **full reproducibility**.  
- The project demonstrates a **practical, analytical, and business-oriented approach** to public data exploration at an intermediate SQL level.
📘 **Interactive Notebook:**  
You can view the full visualization notebook here → [Google Colab Link](https://colab.research.google.com/drive/1QalcIkn5MjXBgJEXshGy9tQ6s2GqWmn0?usp=sharing)
