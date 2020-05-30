public class Freguesia {
    private int id;
    private String nome;

    private static int ID = 0;

    public Freguesia(String nome) {
        this.id = ID++;
        this.nome = nome;
    }

    public int getId() {
        return id;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("freguesia( " + id + ", '" + this.nome + "' ).\n");
        return sb.toString();
    }
}
