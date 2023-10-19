Color(red).
color(yellow).
color(green).
color(orange).
color(purple).
fruit(apple, red).
fruit(banana, yellow).
fruit(grape, purple).
fruit(orange, orange).
fruit(kiwi, green).
fruit(strawberry, red).
find_color(Fruit, Color) :- fruit(Fruit, Color).
fruits_of_color(Color) :- fruit(Fruit, Color), write(Fruit), nl, fail.
