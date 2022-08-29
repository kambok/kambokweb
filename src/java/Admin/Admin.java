
package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AdminUser;
import model.Admindetails;
import model.DataSupply;
import model.LoanDetailSupply;
import model.Logindetails;
import model.Users;


@WebServlet(name = "Admin", urlPatterns = {"/Admin"})
public class Admin extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         String username=request.getParameter("username");
         String password=request.getParameter("pass");
           
            Logindetails ln=new Logindetails();
            ln.setPassword(password);
            ln.setUsername(username);
            Logindetails ld= data.Database.validatePosition(ln);
            ln.setPosition(ld.getPosition());
            if(data.Database.validate(ln) && ln.getPosition().equals("Admin")){
                List<Admindetails>us=data.Database.getadmininfo(username);
                HttpSession hs=request.getSession();
                hs.setAttribute("admin", us);
                response.sendRedirect("Adminhome.jsp");
            //out.println("success");
            
            }else if(data.Database.validate(ln) && ln.getPosition().equals("Client")){
                DataSupply us=data.Database.getuserinfo(username);
                HttpSession hs=request.getSession();
                hs.setAttribute("user", us);
                response.sendRedirect("dashboard.jsp");
            
            }else if(data.Database.validate(ln) && ln.getPosition().equals("regular")){
              response.sendRedirect("regulardashboard.html");
            }else if(data.Database.validate(ln) && ln.getPosition().equals("Inspector")){
                AdminUser us = data.Database.getstaffinfo(username);
                HttpSession hs=request.getSession();
                hs.setAttribute("staff", us);
                response.sendRedirect("inspectionDashboard.jsp");          
            
            }else if(data.Database.validate(ln) && ln.getPosition().equals("Customer Care")){
                DataSupply us=data.Database.getuserinfo(username);
                HttpSession hs=request.getSession();
                hs.setAttribute("user", us);
                AdminUser staff = data.Database.getstaffinfo(username);
                HttpSession hs2=request.getSession();
                hs2.setAttribute("staff", staff);
             response.sendRedirect("ccReagisterUser.jsp");          
            
            }else if(data.Database.validate(ln) && ln.getPosition().equals("Finance")){
                AdminUser us = data.Database.getstaffinfo(username);
                HttpSession hs=request.getSession();
                hs.setAttribute("staff", us);
                response.sendRedirect("Paymentdept.jsp");          
            
            }else if(data.Database.validate(ln) && ln.getPosition().equals("Investor")){
                AdminUser us = data.Database.getstaffinfo(username);
                HttpSession hs=request.getSession();
                hs.setAttribute("staff", us);
                response.sendRedirect("investordashboard.jsp");       
            }else{
           
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.include(request, response);
                out.println("<body><style>b{color:red;}</style></body>"); 
            out.println("<body><script type='text/javascript'>document.getElementById('report').innerHTML='username or password is incorrect';</script></body>");
          
            }
        }
    }

   
}
