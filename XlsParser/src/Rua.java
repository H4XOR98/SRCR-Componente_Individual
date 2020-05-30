public class Rua {
    private int codigo;
    private String nome;
    private Freguesia freguesia;

    public Rua(int codigo, String nome, Freguesia freguesia) {
        this.codigo = codigo;
        this.nome = nome;
        this.freguesia = freguesia;
    }

    public int getCodigo() {
        return this.codigo;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("rua( " + this.codigo + ", '" + this.nome + "', " + this.freguesia.getId() + " ).\n");
        return  sb.toString();
    }
}
