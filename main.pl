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
% Calcular um trajeto entre dois pontos.
% Algoritmo de Pesquisa : Pesquisa Não-Informada( Primeiro em Profundidade Com Multi-Estados).
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

trajetoEntrePontos(Origem, Destino, Caminho) :- calculaTrajeto(Origem, Destino, [Origem], Caminho).

calculaTrajeto(Destino, Destino, Visitadas, Caminho) :- inverso(Visitadas, Caminho).
calculaTrajeto(Origem, Destino, Visitadas, Caminho) :- isAdjacente(Origem, Proxima),
										             \+ member(Proxima, Visitadas),
										             calculaTrajeto(Proxima, Destino, [Proxima|Visitadas], Caminho).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Selecionar apenas algumas das operadoras de transporte para um determinado percurso.
% Algoritmo de Pesquisa : Pesquisa Não-Informada( Primeiro em Profundidade Com Multi-Estados)
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

trajetoEntrePontosPorOperadora(Origem, Destino, Operadoras, Caminho) :- calculaTrajetoPorOperadora(Origem, Destino, Operadoras, [Origem], Caminho).

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
% Algoritmo de Pesquisa : Pesquisa Não-Informada( Primeiro em Profundidade Com Multi-Estados)
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

trajetoEntrePontosSemOperadora(Origem, Destino, Operadoras, Caminho) :- calculaTrajetoSemOperadora(Origem, Destino, Operadoras, [Origem], Caminho).

calculaTrajetoSemOperadora(Destino, Destino, Operadoras, Visitadas, Caminho) :- paragem( Destino, _, _, _, _, _, _, OperadoraDestino, _ ),
																  				\+ member(OperadoraDestino, Operadoras), 
																  				inverso(Visitadas, Caminho).
calculaTrajetoSemOperadora(Origem, Destino, Operadoras, Visitadas, Caminho) :- paragem( Origem, _, _, _, _, _, _, OperadoraOrigem, _ ),
															     			   \+ member(OperadoraOrigem, Operadoras), 
																 			   isAdjacente(Origem, Proxima),
										             			 			   \+ member(Proxima, Visitadas),
										            			 			   calculaTrajetoSemOperadora(Proxima, Destino, Operadoras, [Proxima|Visitadas], Caminho).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Identificar quais as paragens com o maior número de carreiras num determinado percurso.
% Algoritmo de Pesquisa : Pesquisa Não-Informada( Primeiro em Profundidade Com Multi-Estados)
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

trajetoParagensComMaisCarreiras(Origem, Destino, Caminho/Carreiras) :- paragem( Origem, _, _, _, _, _, CarreirasOrigem, _, _ ),
                                              						   length(CarreirasOrigem, NumCarreirasOrigem),
											  						   calculaParagensComMaisCarreiras(Origem, Destino, [Origem], [Origem]/NumCarreirasOrigem, Caminho/Carreiras).

calculaParagensComMaisCarreiras(Destino, Destino, Visitadas, MaxCarreiras, Caminho/Carreiras) :- paragem( Destino, _, _, _, _, _, CarreirasDestino, _, _ ),
                                                          	 			 						 length(CarreirasDestino, NumCarreirasDestino),
																		 						 paragemComMaisCarreiras(Destino/NumCarreirasDestino, MaxCarreiras, Carreiras), 
														  	 			 						 inverso(Visitadas, Caminho).
calculaParagensComMaisCarreiras(Origem, Destino, Visitadas, MaxCarreiras, Caminho/Carreiras) :- isAdjacente(Origem, Proxima), 
										             											\+ member(Proxima, Visitadas),
														 										paragem( Proxima, _, _, _, _, _, CarreirasProxima, _, _ ),
                                                         										length(CarreirasProxima, NumCarreirasProxima),
														 										paragemComMaisCarreiras(Proxima/NumCarreirasProxima, MaxCarreiras, Result),
										             	 										calculaParagensComMaisCarreiras(Proxima, Destino, [Proxima|Visitadas], Result, Caminho/Carreiras).



% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Escolher o menor percurso (usando critério menor número de paragens).
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Escolher o percurso mais rápido (usando critério da distância).
% Algoritmo de Pesquisa : Pesquisa Informada( Algoritmo A* )
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

percursoMaisRapido_Distancia(Origem, Destino, Caminho/Custo) :-
	distanciaEuclidiana(Origem, Destino, Estima),
	calculaMaisRapido_Distancia(Destino, [[Origem]/0/Estima], InvCaminho/Custo/_),
	inverso(InvCaminho, Caminho).

calculaMaisRapido_Distancia(Destino, Caminhos, Caminho) :-
	obtem_MaisRapido_Distancia(Destino, Caminhos, Caminho),
	Caminho = [Destino|_]/_/_.

calculaMaisRapido_Distancia(Destino, Caminhos, SolucaoCaminho) :-
	obtem_MaisRapido_Distancia(Destino, Caminhos, MelhorCaminho),
	seleciona(MelhorCaminho, Caminhos, OutrosCaminhos),
	expande_MaisRapido_Distancia(Destino, MelhorCaminho, ExpCaminhos),
	append(OutrosCaminhos, ExpCaminhos, NovoCaminhos),
    calculaMaisRapido_Distancia(Destino, NovoCaminhos, SolucaoCaminho).		


obtem_MaisRapido_Distancia(Destino, [Caminho], Caminho) :- !.

obtem_MaisRapido_Distancia(Destino, [Caminho1/Custo1/Est1,_/Custo2/Est2|Caminhos], MelhorCaminho) :-
	Custo1 + Est1 =< Custo2 + Est2, !,
	obtem_MaisRapido_Distancia(Destino, [Caminho1/Custo1/Est1|Caminhos], MelhorCaminho).
	
obtem_MaisRapido_Distancia(Destino,[_|Caminhos], MelhorCaminho) :- 
	obtem_MaisRapido_Distancia(Destino,Caminhos, MelhorCaminho).

expande_MaisRapido_Distancia(Destino,Caminho, ExpCaminhos) :-
	findall(NovoCaminho, isAdjacente(Destino,Caminho,NovoCaminho), ExpCaminhos).

isAdjacente(Destino,[Origem|Caminho]/Custo/_, [Proxima,Origem|Caminho]/NovoCusto/Estima) :-
	adjacente(Origem, Proxima, _, PassoCusto),
	\+ member(Proxima, Caminho),
	NovoCusto is Custo + PassoCusto,
	distanciaEuclidiana(Proxima, Destino, Estima).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Escolher o percurso que passe apenas por abrigos com publicidade.
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


trajetoEntrePontosComPublicidade(Origem, Destino, Caminho) :- calculaTrajetoComPublicidade(Origem, Destino, [Origem], Caminho), escrever(Caminho).

calculaTrajetoComPublicidade(Destino, Destino, Visitadas, Caminho) :- paragem( Destino, _, _, _, _, 'Yes', _, _, _ ), inverso(Visitadas, Caminho).
calculaTrajetoComPublicidade(Origem, Destino, Visitadas, Caminho) :- isAdjacente(Origem, Proxima),
													   				 paragem( Origem, _, _, _, _, 'Yes' , _, _, _ ),
																     \+ member(Proxima, Visitadas),
										               				 calculaTrajetoComPublicidade(Proxima, Destino, [Proxima|Visitadas], Caminho).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Escolher o percurso que passe apenas por paragens abrigadas.
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


trajetoEntrePontosComAbrigo(Origem, Destino, Caminho) :- calculaTrajetoComAbrigo(Origem, Destino, [Origem], Caminho), escrever(Caminho).

calculaTrajetoComAbrigo(Destino, Destino, Visitadas, Caminho) :- paragem( Destino, _, _, _, Abrigo, _, _, _, _ ), 
																 member(Abrigo,['Aberto dos Lados','Fechado dos Lados']), 
																 inverso(Visitadas, Caminho).
calculaTrajetoComAbrigo(Origem, Destino, Visitadas, Caminho) :- isAdjacente(Origem, Proxima),
													   			paragem( Origem, _, _, _, Abrigo, _, _, _, _ ),
																member(Abrigo,['Aberto dos Lados','Fechado dos Lados']), 
																\+ member(Proxima, Visitadas),
										               			calculaTrajetoComAbrigo(Proxima, Destino, [Proxima|Visitadas], Caminho).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Escolher um ou mais pontos intermédios por onde o percurso deverá passar.
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

trajetoPorIntermedias(Origem, Destino, Intermedias, Caminho) :- removeEmComum(Origem,Intermedias,NovasIntermedias), calculaTrajetoPorIntermedias(Origem, Destino, NovasIntermedias, [Origem], Caminho).

calculaTrajetoPorIntermedias(Destino, Destino, [], Visitadas, Caminho) :- inverso(Visitadas, Caminho).
calculaTrajetoPorIntermedias(Origem, Destino, Intermedias, Visitadas, Caminho) :- isAdjacente(Origem, Proxima),
																				  \+ member(Proxima, Visitadas),
																				  (member(Proxima,Intermedias) -> removeEmComum(Proxima,Intermedias,NovasIntermedias) ; NovasIntermedias = Intermedias),
																				  calculaTrajetoPorIntermedias(Proxima, Destino, NovasIntermedias, [Proxima|Visitadas], Caminho).