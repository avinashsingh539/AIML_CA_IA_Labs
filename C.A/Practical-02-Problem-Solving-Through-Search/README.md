# Practical Assignment 2 — Problem Solving Through Search

This repository contains the Jupyter Notebook for evaluating search-based problem-solving techniques 
## Aim

To implement and compare Uninformed Search, Informed Search, Local Search and Constraint Satisfaction algorithms using suitable benchmark problems.

## What is included?

| Area | Algorithms / methods | Problem used |
|---|---|---|
| Uninformed search | BFS, DFS, Uniform Cost Search | Zachary's Karate Club network |
| Informed search | Greedy Best-First Search, A* | Zachary's Karate Club network |
| Local search | Hill Climbing | 8-Queens problem |
| Constraint satisfaction | Backtracking, MRV + Forward Checking | Australia map colouring |

A single dataset is not a natural fit for all four categories. The practical therefore uses the established Karate Club social-network benchmark for graph search, and standard N-Queens and map-colouring problems for local search and CSP. The notebook explains this choice and reports each family with suitable metrics.

## Repository structure

```text
Practical-02-Problem-Solving-Through-Search/
├── Practical_02_Problem_Solving_Through_Search.ipynb
├── README.md
├── requirements.txt
├── data/
│   └── karate_club_edges.csv

```


## Evaluation metrics

For graph search, the notebook records path length, path cost, expanded nodes and execution time. For N-Queens, it runs 30 trials and records success rate, remaining conflicts, steps and execution time. For map colouring, it records whether a valid assignment was found, assignment attempts, backtracks and execution time.

## Dataset and references

The graph is loaded from NetworkX's built-in Zachary's Karate Club dataset. An edge-list CSV with the reproducible experimental edge costs is included under `data/`.

- NetworkX dataset documentation: https://networkx.org/documentation/stable/reference/generated/networkx.generators.social.karate_club_graph.html
- Zachary, W. W. (1977). *An Information Flow Model for Conflict and Fission in Small Groups*. Journal of Anthropological Research, 33(4), 452–473.
- Russell, S. and Norvig, P. *Artificial Intelligence: A Modern Approach*.

The edge costs are deterministic values added for this practical to compare hop-based and cost-based search. They are not real-world travel costs.
