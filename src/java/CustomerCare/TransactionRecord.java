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
import model.LoanRequest;

public class TransactionRecord extends HttpServlet {

    protected void service(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            
            List <LoanDetails> lr = data.Database.transactionRecord(email);
            if(!lr.isEmpty()){
              for(LoanDetails p:lr){
                if(p.getEmail().equals(email)){
                    HttpSession se=request.getSession();
                    DataSupply ds = (DataSupply)data.Database.getuserinfo(email);
                    se.setAttribute("user", ds);
                    out.println("<div class='table-responsive'>");
                        out.println("<table class='table'>");
                            out.println("<tr>"); 
                                out.println("<th>Transaction Id</th>"); 
                                out.println("<th>Amount</th>"); 
                                out.println("<th>Interest</th>"); 
                                out.println("<th>Duration</th>"); 
                                out.println("<th>Loan Date</th>"); 
                                out.println("<th>Repay Date</th>"); 
                                out.println("<th>Status</th>"); 
                            out.println("</tr>"); 
                            
                            List <LoanDetails> loan = data.Database.transactionRecord(email);
                            for(LoanDetails ld: loan){
                                if(ld.getLoanamount()==null){
                                    ld.setLoanamount("-");
                                }else if(ld.getInterest()==null){
                                    ld.setInterest("-");
                                }else if(ld.getDuration()==null){
                                    ld.setDuration("-");
                                }else if(ld.getLoandate()==null){
                                    ld.setLoandate("-");
                                }else if(ld.getRepaydate()==null){
                                    ld.setRepaydate("-");
                                }
                                out.println("<tr>"); 
                                    out.println("<td>"+ld.getTrid()+"</td>"); 
                                    out.println("<td>"+ld.getLoanamount()+"</td>"); 
                                    out.println("<td>"+ld.getInterest()+"</td>"); 
                                    out.println("<td>"+ld.getDuration()+"</td>"); 
                                    out.println("<td>"+ld.getLoandate()+"</td>"); 
                                    out.println("<td>"+ld.getRepaydate()+"</td>"); 
                                    out.println("<td>"+ld.getStatus()+"</td>"); 
                                out.println("</tr>"); 
                            }
                        out.println("</table>");
                    out.println("</div>");
                    
                }else{
                    out.println("Invalid Transaction ID!"); 
                }
              }
            }else{
                    out.println("Invalid Transaction ID!"); 
            }
        }
    }
}
