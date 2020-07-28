package priv.datastructure;

public class geocountries {
    private String ISO=null;
    private String CountryName=null;

    @Override
    public String toString() {
        return "geocountries{" +
                "ISO='" + ISO + '\'' +
                ", CountryName='" + CountryName + '\'' +
                '}';
    }

    public String getISO() {
        return ISO;
    }

    public void setISO(String ISO) {
        this.ISO = ISO;
    }

    public String getCountryName() {
        return CountryName;
    }

    public void setCountryName(String countryName) {
        CountryName = countryName;
    }

    public geocountries(String ISO, String countryName) {
        this.ISO = ISO;
        CountryName = countryName;
    }

    public geocountries(){

    }
}
