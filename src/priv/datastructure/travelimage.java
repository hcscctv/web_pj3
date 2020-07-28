package priv.datastructure;

import tools.DAO;

import java.util.Date;
import java.util.Objects;

public class travelimage {
    public Integer getImageID() {
        return ImageID;
    }

    public void setImageID(Integer imageID) {
        ImageID = imageID;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public double getLatitude() {
        return Latitude;
    }

    public void setLatitude(double latitude) {
        Latitude = latitude;
    }

    public double getLongitude() {
        return Longitude;
    }

    public void setLongitude(double longitude) {
        Longitude = longitude;
    }

    public Integer getCityCode() {
        return CityCode;
    }

    public void setCityCode(Integer cityCode) {
        CityCode = cityCode;
    }

    public String getCountryCodeISO() {
        return CountryCodeISO;
    }

    public void setCountryCodeISO(String countryCodeISO) {
        CountryCodeISO = countryCodeISO;
    }

    public Integer getUID() {
        return UID;
    }

    public void setUID(Integer UID) {
        this.UID = UID;
    }

    public String getPATH() {
        return PATH;
    }

    public void setPATH(String PATH) {
        this.PATH = PATH;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public Integer getLike_num() {
        return like_num;
    }

    public void setLike_num(Integer like_num) {
        this.like_num = like_num;
    }

    public travelimage(){

    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        travelimage that = (travelimage) o;
        return Double.compare(that.Latitude, Latitude) == 0 &&
                Double.compare(that.Longitude, Longitude) == 0 &&
                Objects.equals(ImageID, that.ImageID) &&
                Objects.equals(Title, that.Title) &&
                Objects.equals(Description, that.Description) &&
                Objects.equals(CityCode, that.CityCode) &&
                Objects.equals(CountryCodeISO, that.CountryCodeISO) &&
                Objects.equals(UID, that.UID) &&
                Objects.equals(PATH, that.PATH) &&
                Objects.equals(Content, that.Content) &&
                Objects.equals(like_num, that.like_num) &&
                Objects.equals(updatetime, that.updatetime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(ImageID, Title, Description, Latitude, Longitude, CityCode, CountryCodeISO, UID, PATH, Content, like_num, updatetime);
    }

    private Integer ImageID=null;
    private String Title =null;
    private String Description = null;
    private double Latitude=0;
    private double Longitude=0;
    private Integer CityCode = null;
    private String CountryCodeISO=null;
    private Integer UID = null;
    private String PATH = null;
    private String Content =null;
    private Integer like_num=null;
    private java.util.Date updatetime=null;

    public travelimage(Integer imageID, String title, String description, double latitude, double longitude, Integer cityCode, String countryCodeISO, Integer UID, String PATH, String content, Integer like_num, Date updatetime) {
        ImageID = imageID;
        Title = title;
        Description = description;
        Latitude = latitude;
        Longitude = longitude;
        CityCode = cityCode;
        CountryCodeISO = countryCodeISO;
        this.UID = UID;
        this.PATH = PATH;
        Content = content;
        this.like_num = like_num;
        this.updatetime = updatetime;
    }

    @Override
    public String toString() {
        return "travelimage{" +
                "ImageID=" + ImageID +
                ", Title='" + Title + '\'' +
                ", Description='" + Description + '\'' +
                ", Latitude=" + Latitude +
                ", Longitude=" + Longitude +
                ", CityCode=" + CityCode +
                ", CountryCodeISO='" + CountryCodeISO + '\'' +
                ", UID=" + UID +
                ", PATH='" + PATH + '\'' +
                ", Content='" + Content + '\'' +
                ", like_num=" + like_num +
                ", updatetime=" + updatetime +
                '}';
    }

    public String username(){
        return DAO.getForValue("select UserName from traveluser where UID=?",getUID()).toString();
    }

    public String country(){
       return DAO.getForValue("select CountryName from geocountries where ISO=?",getCountryCodeISO()).toString();
    }

    public String city(){
        return (DAO.getForValue("select AsciiName from geocities where GeoNameID=?",getCityCode()).toString());
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }



}
