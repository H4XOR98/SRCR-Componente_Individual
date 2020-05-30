import java.util.ArrayList;
import java.util.List;

public class Carreira {
    private int id;
    private List<Paragem> percurso;
    private List<Adjacente> adjacentes;

    public Carreira(int id) {
        this.id = id;
        this.percurso = new ArrayList<>();
        this.adjacentes = new ArrayList<>();
    }


    public void addParagem(Paragem paragem){
        this.addAdjacente(paragem);
        this.percurso.add(paragem);
    }

    private void addAdjacente(Paragem paragem){
        if(this.percurso.size() > 0) {
            Paragem paragemAnterior = this.percurso.get(this.percurso.size() - 1);
            this.adjacentes.add(new Adjacente(this.id, paragemAnterior.getGid(), paragem.getGid(), paragemAnterior.getLocalizacao(), paragem.getLocalizacao()));
        }
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
