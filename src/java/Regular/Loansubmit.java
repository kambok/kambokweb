
package Regular;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DataSupply;
import model.LoanDetailSupply;
import model.LoanRequest;
import model.RegNoGenerator;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class Loansubmit extends HttpServlet {

  
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
          PrintWriter out = response.getWriter();
        try{
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload sfu  = new ServletFileUpload(factory);
        
         if (! ServletFileUpload.isMultipartContent(request)) {
                System.out.println("sorry. No file uploaded");
                return;
            }
         
          List items = sfu.parseRequest(request);
          FileItem  colnam = (FileItem) items.get(0);
           String colname =colnam.getString();
          FileItem  colid = (FileItem) items.get(1);
           String collid =colid.getString();
            FileItem  photo1= (FileItem) items.get(2);
           FileItem  photo2= (FileItem) items.get(3);
            FileItem  date = (FileItem) items.get(4);
           String mydate =date.getString();
           FileItem  emai = (FileItem) items.get(5);
           String email =emai.getString();
            FileItem  time = (FileItem) items.get(6);
           String mytime =time.getString();
           FileItem  condition = (FileItem) items.get(7);
           String colcondtion =condition.getString();
            
        
           
            LoanRequest lr=new LoanRequest();
            lr.setColname(colname);
            lr.setColid(collid);
            lr.setTrid(RegNoGenerator.generateRegno());
            lr.setCondition(colcondtion);
            lr.setDate(mydate);
            lr.setTime(mytime);
            lr.setEmail(email);
            lr.setStatus("pending");
          
           if(data.Database.LoanRequestSave(lr,photo1,photo2)==1){
                DataSupply us=data.Database.getuserinfo(email);
                HttpSession hs=request.getSession();
                hs.setAttribute("user", us);
                response.sendRedirect("loan-status.jsp");

           }else{
                   
                   out.println("something wentwrong");
                   
                   request.getRequestDispatcher("loanrequest.jsp").include(request, response);
                   }
           }catch(Exception ex){
        out.println( "Error --> " + ex.getMessage());
       }
    }
}