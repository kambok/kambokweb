
package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Payment;


public class PaymentAdminSearch extends HttpServlet {
     int count=0;
  
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            String pin =request.getParameter("pin");
            
              List<Payment> admin=data.Database.admincheckpayment(pin);
              if(!admin.isEmpty()){
              for(Payment p:admin){
                if(p.getStatus().equals("Pending") && p.getPin().equals(pin)){
                out.println("<tr class='text-dark ustify-content-between'><td>"+p.getTotal()+"</td><td>"+p.getDeposit()+"</td><td>"+p.getBalance()+"</td><td>"+p.getStatus()+"</td><td>"+p.getDate()+"</td><td>"+p.getPin()+"</td><td><button type='button' class='btn btn-success' onclick='sendInfo2();'>Activiate</button></td><td><button type='button' class='btn btn-danger'>Deactiviate</button></td><td><form action='Edittransaction.jsp'><input type='hidden' name='edit' value='"+p.getPin()+"'><button type='submit' class='btn btn-danger'>Edit</button></form></td></tr>");
                out.println("<form class='row g-' name='myform'>");
                out.println("<form>");
                //break;
                }else if(p.getStatus().equals("Pending") && p.getEmail().equals(pin)){
                out.println("<tr class='text-dark ustify-content-between'><td>"+p.getTotal()+"</td><td>"+p.getDeposit()+"</td><td>"+p.getBalance()+"</td><td>"+p.getStatus()+"</td><td>"+p.getDate()+"</td><td>"+p.getPin()+"</td><td><button type='button' class='btn btn-success' onclick='sendInfo2();'>Activiate</button></td><td><button type='button' class='btn btn-danger'>Deactiviate</button></td><td><form action='Edittransaction.jsp'><input type='hidden' name='edit' value='"+p.getEmail()+"'><button type='submit' class='btn btn-danger'>Edit</button></form></td></tr>");
               //break;
                }else if(!p.getStatus().equals("Pending") && (!p.getEmail().equals(pin)|| !p.getPin().equals(pin)) ){
                  if(count==0){
                       out.println("No pending transaction");
                       count++;
                   
                   }else{
                   
                   }
                }
              }  
        }else{
             out.println("invalid code or email");     
              }
        }
    }

    

}
