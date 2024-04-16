:- discontiguous s/6. % When consulting 'prolog/wn_s.pl'
:- consult('wn_s.pl').
:- consult('svo.pl').
:- consult('wn_sk_ruben.pl').

get_class(Word, Class):- sk(_, Word, Class).

sentence --> noun_phrase(N), verb_phrase(V, O), {get_class(N, Nc)}, {get_class(V, Vc)}, {get_class(O, Oc)}, {s_v_o(Nc, Vc, Oc)}.
noun_phrase(N) --> determiner, noun(N) .
noun_phrase(N) --> determiner, noun(N), prepositional_phrase .
verb_phrase(V, _) --> verb(V) .
verb_phrase(V, N) --> verb(V), noun_phrase(N) .
verb_phrase(V, N) --> verb(V), noun_phrase(N), prepositional_phrase .
prepositional_phrase --> preposition, noun_phrase(_) .

noun(NOUN) --> [NOUN], {s(_, _, NOUN, n, _, _)}.
verb(VERB) --> [VERB], {s(_, _, VERB, v, _, _)}.
determiner --> [a] ; [the] .
preposition --> [by] ; [with] ; [about] .

%sentence(N, V, O, [the, cat, eat, the, fish], []).
