% Facts about planets
planet(mercury, 0.39, 0.38, 4879).
planet(venus, 0.72, 0.95, 12104).
planet(earth, 1.00, 1.00, 12742).
planet(mars, 1.52, 0.53, 6779).
planet(jupiter, 5.20, 318.6, 139822).
planet(saturn, 9.58, 95.2, 116464).
planet(uranus, 19.22, 14.6, 50724).
planet(neptune, 30.05, 17.2, 49244).

% Rules for planet classification
inner_planet(P) :- planet(P, D, M, _), D < 1.0, M < 10.0.
outer_planet(P) :- planet(P, D, M, _), D >= 1.0, M >= 10.0.

% Rule for planet size classification
small_planet(P) :- planet(P, _, _, R), R < 10000.
large_planet(P) :- planet(P, _, _, R), R >= 10000.

% Rule for planet description
describe_planet(P) :-
    planet(P, D, M, R),
    format("Planet ~w:~n", [P]),
    format("  Distance from the Sun: ~2f AU~n", [D]),
    format("  Mass relative to Earth: ~2f Earth masses~n", [M]),
    format("  Radius: ~w km~n", [R]),
    (inner_planet(P) -> format("  Classification: Inner Planet~n");
    outer_planet(P) -> format("  Classification: Outer Planet~n")),
    (small_planet(P) -> format("  Size: Small Planet~n");
    large_planet(P) -> format("  Size: Large Planet~n")).

