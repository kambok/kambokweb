package client;



import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DataSupply;
import model.DataSupply;
import model.LoanDetailSupply;
import model.LoanDetails;
import model.LoanDetails;


public class Finish extends HttpServlet {

  
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        
            String amount=request.getParameter("amt");
            String interest=request.getParameter("int");
            String repaydate=request.getParameter("rd");
            String loandate=request.getParameter("ld");
            String tid=request.getParameter("tid");
            String duration=request.getParameter("d");
            String email=request.getParameter("email");
            if((amount!=null && interest!=null) &&(email!=null && tid!=null) &&(duration!=null && loandate!=null)){
            LoanDetails ld=new LoanDetails();
            ld.setLoanamount(amount);
            ld.setRepaydate(repaydate);
            ld.setLoandate(loandate);
            ld.setTrid(tid);
            ld.setDuration(duration);
            ld.setInterest(interest);
            ld.setStatus("Submitted");
            ld.setEmail(email);
           
            if(data.Database.saveLoanDetails(ld)==2){
                DataSupply us=data.Database.getuserinfo(email);
                HttpSession hs=request.getSession();
                hs.setAttribute("user", us);
                response.sendRedirect("Loanagreement.jsp");
                           
            }else{
            
            out.println("something went wrong");
                RequestDispatcher rd=request.getRequestDispatcher("Review.jsp");
                rd.include(request, response);
            }
            }else{
             response.sendRedirect("dashboard.jsp");
            }       
            
        }
    }

}
