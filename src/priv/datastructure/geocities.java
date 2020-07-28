package priv.datastructure;

public class geocities {
    private Integer GeoNameID =null;
    private String AsciiName=null;
    private String CountryCodeISO=null;

    @Override
    public String toString() {
        return "geocities{" +
                "GeoNameID=" + GeoNameID +
                ", AsciiName='" + AsciiName + '\'' +
                ", CountryCodeISO='" + CountryCodeISO + '\'' +
                '}';
    }

    public Integer getGeoNameID() {
        return GeoNameID;
    }

    public void setGeoNameID(Integer geoNameID) {
        GeoNameID = geoNameID;
    }

    public String getAsciiName() {
        return AsciiName;
    }

    public void setAsciiName(String asciiName) {
        AsciiName = asciiName;
    }

    public String getCountryCodeISO() {
        return CountryCodeISO;
    }

    public void setCountryCodeISO(String countryCodeISO) {
        CountryCodeISO = countryCodeISO;
    }

    public geocities(Integer geoNameID, String asciiName, String countryCodeISO) {
        GeoNameID = geoNameID;
        AsciiName = asciiName;
        CountryCodeISO = countryCodeISO;
    }

    public geocities(){

    }
}
