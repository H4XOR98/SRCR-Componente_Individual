import java.text.DecimalFormat;

public class Adjacente {
    private int idCarreira;
    private int gidOrigem;
    private int gidDestino;
    private double distancia;

    public Adjacente(int idCarreira, int gidOrigem, int gidDestino, Ponto origem, Ponto destino) {
        this.idCarreira = idCarreira;
        this.gidOrigem = gidOrigem;
        this.gidDestino = gidDestino;
        this.distancia = origem.distanciaEuclidiana(destino);
    }

    @Override
    public String toString() {
        DecimalFormat numberFormat = new DecimalFormat("#.00");
        StringBuilder sb = new StringBuilder();
        sb.append("adjacente( " + this.idCarreira + ", " + this.gidOrigem + ", " + this.gidDestino + ", " + numberFormat.format(this.distancia ) + " ).");
        return sb.toString();
    }
}
