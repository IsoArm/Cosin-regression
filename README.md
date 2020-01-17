# Cosin-regression

Given (x,y) pair regress y on x via cosin function model of the form f(x) = a*cos(b*x+c) + d. 
The function is first transformed into a simpler form with only 1 non-linear parameter and then we use linear regression on linear parameters. Non-linear paramater is then chosen using grid search.
