:- discontiguous animal/5.

% Facts about animals
% animal(Name, Type, plumes, Eggs, Carnivore)
animal(albatros, oiseau, true, false, false).
animal(autruche, oiseau, false, true, true).
animal(tigre, mammifere, true, false, true).
animal(girafe, mammifere, false, true, false).

% Rules for identifying animals
rule1 :-
    animal(Name, oiseau, true, _, _),
    write('L\'animal est un(e) '), write(Name), nl.

rule2 :-
    animal(Name, oiseau, false, true, true),
    write('L\'animal est un(e) '), write(Name), nl.

rule3 :-
    animal(Name, mammifere, true, _, true),
    write('L\'animal est un(e) '), write(Name), nl.

rule4 :-
    animal(Name, mammifere, false, true, false),
    write('L\'animal est un(e) '), write(Name), nl.

% Questions
demander(plumes) :-
    write('Est-ce que l\'animal a des plumes ? '),
    read(Reponse),
    (   Reponse == oui
    ->  assert(plumes)
    ;   assert(\+ plumes)
    ).

demander(pond) :-
    write('Est-ce que l\'animal pond des oeufs ? '),
    read(Reponse),
    (   Reponse == oui
    ->  assert(pond)
    ;   assert(\+ pond)
    ).

demander(mammifere) :-
    write('Est-ce que l\'animal est un mammifère ? '),
    read(Reponse),
    (   Reponse == oui
    ->  assert(mammifere)
    ;   assert(\+ mammifere)
    ).

demander(carnivore) :-
    write('Est-ce que l\'animal est un carnivore ? '),
    read(Reponse),
    (   Reponse == oui
    ->  assert(carnivore)
    ;   assert(\+ carnivore)
    ).

demander(rayures_noires) :-
    write('Est-ce que l\'animal a des rayures noires ? '),
    read(Reponse),
    (   Reponse == oui
    ->  assert(rayures_noires)
    ;   assert(\+ rayures_noires)
    ).

% Point d'entrée
demarrer :-
    retractall(plumes),
    retractall(pond),
    retractall(mammifere),
    retractall(carnivore),
    retractall(rayures_noires),
    demander(plumes),
    (   plumes
    ->  demander(pond),
        (   pond
        ->  write('L\'animal est un oiseau'), nl
        ;   rule1
        )
    ;   demander(mammifere),
        (   mammifere
        ->  demander(carnivore),
            (   carnivore
            ->  demander(rayures_noires),
                (   rayures_noires
                ->  rule3
                ;   write('L\'animal n\'est pas un tigre'), nl
                )
            ;   rule4
            )
        ;   write('L\'animal n\'est pas un mammifère'), nl
        )
    ).
