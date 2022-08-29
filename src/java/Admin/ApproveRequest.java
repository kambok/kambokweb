
package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LoanDetailSupply;


public class ApproveRequest extends HttpServlet {

   
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        
        String email=request.getParameter("email");
        String colname=request.getParameter("colname");
        String trid=request.getParameter("trid");
        String amount=request.getParameter("amount");
        String status="Approved";
        
        model.ApproveRequest ap=new model.ApproveRequest();
         ap.setAmount(amount);
         ap.setColname(colname);
         ap.setTrid(trid);
         ap.setEmail(email);
         ap.setStatus(status);
        
        if(data.Database.savaApprovedRequest(ap)==2){
        out.print("successful");
        }else{
        
         out.print("something went wrong");
        }
            
        }
    }

}
