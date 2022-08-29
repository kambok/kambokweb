
package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.PaymentCodegenerator;
import model.Wallet;


public class DebitClient extends HttpServlet {

   
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession hp=request.getSession();
          String id=request.getParameter("id");
         String email=request.getParameter("email");
         String amount=request.getParameter("amount");
         String sender=request.getParameter("sender");
          LocalDate date = LocalDate.now();
          String mydate=String.valueOf(date);
            Wallet w=new Wallet();
            if(id.contains("@")){
           
            w.setAccount(email);
            w.setEmail(id);
            w.setCredit(Double.parseDouble(amount));
            w.setTotal(Double.parseDouble(amount));
            w.setPin(PaymentCodegenerator.generateRegno());
            w.setDate(mydate);
            w.setSender(sender);
            w.setStatus("cr");  
            }else{
          
            w.setAccount(id);
            w.setEmail(email);
            w.setCredit(Double.parseDouble(amount));
            w.setTotal(Double.parseDouble(amount));
            w.setPin(PaymentCodegenerator.generateRegno());
            w.setDate(mydate);
            w.setSender(sender);
            w.setStatus("cr");
            }
            
            java.util.Date daten = new java.util.Date();  
               hp.setAttribute("time", String.valueOf(date)); 
            if(data.Database.debitclient(w,hp)==2){
                out.println("<big>succesful</big><br />");
                out.println("<a href='Receipt.jsp?pin="+hp.getAttribute("pin")+"'>Print Receipt</a>");
            }else{
                out.println("something wentwrong");
            }
            
        }
    }

   
}
