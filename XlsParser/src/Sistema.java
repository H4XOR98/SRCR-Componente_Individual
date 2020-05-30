import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public class Sistema {
    private Map<String,Freguesia> freguesias;
    private Map<Integer, Rua> ruas;
    private Map<String,Operadora> operadoras;
    private Map<Integer, Paragem> paragens;
    private Map<Integer, Carreira> carreiras;

    private Comparator<Integer> comparaInts = Comparator.comparingInt(a -> a);

    public Sistema() {
        this.freguesias = new HashMap();
        this.ruas = new TreeMap(comparaInts);
        this.operadoras = new HashMap();
        this.paragens = new TreeMap(comparaInts);
        this.carreiras = new TreeMap<>(comparaInts);
    }


    public void inserirParagem(int gid, double latitude, double longitude, String estado, String tipo, String publicidade, String operadora, int carreira, int codigo, String rua, String freguesia) {
        if(!this.freguesias.containsKey(freguesia)){
            this.freguesias.put(freguesia,new Freguesia(freguesia));
        }
        if(!this.ruas.containsKey(codigo)){
            this.ruas.put(codigo,new Rua(codigo,rua,this.freguesias.get(freguesia)));
        }
        if(!this.operadoras.containsKey(operadora)){
            this.operadoras.put(operadora,new Operadora(operadora));
        }
        if(!this.paragens.containsKey(gid)){
            this.paragens.put(gid,new Paragem(gid,latitude,longitude,estado,tipo,publicidade, this.operadoras.get(operadora),this.ruas.get(codigo)));
        }
        if(!this.carreiras.containsKey(carreira)) {
            this.carreiras.put(carreira, new Carreira(carreira));
        }
        this.paragens.get(gid).addCarreira(carreira);
        this.carreiras.get(carreira).addParagem(paragens.get(gid));
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%\n" +
                "% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %\n" +
                "%|                                                                            FACTOS                                                                        |%\n" +
                "% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %\n" +
                "% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%\n\n\n\n\n");

        sb.append("% FREGUESIAS\n" +
                "% Extensão do predicado freguesia: IdFreguesia, Nome -> {V,F}\n\n");
        for(Freguesia freguesia : this.freguesias.values()){
            sb.append(freguesia.toString());
        }

        sb.append("\n\n\n" +
                "% RUAS\n" +
                "% Extensão do predicado rua: Codigo, Nome, IdFreguesia -> {V,F}\n\n");
        for(Rua rua : this.ruas.values()){
            sb.append(rua.toString());
        }

        sb.append("\n\n\n" +
                "% OPERADORAS\n" +
                "% Extensão do predicado operadora: Operadora, Nome -> {V,F}\n\n");
        for(Operadora operadora : this.operadoras.values()){
            sb.append(operadora.toString());
        }

        sb.append("\n\n\n" +
                "% PARAGENS\n" +
                "% Extensão do predicado paragem: Gid, Latitude, Longitude, Estado, Tipo, Publicidade, Carreiras, Operadora, Codigo -> {V,F}\n\n");
        for(Paragem paragem : this.paragens.values()){
            sb.append(paragem.toString());
        }


        sb.append("\n\n\n" +
                "% ADJACENTES\n" +
                "% Extensão do predicado adjacente: Carreira, GidOrigem, GidDestino, Distancia -> {V,F}\n\n");
        for(Carreira carreira : this.carreiras.values()){
            sb.append(carreira.toString());
        }

        return sb.toString();
    }
}
