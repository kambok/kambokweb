
package model;


public class Finance {
    private String pmtmethd,pmtpurpose,ptmid,date,time,sendername,sendemail,trid,agentid,agentname,receivedsection,pmtpin,status;
    

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPmtpin() {
        return pmtpin;
    }

    public void setPmtpin(String pmtpin) {
        this.pmtpin = pmtpin;
    }
    private float deposit,balance,total,bonus;

    public String getPmtmethd() {
        return pmtmethd;
    }

    public void setPmtmethd(String pmtmethd) {
        this.pmtmethd = pmtmethd;
    }

    public String getPmtpurpose() {
        return pmtpurpose;
    }

    public void setPmtpurpose(String pmtpurpose) {
        this.pmtpurpose = pmtpurpose;
    }

    public String getPtmid() {
        return ptmid;
    }

    public void setPtmid(String ptmid) {
        this.ptmid = ptmid;
    }

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

    public String getSendername() {
        return sendername;
    }

    public void setSendername(String sendername) {
        this.sendername = sendername;
    }

    public String getSendemail() {
        return sendemail;
    }

    public void setSendemail(String sendemail) {
        this.sendemail = sendemail;
    }

    public String getTrid() {
        return trid;
    }

    public void setTrid(String trid) {
        this.trid = trid;
    }

    public String getAgentid() {
        return agentid;
    }

    public void setAgentid(String agentid) {
        this.agentid = agentid;
    }

    public String getAgentname() {
        return agentname;
    }

    public void setAgentname(String agentname) {
        this.agentname = agentname;
    }

    public String getReceivedsection() {
        return receivedsection;
    }

    public void setReceivedsection(String receivedsection) {
        this.receivedsection = receivedsection;
    }

    public float getDeposit() {
        return deposit;
    }

    public void setDeposit(float deposit) {
        this.deposit = deposit;
    }

    public float getBalance() {
        return balance;
    }

    public void setBalance(float balance) {
        this.balance = balance;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public float getBonus() {
        return bonus;
    }

    public void setBonus(float bonus) {
        this.bonus = bonus;
    }
    
}
