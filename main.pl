% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Programacao em logica estendida

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

:- include(factos).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

%Calcular um trajeto entre dois pontos


% Pesquisa em profundidade primeiro multi-estados

resolve_pp_h(Origem, Destino, Caminho) :- profundidade(Origem, Destino, [Origem], Caminho),
                                          escrever(Caminho).

profundidade(Destino, Destino, Visitados, Caminho) :- inverso(Visitados, Caminho).

profundidade(Origem, Destino, Visitados, Caminho) :- adjacente_h(Origem, Prox),
										             \+ member(Prox, Visitados),
										             profundidade(Prox, Destino, [Prox|Visitados], Caminho).

adjacente_h(Paragem, ProxParagem) :- adjacente(Paragem, ProxParagem, _, _).







inverso(Xs, Ys):-
	inverso(Xs, [], Ys).

inverso([], Xs, Xs).
inverso([X|Xs],Ys, Zs):-
	inverso(Xs, [X|Ys], Zs).

escrever([]).
escrever([X|L]) :- write(X), write(','), escrever(L).
