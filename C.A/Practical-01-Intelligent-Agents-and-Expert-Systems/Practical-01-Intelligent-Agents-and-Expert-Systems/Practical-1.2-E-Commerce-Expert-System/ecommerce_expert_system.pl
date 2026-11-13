% E-COMMERCE EXPERT SYSTEM
% Product Recommendation System

% PRODUCT FACTS
% product(Name, Category, Price, Brand, Rating).

product(laptop, electronics, 55000, dell, 4).
product(smartphone, electronics, 25000, samsung, 5).
product(headphones, electronics, 3000, boat, 4).
product(smartwatch, electronics, 5000, noise, 4).

product(tshirt, clothing, 800, nike, 4).
product(shoes, clothing, 2500, adidas, 5).
product(jacket, clothing, 3000, puma, 4).

product(backpack, accessories, 1500, skybags, 4).
product(wallet, accessories, 1000, wildhorn, 4).

% CUSTOMER PREFERENCES
% preference(Category, MaximumPrice).

preference(electronics, 30000).
preference(clothing, 3000).
preference(accessories, 2000).

% A product is affordable when its price is within the category limit.
affordable(Product) :-
    product(Product, Category, Price, _, _),
    preference(Category, MaxPrice),
    Price =< MaxPrice.

% A product has a good rating when its rating is 4 or above.
good_rating(Product) :-
    product(Product, _, _, _, Rating),
    Rating >= 4.

% A product is recommended when it is affordable and well rated.
recommended(Product) :-
    affordable(Product),
    good_rating(Product).

% Find products with a rating of exactly 5.
highly_rated(Product) :-
    product(Product, _, _, _, Rating),
    Rating =:= 5.

% Find products in a selected category.
category_product(Product, Category) :-
    product(Product, Category, _, _, _).

% Find products from a selected brand.
brand_product(Product, Brand) :-
    product(Product, _, _, Brand, _).

% Display complete information about one product.
show_product(Product) :-
    product(Product, Category, Price, Brand, Rating),
    write('Product    : '), write(Product), nl,
    write('Category   : '), write(Category), nl,
    write('Price      : Rs. '), write(Price), nl,
    write('Brand      : '), write(Brand), nl,
    write('Rating     : '), write(Rating), write('/5'), nl,
    write('---------------------------'), nl.

% Display all recommended products.
show_recommendations :-
    write('================================'), nl,
    write('   RECOMMENDED PRODUCTS'), nl,
    write('================================'), nl,
    recommended(Product),
    show_product(Product),
    fail.

show_recommendations :-
    write('Recommendation process completed.'), nl.
