
package Regular;

import Regular.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DisplayPhotoServlet2 extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         String transtionid=request.getParameter("trid");
        try {
            
              Class.forName("com.mysql.jdbc.Driver").newInstance();
 Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onedrive","root","kambok123");
             PreparedStatement ps = con.prepareStatement("select * from onedrive.loanrequest where transactionID=?");
               ps.setString(1, transtionid);
             
             ResultSet rs = ps.executeQuery();
             rs.next();
             Blob  b = rs.getBlob("collateralImageB");
            response.setContentType("image/jpeg");
            response.setContentLength( (int) b.length());
            InputStream is = b.getBinaryStream();
            OutputStream os = response.getOutputStream();
            byte buf[] = new byte[(int) b.length()];
            is.read(buf);
            os.write(buf);
            os.close();
        }
        catch(Exception ex) {
             System.out.println(ex.getMessage());
        }
    }
}

    