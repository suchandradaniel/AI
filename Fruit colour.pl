% --- Facts: fruit(Name, Color) ---

fruit(apple, red).
fruit(banana, yellow).
fruit(grape, green).
fruit(grape, purple).
fruit(orange, orange).
fruit(mango, yellow).
fruit(strawberry, red).
fruit(blueberry, blue).
fruit(watermelon, green).
fruit(cherry, red).

% --- Rule: find color of a fruit ---
color_of(Fruit, Color) :-
    fruit(Fruit, Color).

% --- Rule: find fruits of a particular color ---
fruits_with_color(Color, Fruit) :-
    fruit(Fruit, Color).
