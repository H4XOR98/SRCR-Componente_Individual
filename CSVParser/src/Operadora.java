public class Operadora {
    private int id;
    private String nome;

    private static int ID = 0;

    public Operadora(String nome) {
        this.id = ID++;
        this.nome = nome;
    }

    public int getId() {
        return id;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("operadora( " + this.id + ", '" + this.nome + "' ).\n");
        return  sb.toString();
    }
}
