package priv.datastructure;

import java.sql.Timestamp;

public class message {
    private Integer messageid=null;
    private Integer uid1=null;
    private Integer uid2=null;
    private String message=null;
    private boolean state=false;
    private Timestamp time=null;

    public message(Integer messageid, Integer uid1, Integer uid2, String message, boolean state, Timestamp time) {
        this.messageid = messageid;
        this.uid1 = uid1;
        this.uid2 = uid2;
        this.message = message;
        this.state = state;
        this.time = time;
    }

    @Override
    public String toString() {
        return "message{" +
                "messageid=" + messageid +
                ", uid1=" + uid1 +
                ", uid2=" + uid2 +
                ", message='" + message + '\'' +
                ", state=" + state +
                ", time=" + time +
                '}';
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Integer getMessageid() {
        return messageid;
    }

    public void setMessageid(Integer messageid) {
        this.messageid = messageid;
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

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    public message() {
    }
}
