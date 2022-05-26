% AUTORS: Joan López, Marc Melia, Miquel Vidal.
consult('auxiliar').

paraula(X):-member(Y,[democracia, encontrarse, emboscar, abordaje, convexo, evadirse, elevarse, escuela, cuerpo, jugar, juicio, error, vicio, rea]),atom_chars(Y,X).
paraula(X):-member(Y,[democracia, encontrarse, emboscar, abordaje, convexo, evadirse, elevarse, escuela, cuerpo, jugar, juicio, error, vicio, rea]),atom_chars(Y,Z),reverse(Z,X).

repetides([_|[]]):-fail.
repetides([E1|R]):-member(E1,R).
repetides([E1|R]):-reverse(E1,E2),member(E2,R).
repetides([_|R]):-repetides(R).
