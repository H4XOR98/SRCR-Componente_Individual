import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;

public class Ponto {
    private double latitude;
    private double longitude;

    public Ponto(double latitude, double longitude) {
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public double getLatitude() {
        return latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public double distanciaEuclidiana(Ponto ponto){
        return Math.sqrt(Math.pow((this.latitude - ponto.getLatitude()),2) + Math.pow(this.longitude - ponto.getLongitude(),2));
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.latitude + ", " + this.longitude);
        return  sb.toString();
    }
}
