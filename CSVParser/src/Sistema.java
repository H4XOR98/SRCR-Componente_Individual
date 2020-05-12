import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Sistema {
    private Map<String,Freguesia> freguesias;
    private Map<Integer, Rua> ruas;
    private Map<String,Operadora> operadoras;
    private Map<Integer, Carreira> carreiras;
    private Map<Integer, Paragem> paragens;


    public Sistema() {
        this.freguesias = new HashMap<>();
        this.ruas = new HashMap<>();
        this.operadoras = new HashMap<>();
        this.carreiras = new HashMap<>();
        this.paragens = new HashMap<>();
    }

    public void inserirParagem(int gid, double latitude, double longitude, String estado, String tipo, String publicidade, String operadora, int carreira, int codigo, String rua, String freguesia){
        if(!this.freguesias.containsKey(freguesia)){
            this.freguesias.put(freguesia, new Freguesia(freguesia));
        }
        if(!this.ruas.containsKey(codigo)){
            this.ruas.put(codigo,new Rua(codigo,rua,this.freguesias.get(freguesia)));
        }
        if(!this.operadoras.containsKey(operadora)){
            this.operadoras.put(operadora,new Operadora(operadora));
        }
        if(!this.paragens.containsKey(gid)){
           this.paragens.put(gid,new Paragem(gid,latitude,longitude,estado,tipo,publicidade,this.operadoras.get(operadora),this.ruas.get(codigo)));
        }

        if(!this.carreiras.containsKey(carreira)){
            this.carreiras.put(carreira,new Carreira(carreira));
        }else{
            this.carreiras.get(carreira).addParagem(gid);
        }

    }


    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for(Freguesia freguesia : this.freguesias.values()){
            sb.append(freguesia.toString());
        }
        sb.append("\n\n\n");
        for(Rua rua : this.ruas.values()){
            sb.append(rua.toString());
        }
        sb.append("\n\n\n");
        for(Operadora operadora : this.operadoras.values()){
            sb.append(operadora.toString());
        }
        sb.append("\n\n\n");
        for(Paragem paragem : this.paragens.values()){
            sb.append(paragem.toString());
        }
        return sb.toString();
    }




}
