import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;

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
        String r;
        if((this.distancia == Math.floor(this.distancia)) && !Double.isInfinite(this.distancia)) {
            r = "" + this.distancia;
        }else{
            DecimalFormatSymbols otherSymbols = new DecimalFormatSymbols(Locale.getDefault());
            otherSymbols.setDecimalSeparator('.');
            DecimalFormat numberFormat = new DecimalFormat("#.0000000000");
            r = numberFormat.format(this.distancia);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("adjacente( " + this.idCarreira + ", " + this.gidOrigem + ", " + this.gidDestino + ", " + r + " ).");
        return sb.toString();
    }
}
