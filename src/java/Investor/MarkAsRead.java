package Investor;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MarkAsRead extends HttpServlet {

    protected void service(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String mar = request.getParameter("mar");
            out.println(mar);
//           if (!mar.isEmpty()){
//            RequestDispatcher rd=request.getRequestDispatcher("investordashboard.jsp");
//                    rd.include(request, response);      
//                    out.println("<head><script type='text/javascript'>alert("+mar+")</script></head>");
//           }
                
        }
            
    }
}
