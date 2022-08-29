
package inspection;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LoanDetailSupply;



public class CollateralVerfication extends HttpServlet {

    
    
    
    
    
    
    
    
    
    
    
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            HttpSession session = request.getSession();
            String transactionid = request.getParameter("tranid");
            LoanDetailSupply loandata = data.Database.verifyCol(transactionid);
            session.setAttribute("tranid", transactionid);
            if((!loandata.equals(null) || !loandata.equals("null") )&& loandata.getTrid().equals(transactionid)){
                  Thread.sleep(3000);
                 request.getRequestDispatcher("inspectorsearch2.jsp").include(request, response);
              }else{
                 out.println("Invalid Transaction ID");
              }       
        }catch(Exception e){}
    }

}
