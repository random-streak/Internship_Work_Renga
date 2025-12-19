# Renga Work — Project Overview

This repository contains the full workflow to:
- Clean and prepare imbalance and price data
- Contains notebooks, scripts and sample data used for analysing imbalance forecasts, predicting grid state (long/short), and evaluating revenue & penalty outcomes under different bidding strategies.

---

**Quick summary**

- **Purpose:** Analyse forecast vs actuals, build simple grid-state prediction models, and evaluate economic outcomes (revenue & penalty).
- **Primary language:** Python (notebooks + small scripts)
- **Environment:** Uses a virtual environment; install dependencies from `requirements.txt`.

---

**Repository layout (high level)**

- `data/` : Raw and intermediate datasets (subfolders for `neoen` and `sunnic`).
- `analysis/` : Exploratory analysis notebooks.
- `final_versions/` : Reorganized final notebooks and analyses (penalty, grid state prediction, long & short pattern and forecast evolution study ).
- `data_process/` : Data cleaning notebooks and helper scripts.
- `sample_results/` : Output CSVs produced by analyses.
- `requirements.txt` : Python dependencies list.

---

**Getting started (minimal)**

1. Create a virtual environment and install dependencies (recommended):

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
```

2. Open the notebook server:

```bash
jupyter lab
```

3. Recommended notebook order (pipeline):

- `data_process/data_clean_v2.ipynb` — prepare and standardise raw data
- `analysis/analysis_per_ts.ipynb` & `analysis/analysis_range.ipynb` — forecast vs actual exploration (Optional)
- `final_versions/grid_state_pred/predict_imb_n-1hr.ipynb` — grid state model
- `final_versions/Penalty/Penalty_Analysis_final.ipynb` — revenue & penalty analysis

---


