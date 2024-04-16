% :- style_check(-singleton).
:- module(animal, [animal/4]).


% Faits
animal(vache, mammifere, corne, domestique).
animal(cerf, mammifere, corne, sauvage).
animal(lion, mammifere, sans_corne, carnivore).
animal(cheval, mammifere, sans_corne, herbivore).
animal(aigle, non_mammifere, plume, vole).
animal(autruche, non_mammifere, plume, ne_vole_pas).
animal(requin, non_mammifere, sans_plume, ecailles).
animal(pieuvre, non_mammifere, sans_plume, sans_ecailles).

compatibility(Animal, Attributs) :-
    findall(Nom, (animal(Nom, Attribut1, Attribut2, Attribut3), 
                    member(Attribut1, Attributs), 
                    member(Attribut2, Attributs), 
                    member(Attribut3, Attributs)), 
            Animal).

% Règles
deviner_animal :-
    deviner(mammifere, Animal, []),
    write('L\'animal est : '), write(Animal), nl.

deviner(Attribut, Animal, AttributsTrouves) :-
    (
        length(AttributsTrouves, Length), 
        Length = 0 
        ; 
        AttributsTrouves = [PremierAttribut|_], 
        Attribut \= PremierAttribut
    ),
    trouve_attribut(Attribut, Question),
    write(Question), write(' (oui/non) ? '),
    read(Reponse), nl,
    (
        (Reponse = oui) ->
            trouve_valeur(Attribut, Valeur),
            append([Attribut], AttributsTrouves, NouveauxAttributs),
            write('Les attributs trouvés sont : '), write(NouveauxAttributs), nl,
            compatibility(ListAnimal, NouveauxAttributs),
            length(ListAnimal, LengthListAnimal),

            ( LengthListAnimal = 1 ->
                NouveauxAttributs = [_,_,_],
                compatibility([Animal], NouveauxAttributs)
            ;
                deviner(Valeur, Animal, NouveauxAttributs)
            )
        ;
            trouve_valeur_oppose(Attribut, AttributOppose),
            trouve_valeur(AttributOppose, QuestionOppose),
            append([AttributOppose], AttributsTrouves, NouveauxAttributs),
            write('Les attributs trouvés sont :'), write(NouveauxAttributs), nl,
            deviner(QuestionOppose, Animal, NouveauxAttributs)
    ).




% Liste de question correspondant
trouve_attribut(mammifere, 'Est-ce un mammifère ?').
trouve_attribut(non_mammifere, 'Est-ce un non-mammifère ?').
trouve_attribut(corne, 'A-t-il des cornes ?').
trouve_attribut(sans_corne, 'N\'a-t-il pas de cornes ?').
trouve_attribut(domestique, 'Est-il domestique ?').
trouve_attribut(sauvage, 'Est-il sauvage ?').
trouve_attribut(carnivore, 'Est-il carnivore ?').
trouve_attribut(herbivore, 'Est-il herbivore ?').
trouve_attribut(plume, 'A-t-il des plumes ?').
trouve_attribut(sans_plume, 'N\'a-t-il pas de plumes ?').
trouve_attribut(vole, 'Peut-il voler ?').
trouve_attribut(ne_vole_pas, 'Ne peut-il pas voler ?').
trouve_attribut(ecailles, 'A-t-il des écailles ?').
trouve_attribut(sans_ecailles, 'N\'a-t-il pas d\'écailles ?').

% Correspondance entre les attributs : permet de savoir quel attribut vérifier ensuite

% trouve_valeur(mammifere, mammifere).
trouve_valeur(mammifere, corne).
trouve_valeur(non_mammifere, plume).
trouve_valeur(corne, domestique).
trouve_valeur(sans_corne, carnivore).
trouve_valeur(plume, vole).
trouve_valeur(sans_plume, ecailles).

trouve_valeur(domestique, vache).
trouve_valeur(sauvage, cerf).
trouve_valeur(carnivore, lion).
trouve_valeur(herbivore, cheval).
trouve_valeur(vole, aigle).
trouve_valeur(ne_vole_pas, autruche).
trouve_valeur(ecailles, requin).
trouve_valeur(sans_ecailles, pieuvre).


% Correspondance entre les attributs opposés : permet de savoir quel attribut vérifier ensuite
trouve_valeur_oppose(mammifere, non_mammifere).
trouve_valeur_oppose(non_mammifere, mammifere).
trouve_valeur_oppose(corne, sans_corne).
trouve_valeur_oppose(sans_corne, corne).
trouve_valeur_oppose(domestique, sauvage).
trouve_valeur_oppose(sauvage, domestique).
trouve_valeur_oppose(sauvage, cerf).
trouve_valeur_oppose(carnivore, herbivore).
trouve_valeur_oppose(herbivore, cheval).
trouve_valeur_oppose(plume, sans_plume).
trouve_valeur_oppose(sans_plume, vole).
trouve_valeur_oppose(vole, aigle).
trouve_valeur_oppose(ne_vole_pas, autruche).
trouve_valeur_oppose(ecailles, sans_ecailles).
trouve_valeur_oppose(sans_ecailles, pieuvre).
