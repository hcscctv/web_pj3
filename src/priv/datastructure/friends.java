package priv.datastructure;

public class friends {
    private Integer favorid=null;
    private Integer uid1=null;
    private Integer uid2=null;
    private Integer state=null;

    public friends() {
    }

    public friends(Integer favorid, Integer uid1, Integer uid2, Integer state) {
        this.favorid = favorid;
        this.uid1 = uid1;
        this.uid2 = uid2;
        this.state = state;
    }

    @Override
    public String toString() {
        return "friends{" +
                "favorid=" + favorid +
                ", uid1=" + uid1 +
                ", uid2=" + uid2 +
                ", state=" + state +
                '}';
    }

    public Integer getFavorid() {
        return favorid;
    }

    public void setFavorid(Integer favorid) {
        this.favorid = favorid;
    }

    public Integer getUid1() {
        return uid1;
    }

    public void setUid1(Integer uid1) {
        this.uid1 = uid1;
    }

    public Integer getUid2() {
        return uid2;
    }

    public void setUid2(Integer uid2) {
        this.uid2 = uid2;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }








}
