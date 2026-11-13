# Practical Assignment 1.2 – E-Commerce Expert System

## Aim
Build a knowledge-based expert system using facts and rules for product recommendations.

## Domain
E-commerce product recommendation. Product facts store the product name, category, price, brand and rating. Category preferences define maximum prices.

## Rules
- `affordable/1` checks the category price limit.
- `good_rating/1` checks whether the rating is at least 4.
- `recommended/1` combines affordability and rating.
- `highly_rated/1` finds products rated 5.
- `category_product/2` and `brand_product/2` filter products.




```prolog
product(Product, Category, Price, Brand, Rating).
category_product(Product, electronics).
brand_product(Product, nike).
affordable(Product).
highly_rated(Product).
recommended(Product).
show_product(smartphone).
show_recommendations.
```