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