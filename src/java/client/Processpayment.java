
package client;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DataSupply;
import model.Payment;
import model.PaymentCodegenerator;


public class Processpayment extends HttpServlet {

   
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String email=request.getParameter("email");
            String trid=request.getParameter("trid");
            String deposit=request.getParameter("deposit");
            String balance=request.getParameter("balance");
            String total=request.getParameter("total");
            
            List<Payment> cp=data.Database.checkpayment("Pending");
              if(!cp.isEmpty()){
             for(Payment c:cp){
             if(c.getTrid().equals(trid)){
              out.println(c.getPin());
        
            }else{
          Payment pt=new Payment();
            pt.setBalance(Double.parseDouble(balance));
            pt.setDeposit(Double.parseDouble(deposit));
            pt.setTotal(Double.parseDouble(total));
            pt.setTrid(trid);
            pt.setEmail(email);
            pt.setStatus("Pending");
            LocalDate date = LocalDate.now();
         String mydate=String.valueOf(date);
         pt.setDate(mydate);
         String pin=PaymentCodegenerator.generateRegno();
         pt.setPin(pin);
            if(pt.getDeposit()>0.0 && pt.getTotal()!=0){
          if(data.Database.savaPaymentRequest(pt)==1){
               DataSupply us=data.Database.getuserinfo(email);
                HttpSession hs=request.getSession(false);
                hs.setAttribute("user", us);
                out.println(pin);
              
          }else{
              out.println("something went wrong");
          }
            
            
            }else{
            out.println("something went wrong");
            }           
             
             }
             }
              }else{
            Payment pt=new Payment();
            pt.setBalance(Double.parseDouble(balance));
            pt.setDeposit(Double.parseDouble(deposit));
            pt.setTotal(Double.parseDouble(total));
            pt.setTrid(trid);
            pt.setEmail(email);
            pt.setStatus("Pending");
            LocalDate date = LocalDate.now();
         String mydate=String.valueOf(date);
         pt.setDate(mydate);
         String pin=PaymentCodegenerator.generateRegno();
         pt.setPin(pin);
            if(pt.getDeposit()>0.0 && pt.getTotal()!=0){
          if(data.Database.savaPaymentRequest(pt)==1){
               DataSupply us=data.Database.getuserinfo(email);
               HttpSession hs=request.getSession(false);
                hs.setAttribute("user", us);
                out.println(pin);
              
          }else{
              out.println("something went wrong");
          }
            
            
            }else{
            out.println("something went wrong");
            }            
            }
}
}
}