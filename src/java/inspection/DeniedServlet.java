
package inspection;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Float.parseFloat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CollateralVerify;
import model.VerificationCodegenerator;


public class DeniedServlet extends HttpServlet {


    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String trid = request.getParameter("trid");
            String email = request.getParameter("email");
            String agentname = request.getParameter("agentName");
            String agentemail = request.getParameter("agentEmail");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String phone = request.getParameter("phone");
            String time = request.getParameter("time");
            String date =request.getParameter("date");
            String lamount = request.getParameter("lamount");
            String appamount = request.getParameter("appamount");
            String intst = request.getParameter("interest");
            float loanamount = parseFloat(lamount);
            float approveamount = parseFloat(appamount);
            float interest = parseFloat(intst);
            float totalamount = loanamount+interest;
           
            
            CollateralVerify cv = new CollateralVerify();
            
            cv.setTrid(trid);
            cv.setEmail(email);
            cv.setStatus("Denied");
            cv.setAgentemail(agentemail);
            cv.setAgentname(agentname);
            cv.setApproveamount(approveamount);
            cv.setDate(date);
            cv.setFirstname(fname);
            cv.setInterest(interest);
            cv.setLastname(lname);
            cv.setLoanamount(loanamount);
            cv.setPhone(phone);
            cv.setTime(time);
            cv.setTotalamount(totalamount);
            cv.setVerificationid(VerificationCodegenerator.generateRegno());
           
            if(data.Database.saveDeniedVerification(cv).equals("done")){
                out.println("Loan verification denied");
            }else{
                out.println("something went wrong");
            }
        }
    }



}
