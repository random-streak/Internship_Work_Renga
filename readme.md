# Renga Work — Project Overview

This repository contains the full workflow to:
- Clean and prepare imbalance and price data  
# Renga Work — Project Overview

This repository contains notebooks, scripts and sample data used for analysing imbalance forecasts, predicting grid state (long/short), and evaluating revenue & penalty outcomes under different bidding strategies.

**Recent changes:**
- Many notebooks were reorganised under `final_versions/`.
- Example output datasets were added under `sample_results/`.
- New `final_versions/Penalty/` notebooks and analysis files were added.
- A new remote repository was created and pushed to: `https://github.com/random-streak/Internship_Work_Renga.git`.

---

**Quick summary**

- **Purpose:** Analyse forecast vs actuals, build simple grid-state prediction models, and evaluate economic outcomes (revenue & penalty).
- **Primary language:** Python (notebooks + small scripts)
- **Environment:** Uses a virtual environment; install dependencies from `requirements.txt`.

---

**Repository layout (high level)**

- `data/` : Raw and intermediate datasets (subfolders for `neoen` and `sunnic`).
- `analysis/` : Exploratory analysis notebooks.
- `final_versions/` : Reorganized final notebooks and analyses (penalty, grid state prediction, etc.).
- `data_process/` : Data cleaning notebooks and helper scripts.
- `sample_results/` : Example output CSVs produced by analyses.
- `scripts/` : Helper shell scripts (e.g. `setup_and_run.sh`).
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
- `analysis/analysis_per_ts.ipynb` & `analysis/analysis_range.ipynb` — forecast vs actual exploration
- `final_versions/grid_state_pred/predict_imb_n-1hr.ipynb` — grid state model
- `final_versions/Penalty/Penalty_Analysis_final.ipynb` — revenue & penalty analysis

---

**Sample script**

Use `scripts/setup_and_run.sh` to create the virtual environment (if missing), install dependencies, and launch `jupyter lab` from the repository root. See the script for details.

---

**Notes & tips**

- Large CSVs and many generated forecast files are present under `data/` — avoid committing large, regenerate-able files to the remote unless necessary.
- If you pushed this repository to a new remote (e.g. `internship`), you can keep the original `origin` remote alongside it to sync between repositories.

---

If you want, I can:

- Commit this README and the sample script for you.
- Add a small `.gitignore` entry to exclude large data files under `data/`.
- Create a short CONTRIBUTING.md describing how to run analyses reproducibly.

