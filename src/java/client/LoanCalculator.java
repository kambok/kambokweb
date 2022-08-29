
package client;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.LoanInterestCalculator;


public class LoanCalculator extends HttpServlet {

  
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        String amount=request.getParameter("amount");
        String days=request.getParameter("duration");
        String app=request.getParameter("appamount");
          double amot=Double.parseDouble(amount);
          double appamot=Double.parseDouble(app);
          int da=Integer.parseInt(days);
          int interest= (int)LoanInterestCalculator.loanInterest(amot, da);
          
          if(da<0 || da>30 ){
           out.print("change date");
            interest=0;
         
          }else{
             
          String inter=String.valueOf(interest);
          
          out.println(inter);
            
           }
              
          
          }
        }
    }

    
  

