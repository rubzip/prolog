:- discontiguous s/6. % When consulting 'prolog/wn_s.pl'
:- consult('wn_s.pl').

sentence --> noun_phrase, verb_phrase .
noun_phrase --> determiner, noun .
noun_phrase --> determiner, noun, prepositional_phrase .
verb_phrase --> verb .
verb_phrase --> verb, noun_phrase .
verb_phrase --> verb, noun_phrase, prepositional_phrase .
prepositional_phrase --> preposition, noun_phrase .

noun --> [NOUN], {s(_, _, NOUN, n, _, _)}.
verb --> [VERB], {s(_, _, VERB, v, _, _)}.
determiner --> [a] ; [the] .
preposition --> [by] ; [with] ; [about] .

% sentence([the, cat, eat, the, fish], []).
