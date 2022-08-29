/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inspection;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ApplicantVerification;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import sun.rmi.server.Dispatcher;


public class verify extends HttpServlet {


    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            
            
        
        try {
           DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload sfu  = new ServletFileUpload(factory);
        
            if (! ServletFileUpload.isMultipartContent(request)) {
                System.out.println("sorry. No file uploaded");
                return;
            }
         
            List items = sfu.parseRequest(request);
            FileItem  tel = (FileItem) items.get(0);
            String telphone =tel.getString();
            FileItem  photo= (FileItem) items.get(1);
            FileItem  tri = (FileItem) items.get(2);
            String trid =tri.getString();
            FileItem  ang = (FileItem) items.get(3);
            String agentname =ang.getString();
            FileItem  em = (FileItem) items.get(4);
            String email =em.getString();
            FileItem  em2 = (FileItem) items.get(5);
            String email2 =em2.getString();
            
            
            ApplicantVerification av = new ApplicantVerification();
            av.setEmail(email);
            av.setTrid(trid);
            av.setPhone(telphone);
            av.setApplicantEmail(email2);
            if(data.Database.saveApplicantVerification(av, photo)==1){
            HttpSession session = request.getSession();
            session.setAttribute("trid", trid);
            session.setAttribute("agentname", agentname);
            session.setAttribute("agentemail", email);
            request.getRequestDispatcher("VerifyCollateral").forward(request, response);
//            response.sendRedirect("VerifyCollateral");
            }else{
                out.println("Something went wrong");
            }
          
        }catch(Exception e){}
    }

    

}
