/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author User
 */
public class AdmininvestmentDetails {
 
    String walletno,email,refid,date,status,type;
 int month,days,years;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
 double monthlyinvest,yearlyreturn,capitalinvest,monthlyreturn;

    public String getWalletno() {
        return walletno;
    }

    public void setWalletno(String walletno) {
        this.walletno = walletno;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRefid() {
        return refid;
    }

    public void setRefid(String refid) {
        this.refid = refid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public int getYears() {
        return years;
    }

    public void setYears(int years) {
        this.years = years;
    }

    public double getMonthlyinvest() {
        return monthlyinvest;
    }

    public void setMonthlyinvest(double monthlyinvest) {
        this.monthlyinvest = monthlyinvest;
    }

    public double getYearlyreturn() {
        return yearlyreturn;
    }

    public void setYearlyreturn(double yearlyreturn) {
        this.yearlyreturn = yearlyreturn;
    }

    public double getCapitalinvest() {
        return capitalinvest;
    }

    public void setCapitalinvest(double capitalinvest) {
        this.capitalinvest = capitalinvest;
    }

    public double getMonthlyreturn() {
        return monthlyreturn;
    }

    public void setMonthlyreturn(double monthlyreturn) {
        this.monthlyreturn = monthlyreturn;
    }
 
}
