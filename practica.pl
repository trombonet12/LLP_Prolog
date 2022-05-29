% AUTORS: Joan López, Marc Melia, Miquel Vidal.
:-consult(auxiliar).

paraula(X):-member(Y,[democracia, encontrarse, emboscar, abordaje, convexo, evadirse, elevarse, escuela, cuerpo, jugar, juicio, error, vicio, rea]),atom_chars(Y,X).
paraula(X):-member(Y,[democracia, encontrarse, emboscar, abordaje, convexo, evadirse, elevarse, escuela, cuerpo, jugar, juicio, error, vicio, rea]),atom_chars(Y,Z),reverse(Z,X).

repetides([_|[]]):-fail.
repetides([E1|R]):-member(E1,R).
repetides([E1|R]):-reverse(E1,E2),member(E2,R).
repetides([_|R]):-repetides(R).

mostra([],_,_,_).
mostra([L|R],X,Y,horitzontal):-gotoXY(X,Y),escriu(L,blau),Y1 is Y+3,mostra(R,X,Y1,horitzontal).
mostra([L|R],X,Y,vertical):-gotoXY(X,Y),escriu(L,vermell),X1 is X+3,mostra(R,X1,Y,vertical).

creuats():-
    paraula(H1),length(H1,7),paraula(V6),length(V6,11),
    nth0(4,H1,C1),nth0(0,V6,C1),

    paraula(H2),length(H2,5),
    nth0(2,H2,C2),nth0(2,V6,C2),

    paraula(H3),length(H3,6),paraula(V1),length(V1,5),
    nth0(0,H3,C3),nth0(0,V1,C3),

    paraula(V3),length(V3,8),
    nth0(5,H3,C4),nth0(2,V3,C4),

    paraula(H4),length(H4,8),paraula(V2),length(V2,8),
    nth0(0,H4,C5),nth0(0,V2,C5),

    nth0(3,H4,C6),nth0(4,V3,C6),

    paraula(V4),length(V4,6),
    nth0(5,H4,C7),nth0(3,V4,C7),

    paraula(V5),length(V5,8),
    nth0(7,H4,C8),nth0(0,V5,C8),

    paraula(H5),length(H5,5),
    nth0(1,H5,C9),nth0(5,V2,C9),

    paraula(H6),length(H6,7),
    nth0(2,H6,C10),nth0(5,V5,C10),

    nth0(4,H6,C11),nth0(10,V6,C11),

    paraula(V7),length(V7,3),
    nth0(6,H6,C12),nth0(2,V7,C12),

    paraula(H7),length(H7,10),
    nth0(5,H7,C13),nth0(7,V5,C13),

    write([H1,H2,H3,H4,H5,H6,H7,V1,V2,V3,V4,V5,V6,V7])
.    

