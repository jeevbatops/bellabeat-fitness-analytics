# Bellabeat Fitness Analytics

**A data analytics case study exploring Fitbit user behaviour to identify opportunities for Bellabeat's wellness products and marketing strategy.**

![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-336791?style=flat&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=flat&logo=powerbi&logoColor=black)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=flat&logo=pandas&logoColor=white)

## 1. Project Overview

This project analyses fitness-tracking data collected from Fitbit users to understand patterns in physical activity, daily steps, calorie expenditure, sleep behaviour, and hourly movement.

The analysis is framed as a business case study for **Bellabeat**, a wellness technology company focused on health-oriented products.

The objective is to translate observed user behaviour into insights that could inform product engagement, personalised activity goals, and wellness-focused marketing strategies.

## 2. Business Objectives

The analysis focuses on the following business questions:

- What patterns can be observed in users' daily step counts and physical activity?
- How are daily steps associated with calorie expenditure?
- How much time do users spend in different activity-intensity categories?
- What patterns and variations exist in users' sleep duration?
- During which hours do users record the most physical activity?
- How can these behavioural patterns inform Bellabeat's engagement strategy?

## 3. Technology Stack

| Technology | Application |
|---|---|
| Python | Data preparation, exploratory analysis and visualisation |
| Pandas | Data loading, manipulation and transformation |
| Matplotlib | Data visualisation |
| Seaborn | Statistical visualisation |
| SQL / PostgreSQL | Database creation, validation and analytical queries |
| Power BI | Dashboard development and reporting |

## 4. Dataset

The project uses Fitbit fitness-tracker data from the Fitabase dataset.

The available data includes:

- Daily activity and step records
- Daily calorie expenditure
- Daily activity intensity
- Hourly steps and calorie records
- Sleep records
- Minute-level activity and intensity records
- Heart-rate records
- Weight-log information

The Python analysis primarily uses four datasets:

- `dailyActivity_merged.csv`
- `sleepDay_merged.csv`
- `hourlySteps_merged.csv`
- `hourlyCalories_merged.csv`

The SQL analysis uses structured daily activity, sleep, hourly steps, hourly calories, hourly intensities, and weight-log tables.

**Data note:** The dataset represents a limited group of Fitbit users and should not be considered representative of all Bellabeat customers.

## 5. Methodology

### Python Analysis

The Jupyter Notebook uses Pandas, Matplotlib, and Seaborn to perform exploratory data analysis.

The analysis includes:

1. Loading and inspecting the datasets.
2. Converting date columns into datetime formats.
3. Checking missing values.
4. Examining the distribution of daily steps.
5. Exploring the relationship between steps and calories burned.
6. Comparing average activity minutes.
7. Analysing sleep-duration distributions.
8. Examining hourly step and calorie patterns.
9. Exploring correlations between activity metrics.
10. Segmenting observations by activity level.

### SQL Analysis

The SQL script creates the `bellabeat_analysis` database and defines tables for daily activity, sleep, hourly steps, hourly calories, hourly intensities, and weight logs.

It includes data-validation and analytical queries covering:

- Distinct user count
- Average daily steps
- Average calorie expenditure
- Activity-minutes distribution
- Top 10 most and least active users
- Daily activity trends
- Steps versus calories
- Average sleep duration
- Sleep versus activity
- Most active hours
- Hourly calorie patterns
- User activity categories
- Average BMI
- Steps versus activity minutes

### Power BI Dashboard

The Power BI report presents the project's fitness analytics through KPI cards and visualisations.

The dashboard includes:

- Average daily steps
- Average daily calories
- Average sleep
- Unique users
- Daily steps trend
- Steps versus calories
- Daily activity intensity
- Hourly activity patterns

## 6. Key Findings

The supplied Python analysis report identifies the following patterns:

**Daily Activity**
- A large proportion of the analysed observations fall below the 10,000-step reference point.
- Light activity accounts for more time than higher-intensity activity categories.

**Energy Expenditure**
- The steps-versus-calories scatter plot indicates a strong positive relationship between daily steps and calories burned.
- The correlation analysis identifies relationships between steps, activity minutes, and calorie expenditure.

**Sleep Behaviour**
- Sleep duration varies across recorded users and nights.
- The report notes that many observations fall below the referenced 7–9-hour sleep range.

**Hourly Activity**
- The hourly step analysis indicates higher activity during the late afternoon and evening.

These are descriptive findings from the available sample, not conclusions about all consumers.

## 7. Business Recommendations

Based on the patterns identified in the analysis, the following opportunities could be explored by Bellabeat:

1. **Personalised activity goals:** Encourage users with achievable targets based on their activity patterns.
2. **Inactivity reminders:** Use timely notifications to encourage movement after extended inactive periods.
3. **Sleep awareness:** Present sleep-duration trends and optional bedtime reminders.
4. **Gamification:** Introduce milestones, activity streaks, and progressive challenges.
5. **Targeted engagement:** Explore notification timing based on observed hourly activity patterns.

These recommendations are hypotheses for further testing, not proven outcomes from the dataset.

## 8. Repository Structure

```text
bellabeat-fitness-analytics/
│
├── Python/
│   └── stravafitness.ipynb
│
├── SQL/
│   └── script.sql
│
├── PowerBI/
│   └── Bellabeat_Fitness_Analytics.pbix
│
├── Dataset/
│   ├── dailyActivity_merged.csv
│   ├── dailyCalories_merged.csv
│   ├── dailyIntensities_merged.csv
│   ├── dailySteps_merged.csv
│   ├── heartrate_seconds_merged.csv
│   ├── hourlyCalories_merged.csv
│   ├── hourlyIntensities_merged.csv
│   ├── hourlySteps_merged.csv
│   ├── minuteCaloriesNarrow_merged.csv
│   ├── minuteCaloriesWide_merged.csv
│   ├── minuteIntensitiesNarrow_merged.csv
│   ├── minuteIntensitiesWide_merged.csv
│   ├── minuteMETsNarrow_merged.csv
│   ├── minuteSleep_merged.csv
│   ├── minuteStepsNarrow_merged.csv
│   ├── minuteStepsWide_merged.csv
│   ├── sleepDay_merged.csv
│   └── weightLogInfo_merged.csv
│
├── Reports/
│   ├── SQL report.pdf
│   └── python_analysis_report_bellabeat.pdf
│
├── Presentation/
│   └── Bellabeat_Fitness_Analytics_Presentation.pptx
│
└── README.md
```

## 9. Project Deliverables

| Deliverable | Description |
|---|---|
| Python Notebook | Exploratory data analysis and visualisations |
| SQL Script | Database schema, validation and analytical queries |
| Power BI Dashboard | Interactive fitness analytics report |
| Python Report | Summary of Python analysis and findings |
| SQL Report | Summary of SQL analytical outputs |
| PowerPoint | Presentation of business findings and recommendations |

## 10. Limitations

- The available Fitbit dataset represents a limited participant sample.
- The findings may not generalise to Bellabeat's actual customer base.
- The analysis is observational and does not establish causation.
- Tracker usage and data completeness may vary between participants.
- Sleep and activity observations require careful user-level and date-level matching when analysing relationships.
- Further validation using Bellabeat's own customer data would be necessary before implementing business decisions.

## 11. Conclusion

This project demonstrates how fitness-tracking data can be used to explore consumer activity patterns and derive business-oriented insights.

By combining Python-based exploratory analysis, SQL querying, and Power BI visualisation, the project connects technical data analysis with practical business questions.

The findings highlight opportunities for Bellabeat to explore personalised activity goals, sleep awareness, timely engagement, and gamified wellness experiences.

---

**Project:** Bellabeat Fitness Analytics  
**Focus:** Data Analytics | Business Intelligence | Consumer Behaviour  
**Tools:** Python | SQL | Power BI