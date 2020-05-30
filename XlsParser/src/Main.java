import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.Normalizer;

public class Main {

    public static void main(String[] args) throws IOException, BiffException {
        Workbook workbook = Workbook.getWorkbook(new File("/Users/lazaropinheiro/Desktop/SRCR/ficheirosfornecidos/lista_adjacencias_paragens.xls"));
        int Num = workbook.getNumberOfSheets();
        StringBuilder sb;

        Sistema sistema = new Sistema();
        for (int i = 0; i < Num; i++) {
            workbook.getSheet(i);
            Sheet s = workbook.getSheet(i);

            int linha = s.getRows();
            int coluna = s.getColumns();

            for (int i1 = 1; i1 < linha; i1++) {
                sb = new StringBuilder();
                for (int j = 0; j < coluna; j++) {
                    Cell c = s.getCell(j, i1);
                    sb.append(c.getContents() + ";");
                }
                String[] componentes = sb.toString().split(";");
                sistema.inserirParagem(Integer.parseInt(componentes[0]),Double.parseDouble (componentes[1]),Double.parseDouble(componentes[2]),stripAccents(componentes[3]),stripAccents(componentes[4]),stripAccents(componentes[5]),stripAccents(componentes[6]),Integer.parseInt(componentes[7]),Integer.parseInt(componentes[8]),stripAccents(componentes[9]),stripAccents(componentes[10]));
            }
        }

        FileWriter myWriter = new FileWriter("/Users/lazaropinheiro/Desktop/SRCR/factos.pl");
        myWriter.write(sistema.toString());
        myWriter.close();
    }

    private static String stripAccents(String s)
    {
        String result = Normalizer.normalize(s, Normalizer.Form.NFD);
        result = result.replaceAll("[\\p{InCombiningDiacriticalMarks}]", "");
        return result.replaceAll("´","");
    }
}
