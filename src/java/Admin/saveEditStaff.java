
package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AdminUser;


public class saveEditStaff extends HttpServlet {

 
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String phone = request.getParameter("phone");
            String position= request.getParameter("position");
            String email= request.getParameter("email");
 
            AdminUser ad = new AdminUser();
            ad.setPosition(position);
            ad.setPhone(phone);
            ad.setEmail(email);
            
            if(data.Database.editStaff(ad)==3){ 
            RequestDispatcher rd=request.getRequestDispatcher("staffmanagement.jsp");
                rd.include(request, response);    
                out.println("<script type='text/javascript'>alert('Record updated successfully')</script>");
           }else{
                RequestDispatcher rd=request.getRequestDispatcher("staffmanagement.jsp");
                rd.include(request, response);    
                out.println("<script type='text/javascript'>alert('Something went wrong')</script>");
           }
        }
    }
}
