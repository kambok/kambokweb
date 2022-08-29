
package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Payment;


public class saveEdit extends HttpServlet {

   
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String pin=request.getParameter("pin");
           String deposit=request.getParameter("deposite");
           String balance=request.getParameter("balance");
           String total=request.getParameter("total");
           
            Payment pt=new Payment();
            pt.setPin(pin);
            pt.setDeposit(Double.parseDouble(deposit));
            pt.setTotal(Double.parseDouble(total));
            pt.setBalance(Double.parseDouble(balance));
            if(data.Database.saveEditedpayment(pt).equals("done")){
               out.println("Editted/saved"); 
            }else{
                 out.println("somehting went wrong");
            }
            
           
        }
    }

    

}
