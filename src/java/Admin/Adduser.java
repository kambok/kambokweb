
package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AdminUser;
import model.InvestorDetails;


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
            
            if(ad.getPosition().equals("Investor")){
                InvestorDetails id = new InvestorDetails();
                id.setEmail(email);
                id.setWalletId(WalletID.referenceCode());
                id.setTranspin("pin");
                if(data.Database.Investor(id)==1 && data.Database.saveAdminuser(ad)==4){
                    RequestDispatcher rd=request.getRequestDispatcher("staffmanagement.jsp");
                    rd.include(request, response);
                    out.println("<head><style>b{color:green;}</style></head>");    
                    out.println("<script type='text/javascript'>document.getElementById('addReport').innerHTML = 'Record saved successfully';</script>");
                }else{
                    RequestDispatcher rd=request.getRequestDispatcher("staffmanagement.jsp");
                    rd.include(request, response);  
                    out.println("<head><style>b{color:red;}</style></head>");    
                    out.println("<script type='text/javascript'>document.getElementById('addReport').innerHTML = 'Something went wrong!';</script>");
                }
            }else{
               if(data.Database.saveAdminuser(ad)==4){
                    RequestDispatcher rd=request.getRequestDispatcher("staffmanagement.jsp");
                    rd.include(request, response);
                    out.println("<head><style>b{color:green;}</style></head>");    
                    out.println("<script type='text/javascript'>document.getElementById('addReport').innerHTML = 'Record saved successfully';</script>");
                }else{
                    RequestDispatcher rd=request.getRequestDispatcher("staffmanagement.jsp");
                    rd.include(request, response);  
                    out.println("<head><style>b{color:red;}</style></head>");    
                    out.println("<script type='text/javascript'>document.getElementById('addReport').innerHTML = 'Something went wrong!';</script>");
                    } 
            }
        }
    }
}
