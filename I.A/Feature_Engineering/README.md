# Assignment 2 — Feature Engineering on Backblaze Drive Stats (Q3 2023)

**Name:** Avinash Singh
**Roll No.:** 312
**PRN:** 202401040311
**Course:** Artificial Intelligence and Machine Learning

## Objective
Prepare and analyse Backblaze drive records, engineer useful features from SMART readings, and evaluate a classification model.

## Work Done
- Inspected dataset columns and missing values.
- Analysed drive statistics and SMART attributes.
- Created features using capacity conversion and log transformation.
- Handled missing readings and created SMART indicators.
- Trained and evaluated a Random Forest classifier.

## Dataset
Place the Q3 2023 CSV files inside `data_Q3_2023` near the notebook.

The notebook also supports the sample file `2023-07-05_sample.csv`.

## How to Run
1. Install the required packages:
   `pip install -r requirements.txt`
2. Open the notebook in Jupyter.
3. Run all cells from top to bottom.

## Note
The original dataset files are not modified. Full dataset mode processes files in chunks to reduce memory usage.