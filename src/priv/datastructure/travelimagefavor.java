package priv.datastructure;

public class travelimagefavor {
    private Integer FavorID = null;
    private Integer UID =null;
    private Integer ImageID =null;

    @Override
    public String toString() {
        return "travelimagefavor{" +
                "FavorID=" + FavorID +
                ", UID=" + UID +
                ", ImageID=" + ImageID +
                '}';
    }

    public Integer getFavorID() {
        return FavorID;
    }

    public void setFavorID(Integer favorID) {
        FavorID = favorID;
    }

    public Integer getUID() {
        return UID;
    }

    public void setUID(Integer UID) {
        this.UID = UID;
    }

    public Integer getImageID() {
        return ImageID;
    }

    public void setImageID(Integer imageID) {
        ImageID = imageID;
    }

    public travelimagefavor(Integer favorID, Integer UID, Integer imageID) {
        FavorID = favorID;
        this.UID = UID;
        ImageID = imageID;
    }

    public travelimagefavor(){

    }

}
