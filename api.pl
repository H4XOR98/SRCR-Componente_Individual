:- consult('main.pl').


trajetoEntrePontos(Origem, Destino) :- trajetoEntrePontos(Origem, Destino, Caminho), 
                                       write('------------------------------------------------------'),
                                       write('---------------- Trajeto Entre Pontos ----------------'),
                                       write('------------------------------------------------------'),
                                       write('\nOrigem: '),
                                       write(Origem),
                                       write('\nDestino: '),
                                       write(Destino),
                                       write('\nPercurso: '),
                                       write(Caminho).