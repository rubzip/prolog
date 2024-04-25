:- discontioguous s/6.
:- discontiogous s/4.

:- consult('wn_ant').
:- consult('wn_s').
:- consult('wn_sim').

get_number(Number) :- s(Number, _, Word, _, _, _).

synonimous_words(W, S):- s(O,_,S,_,_,_), s(O,_,W,_,_,_), W\=S.

% Exercise 1
is_direct_antonym(Word1, Word2):-
    s(X,_,Word1,_,_,_),
    s(Y,_,Word2,_,_,_),
    ant(X,_,Y,_).

%is_direct_antonym('natural object', 'artifact').
%is_direct_antonym('natural object', 'artefact').
%is_direct_antonym('natural object', 'tomate').

% Exercise 2
is_antonym(Word1, Word2):-
    is_direct_antonym(Word1, Word2);
    (
        s(Offset1,_,Word1,_,_,_),
        s(Offset2,_,Word2,_,_,_),
        ant(Offset1,_,Z,_),
        sim(Offset2,Z)
        );
    (
        s(Offset1,_,Word1,_,_,_),
        s(Offset2,_,Word2,_,_,_),
        ant(Offset2,_,Z,_),
        sim(Offset1,Z)
        ).

%is_antonym('abundant', 'scarce').
%is_antonym('abundant', 'rare').
%is_antonym('scarce', 'rare').

% Exercise 3
not_repeated(List):-
    length(List, N),
    list_to_set(List, Set),
    length(Set, M),
    N==M.

all_direct_antonyms_offset_offset(Offset, List_of_Offsets) :-
    findall(X, ant(Offset, _, X, _), Antonyms),
    not_repeated(List_of_Offsets),
    subset(Antonyms, List_of_Offsets).

%all_direct_antonyms_offset_offset(100019128, [100021939]).
%all_direct_antonyms_offset_offset(100019128, [100021939, 100021939]).

% Exercise 4
all_direct_antonyms_word_offset(Word, List_of_Offsets) :-
    s(Offset,_,Word,_,_,_),
    findall(X, ant(Offset, _, X, _), Antonyms),
    not_repeated(List_of_Offsets),
    subset(Antonyms, List_of_Offsets).

%all_direct_antonyms_word_offset('natural object', [100021939]).
%all_direct_antonyms_word_offset('natural object', [100021939, 100021939]).

% Exercise 5
all_direct_antonyms_offset_word(Offset, List_of_Words) :-
    findall(X, ant(Offset, _, X, _), Antonyms),
    findall(Y, (s(Y,_,Word,_,_,_),member(Word,List_of_Words)), List_of_Offsets),
    not_repeated(List_of_Offsets),
    subset(Antonyms, List_of_Offsets).

%all_direct_antonyms_offset_word(100019128, ['artifact']).
%all_direct_antonyms_offset_word(100019128, ['artifact', 'artefact']).

% Exercise 6
all_direct_antonyms_word_word(Word, List_of_Words) :-
    s(Offset,_,Word,_,_,_),
    findall(X, ant(Offset, _, X, _), Antonyms),
    findall(Y, (s(Y,_,WordFromList,_,_,_),member(WordFromList,List_of_Words)), List_of_Offsets),
    not_repeated(List_of_Offsets),
    subset(Antonyms, List_of_Offsets).

%all_direct_antonyms_word_word('natural object', ['artifact']).
%all_direct_antonyms_word_word('natural object', ['artifact', 'artefact']).
%all_direct_antonyms_word_word('natural object', ['artifact', 'artefact', 'artefact']).

% Exercise 7
is_antonym_via_similarity(Offset1, Offset2):-
    (ant(Offset1,_,OffsetAux,_),
    sim(OffsetAux,Offset2));
    (ant(Offset2,_,OffsetAux,_),
    sim(OffsetAux,Offset1)).

is_antonym_offset(Offset1, Offset2):-
    ant(Offset1,_,Offset2,_),
    is_antonym_via_similarity(Offset1, Offset2).

all_antonyms_offset(Offset,List_of_Offsets):-
    findall(X, is_antonym_offset(Offset, X), Antonyms),
    not_repeated(List_of_Offsets),
    subset(Antonyms, List_of_Offsets).

%all_antonyms_offset(300013887, [300016756, 300017024]).

% Exercise 8    Termnar **
all_antonyms_word(Word,List_of_Words):-
    findall(X, is_antonym(Word, X), Antonyms),
    not_repeated(List_of_Words),
    subset(Antonyms, List_of_Words).

% Exercise 9
number_of_antonyms_offset(Offset,Count):-
    findall(X, is_antonym_offset(Offset, X), Antonyms),
    Count==length(Antonyms).

% Exercise 10
number_of_antonyms_word(Word,Count):-
    s(Offset,_,Word,_,_,_),
    findall(X, is_antonym_offset(Offset, X), Antonyms),
    Count==length(Antonyms).

