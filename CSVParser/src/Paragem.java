import java.util.ArrayList;
import java.util.List;

public class Paragem {
    private int gid;
    private Ponto localizacao;
    private String estado;
    private String tipo;
    private String publicidade;
    private List<Integer> carreiras;
    private Operadora operadora;
    private Rua rua;

    public Paragem(int gid, double latitude, double longitude, String estado, String tipo, String publicidade, Operadora operadora, Rua rua) {
        this.gid = gid;
        this.localizacao = new Ponto(latitude,longitude);
        this.estado = estado;
        this.tipo = tipo;
        this.carreiras = new ArrayList<>();
        this.publicidade = publicidade;
        this.operadora = operadora;
        this.rua = rua;
    }

    public Ponto getLocalizacao() {
        return localizacao;
    }

    public void addCarreira(int carreira){
        this.carreiras.add(carreira);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("paragem( " + this.gid + ", " + this.localizacao.toString() + ", '" + this.estado +  "', '" + this.tipo + "', '" + this.publicidade + "', [ ");
        for(int i = 0; i < this.carreiras.size() ; i++){
            sb.append(this.carreiras.get(i));
            if(i != this.carreiras.size()-1){
                sb.append(", ");
            }
        }
        sb.append(" ], " + this.operadora.getId() + ", " + this.rua.getCodigo() + " ).");
        return  sb.toString().replaceAll("\n","")+"\n";
    }
}
