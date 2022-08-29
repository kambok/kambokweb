
package model;

import java.util.List;


public class History {
  
    private String email,trid;
    private List<LoanDetails> loandetails;
    List<LoanRequest>loanRequests;
    List<ApproveRequest>approveRequests;

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

    public List<LoanDetails> getLoandetails() {
        return loandetails;
    }

    public void setLoandetails(List<LoanDetails> loandetails) {
        this.loandetails = loandetails;
    }

    public List<LoanRequest> getLoanRequests() {
        return loanRequests;
    }

    public void setLoanRequests(List<LoanRequest> loanRequests) {
        this.loanRequests = loanRequests;
    }

    public List<ApproveRequest> getApproveRequests() {
        return approveRequests;
    }

    public void setApproveRequests(List<ApproveRequest> approveRequests) {
        this.approveRequests = approveRequests;
    }
    
    
}
