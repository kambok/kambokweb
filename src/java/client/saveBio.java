
package client;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Address;
import model.DataSupply;


public class saveBio extends HttpServlet {

  
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        String email=request.getParameter("email");
        String purpose=request.getParameter("purpose");
        String occupation=request.getParameter("occupation");
        String state=request.getParameter("state");
        String address=request.getParameter("address");
        String gender=request.getParameter("gender");
        String phone=request.getParameter("phone");
        
        Address ad=new Address();
        ad.setAdress(address);
        ad.setPurpose(purpose);
        ad.setOccupation(occupation);
        ad.setPhone(phone);
        ad.setState(state);
        ad.setEmail(email);
        ad.setGender(gender);
        if(data.Database.savaAddress(ad)>0){
                DataSupply us=data.Database.getuserinfo(email);
                HttpSession hs=request.getSession();
                hs.setAttribute("user", us);
            out.println("saved");
            
        }else{
         out.println("something wentwrong");   
        }
        }
    }

   
}
