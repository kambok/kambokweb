package model;

public class LoanAgr {
    private String email, trid, uploadBy, date, time;
    private byte loanAgreement;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTrid() {
        return trid;
    }

    public void setTrid(String trid) {
        this.trid = trid;
    }

    public String getUploadBy() {
        return uploadBy;
    }

    public void setUploadBy(String uploadBy) {
        this.uploadBy = uploadBy;
    }

    public byte getLoanAgreement() {
        return loanAgreement;
    }

    public void setLoanAgreement(byte loanAgreement) {
        this.loanAgreement = loanAgreement;
    }
}
