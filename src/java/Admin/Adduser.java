
package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AdminUser;
import model.Admindetails;


public class Adduser extends HttpServlet {

  
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            String fname = request.getParameter("firstn");
            String lname = request.getParameter("lastn");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String password = request.getParameter("pass");
            String position= request.getParameter("position");
            
            AdminUser ad = new AdminUser();
            ad.setFirstname(fname);
            ad.setLastname(lname);
            ad.setPassword(password);
            ad.setPosition(position);
            ad.setEmail(email);
            ad.setPhone(phone);

            if(data.Database.saveAdminuser(ad)==4){
                out.println("<head><style>b{color:green;}</style></head>");    
                out.println("<script type='text/javascript'>document.getElementById('report').innerHTML = 'Record saved successfully';</script>");
                RequestDispatcher rd=request.getRequestDispatcher("register.html");
                rd.include(request, response);
            }else{
                out.println("<head><style>b{color:red;}</style></head>");    
                out.println("<script type='text/javascript'>document.getElementById('report').innerHTML = 'Something went wrong!';</script>");
                RequestDispatcher rd=request.getRequestDispatcher("register.html");
                rd.include(request, response);  
                }
        }

    }
}
