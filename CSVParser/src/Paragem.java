import java.util.ArrayList;
import java.util.List;

public class Paragem {
    private int gid;
    private Ponto localizacao;
    private String estado;
    private String tipo;
    private String publicidade;
    private Operadora operadora;
    private Rua rua;

    public Paragem(int gid, double latitude, double longitude, String estado, String tipo, String publicidade, Operadora operadora, Rua rua) {
        this.gid = gid;
        this.localizacao = new Ponto(latitude,longitude);
        this.estado = estado;
        this.tipo = tipo;
        this.publicidade = publicidade;
        this.operadora = operadora;
        this.rua = rua;
    }


    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("paragem( " + this.gid + ", " + this.localizacao.toString() + ", '" + this.estado +  "', '" + this.tipo + "', '" + this.publicidade +"', " + this.operadora.getId());

        sb.append(this.rua.getCodigo() + " ).\n");

        return  sb.toString();
    }
}
