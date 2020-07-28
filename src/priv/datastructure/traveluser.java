package priv.datastructure;

import tools.DAO;

import java.sql.Date;
import java.sql.Timestamp;

public class traveluser {
    public traveluser(){

    }

    public int getUID() {
        return UID;
    }

    public void setUID(int UID) {
        this.UID = UID;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getPass() {
        return Pass;
    }

    public void setPass(String pass) {
        Pass = pass;
    }

    public int getState() {
        return State;
    }

    public void setState(int state) {
        State = state;
    }

    public Timestamp getDateJoined() {
        return (Timestamp) DateJoined;
    }

    public void setDateJoined(Timestamp dateJoined) {
        DateJoined = dateJoined;
    }

    public Timestamp getDateLastModified() {
        return (Timestamp) DateLastModified;
    }

    public void setDateLastModified(Timestamp dateLastModified) {
        DateLastModified = dateLastModified;
    }

    private Integer UID=null;
    private String Email=null;
    private String UserName=null;
    private String Pass=null;
    private Integer State=null;
    private Timestamp DateJoined=null;
    private Timestamp DateLastModified=null;
    private boolean whetherseen =false;

    public traveluser(Integer UID, String email, String userName, String pass, Integer state, Timestamp dateJoined, Timestamp dateLastModified, boolean whetherseen) {
        this.UID = UID;
        Email = email;
        UserName = userName;
        Pass = pass;
        State = state;
        DateJoined = dateJoined;
        DateLastModified = dateLastModified;
        this.whetherseen = whetherseen;
    }

    @Override
    public String toString() {
        return "traveluser{" +
                "UID=" + UID +
                ", Email='" + Email + '\'' +
                ", UserName='" + UserName + '\'' +
                ", Pass='" + Pass + '\'' +
                ", State=" + State +
                ", DateJoined=" + DateJoined +
                ", DateLastModified=" + DateLastModified +
                ", whetherseen=" + whetherseen +
                '}';
    }

    public boolean getWhetherseen() {
        return whetherseen;
    }

    public void setWhetherseen(boolean whetherseen) {
        this.whetherseen = whetherseen;
    }
}
