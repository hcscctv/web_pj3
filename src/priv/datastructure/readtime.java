package priv.datastructure;

public class readtime {
    private Integer readid=null;
    private Integer uid=null;
    private Integer imgid=null;
    private long readtime=0;

    @Override
    public String toString() {
        return "readtime{" +
                "readid=" + readid +
                ", uid=" + uid +
                ", imgid=" + imgid +
                ", readtime=" + readtime +
                '}';
    }

    public Integer getReadid() {
        return readid;
    }

    public void setReadid(Integer readid) {
        this.readid = readid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getImgid() {
        return imgid;
    }

    public void setImgid(Integer imgid) {
        this.imgid = imgid;
    }

    public long getReadtime() {
        return readtime;
    }

    public void setReadtime(long readtime) {
        this.readtime = readtime;
    }

    public readtime() {
    }

    public readtime(Integer readid, Integer uid, Integer imgid, long readtime) {
        this.readid = readid;
        this.uid = uid;
        this.imgid = imgid;
        this.readtime = readtime;
    }
}
