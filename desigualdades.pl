
persona(liliana, mujer(24, universitario, 2),argentina).
persona(juan, varon(38, secundario),argentina).
persona(santiago, varon(22, secundario), argentina).
persona(laura, trans, argentina).
persona(pedro, trans, argentina).
persona(franco, trans, argentina).

esCisgenero(Persona):-
    persona(Persona, _, _),
    not(esTrans(Persona)).

esperanzaDeVida(Persona, 80):-
    esMujer(Persona,_,_,_).
esperanzaDeVida(Persona, 72):-
    esVaron(Persona,_,_).
esperanzaDeVida(Persona, 35):-
    esTrans(Persona).

esMujer(Persona,NivelEd,Edad,Hijes):-
    persona(Persona, mujer(Edad,NivelEd,Hijes), _).
esVaron(Persona,NivelEd,Edad):-
    persona(Persona, varon(Edad,NivelEd),_).
esTrans(Persona):-
    persona(Persona, trans,_).

%esSuperior(Superior,Inferior).
esSuperior(universitario,secundario).
esSuperior(universitario,primario).
esSuperior(secundario,primario).

consigueTrabajo(Persona):-
    esMujer(Persona,NivelEd,Edad,0),
    esSuperior(NivelEd,secundario),
    Edad < 35.
consigueTrabajo(Persona):-
    esVaron(Persona,NivelEd,Edad),
    esSuperior(NivelEd,primario),
    Edad < 45.

salarioEsperado(Persona,0):-
    not(consigueTrabajo(Persona)).
salarioEsperado(Persona,Salario):-
    esVaron

