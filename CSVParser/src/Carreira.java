import java.util.ArrayList;
import java.util.List;

public class Carreira {
    private int id;
    private List<Integer> percurso;


    public Carreira(int id) {
        this.id = id;
        this.percurso = new ArrayList<>();
    }

    public void addParagem(int paragem){
        if(!this.percurso.contains(paragem)){
            this.percurso.add(paragem);
        }
    }
}
