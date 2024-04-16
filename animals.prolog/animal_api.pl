:- module(animal_api, [animal_info/1]).

:- use_module(library(http/json)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(animals).

:- ensure_loaded(animals).


% api to get the list of animals
animal_info(_Request) :-
    findall(json([name=Name, attr1=Attr1, attr2=Attr2, attr3=Attr3]), animal(Name, Attr1, Attr2, Attr3), Animals),
    reply_json(Animals).