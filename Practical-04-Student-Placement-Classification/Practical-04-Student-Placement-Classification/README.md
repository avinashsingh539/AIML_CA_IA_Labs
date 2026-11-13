# Assignment 4 – Student Placement Classification

## Aim
Prepare the supplied student dataset, train four classification models and compare their performance.

## Dataset
The assignment CSV is included in `data/student_placement_dataset.csv`. It contains 1,200 records; `Placed` is the target column.

## Preprocessing
- Removed `Student_ID` from the input features.
- Filled missing numerical values with the median and categorical values with the most frequent value.
- Standardized numerical features and one-hot encoded categorical features.
- Used a stratified 80:20 train-test split.

## Models
- Support Vector Machine (SVM)
- Decision Tree (CART, Gini criterion)
- K-Nearest Neighbors (KNN)
- Gaussian Naive Bayes

## Evaluation
Accuracy, precision, recall, F1-score and log loss are reported. The notebook includes comparison charts, confusion matrices and classification reports.


## Files
- `Assignment_04_Student_Placement_Classification.ipynb` – implementation and evaluation
- `data/student_placement_dataset.csv` – dataset supplied for the assignment
- `requirements.txt` – required packages
