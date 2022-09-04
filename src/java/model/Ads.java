package model;

public class Ads {
    String  date, adsID, adsPackage, adsStatus;
private double investBalance,adsAmount;

    public double getInvestBalance() {
        return investBalance;
    }

    public void setInvestBalance(double investBalance) {
        this.investBalance = investBalance;
    }

    public double getAdsAmount() {
        return adsAmount;
    }

    public void setAdsAmount(double adsAmount) {
        this.adsAmount = adsAmount;
    }
 

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAdsID() {
        return adsID;
    }

    public void setAdsID(String adsID) {
        this.adsID = adsID;
    }

    public String getAdsPackage() {
        return adsPackage;
    }

    public void setAdsPackage(String adsPackage) {
        this.adsPackage = adsPackage;
    }

    public String getAdsStatus() {
        return adsStatus;
    }

    public void setAdsStatus(String adsStatus) {
        this.adsStatus = adsStatus;
    }
    
}
