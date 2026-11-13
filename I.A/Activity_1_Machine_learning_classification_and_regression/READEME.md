# Activity 1 – Machine Learning Classification and Regression

## Overview

This activity uses daily hard-drive telemetry from the **Backblaze Q1 2016** dataset to demonstrate two supervised machine-learning tasks:

1. **Classification:** Predict whether a hard drive will have a recorded failure within the next 7 calendar days.
2. **Regression:** Estimate how many days remain until a recorded failure for drives that fail during the observed quarter.

The notebook combines the original daily CSV files, explores SMART attributes, creates time-based features, trains machine-learning models, and evaluates their results.

---

## Dataset

The notebook expects the original Q1 2016 daily CSV files in a folder named `data_Q1_2016`.

### Required Fields
* `date`
* `serial_number`
* `failure`
* `model`
* `capacity_bytes`

**SMART Attributes:** Used when available. The notebook checks for **SMART IDs 5, 9, 187, 188, 194, 197, and 198**, including both raw and normalized values.

> **Note:** The original CSV files are not included in this repository. Download the Q1 2016 daily files from the [Backblaze Hard Drive Test Data](https://backblaze.com) page and place them in the `data_Q1_2016/` input folder before running the notebook.

---

## Folder Structure

```text
Activity-1-Machine-Learning-Classification-and-Regression/
│
├── Activity_1_Machine_Learning_Classification_and_Regression.ipynb
├── README.md
|- Requirements.txt


```

*Output files are generated automatically when the notebook is executed; they do not need to be created manually.*

---

## Requirements

* **Python:** 3.10 or later
* **Environment:** Jupyter Notebook or JupyterLab
* **Libraries:** DuckDB, NumPy, Pandas, Matplotlib, Scikit-learn, Joblib

### Installation
Install the required packages using `pip`:

```bash
pip install duckdb numpy pandas matplotlib scikit-learn joblib jupyter
```

---

## Before Running the Notebook

1. Open `Activity_1_Machine_Learning_Classification_and_Regression.ipynb` and check the project path in **Section 2 – Imports and configuration**.
2. The current notebook uses a local Windows path:
   ```python
   ROOT = Path(r"D:\T.Y\PEC(AIML)\th activities for ia")
   RAW_DIR = ROOT / "data_Q1_2016"
   ```
3. Update `ROOT` to the directory where you have stored the project, keeping the Q1 2016 CSV files inside `data_Q1_2016`. For example, if the project folder is your current working directory, use:
   ```python
   ROOT = Path.cwd()
   RAW_DIR = ROOT / "data_Q1_2016"
   ```

---



## Work Performed

### 1. Data Preparation and Exploration
* Locate and combine the daily Q1 2016 CSV files while preserving source columns.
* Inspect the schema, date range, drive count, and available SMART attributes.
* Save the combined dataset in Parquet format using DuckDB.

### 2. Feature Engineering
* Construct the 7-day failure classification target.
* Construct the 1–30 day failure regression target.
* Create SMART-based features, missing-value indicators, historical lags, changes, and rolling averages.
* Ensure target and failure information are excluded from predictor features to prevent data leakage.

### 3. Classification
* Retain known positive and negative labels; exclude unknown outcomes.
* Sample non-failure records to manage class imbalance and retain sample weights.
* Split the data chronologically into training, validation, and test periods.
* Apply imputation and categorical encoding through a preprocessing pipeline.
* Train a **Random Forest Classifier** and select the optimal decision threshold using validation data.
* Evaluate on the final test period using weighted ROC-AUC, average precision, precision, recall, and F1-score.
* Plot the confusion matrix and precision-recall curve, and calculate permutation feature importance.

### 4. Regression
* Filter observations to drives with a recorded failure in the quarter and a target between 1 and 30 days.
* Split by drive identifier (`serial_number`) so the same drive does not appear in both training and test sets.
* Preprocess numeric and categorical features.
* Train a **Random Forest Regressor** and compare it against a median baseline.
* Evaluate using MAE, RMSE, and $R^2$.
* Plot actual versus predicted values and the residual distribution.

### 5. Saved Outputs
* Export trained classification and regression pipelines (`.joblib`), evaluation metrics (`.json`), feature-importance results (`.csv`), and regression test predictions (`.csv`) into their respective output directories.

---

## Important Notes and Limitations

* **Censored Classification Data:** The classification target is a recorded failure within the next 7 calendar days. Records without sufficient follow-up are treated as `unknown`, not as non-failures.
* **Regression Scope:** The regression task only covers drives with a recorded failure during Q1 2016; it does not estimate remaining useful life (RUL) for healthy or right-censored drives.
* **Hardware Variance:** SMART attribute meanings and scaling can differ by manufacturer and drive model.
* **Sample Weighting:** The classification sample uses weights to accurately account for downsampled non-failure records during evaluation.
* **Academic Use Only:** These results are intended for academic analysis of Q1 2016 data and should not be treated as a production-ready drive-failure prediction system.

---

## Conclusion

This activity demonstrates an end-to-end machine learning workflow for predictive maintenance using hard-drive telemetry. It highlights best practices in large-scale data ingestion with DuckDB, leak-free time-aware feature engineering, class-imbalance handling, chronological and group-aware data splitting, and reproducible model persistence.
