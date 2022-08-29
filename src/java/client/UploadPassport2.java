
package client;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PassportUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


@WebServlet(name = "UploadPassport2", urlPatterns = {"/UploadPassport2"})
public class UploadPassport2 extends HttpServlet {

  
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
          FileItem  em = (FileItem) items.get(0);
          String email = em.getString();
          FileItem  photo= (FileItem) items.get(1);
          
          PassportUpload pu = new PassportUpload();
          
          pu.setEmail(email);
          
          if(data.Database.UpdatePassport(pu, photo)==1){
              Thread.sleep(3000);
              out.print("Updated Successfully");
              response.sendRedirect("dashboard.jsp");
          }else{
              out.print("Something went wrong");
          }
           
            
        }catch(Exception e){}
    }

}
