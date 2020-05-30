% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                 PREDICADOS AUXILIARES                                                                    |%   
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% Extensão do predicado inverso : Lista, Lista, Lista -> {V,F}

inverso( Xs, Ys ) :- inverso( Xs, [], Ys ).
inverso( [], Xs, Xs ).
inverso([X|Xs],Ys, Zs):- inverso( Xs, [X|Ys], Zs).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Extensão do predicado escrever - imprime no stdout uma lista de elementos :  Lista  -> { }

escrever([]).
escrever([X|L]) :- write(X), write(','), escrever(L).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Extensão do predicado adjacente - testa se duas gids de Paragens são adjacentes : Gid, Gid  -> {V,F}

isAdjacente( Atual, Proxima ) :- adjacente( Atual, Proxima, _, _ ).