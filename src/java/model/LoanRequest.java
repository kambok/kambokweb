
package model;


public class LoanRequest {
 private String colname,colid,condition,trid,time,date,status,email;
 private byte imageback,imagefront;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getColname() {
        return colname;
    }

    public void setColname(String colname) {
        this.colname = colname;
    }

    public String getColid() {
        return colid;
    }

    public void setColid(String colid) {
        this.colid = colid;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getTrid() {
        return trid;
    }

    public void setTrid(String trid) {
        this.trid = trid;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public byte getImageback() {
        return imageback;
    }

    public void setImageback(byte imageback) {
        this.imageback = imageback;
    }

    public byte getImagefront() {
        return imagefront;
    }

    public void setImagefront(byte imagefront) {
        this.imagefront = imagefront;
    }
 
 
 
}
