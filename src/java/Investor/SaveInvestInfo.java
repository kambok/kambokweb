package Investor;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Ads;

public class SaveInvestInfo extends HttpServlet {

    protected void service(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String adsId = (String)session.getAttribute("adsId");
            
            Ads ads = data.Database.GetLoanAdsViaId(adsId);
            if((!ads.equals(null) || !ads.equals("null")) && ads.getAdsID().equals(adsId)){
                response.sendRedirect("Invest.jsp");
            }else{
                out.println("Invalid Transaction ID");
            }
        }
    }
}
