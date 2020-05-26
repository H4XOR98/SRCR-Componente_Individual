import java.util.ArrayList;
import java.util.List;

public class Carreira {
    private int id;
    private List<Integer> percurso;
    private List<Adjacente> adjacentes;


    public Carreira(int id) {
        this.id = id;
        this.percurso = new ArrayList<>();
        this.adjacentes = new ArrayList<>();
    }


    public void addParagem(int idParagem){
        this.percurso.add(idParagem);
    }


    public void addAdjacente(int idParagem, Ponto origem, Ponto destino){
        this.adjacentes.add(new Adjacente(this.id, this.getIdUltimaParagem(), idParagem, origem, destino));
    }

    public int getIdUltimaParagem(){
        int idUltima;
        if(this.percurso.isEmpty()){
            idUltima = -1;
        }else{
            idUltima = this.percurso.get(this.percurso.size()-1);
        }
        return idUltima;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for(Adjacente adjacente : this.adjacentes){
            sb.append(adjacente.toString() + "\n");
        }
        return sb.toString();
    }
}
