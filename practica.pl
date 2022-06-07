% AUTORS: Joan López, Marc Melia, Miquel Vidal.

% Importam els fitxers auxiliars
:-consult(auxiliar).
:-consult(diccionari).

% Definim el conjunt de paraules de la practica. Tant cap endevant com per enderrera y a una llista lletra a lletra.
paraula(X):-member(Y,[democracia, encontrarse, emboscar, abordaje, convexo, evadirse, elevarse, escuela, cuerpo, jugar, juicio, error, vicio, rea]),atom_chars(Y,X).
paraula(X):-member(Y,[democracia, encontrarse, emboscar, abordaje, convexo, evadirse, elevarse, escuela, cuerpo, jugar, juicio, error, vicio, rea]),atom_chars(Y,Z),reverse(Z,X).

% Funció que ens retorna si hi ha elements repetits en una llista.
% Si la llista es buida, retorna false.
repetides([_|[]]):-fail.
% Si la llista no es buida, comprova si el primer element de la llista está una altra vegada a la llista.
repetides([E1|R]):-member(E1,R).
% Si la llista no es buida, comprova si el primer element de la llista está una altra vegada a la llista al enreves.
repetides([E1|R]):-reverse(E1,E2),member(E2,R).
% Com el primer element no está repetit a la llista, envia la resta de la llista a la funció per fer la recursivitat.
repetides([_|R]):-repetides(R).

% Funció que ens mostra graficament un element en base a unes coordenades y una orientació.
% Cas base.
mostra([],_,_,_).
% Cas d·orientació horitzontal.
mostra([L|R],X,Y,horitzontal):-gotoXY(X,Y),escriu(L,blau),Y1 is Y+3,mostra(R,X,Y1,horitzontal).
% Cas d·orientació vertical.
mostra([L|R],X,Y,vertical):-gotoXY(X,Y),escriu(L,vermell),X1 is X+1,mostra(R,X1,Y,vertical).

% Funció auxiliar per creuats2 per la reducció de codi.
paraula2(X):-paraula(_,_,Y,_,_,_,_,_,_,_,_,_,_,_,_),atom_chars(Y,X).

% Funció principal del programa.
% Primer de tot borra la pantalla per evitar que hi hagi res escrit per pantalla.
% Després, va aplicant les funcións paraula() i length() per sebre quines paraules poden encaixar en cada posició del mot creuats.
% Això es fa per cada posició del mot creuats a mesura que els va necesitant per les diferents colisions entre paraules verticals i horitzontals.
% Després es comprova que la solució no conté paraules repetides, aixo ho feim negant la funció repetides().
% Una vegada ja es te una solució, la mostra per pantalla amb la funció mostra() a la posició corresponent.
creuats():-
    cls,
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

    \+repetides([H1,H2,H3,H4,H5,H6,H7,V1,V2,V3,V4,V5,V6,V7]),

    %write([H1,H2,H3,H4,H5,H6,H7,V1,V2,V3,V4,V5,V6,V7]), % Per fer debuging.

    mostra(H1,1,22,horitzontal),
    mostra(H2,3,28,horitzontal),
    mostra(H3,4,1,horitzontal),
    mostra(H4,6,7,horitzontal),
    mostra(H5,11,4,horitzontal),
    mostra(H6,11,22,horitzontal),
    mostra(H7,13,13,horitzontal),
    mostra(V1,4,1,vertical),
    mostra(V2,6,7,vertical),
    mostra(V3,2,16,vertical),
    mostra(V4,3,22,vertical),
    mostra(V5,6,28,vertical),
    mostra(V6,1,34,vertical),
    mostra(V7,9,40,vertical),nl,nl,nl
.

% Funció extra del programa.
% Es basa en creuats() pero canviant paraula() per paraula2() per incloure el diccionari de paraules.
creuats2():-
    cls,
    paraula2(H1),length(H1,7),paraula2(V6),length(V6,11),
    nth0(4,H1,C1),nth0(0,V6,C1),

    paraula2(H2),length(H2,5),
    nth0(2,H2,C2),nth0(2,V6,C2),

    paraula2(H3),length(H3,6),paraula2(V1),length(V1,5),
    nth0(0,H3,C3),nth0(0,V1,C3),

    paraula2(V3),length(V3,8),
    nth0(5,H3,C4),nth0(2,V3,C4),

    paraula2(H4),length(H4,8),paraula2(V2),length(V2,8),
    nth0(0,H4,C5),nth0(0,V2,C5),

    nth0(3,H4,C6),nth0(4,V3,C6),

    paraula2(V4),length(V4,6),
    nth0(5,H4,C7),nth0(3,V4,C7),

    paraula2(V5),length(V5,8),
    nth0(7,H4,C8),nth0(0,V5,C8),

    paraula2(H5),length(H5,5),
    nth0(1,H5,C9),nth0(5,V2,C9),

    paraula2(H6),length(H6,7),
    nth0(2,H6,C10),nth0(5,V5,C10),

    nth0(4,H6,C11),nth0(10,V6,C11),

    paraula2(V7),length(V7,3),
    nth0(6,H6,C12),nth0(2,V7,C12),

    paraula2(H7),length(H7,10),
    nth0(5,H7,C13),nth0(7,V5,C13),

    \+repetides([H1,H2,H3,H4,H5,H6,H7,V1,V2,V3,V4,V5,V6,V7]),

    mostra(H1,1,22,horitzontal),
    mostra(H2,3,28,horitzontal),
    mostra(H3,4,1,horitzontal),
    mostra(H4,6,7,horitzontal),
    mostra(H5,11,4,horitzontal),
    mostra(H6,11,22,horitzontal),
    mostra(H7,13,13,horitzontal),
    mostra(V1,4,1,vertical),
    mostra(V2,6,7,vertical),
    mostra(V3,2,16,vertical),
    mostra(V4,3,22,vertical),
    mostra(V5,6,28,vertical),
    mostra(V6,1,34,vertical),
    mostra(V7,9,40,vertical),nl,nl,nl
. 

