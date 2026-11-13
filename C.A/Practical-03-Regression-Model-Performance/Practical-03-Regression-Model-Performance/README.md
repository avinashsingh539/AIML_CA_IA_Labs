# Practical 03 – Regression Model Performance

## Aim
Build regression models for a real-world application, evaluate them with suitable metrics, and study Gradient Descent for Linear Regression.

## Application and dataset
The Scikit-learn Diabetes dataset is used to estimate a quantitative measure of disease progression from baseline clinical measurements. It has 442 records and 10 input features. The CSV is included in `data/diabetes_dataset.csv`.

## Models
- Linear Regression
- Ridge Regression
- Linear Regression trained with Batch Gradient Descent (NumPy implementation)

## Evaluation
The models are compared on the same test set using MAE, MSE, RMSE and R². The notebook also plots the Gradient Descent loss, compares learning rates and displays actual versus predicted values.


## Files
- `Practical_03_Performance_Evaluation_of_Regression_Models.ipynb` – code, plots and evaluation
- `data/diabetes_dataset.csv` – dataset
- `requirements.txt` – required packages

## Dataset reference
https://scikit-learn.org/stable/datasets/toy_dataset.html#diabetes-dataset

The dataset and model are for educational use, not medical diagnosis.
