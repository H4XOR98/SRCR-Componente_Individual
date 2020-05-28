public enum DiasSemanaEnum {
    Segunda(0), Terca(1), Quarta(2), Quinta(3), Sexta(4), Sabado(5), Domingo(6);

    private int id;

    private DiasSemanaEnum(int id) {
        this.id = id;
    }
    
    public static DiasSemanaEnum getRandom() {
        return values()[(int) (Math.random() * values().length)];
    }
}
