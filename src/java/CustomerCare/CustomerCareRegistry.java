package CustomerCare;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;
import model.CustomerRegister;
import model.DataSupply;

public class CustomerCareRegistry extends HttpServlet {

    protected void service(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String firstname=request.getParameter("firstn");
            String lastname=request.getParameter("lastn");
            String phone=request.getParameter("phone");
            String password=request.getParameter("pass");
            String email=request.getParameter("email");
            String registeredBy=request.getParameter("registeredBy");
                                     
            CustomerRegister cr = new CustomerRegister();
            cr.setFirstname(firstname);
            cr.setLastname(lastname);
            cr.setPassword(password);
            cr.setPhone(phone);
            cr.setPosition("Client");
            cr.setEmail(email);
            cr.setRegisteredBy(registeredBy);
            ArrayList<CustomerRegister> rs=new ArrayList<>();
            rs.add(cr);
            if(data.Database.ccRegister(cr)==4){
                HttpSession se=request.getSession();
                DataSupply ds = (DataSupply)data.Database.getuserinfo(email);
                se.setAttribute("user", ds);
             response.sendRedirect("dashboard.jsp");
            }else{
                RequestDispatcher rd=request.getRequestDispatcher("ccReagisterUser.jsp");
                rd.include(request, response);
            }
        }
    }
}
