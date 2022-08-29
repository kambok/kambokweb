
package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MakePayment;


public class SendPayment extends HttpServlet {
       static float isnonef(String nu){
           float a=0.0f;
       if(nu==null){
           a=0.0f;
       }else{
          a= Float.parseFloat(nu);
       }
       return a;
       }
 
         static int isnonei(String nu){
         int a=0;
       if(nu==null){
           a=0;
       }else{
          a= Integer.parseInt(nu);
       }
       return a;
       }
       
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            MakePayment pmt=new MakePayment();

              pmt.setPmtid(request.getParameter("pid"));
               pmt.setVerificationid(request.getParameter("vid"));
               pmt.setTrid(request.getParameter("tid"));
               pmt.setFirstname(request.getParameter("fn"));
               pmt.setLastname(request.getParameter("ln"));
               pmt.setEmail(request.getParameter("e"));
               pmt.setPhone(request.getParameter("p"));
               pmt.setDate(request.getParameter("d"));
               pmt.setTime(request.getParameter("t"));
               pmt.setVerifiedstatus(request.getParameter("vs"));
               pmt.setNoexpired(isnonei(request.getParameter("noep")));
               pmt.setNoextension(Integer.parseInt(request.getParameter("noex")));
               pmt.setNoliquidate(Integer.parseInt(request.getParameter("noli")));
               pmt.setCamount(Float.parseFloat(request.getParameter("camt")));
               pmt.setCint(Float.parseFloat(request.getParameter("cint")));
               pmt.setCtotal(Float.parseFloat(request.getParameter("ctotal")));
               pmt.setPamount(Float.parseFloat(request.getParameter("pamt")));
               pmt.setPint(Float.parseFloat(request.getParameter("pint")));
               pmt.setPtoal(Float.parseFloat(request.getParameter("ptotal")));
              pmt.setBankname(request.getParameter("bankname"));
              pmt.setAcctname(request.getParameter("acctname"));
              pmt.setAcctno(request.getParameter("acctno"));
              pmt.setAgentname(request.getParameter("agentname"));
              pmt.setPaymentmethod(request.getParameter("pmethod"));
              
             if(data.Database.saveSendPayment(pmt)==2){
             response.sendRedirect("sendpaymentsuccessful.jsp");
             }else if(data.Database.saveSendPayment(pmt)==3){
              out.println("no funds");
             }else{
            out.println("something wentwrong");
             }
        }
    }

   }
