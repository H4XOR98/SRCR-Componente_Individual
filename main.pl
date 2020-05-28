% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Programacao em logica estendida

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

:- include(auxiliares).
:- include(factos).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

resolve_pp_h(Origem, Destino, Caminho) :- profundidade(Origem, Destino, [Origem], Caminho).

profundidade(Destino, Destino, Visitados, Caminho) :- inverso(Visitados,Caminho).
profundidade(Origem, Destino, Visitados, Caminho) :- Paragem(Origem, _, _, _, _, _, CarreirasOrigem, _, _), Paragem(Destino, _, _, _, _, _, CarreirasDestino, _, _),
                                         adjacente_h(Origem, Prox),
										 \+ member(Prox, Visitados),
										 profundidade(Prox, Destino, [Prox|Visitados], Caminho).

adjacente_h(Nodo, ProxNodo) :- adjacente( Carreira, Nodo, ProxNodo, _ ).


inverso(Xs, Ys):-
	inverso(Xs, [], Ys).

inverso([], Xs, Xs).
inverso([X|Xs],Ys, Zs):-
	inverso(Xs, [X|Ys], Zs).

escrever([]).
escrever([X|L]) :- write(X), n1, escrever(L).

procuraIgual([O|L],[D])