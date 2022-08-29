
package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PaymentCodegenerator;
import model.Wallet;


public class CreditAccount extends HttpServlet {

  
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         String id=request.getParameter("id");
         String email=request.getParameter("email");
         String amount=request.getParameter("amount");
         String sender=request.getParameter("sender");
          LocalDate date = LocalDate.now();
          String mydate=String.valueOf(date);
            Wallet w=new Wallet();
            w.setAccount(id);
            w.setEmail(email);
            w.setCredit(Double.parseDouble(amount));
            w.setTotal(Double.parseDouble(amount));
            w.setPin(PaymentCodegenerator.generateRegno());
            w.setDate(mydate);
            w.setSender(sender);
            w.setStatus("cr");
            model.AdminInvestment ad=new model.AdminInvestment();
             ad.setEmail(email);
             ad.setCapitalinvest(Double.parseDouble(amount));
         int i=data.Database.updatewallet(w);
            data.Database.setadminCapital(ad);
            if(i==1){
           out.println("Successful");
            }else{
                out.println("something wentwrong");
            }
        
            
        }
    }

   

}
