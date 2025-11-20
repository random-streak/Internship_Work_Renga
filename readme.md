# Renga Work — Project Overview

This repository contains the full workflow to:
- Clean and prepare imbalance and price data  
- Analyse how forecasts evolve vs. actuals  
- Test assumptions on long/short grid conditions  
- Build simple models to predict grid state  
- Evaluate revenue and penalty outcomes under different bidding strategies  

---

## Code Flow

The typical flow through the repository is:

1. **Data cleaning**
2. **Forecast vs. actual analysis (per timestamp and over ranges)**
3. **Check long/short price pattern assumption**
4. **Predict grid state (classification models)**
5. **Revenue & penalty analysis for different P-values and strategies**

Each step is mapped to specific notebooks/scripts as described below.

---

## 1. Data Cleaning

These files prepare the raw data for all subsequent analyses:

- **`data_clean_v2.ipynb`**  
  Main notebook for loading, cleaning, and transforming the raw datasets into a consistent format used by the analysis and modelling notebooks.

- **`dummy1.py`**  
  Python script version of (parts of) the cleaning logic, useful for batch runs or integration into other workflows.

---

## 2. Forecast vs. Actual Analysis

These notebooks explore how forecasts evolve over the last 48 hours before delivery and compare them to actual values, both at single timestamps and over ranges:

- **`analysis_per_ts.ipynb`**  
  Visualizes the evolution of forecasts over the last 48 hours for a **single target timestamp**, together with the actual value.

- **`analysis_range.ipynb`**  
  Extends the above idea to **a range of timestamps**, enabling analysis of patterns over multiple consecutive time steps.

- **`analysis_v3.ipynb`**  
  Iterative version of the analysis with additional views/metrics on forecast vs. actual behaviour.

- **`analysis_v5.ipynb`**  
  Further refined analysis, adding more robust visualizations and/or metrics for the forecast evolution.

- **`evolution_analysis.ipynb`**  
  Focused on the **temporal evolution** of forecasts in the last 48 hours before delivery, with aggregated views over time.

---

## 3. Long/Short Pattern Assumption

This notebook checks a specific assumption about price signals and grid state:

- **`long_short_pattern.ipynb`**  
  A short analysis that tests the hypothesis:  
  - If **positive and negative imbalance prices are higher than the day-ahead price**, the grid is considered **short**.  
  - If **imbalance prices are lower than the day-ahead price**, the grid is considered **long**.  

It evaluates how acceptable this assumption is on historical data.

---

## 4. Grid State Prediction Models

These notebooks build models to predict whether the grid is in a long or short state:

- **`predict_imb_n-1hr.ipynb`**  
  Model predicting the grid state using information up to **one hour before delivery**.  
  - Achieved accuracy: **~74.23%** (based on sign correctness between actual and predicted state).

- **`predict_imb_tod.ipynb`**  
  Model predicting the grid state using **time-of-day and related features**.  
  - Achieved accuracy: **~57.23%**.

These models are later used as inputs to strategy and penalty simulations.

---

## 5. Revenue & Penalty Analysis

These notebooks evaluate how revenues and penalties change under different bidding strategies and P-values:

- **`penalty_v1.ipynb`**  
  Baseline implementation to compute **revenues and penalties** as a function of different P-values (bid volumes / quantiles), helping understand the impact of under- and over-production.

- **`penalty_v2.ipynb`**  
  Extended version that:  
  - Explores **combinational strategies** (e.g., different P-values depending on predicted grid state).  
  - Shows how **net revenue (revenue + penalty)** evolves across strategies.

---

## Suggested Reading Order

If you are new to the project, a good order is:

1. `data_clean_v2.ipynb`  
2. `analysis_per_ts.ipynb` / `analysis_range.ipynb` / `evolution_analysis.ipynb`  
3. `long_short_pattern.ipynb`  
4. `predict_imb_n-1hr.ipynb` and `predict_imb_tod.ipynb`  
5. `penalty_v1.ipynb` and `penalty_v2.ipynb`

This follows the logical pipeline from raw data → understanding → prediction → strategy & economics.
