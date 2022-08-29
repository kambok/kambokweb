
package inspection;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ApproveRequest;
import model.LoanDetailSupply;
import model.LoanRequest;


@WebServlet(name = "VerifyCollateral", urlPatterns = {"/VerifyCollateral"})
public class VerifyCollateral extends HttpServlet {


    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter();
        try {
            out.println("<style>");
            out.println(".image-container{width: 100%; height: 400px; overflow: hidden;}");
            out.println(".image-container img{width: 100%; height: 400px; object-fit: contain;}");
            out.println("</style>");
            HttpSession session = request.getSession();
            String transactionid = (String)session.getAttribute("trid");
            String agentname = (String)session.getAttribute("agentname");
            String agentemail = (String)session.getAttribute("agentemail");
            HttpSession session2 = request.getSession();
            session2.setAttribute("trid", transactionid);
            session2.setAttribute("agentname", agentname);
            session2.setAttribute("agentemail", agentemail);
            LoanDetailSupply loandata = data.Database.verifyCol(transactionid);
            
              if((!loandata.equals(null) || !loandata.equals("null") )&& loandata.getTrid().equals(transactionid)){
                  Thread.sleep(3000);
                 request.getRequestDispatcher("inspectorsearch.jsp").include(request, response);
              }else{
                 out.println("Invalid Transaction ID");
              }       
    }catch(Exception e){}

    }
}
