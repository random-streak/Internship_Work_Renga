# Renga Work — Project Overview

This repository contains data cleaning, forecasting evaluation and analysis notebooks used to inspect and evaluate short-term renewable production forecasts and the associated market penalties/revenue. The README below summarizes the main files and the typical code/data flow.

## Quick summary
- `data_clean_v2.ipynb`, `dummy1.py` — data ingestion and cleaning utilities. Prepare measured actuals and find/align forecasts for evaluation. 
- `analysis_per_ts.ipynb`, `analysis_range.ipynb`, `analysis_v3.ipynb`, `analysis_v5.ipynb`, `evolution_analysis.ipynb` — analysis notebooks that compare forecast evolution for the previous 48 hours against the observed actuals for a timestamp or a range.
- `long_short_pattern.ipynb` — quick exploratory check of a grid-state assumption using prices: if imbalance prices (Long/Short) are larger than day-ahead price, the grid is considered short, otherwise long.
- `predict_imb_n-1hr.ipynb`, `predict_imb_tod.ipynb` — grid-state prediction models (classification). The `n-1hr` model has ~74.23% accuracy; `tod` model has ~57.23% accuracy (measured on the notebook's evaluation datasets). The results are in the folder `outputs_same_tod`.

- `penalty_v1.ipynb`, `penalty_v2.ipynb`, `penalty_v3_bestcase.ipynb`, `penalty_v4.ipynb`, `penalty_v4_trial.ipynb`, `penalty_v4_trial_v2.ipynb`, `penalty_v5_bc_clean.ipynb` — notebooks that compute revenue / penalties across forecast quantiles and combinational strategies. These explore how revenue and penalty evolve when selecting different quantiles (P values) and applying strategy-derived forecasts.

