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
        StringBuilder sb = new StringBuilder();
        sb.append("adjacente( " + this.gidOrigem + ", " + this.gidDestino + ", " + this.idCarreira + ", " + String.valueOf(this.distancia).replaceAll(",",".") + " ).");
        return sb.toString();
    }
}
