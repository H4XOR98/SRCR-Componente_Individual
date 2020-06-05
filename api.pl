:- consult('main.pl').


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