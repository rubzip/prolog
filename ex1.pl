%:- discontioguous s/6.
%:- discontiogous s/4.

:- consult('wn_ant').
:- consult('wn_s').

%s(1, 0, 'hola', 1,1,1).
%s(2, 0, adios, 1, 1, 1).
%s(3, 0, adeu, 1, 1, 1).
%ant(1, 11, 2, 22).

get_number(Number) :- s(Number, _, Word, _, _, _).

synonimous_words(W, S):- s(O,_,S,_,_,_), s(O,_,W,_,_,_), W\=S.

is_direct_antonym(Word1, Word2):-
s(X,_,Word1,_,_,_),
s(Y,_,Word2,_,_,_),
ant(X,_,Y,_).

is_antonym(X, Y):- ant(X,_,Y,_).
