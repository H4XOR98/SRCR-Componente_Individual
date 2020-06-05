:- consult('main.pl').


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                           API                                                                            |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Calcular um trajeto entre dois pontos.
% Algoritmo de Pesquisa : Pesquisa Não-Informada( Primeiro em Profundidade Com Multi-Estados).
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
trajetoEntrePontos(Origem, Destino) :- trajetoEntrePontos(Origem, Destino, Caminho), 
                                       write('------------------------------------------------------\n'),
                                       write('---------------- Trajeto Entre Pontos ----------------\n'),
                                       write('------------------------------------------------------\n'),
                                       write('\nOrigem: '),
                                       write(Origem),
                                       write('\nDestino: '),
                                       write(Destino),
                                       write('\nPercurso: '),
                                       write(Caminho).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Selecionar apenas algumas das operadoras de transporte para um determinado percurso.
% Algoritmo de Pesquisa : Pesquisa Não-Informada( Primeiro em Profundidade Com Multi-Estados)
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
trajetoEntrePontosPorOperadora(Origem,Destino, Operadoras) :- parseOperadoras(Operadoras, OperadorasParsed),
                                                              trajetoEntrePontosPorOperadora(Origem,Destino,OperadorasParsed,Caminho),
                                                              write('---------------------------------------------------------------------\n'),
                                                              write('---------------- Trajeto Entre Pontos Por Operadoras ----------------\n'),
                                                              write('---------------------------------------------------------------------\n'),
                                                              write('\nOrigem: '),
                                                              write(Origem),
                                                              write('\nDestino: '),
                                                              write(Destino),
                                                              write('\nOperadoras: '),
                                                              write(Operadoras),
                                                              write('\nPercurso: '),
                                                              write(Caminho).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Excluir um ou mais operadores de transporte para o percurso.
% Algoritmo de Pesquisa : Pesquisa Não-Informada( Primeiro em Profundidade Com Multi-Estados)
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
trajetoEntrePontosSemOperadora(Origem,Destino, Operadoras) :- parseOperadoras(Operadoras, OperadorasParsed),
                                                              trajetoEntrePontosSemOperadora(Origem,Destino,OperadorasParsed,Caminho),
                                                              write('---------------------------------------------------------------------\n'),
                                                              write('---------------- Trajeto Entre Pontos Sem Operadoras ----------------\n'),
                                                              write('---------------------------------------------------------------------\n'),
                                                              write('\nOrigem: '),
                                                              write(Origem),
                                                              write('\nDestino: '),
                                                              write(Destino),
                                                              write('\nOperadoras(Nao Permitidas): '),
                                                              write(Operadoras),
                                                              write('\nPercurso: '),
                                                              write(Caminho).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Identificar quais as paragens com o maior número de carreiras num determinado percurso.
% Algoritmo de Pesquisa : Pesquisa Não-Informada( Primeiro em Profundidade Com Multi-Estados)
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
trajetoParagensComMaisCarreiras(Origem,Destino) :- trajetoParagensComMaisCarreiras(Origem, Destino, Caminho/(Paragens/NumParagens)),
                                                    write('---------------------------------------------------------------------\n'),
                                                    write('---------------- Trajeto Paragens Com Mais Carreiras ----------------\n'),
                                                    write('---------------------------------------------------------------------\n'),
                                                    write('\nOrigem: '),
                                                    write(Origem),
                                                    write('\nDestino: '),
                                                    write(Destino),
                                                    write('\nParagens com mais carreiras:'),
                                                    write(Paragens),
                                                    write('\nNumero de Paragens: '),
                                                    write(NumParagens),
                                                    write('\nPercurso: '),
                                                    write(Caminho).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Escolher o menor percurso (usando critério menor número de paragens).
% Algoritmo de Pesquisa : Pesquisa Não-Informada( Primeiro em Profundidade Com Multi-Estados)
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
percursoMenosParagens(Origem, Destino) :- percursoMenosParagens(Origem, Destino, Caminho/NumParagens),
                                          write('------------------------------------------------------------\n'),
                                          write('---------------- Trajeto Com Menos Paragens ----------------\n'),
                                          write('------------------------------------------------------------\n'),
                                          write('\nOrigem: '),
                                          write(Origem),
                                          write('\nDestino: '),
                                          write(Destino),
                                          write('\nNumero de Paragens: '),
                                          write(NumParagens),
                                          write('\nPercurso: '),
                                          write(Caminho).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Escolher o percurso mais rápido (usando critério da distância).
% Algoritmo de Pesquisa : Pesquisa Informada( Algoritmo A* )
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
percursoMaisRapido_Distancia(Origem, Destino) :- percursoMaisRapido_Distancia(Origem, Destino, Caminho/Custo),
                                                 write('-----------------------------------------------------------------\n'),
                                                 write('---------------- Trajeto Mais Rapido (Distancia) ----------------\n'),
                                                 write('-----------------------------------------------------------------\n'),
                                                 write('\nOrigem: '),
                                                 write(Origem),
                                                 write('\nDestino: '),
                                                 write(Destino),  
                                                 write('\nPercurso: '),
                                                 write(Caminho),
                                                 write('\nDistancia Total: '),
                                                 write(Custo).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Escolher o percurso que passe apenas por abrigos com publicidade.
% Algoritmo de Pesquisa : Pesquisa Não-Informada( Primeiro em Profundidade Com Multi-Estados)
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -                                                  
trajetoEntrePontosComPublicidade(Origem, Destino) :- trajetoEntrePontosComPublicidade(Origem, Destino, Caminho),
                                                     write('----------------------------------------------------------\n'),
                                                     write('---------------- Trajeto Com Publicidade  ----------------\n'),
                                                     write('----------------------------------------------------------\n'),
                                                     write('\nOrigem: '),
                                                     write(Origem),
                                                     write('\nDestino: '),
                                                     write(Destino),    
                                                     write('\nPercurso: '),
                                                     write(Caminho).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Escolher o percurso que passe apenas por paragens abrigadas.
% Algoritmo de Pesquisa : Pesquisa Não-Informada( Primeiro em Profundidade Com Multi-Estados)
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
trajetoEntrePontosComAbrigo(Origem, Destino) :- trajetoEntrePontosComAbrigo(Origem, Destino, Caminho),
                                                write('----------------------------------------------------------\n'),
                                                write('------------------- Trajeto Com Abrigo -------------------\n'),
                                                write('----------------------------------------------------------\n'),
                                                write('\nOrigem: '),
                                                write(Origem),
                                                write('\nDestino: '),
                                                write(Destino),    
                                                write('\nPercurso: '),
                                                write(Caminho).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Escolher um ou mais pontos intermédios por onde o percurso deverá passar.
% Algoritmo de Pesquisa : Pesquisa Não-Informada( Primeiro em Profundidade Com Multi-Estados)
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
trajetoPorIntermedias(Origem, Destino, Intermedias) :- trajetoPorIntermedias(Origem, Destino, Intermedias, Caminho),
                                                        write('----------------------------------------------------------\n'),
                                                        write('------------------- Trajeto Com Abrigo -------------------\n'),
                                                        write('----------------------------------------------------------\n'),
                                                        write('\nOrigem: '),
                                                        write(Origem),
                                                        write('\nDestino: '),
                                                        write(Destino),    
                                                        write('\nParagens Intermedias: '),
                                                        write(Intermedias), 
                                                        write('\nPercurso: '),
                                                        write(Caminho).