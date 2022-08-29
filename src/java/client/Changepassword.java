
package client;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Users;


@WebServlet(name = "Changepassword", urlPatterns = {"/Changepassword"})
public class Changepassword extends HttpServlet {

   
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String newPassword = request.getParameter("password");
        String email= request.getParameter("email");
        
        Users us = new Users();
        
        us.setPassword(newPassword);
        us.setEmail(email);
        
        if(data.Database.savePasswordChange(us)==2){
            response.sendRedirect("index.jsp");
        }else{
            out.print("Something went wrong");
        }
       
    }

}
