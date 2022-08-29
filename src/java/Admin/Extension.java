
package Admin;

import client.LoanCalculator;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ExtensionDetails;
import model.LoanDetails;
import model.LoanInterestCalculator;
import model.Payment;
import model.PaymentCodegenerator;


public class Extension extends HttpServlet {
  static int dep=0,bal=0;String mydate="";static int ct=0;
   static String addzero(int date){
   if(date<10){
       return "0"+date;
   }
   return ""+date;
   }
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          String trid=request.getParameter("t");
          String day=request.getParameter("d");
          String month=request.getParameter("m");
          String year=request.getParameter("y");
          int y=Integer.parseInt(year);
          int m=Integer.parseInt(month);
          int d=Integer.parseInt(day);
          if(!trid.isEmpty()){
            LoanDetails ld=data.Database.extension(trid);
            List<Payment> pmt=data.Database.extpayment(trid);
            LocalDate date = LocalDate.now();
            int cm=date.getMonthValue();
            int cd=date.getDayOfMonth();
            int cy=date.getYear();
            int lm=date.lengthOfMonth();
          
            if(y==cy && cm==m){
            int du=Integer.parseInt(ld.getDuration());
            int amt=Integer.parseInt(ld.getLoanamount());
            int intr=Integer.parseInt(ld.getInterest());
            int days=cd-d -du;
           
            int newamount=amt+intr;
            int newrepaydate=cd+du;
            if(newrepaydate>lm && y==cy){
            int df=newrepaydate-lm;
            int nextmonth=date.getMonthValue()+1;
             String cdd=addzero(df);
            String cmm=addzero(nextmonth);
            String cyy=String.valueOf(cy);
             mydate=cyy+"-"+cmm+"-"+cdd;
             
            }else if(lm>newrepaydate && y==cy){
           
            String cdd=addzero(newrepaydate);
            String cmm=addzero(cm);
            String cyy=String.valueOf(cy);
             mydate=cyy+"-"+cmm+"-"+cdd;   
            }
            if(!pmt.isEmpty()){
              out.println("not empty");
              for(Payment p:pmt){
              dep+=(int)p.getDeposit();
               }
              double ramt=(double)newamount-dep;
              LoanInterestCalculator.loanInterest(ramt, days);
              ///out.println("calculated");
              }else{
                dep=0;
              double ans=LoanInterestCalculator.extinterest((double)newamount,days);
              LoanDetails loan=new LoanDetails();
                      HttpSession hs=request.getSession();
                      hs.setAttribute("loandate", ld.getLoandate());
                     
                      loan.setDuration(String.valueOf(days));
                      loan.setTrid(trid);
                      loan.setLoanamount(String.valueOf(newamount));
                      loan.setInterest(String.valueOf(ans));
                      loan.setRepaydate(String.valueOf(mydate));
                      loan.setLoandate(String.valueOf(date));
                      ExtensionDetails exd=new ExtensionDetails();
                                       exd.setTrid(trid);
                                       exd.setExtid(PaymentCodegenerator.generateRegno());
                                       exd.setExtamount(newamount);
                                       exd.setExtinterest(ans);
                                       exd.setExduration(days);
                                       exd.setPredate(ld.getLoandate());
                                       exd.setExtno(++ct);
                                       exd.setExttotal(newamount+ans);
                                       exd.setExtdate(mydate);
                     if(ct==1){                  
                    if(data.Database.extenstionupdate(loan, exd).equals("done")){
                        out.println("Extended");   
                    }                   
                     }
              
            }

//LoanInterestCalculator.loanInterest(cm, cy)
           
              
              }
            }
          }
            
           
       
            
        }
    }



