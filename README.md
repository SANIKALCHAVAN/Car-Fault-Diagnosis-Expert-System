# Car Fault Diagnosis Expert System

## Introduction

This project is a simple Expert System developed using Prolog. It identifies possible car faults based on the symptoms given by the user.

## Problem Statement

To develop a Car Fault Diagnosis Expert System that identifies possible car faults from the symptoms provided by the user and gives a suitable recommendation.

## Features

* Identifies common car faults.
* Uses symptoms to diagnose faults.
* Provides recommendations for identified faults.
* Displays the entered symptoms.
* Handles cases where no matching fault is found.

## Technologies Used

* **Programming Language:** Prolog
* **Platform:** SWI-Prolog
* **Dataset:** Not required
* **External Libraries:** Not required

## Car Faults Covered

The system can identify:

1. Battery Problem
2. Engine Overheating
3. Brake Problem
4. Tire Problem
5. Engine Starting Problem

## How to Run

1. Install SWI-Prolog.
2. Open SWI-Prolog.
3. Load the program using:

```prolog
['car_fault_expert_system.pl'].
```

4. Start the expert system using:

```prolog
start.
```

5. Enter symptoms using `add_symptom/1`.

For example:

```prolog
add_symptom(engine_not_starting).
add_symptom(dim_headlights).
```

6. Display the symptoms:

```prolog
show_symptoms.
```

7. Run the diagnosis:

```prolog
diagnose_car.
```

## Sample Test

```prolog
?- clear_symptoms,
   add_symptom(engine_not_starting),
   add_symptom(dim_headlights),
   show_symptoms,
   diagnose_car.
```

### Expected Result

```text
Observed symptoms: [engine_not_starting,dim_headlights]

Possible car fault(s): [battery_problem]

Recommendation for battery_problem:
Check the battery terminals and battery charge.
Replace the battery if required.
```

## Test Cases

| Test Case | Symptoms                            | Diagnosis          |
| --------- | ----------------------------------- | ------------------ |
| 1         | Engine not starting, Dim headlights | Battery Problem    |
| 2         | High temperature, Steam from engine | Engine Overheating |
| 3         | Weak brakes, Squeaking sound        | Brake Problem      |
| 4         | Low tire pressure, Uneven tire wear | Tire Problem       |
| 5         | Clicking sound                      | No Matching Fault  |

## Conclusion

The Car Fault Diagnosis Expert System was successfully implemented using Prolog. The system uses facts, rules and logical reasoning to identify possible car faults from the symptoms given by the user and provides suitable recommendations.
