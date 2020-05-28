import java.util.*;

public class Carreira {
    private int id;
    private List<Integer> percurso;
    private List<Adjacente> adjacentes;
    private Set<String> horarios;
    private int[] minutos = new int[]{0,15,30,45,60};

    private final int MaxDiasSemana = 5;
    private final int MinDiasSemana = 2;
    private final int MaxNumHoras = 4;
    private final int MinNumHoras = 1;

    Comparator<String> compStrings = Comparator.comparing((String x) -> x);

    public Carreira(int id) {
        this.id = id;
        this.percurso = new ArrayList<>();
        this.adjacentes = new ArrayList<>();
        this.horarios = new TreeSet<>(compStrings);
        this.gerarHorario();
    }

    private void gerarHorario(){
        Set<String> diasSemana = new HashSet<>();
        Set<Integer> horas = new HashSet<>();

        int randomNumDiasSemana = MinDiasSemana + (int)(Math.random() * (MaxDiasSemana-MinDiasSemana) );
        int randomNumHoras =  MinNumHoras + (int)(Math.random() * (MaxNumHoras-MinNumHoras) );

        for(int i = 0; i <randomNumDiasSemana;i++){
            String diaSemana = DiasSemanaEnum.getRandom().name();
            diasSemana.add(diaSemana);
            for(int j = 0 ; j <randomNumHoras ; j++){
                int hora = 6 + (int)(Math.random() * (23-6) );
                horas.add(hora);
                int minuto = (int)(Math.random() * 4 );
                this.horarios.add("horario( " + this.id + ", " + diaSemana + ", " + hora + ", " + this.minutos[minuto] + " ).\n");
            }
            horas = new HashSet<>();
        }
    }


    public void addParagem(int idParagem){
        this.percurso.add(idParagem);
    }


    public void addAdjacente(int idParagem, Ponto origem, Ponto destino){
        this.adjacentes.add(new Adjacente(this.id, this.getIdUltimaParagem(), idParagem, origem, destino));
    }

    public int getIdUltimaParagem(){
        int idUltima;
        if(this.percurso.isEmpty()){
            idUltima = -1;
        }else{
            idUltima = this.percurso.get(this.percurso.size()-1);
        }
        return idUltima;
    }


    public String getHorario(){
        StringBuilder sb = new StringBuilder();
        for(String h : this.horarios){
            sb.append(h);
        }
        return sb.toString();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for(Adjacente adjacente : this.adjacentes){
            sb.append(adjacente.toString() + "\n");
        }
        return sb.toString();
    }
}
