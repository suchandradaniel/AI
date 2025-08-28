symptom(fever, flu).
symptom(cough, flu).
symptom(headache, flu).

symptom(fever, malaria).
symptom(chills, malaria).
symptom(sweating, malaria).

symptom(rash, measles).
symptom(fever, measles).
symptom(runny_nose, measles).

symptom(chest_pain, pneumonia).
symptom(cough, pneumonia).
symptom(fever, pneumonia).

diagnose(Disease, Symptoms) :-
    setof(S, symptom(S, Disease), DiseaseSymptoms),
    subset(DiseaseSymptoms, Symptoms).

subset([], _).
subset([H|T], L) :- member(H, L), subset(T, L).
