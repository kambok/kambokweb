package CustomerCare;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DataSupply;
import model.LoanDetails;

public class PrintLoanAgreement extends HttpServlet {

    protected void service (HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String trid = request.getParameter("trid");
            
            List <LoanDetails> ld = data.Database.print(trid);
            if(!ld.isEmpty()){
              for(LoanDetails p:ld){
                if(p.getStatus().equals("Submitted") && p.getTrid().equals(trid)){
                    HttpSession se=request.getSession();
                    DataSupply ds = (DataSupply)data.Database.getuserinfo(p.getEmail());
                    se.setAttribute("user", ds);
                    response.sendRedirect("Loanagreement.jsp");
                    
                }else{
                    RequestDispatcher rd=request.getRequestDispatcher("printLoanAgreement.jsp");
                    rd.include(request, response);   
                    out.println("<head><script>window.close();</script></head>"); 
                    out.println("<head><script>document.getElementById('report').innerHTML = 'Invalid Transaction ID!';</script></head>"); 
                }
              }
            }else{
                    RequestDispatcher rd=request.getRequestDispatcher("printLoanAgreement.jsp");
                    rd.include(request, response);   
                    out.println("<head><script>window.close();</script></head>"); 
                    out.println("<head><script>document.getElementById('report').innerHTML = 'Invalid Transaction ID!';</script></head>"); 
            }
        }
    }
}
