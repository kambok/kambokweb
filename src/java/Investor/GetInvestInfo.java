package Investor;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GetInvestInfo extends HttpServlet {

    protected void service(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String adsId = request.getParameter("adsId");

           HttpSession session = request.getSession();
           session.setAttribute("adsId", adsId);
           request.getRequestDispatcher("SaveInvestInfo").forward(request, response);
        }
    }
}
