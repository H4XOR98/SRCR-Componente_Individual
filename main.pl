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
% Calcular um trajeto entre dois pontos
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


trajetoEntrePontos(Origem, Destino, Caminho) :- calculaTrajeto(Origem, Destino, [Origem], Caminho), escrever(Caminho).

calculaTrajeto(Destino, Destino, Visitadas, Caminho) :- inverso(Visitadas, Caminho).
calculaTrajeto(Origem, Destino, Visitadas, Caminho) :- isAdjacente(Origem, Proxima),
										             \+ member(Proxima, Visitadas),
										             calculaTrajeto(Proxima, Destino, [Proxima|Visitadas], Caminho).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Selecionar apenas algumas das operadoras de transporte para um determinado percurso
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

trajetoEntrePontosPorOperadora(Origem, Destino, Operadoras, Caminho) :- calculaTrajetoPorOperadora(Origem, Destino, Operadoras, [Origem], Caminho),
                                          			  					escrever(Caminho).

calculaTrajetoPorOperadora(Destino, Destino, Operadoras, Visitadas, Caminho) :- paragem( Destino, _, _, _, _, _, _, OperadoraDestino, _ ),
																  				member(OperadoraDestino, Operadoras), 
																  				inverso(Visitadas, Caminho).
calculaTrajetoPorOperadora(Origem, Destino, Operadoras, Visitadas, Caminho) :- paragem( Origem, _, _, _, _, _, _, OperadoraOrigem, _ ),
															     			   member(OperadoraOrigem, Operadoras), 
																 			   isAdjacente(Origem, Proxima),
										             			 			   \+ member(Proxima, Visitadas),
										            			 			   calculaTrajetoPorOperadora(Proxima, Destino, Operadoras, [Proxima|Visitadas], Caminho).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Excluir um ou mais operadores de transporte para o percurso.
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

trajetoEntrePontosSemOperadora(Origem, Destino, Operadoras, Caminho) :- calculaTrajetoSemOperadora(Origem, Destino, Operadoras, [Origem], Caminho),
                                          			  					escrever(Caminho).

calculaTrajetoSemOperadora(Destino, Destino, Operadoras, Visitadas, Caminho) :- paragem( Destino, _, _, _, _, _, _, OperadoraDestino, _ ),
																  				\+ member(OperadoraDestino, Operadoras), 
																  				inverso(Visitadas, Caminho).
calculaTrajetoSemOperadora(Origem, Destino, Operadoras, Visitadas, Caminho) :- paragem( Origem, _, _, _, _, _, _, OperadoraOrigem, _ ),
															     			   \+ member(OperadoraOrigem, Operadoras), 
																 			   isAdjacente(Origem, Proxima),
										             			 			   \+ member(Proxima, Visitadas),
										            			 			   calculaTrajetoSeOperadora(Proxima, Destino, Operadoras, [Proxima|Visitadas], Caminho).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Identificar quais as paragens com o maior número de carreiras num determinado percurso.
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -







% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Escolher o menor percurso (usando critério menor número de paragens)
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
