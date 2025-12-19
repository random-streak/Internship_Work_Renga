# Renga Work — Project Overview

This repository contains the full workflow for analysing imbalance settlement schemes and testing strategies based on probabilistic forecasts. It covers:

- Data cleaning and preprocessing  
- Forecast evolution analysis (last 48h before delivery)  
- Long/short grid state assumption checks  
- Grid state prediction models  
- Revenue and penalty impact under different bidding strategies  
- Comparison of French vs German imbalance penalty schemes  

---
## Quick Start

If you just want to reproduce the main results, follow this order:

1. **Set up the environment**
   - Use Python (3.x) and install the usual data stack:
     - `pandas`, `numpy`, `matplotlib`, `scikit-learn`, `jupyter` / `jupyterlab`, etc.
   - (If you have a `requirements.txt` in this repo, install with `pip install -r requirements.txt`.)

2. **Clean and prepare the data**
   - Open **`data_process/data_clean_v2.ipynb`**.
   - Configure the paths to your raw data as required by the notebook (usually in the first cells).
   - Run all cells to generate the cleaned datasets used by the rest of the notebooks.
   - Optional: use **`data_process/dummy1.py`** if you prefer running the cleaning as a script.

3. **Explore forecast evolution** (Optional)
   - For a **single timestamp**, open **`analysis_per_ts.ipynb`**.  
   - For a **range of timestamps**, use **`analysis_range.ipynb`** or **`evolution_analysis.ipynb`**.  
   - For more polished/cleaned-up versions, check the notebooks in **`final_versions/`**.

4. **Check the long/short grid assumption** (Optional)
   - Run **`long_short_pattern.ipynb`** to see how well the rule  
     “imbalance price > DA ⇒ grid short; imbalance price < DA ⇒ grid long”  
     holds in the data.

5. **Run the grid state prediction models**
   - Start with **`predict_imb_n-1hr.ipynb`** (main model, ~**74.23%** accuracy).  
   - Then compare with **`predict_imb_tod.ipynb`** (~**57.23%** accuracy).

6. **Evaluate revenue and penalties**
   - Use **`penalty_v1.ipynb`** for the baseline revenue/penalty analysis across different P-values.  
   - Use **`penalty_v2.ipynb`** to explore combinational strategies and examine Pareto-optimal trade-offs.

7. **Review final outputs and slides**
   - Browse **`01_Revamped_Results/`** for the result files used in analysis and figures.  
   - Open the PDFs in **`presentation/`** to see the different stages of the study and final conclusions.

---
## Folder Structure & Code Flow

### 1. `data_process/` – Data Cleaning

- **`data_clean_v2.ipynb`**  
  Main notebook for cleaning and preprocessing the raw input datasets used throughout the project.

- **`dummy1.py`**  
  Script version of the data-cleaning logic, useful for batch processing or reuse in other pipelines.

All subsequent notebooks assume that the data has been processed via these scripts.

---

### 2. Forecast Evolution Analysis

The following notebooks analyse how forecasts evolve over the last **48 hours** before delivery and compare them with the actual values, both for single timestamps and over ranges:

- **`analysis_per_ts.ipynb`**  
  Shows the evolution of forecasts over the last 48 hours for a **single target timestamp**, together with the actual value.

- **`analysis_range.ipynb`**  
  Extends the analysis to a **range of timestamps**, enabling pattern detection over multiple intervals.

- **`analysis_v3.ipynb`** and **`analysis_v5.ipynb`**  
  Iterative, refined versions of the analysis with additional metrics and visualisations for forecast vs. actual behaviour.

- **`evolution_analysis.ipynb`**  
  Focused view on the temporal evolution of forecasts in the last 48 hours across multiple delivery times.

---

### 3. Long/Short Grid Assumption Check

- **`long_short_pattern.ipynb`**  
  A concise notebook that tests the following working assumption:

  - If **both positive and negative imbalance prices exceed the day-ahead price**, the grid is considered **short**.  
  - If **imbalance prices are below the day-ahead price**, the grid is considered **long**.

This notebook checks how acceptable this assumption is when confronted with historical data.

---

### 4. Grid State Prediction Models

These notebooks build models to predict whether the grid is in a long or short state:

- **`predict_imb_n-1hr.ipynb`**  
  Predicts grid state using information available **1 hour before delivery**.  
  - Achieved accuracy: **≈ 74.23%**.

- **`predict_imb_tod.ipynb`**  
  Predicts grid state mainly from **time-of-day and related features**.  
  - Achieved accuracy: **≈ 57.23%**.

These models are later used as inputs to revenue and penalty simulations.

---

### 5. Revenue & Penalty Analysis

- **`penalty_v1.ipynb`** and **`penalty_v2.ipynb`**  
  Contain the code to evaluate how **revenue** and **penalties** evolve for different P-values and combinational strategies (e.g. strategies that depend on the predicted grid state).

Key goals of these notebooks:
- Quantify the trade-off between revenue and volume deviation.
- Assess how different strategies perform under various penalty schemes.

---

### 6. `final_versions/` – Consolidated Code

This folder contains the **most recent and consolidated versions** of the notebooks and scripts used for the main analyses described above. If you only want the “clean” final code, start here.

---

### 7. `01_Revamped_Results/` – Processed Results

This folder stores the **processed outputs** used in the analysis and in the presentation of results (figures, tables, and intermediate result files).

---

### 8. `presentation/` – Slides

Contains three PDF presentations given at different stages of the internship, summarising:

- The methodology and gradual evolution of the study  
- Key intermediate and final results  
- Discussion of implications for market participation and regulation  

---

## Market Comparison & Key Findings

The study is extended to compare **French** and **German** imbalance penalty schemes:

- **French market**:  
  - Distinct **positive** and **negative** imbalance settlement prices.  

- **German market**:  
  - A **single imbalance price** applied to both positive and negative imbalances.

### Strategy vs Deterministic Forecast

One key result is:

- When **revenue and volume deviation are weighted equally**, a **deterministic forecast** still performs better than the probabilistic-based strategy developed here.
- When **revenue is weighted at 1.5× or more** relative to volume deviation, the proposed strategy becomes **Pareto-optimal**, outperforming pure deterministic forecasts in terms of the chosen objective.

### Final Conclusion

The overall conclusion is that **probabilistic forecasts can indeed improve revenue optimisation and reduce penalties** in theory and in backtesting. However, under **current market regulations and requirements set by energy regulators**, they **cannot be directly packaged and offered as a standalone market service or as an explicit value-added product**, despite their operational benefits.
```

