
package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Paymentreceipt extends HttpServlet {

   
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          String trid=request.getParameter("pin");
          
          
            HttpSession hs=request.getSession();
            hs.setAttribute("pin", trid);
          
             java.util.Date date = new java.util.Date();  
                HttpSession sh=request.getSession();
                
                sh.setAttribute("time", String.valueOf(date));
            response.sendRedirect("Result.jsp");
        }
    }

}
