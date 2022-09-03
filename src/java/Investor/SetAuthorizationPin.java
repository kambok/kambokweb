
package Investor;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.InvestorDetails;


public class SetAuthorizationPin extends HttpServlet {


    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String tpin = request.getParameter("tpin");
           String email = request.getParameter("email");
           
           InvestorDetails id = new InvestorDetails();
           id.setEmail(email);
           id.setTranspin(tpin);
           
           if(data.Database.saveInvestorTpin(id)==1){
               out.println("<script>alert('succesfully set authorization pin')</script>");
               request.getRequestDispatcher("investor-tpin.jsp").include(request, response);
           }else{
               out.println("<script>alert('Something went wrong!')</script>");
               response.sendRedirect("investor-tpin.jsp");
           }
        }
    }


}
