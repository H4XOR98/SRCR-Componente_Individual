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
% Extensão do predicado adjacente - testa se duas gids de Paragens são adjacentes : Gid, Gid  -> {V,F}

isAdjacente( Atual, Proxima ) :- adjacente( Atual, Proxima, _, _ ).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Extensão do predicado distanciaEuclidiana - Distancia euclidiana entre duas Paragens : Gid, Gid  -> {V,F}

distanciaEuclidiana( Origem, Destino, R ) :- paragem( Origem, Latitude1, Longitude1, _, _, _, _, _, _ ),
                                             paragem( Destino, Latitude2, Longitude2, _, _, _, _, _, _ ),
                                             Latitudes is Latitude2 - Latitude1, 
                                             Longitudes is Longitude2 - Longitude1, 
                                             R is sqrt((Latitudes ** 2) + (Longitudes ** 2)).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Extensão do predicado paragemComMaisCarreiras - Devolve quais as carreiras com mais carreiras e o seu numero :  Paragem/NumCarreiras, Lista, Lista/NumCarreiras  -> {V,F}

paragemComMaisCarreiras( NovaParagem/NovoNumCarreiras, [ ], [NovaParagem]/NovoNumCarreiras ).
paragemComMaisCarreiras( NovaParagem/NovoNumCarreiras, [Paragem | Paragens]/NumCarreiras, [NovaParagem]/NovoNumCarreiras ) :- NovoNumCarreiras > NumCarreiras.  
paragemComMaisCarreiras( NovaParagem/NovoNumCarreiras, [Paragem | Paragens]/NumCarreiras, [Paragem | Paragens]/NumCarreiras ) :- NovoNumCarreiras < NumCarreiras.
paragemComMaisCarreiras( NovaParagem/NovoNumCarreiras, [Paragem | Paragens]/NumCarreiras, R/NumCarreiras ) :- NovoNumCarreiras == NumCarreiras, append([Paragem | Paragens], [NovaParagem], R).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Extensão do predicado seleciona : Elem, Lista, Lista  -> {V,F}

seleciona(E, [E|Xs], Xs).
seleciona(E, [X|Xs], [X|Ys]) :- seleciona(E, Xs, Ys).	


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Extensão do predicado seleciona : Elem, Lista, Lista  -> {V,F}

removeEmComum( X , [], [] ).
removeEmComum( X, [X|T], T ).
removeEmComum( X, [H|T], [H|R] ) :- removeEmComum( X, T, R ).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Extensão do predicado parseOperadoras - A cada nome da operadora atribui o seu id : Lista, Lista  -> {V,F}

parseOperadoras([],[]).
parseOperadoras([X|T], R) :- operadora(N,X) -> append([N], L, R), parseOperadoras(T, L).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Extensão do predicado minimo - Determina Caminho com menos Paragens : Lista, Lista  -> {V,F}

minimo([],[]).
minimo([(Caminho,NumParagens)], Caminho).
minimo([(Caminho,NumParagens) | Lista],Result) :- comparaMinimos((Caminho,NumParagens), Lista, Result).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Extensão do predicado comparaMinimos  : Caminho/NumParagens, Lista, Lista/NumParagens  -> {V,F}

comparaMinimos((Caminho1,NumParagens1), [], Caminho1).	
comparaMinimos((Caminho1,NumParagens1),[ (Caminho2,NumParagens2) | T],Result) :- NumParagens1 >= NumParagens2 -> comparaMinimos((Caminho2,NumParagens2), T, Result) ; comparaMinimos((Caminho1,NumParagens1),T,Result).