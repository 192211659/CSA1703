food_item(apple, low_glycemic_index).
food_item(banana, medium_glycemic_index).
food_item(carrot, low_glycemic_index).
food_item(potato, high_glycemic_index).
food_item(fish, low_sodium).
food_item(chicken, low_sodium).
food_item(spinach, low_sodium).
food_item(salt, high_sodium).
diet_recommendation(diabetes, Food) :-
    food_item(Food, low_glycemic_index).

diet_recommendation(hypertension, Food) :-
    food_item(Food, low_sodium).
