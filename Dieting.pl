% --- Facts: Diseases and Recommended Diets ---

% Diabetes diet
diet(diabetes, 'Avoid sugar, white rice, white bread. Eat whole grains, green vegetables, bitter gourd, oats, and high-fiber foods.').

% High blood pressure diet
diet(hypertension, 'Avoid salty and fried food. Eat fruits, vegetables, low-fat dairy, and whole grains.').

% Heart disease diet
diet(heart_disease, 'Avoid red meat, fried food, and oily food. Eat fish, nuts, olive oil, and more vegetables.').

% Obesity diet
diet(obesity, 'Avoid junk food, sugary drinks, and fast food. Eat salads, fruits, vegetables, and drink plenty of water.').

% Anemia diet
diet(anemia, 'Eat spinach, beetroot, jaggery, red meat, and foods rich in iron and vitamin C.').

% Stomach ulcer diet
diet(ulcer, 'Avoid spicy food, alcohol, and caffeine. Eat bananas, milk, honey, and easily digestible foods.').

% Fever diet
diet(fever, 'Drink plenty of fluids, eat soups, fruits, and light meals.').


% --- Rule: Suggest diet based on disease ---
suggest_diet(Disease) :-
    diet(Disease, Plan),
    write('For '), write(Disease), write(', the recommended diet is: '), nl,
    write(Plan), nl.
