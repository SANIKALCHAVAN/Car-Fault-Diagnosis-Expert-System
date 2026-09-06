
% ==========================================================
% CAR FAULT DIAGNOSIS EXPERT SYSTEM
% ==========================================================

:- dynamic has_symptom/1.

% ==========================================================
% KNOWLEDGE BASE
% ==========================================================

% ----------------------------------------------------------
% CAR FAULTS
% ----------------------------------------------------------

fault(battery_problem).
fault(engine_overheating).
fault(brake_problem).
fault(tire_problem).
fault(engine_starting_problem).

% ----------------------------------------------------------
% SYMPTOMS ASSOCIATED WITH EACH FAULT
% ----------------------------------------------------------

symptom(battery_problem, engine_not_starting).
symptom(battery_problem, dim_headlights).
symptom(battery_problem, clicking_sound).

symptom(engine_overheating, high_temperature).
symptom(engine_overheating, steam_from_engine).
symptom(engine_overheating, coolant_leak).

symptom(brake_problem, weak_brakes).
symptom(brake_problem, squeaking_sound).
symptom(brake_problem, brake_pedal_vibration).

symptom(tire_problem, low_tire_pressure).
symptom(tire_problem, uneven_tire_wear).
symptom(tire_problem, vehicle_pulling).

symptom(engine_starting_problem, engine_cranking).
symptom(engine_starting_problem, fuel_smell).
symptom(engine_starting_problem, engine_stalls).

% ==========================================================
% DIAGNOSTIC RULES
% ==========================================================

diagnose(battery_problem) :-
    has_symptom(engine_not_starting),
    has_symptom(dim_headlights).

diagnose(engine_overheating) :-
    has_symptom(high_temperature),
    has_symptom(steam_from_engine).

diagnose(brake_problem) :-
    has_symptom(weak_brakes),
    has_symptom(squeaking_sound).

diagnose(tire_problem) :-
    has_symptom(low_tire_pressure),
    has_symptom(uneven_tire_wear).

diagnose(engine_starting_problem) :-
    has_symptom(engine_cranking),
    has_symptom(fuel_smell).

% ==========================================================
% RECOMMENDATIONS
% ==========================================================

recommendation(battery_problem,
    'Check the battery terminals and battery charge. Replace the battery if required.').

recommendation(engine_overheating,
    'Check coolant level and radiator. Stop driving if the engine temperature is very high.').

recommendation(brake_problem,
    'Inspect the brake pads and brake system. Get the brakes checked by a mechanic.').

recommendation(tire_problem,
    'Check tire pressure and inspect tire condition. Rotate or replace tires if necessary.').

recommendation(engine_starting_problem,
    'Check the fuel system and ignition system. Consult a mechanic if the engine continues to stall.').

% ==========================================================
% DIAGNOSIS
% ==========================================================

diagnose_car :-
    findall(Fault, diagnose(Fault), Faults),
    (
        Faults = [] ->
            write('No matching car fault was identified.'), nl
        ;
            write('Possible car fault(s): '),
            write(Faults),
            nl,
            show_recommendations(Faults)
    ).

% ==========================================================
% DISPLAY RECOMMENDATIONS
% ==========================================================

show_recommendations([]).

show_recommendations([Fault|Rest]) :-
    recommendation(Fault, Recommendation),
    write('Recommendation for '),
    write(Fault),
    write(': '),
    write(Recommendation),
    nl,
    show_recommendations(Rest).

% ==========================================================
% ADD SYMPTOM
% ==========================================================

add_symptom(Symptom) :-
    assertz(has_symptom(Symptom)),
    format('Symptom added: ~w~n', [Symptom]).

% ==========================================================
% CLEAR SYMPTOMS
% ==========================================================

clear_symptoms :-
    retractall(has_symptom(_)),
    write('All symptoms cleared.'), nl.

% ==========================================================
% DISPLAY CURRENT SYMPTOMS
% ==========================================================

show_symptoms :-
    findall(Symptom, has_symptom(Symptom), Symptoms),
    write('Observed symptoms: '),
    write(Symptoms),
    nl.

% ==========================================================
% START EXPERT SYSTEM
% ==========================================================

start :-
    write('=============================================='), nl,
    write('        CAR FAULT DIAGNOSIS EXPERT SYSTEM'), nl,
    write('=============================================='), nl,
    write('Enter symptoms using add_symptom/1.'), nl,
    write('Example: add_symptom(engine_not_starting).'), nl,
    write('Then execute diagnose_car.'), nl.

