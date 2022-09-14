package Investor;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Ads;
import model.InvestorDetails;
import model.Wallet;

public class LoanInvest extends HttpServlet {

    protected void service(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            String investBalance = request.getParameter("investBal");
            String adsId = request.getParameter("adsId");
            String walletBalance = request.getParameter("walletBal");
            String walletId = request.getParameter("walletId");
            String investAmount = request.getParameter("investAmount2");
            String investID = InvestmentIDGenerator.investmentID();

            HttpSession session = request.getSession();
            session.setAttribute("investID", investID);

            double investAmt = Double.parseDouble(investAmount);
            double investBal = Double.parseDouble(investBalance);
            double walletBal = Double.parseDouble(walletBalance);

            LocalDate date = LocalDate.now();
            int month = date.getMonthValue();
            int day = date.getDayOfMonth();
            int year = date.getYear();

            Ads ads = new Ads();
            if (investAmt != investBal) {
                investBal -= investAmt;
                walletBal -= investAmt;
                ads.setAdsStatus("Pending");
                if (investBal <= 100000) {
                    ads.setAdsPackage("Bronze");
                } else if (investBal > 100000 && investBal <= 500000) {
                    ads.setAdsPackage("Gold");
                } else if (investBal > 500000 && investBal <= 1000000) {
                    ads.setAdsPackage("Platinum");
                }
            } else {
                walletBal -= investAmt;
                investBal -= investAmt;
                ads.setAdsStatus("Invested");
                if (investBal <= 100000) {
                    ads.setAdsPackage("Bronze");
                } else if (investBal > 100000 && investBal <= 500000) {
                    ads.setAdsPackage("Gold");
                } else if (investBal > 500000 && investBal <= 1000000) {
                    ads.setAdsPackage("Platinum");
                }
            }

            ads.setAdsID(adsId);
            ads.setInvestBalance(investBal);

            Wallet wallet = new Wallet();
            wallet.setSender(walletId);
            wallet.setAcctno(walletId);
            wallet.setEmail(email);
            wallet.setCredit(0);
            wallet.setDebit(investAmt);
            wallet.setTotal(walletBal);
            wallet.setDate("" + day + "/" + month + "/" + year + "");
            wallet.setStatus("Invested");

            InvestorDetails id = new InvestorDetails();
            id.setDebit(investAmt);
            id.setCredit(0.0);
            id.setInvestmentHistory(investAmt);
            id.setEmail(email);
            id.setWalletBalance(walletBal);
            id.setWalletId(walletId);
            id.setDate("" + day + "/" + month + "/" + year + "");
            id.setDays(day);
            id.setMonth(month);
            id.setYear(year);
            id.setInterest((investAmt / 100) * 10);
            id.setInvestmentID(investID);
            id.setStatus("In Progress");
 
            if(data.Database.LoanInvest(id, ads, wallet) == 4){
                request.getRequestDispatcher("investment-news-feed.jsp").include(
                        request, response);
//                response.sendRedirect("investment-news-feed.jsp");
                        out.println("<script type='text/javascript'>");
                            out.println("var alertmsg = document.querySelector('.alert')");
                            out.println("document.getElementById('investedAmt').innerHTML = "+investAmt+"");
                            out.println("alertmsg.classList.remove('d-none')");
                        out.println("</script>");
                    
            }else{
                request.getRequestDispatcher("Invest.jsp").include(
                        request, response);
                out.println(
                        "<head><script>document.getElementById('report2').innerHTML = 'Something went wrong!'</script></head>");
            }
        }
    }
}