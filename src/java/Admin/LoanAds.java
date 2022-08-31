package Admin;      

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Ads;

public class LoanAds extends HttpServlet {

    protected void service(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String amount = request.getParameter("adsAmount");
            String date = request.getParameter("date");
            String adsStatus = request.getParameter("adsStatus");
            double amt = Double.parseDouble(amount);
            Ads ads = new Ads();
            ads.setAdsAmount(amt);
            ads.setInvestBalance(amt);
            ads.setAdsID(GenerateAdsId.generateAdsId());
            ads.setDate(date);
            ads.setAdsStatus(adsStatus);
            
            if (amt <= 100000){
                ads.setAdsPackage("Bronze");
            }else if (amt > 100000 && amt <= 500000){
                ads.setAdsPackage("Gold");
            }else if (amt > 500000 && amt <= 1000000){
                ads.setAdsPackage("Platinum");
            }
            
            if (data.Database.LoanAds(ads) == 1){
                request.getRequestDispatcher("Advertisement.jsp").include(request, response);
                out.println("<script type='text/javascript'>document.getElementById('report').innerHTML = 'Ads has been posted successfully!';</script>");
            }else{
                request.getRequestDispatcher("Advertisement.jsp").include(request, response);
                out.println("<script type='text/javascript'>document.getElementById('report').innerHTML = 'Something went wrong!';</script>");
            }
        }
    }
}
