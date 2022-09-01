package Investor;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;

public class InvestorInterestReturn extends HttpServlet {

    static int duration = 0;
    static String investId, walletId, interestDate, investDate, status;
    static double interest, amount, totalAmount, walletBal, credit, returnAmount;
    static int cd, cm, cy, lm, investMonth, investDay, investYear, interestDay, interestMonth, interestYear, modDate, newDay;

    protected void service(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            LocalDate date = LocalDate.now();
            cd = date.getDayOfMonth();
            cm = date.getMonthValue();
            cy = date.getYear();
            lm = date.lengthOfMonth();
            List<InvestorDetails> invest = data.Database.getInvestmentId(email);
            for(InvestorDetails id: invest){
                investId = id.getInvestmentID();
                List<InvestorDetails> investRecord = data.Database.getInvestmentRecord(investId);
                for(InvestorDetails ir: investRecord){
                    amount = ir.getInvestmentHistory();
                    interest = ir.getInterest();
                    investDay = ir.getDays();
                    investMonth = ir.getMonth();
                    investYear = ir.getYear();
                    walletId = ir.getWalletId();
                    investDate = ir.getDate();
                    walletBal = ir.getWalletBalance();
                    status = ir.getStatus();
                    newDay = investDay + duration;
                    if(!status.equals("Liquidated")){
                        if(newDay > lm && investYear == cy){
                            modDate = newDay - lm;
                            interestMonth = investMonth + 1;
                            interestYear = investYear;
                            interestDay = modDate;
                            interestDate = interestDay + "/" + interestMonth + "/" + interestYear;

                        }else if(newDay > lm && cy > investYear){
                            modDate = interestDay - lm;
                            interestMonth = investMonth + 1;
                            interestYear = investYear + 1;
                            interestDay = modDate;
                            interestDate = interestDay + "/" + interestMonth + "/" + interestYear;
                        }else if(newDay == lm){
                            interestMonth = investMonth;
                            interestYear = investYear;
                            interestDay = newDay;
                            interestDate = interestDay + "/" + interestMonth + "/" + interestYear;
                        }else{
                            interestMonth = investMonth;
                            interestYear = investYear;
                            interestDay = newDay;
                            interestDate = interestDay + "/" + interestMonth + "/" + interestYear;
                        }
                        
                        if((interestDay == cd && interestMonth == cm) && interestYear == cy){
                        totalAmount = interest + amount;
                        returnAmount = walletBal + totalAmount;
                        credit+=totalAmount;
                        InvestorDetails investorDetails = new InvestorDetails();
                        investorDetails.setInvestmentHistory(amount);
                        investorDetails.setInterest(interest);
                        investorDetails.setTotalAmount(totalAmount);
                        investorDetails.setReturnDate(interestDate);
                        investorDetails.setDate(investDate);
                        investorDetails.setWalletId(walletId);
                        investorDetails.setWalletBalance(returnAmount);
                        investorDetails.setEmail(email);
                        investorDetails.setCredit(credit); 
                        investorDetails.setInvestmentID(investId);
                        investorDetails.setStatus("Liquidated");
                        
                        if(data.Database.InvestmentReturn(investorDetails)==4){
                            out.println("Successfully returned investment");
                        }else{
                            out.println("Something went wrong!");
                        }
                    }
                    }
                    break;
                }
//                break;
//                out.println(walletBal);
            }
             
        }
    }
}
