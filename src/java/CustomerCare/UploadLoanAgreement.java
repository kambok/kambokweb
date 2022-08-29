package CustomerCare;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.LoanAgr;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadLoanAgreement extends HttpServlet {

    protected void service(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload sfu  = new ServletFileUpload(factory);

            if (! ServletFileUpload.isMultipartContent(request)) {
                System.out.println("sorry. No file uploaded");
                return;
            }
            
            List items = sfu.parseRequest(request);
            FileItem  emai = (FileItem) items.get(0);
            String email =emai.getString();
            FileItem  tid = (FileItem) items.get(1);
            String trid =tid.getString();
            FileItem  photo= (FileItem) items.get(2);
            FileItem  uploadby = (FileItem) items.get(3);
            String uploadBy =uploadby.getString();
            FileItem  date = (FileItem) items.get(4);
            String mydate =date.getString();
            FileItem  time = (FileItem) items.get(5);
            String mytime =time.getString();
            
            LoanAgr la = new LoanAgr();
            la.setEmail(email);
            la.setTrid(trid);
            la.setUploadBy(uploadBy);
            la.setDate(mydate);
            la.setTime(mytime);
            
            if(data.Database.LoanAgreement(la, photo)==1){
                response.sendRedirect("uploadLoanAgreement.jsp");
                out.println("<head><script>alert('Upload Successful');</script></head>");
            }else{
                 response.sendRedirect("uploadLoanAgreement.jsp");
                out.println("<head><script>alert('Something went wrong');</script></head>");
            }
            
        }catch(Exception ex){
                out.println( "Error --> " + ex.getMessage());
           }
    }
}
