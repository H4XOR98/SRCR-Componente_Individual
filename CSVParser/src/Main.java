import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import java.io.*;


public class Main {
    public static void main(String[] args) throws IOException, BiffException {
        Sistema sistema = new Sistema();


        Workbook workbook = Workbook.getWorkbook(new File("/Users/lazaropinheiro/SRCR-Componente_Individual/Ficheiros Fornecidos/lista_adjacencias_paragens.xls"));
        int Num = workbook.getNumberOfSheets();
        StringBuilder sb;

        for (int i = 0; i < Num; i++) {
            workbook.getSheet(i);
            Sheet s = workbook.getSheet(i);

            int linha = s.getRows();
            int coluna = s.getColumns();

            for(int i1=1; i1<linha;i1++) {
                sb = new StringBuilder();
                for(int j=0;j<coluna;j++) {
                    Cell c =s.getCell(j, i1);
                    sb.append(c.getContents() + ";");
                }
                String[] componentes = sb.toString().split(";");
                sistema.inserirParagem(Integer.parseInt(componentes[0]),Double.parseDouble (componentes[1]),Double.parseDouble(componentes[2]),componentes[3],componentes[4],componentes[5],componentes[6],Integer.parseInt(componentes[7]),Integer.parseInt(componentes[8]),componentes[9],componentes[10]);

            }
        }

        FileWriter myWriter = new FileWriter("/Users/lazaropinheiro/SRCR-Componente_Individual/factos.pl");
        myWriter.write(sistema.toString());
        myWriter.close();
    }
}
