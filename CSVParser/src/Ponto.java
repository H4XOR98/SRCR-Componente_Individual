public class Ponto {
    private double latitude;
    private double longitude;

    public Ponto(double latitude, double longitude) {
        this.latitude = latitude;
        this.longitude = longitude;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.latitude + ", " + this.longitude);
        return  sb.toString();
    }
}
