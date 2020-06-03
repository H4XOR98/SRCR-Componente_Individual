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


distanciaEuclidiana( Origem, Destino, R ) :- paragem( Origem, Latitude1, Longitude1, _, _, _, _, _, _ ),
                                             paragem( Destino, Latitude2, Longitude2, _, _, _, _, _, _ ),
                                             Latitudes is Latitude2 - Latitude1, 
                                             Longitudes is Longitude2 - Longitude1, 
                                             R is sqrt((Latitudes ** 2) + (Longitudes ** 2)).



paragemComMaisCarreiras( NovaParagem/NovoNumCarreiras, [ ], [NovaParagem]/NovoNumCarreiras ).
paragemComMaisCarreiras( NovaParagem/NovoNumCarreiras, [Paragem | Paragens]/NumCarreiras, [NovaParagem]/NovoNumCarreiras ) :- NovoNumCarreiras > NumCarreiras.  
paragemComMaisCarreiras( NovaParagem/NovoNumCarreiras, [Paragem | Paragens]/NumCarreiras, [Paragem | Paragens]/NumCarreiras ) :- NovoNumCarreiras < NumCarreiras.
paragemComMaisCarreiras( NovaParagem/NovoNumCarreiras, [Paragem | Paragens]/NumCarreiras, R/NumCarreiras ) :- NovoNumCarreiras == NumCarreiras, append([Paragem | Paragens], [NovaParagem], R).


seleciona(E, [E|Xs], Xs).
seleciona(E, [X|Xs], [X|Ys]) :- seleciona(E, Xs, Ys).	

removeEmComum( X , [], [] ).
removeEmComum( X, [X|T], T ).
removeEmComum( X, [H|T], [H|R] ) :- removeEmComum( X, T, R ).