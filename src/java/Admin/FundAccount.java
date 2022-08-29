
package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Wallet;


public class FundAccount extends HttpServlet {

  
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         String id=request.getParameter("id");
          
         if(id.contains("@") && !id.equals("")){
            Wallet w=new Wallet();
            w.setEmail(id);
         Wallet ww=data.Database.getwalletemail(w);
         
         out.println(ww.getEmail());
         }else{
           Wallet w=new Wallet();
            w.setAccount(id);
         Wallet ww=data.Database.getwallet(w);
          out.println(ww.getEmail());
         }   
        }
    }

   

}
