
package client;

import data.Database;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DataSupply;
import model.Users;


public class Register extends HttpServlet {

  
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         String firstname=request.getParameter("firstn");
          String lastname=request.getParameter("lastn");
                   String phone=request.getParameter("phone");
                            String password=request.getParameter("pass");
                                     String email=request.getParameter("email");
                                     
            Users us=new Users();
            us.setFirstname(firstname);
            us.setLastname(lastname);
            us.setPassword(password);
            us.setPhone(phone);
            us.setPosition("Client");
            us.setEmail(email);
            ArrayList<Users> rs=new ArrayList<>();
            rs.add(us);
            if(data.Database.clientusers(us)==3){
                DataSupply user=data.Database.getuserinfo(email);
                HttpSession hs=request.getSession();
                hs.setAttribute("user", user);
                response.sendRedirect("dashboard.jsp");
            }else{
                RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
                rd.include(request, response);
            }
            
            
        }
    }

   
}
