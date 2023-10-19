hypothesis(has_flu) :- symptom(fever), symptom(cough).
hypothesis(has_allergy) :- symptom(sneezing), symptom(runny_nose).

symptom(fever).
symptom(cough).
symptom(sneezing).
symptom(runny_nose).

diagnose(Condition) :-
    hypothesis(Condition),
    writeln('Patient may have: '),
    writeln(Condition),
    !.
diagnose(_).
