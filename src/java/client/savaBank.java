
package client;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Bank;
import model.DataSupply;


public class savaBank extends HttpServlet {

  
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         
           String email=request.getParameter("email");
           String acctname=request.getParameter("acctname");
           String acctno=request.getParameter("acctno");
           String bankname=request.getParameter("bankname");
            Bank bn=new Bank();
            bn.setEmail(email);
            bn.setAcctname(acctname);
            bn.setAcctno(acctno);
            bn.setBankname(bankname);
            if(data.Database.savaBank(bn)==1){
                DataSupply us=data.Database.getuserinfo(email);
                HttpSession hs=request.getSession();
                hs.setAttribute("user", us);
                out.println("Saved");
            }else{
            out.println("Something wentwrong");
            }
           
        }
    }

    

}
