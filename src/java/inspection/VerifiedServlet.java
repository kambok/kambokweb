
package inspection;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Float.parseFloat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ApplicantVerification;
import model.CollateralVerify;
import model.VerificationCodegenerator;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class VerifiedServlet extends HttpServlet {


    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            
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
            cv.setStatus("Verified");
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

           if((data.Database.saveCollateralVerify(cv)==3)){
                out.println("Successfully verified");
                
            }else{
                out.println("Something went wrong");
            }
            
        }catch(Exception e){}
    }


}
