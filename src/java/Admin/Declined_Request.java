
package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Declined_Request extends HttpServlet {

   
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
      try  {
            String email=request.getParameter("email");
            String colname=request.getParameter("colname");
            String trid=request.getParameter("trid");
            String amount=request.getParameter("amount");
            String status="Declined";
            
            model.ApproveRequest ap=new model.ApproveRequest();
            ap.setAmount(amount);
            ap.setColname(colname);
            ap.setTrid(trid);
            ap.setEmail(email);
            ap.setStatus(status);
         
            if(data.Database.savaDeclineRequest(ap)==2){
              out.print("Request has been declined");
            }else{
                out.print("Something went wrong!");
            }
        }catch(Exception e){}  
    }
    

}
