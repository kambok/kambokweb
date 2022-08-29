
package imageloader;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class Loader {
 
    
public static String loadImageFront(String transid){
    String pic=""; 
try{
 PreparedStatement prep = null;
 FileOutputStream file;
  pic=transid+".jpg";
String sql = "select collateralImageF from onedrive.loanrequest where transactionid=?";
Connection conn=data.Database.myconnection();
prep =conn.prepareStatement(sql);
prep.setString(1, transid);
ResultSet resultSet = prep.executeQuery();
resultSet.next();  
Blob clob = resultSet.getBlob("collateralImageF");
byte[] byteArr=clob.getBytes(1,(int)clob.length());
file =new FileOutputStream("C:\\Users\\User\\Documents\\Kambokwebnew.com\\new editted\\Kambokweb.com\\Kambokweb.com\\Kambokweb.com\\web\\photos\\"+pic);
file.write(byteArr);  
System.out.println("Image instantiated");
file.close(); 
prep.close();			//close connection
conn.close();			
}catch(Exception e){
e.printStackTrace();
}
return pic;
}


public static String loadImageBack(String transid){
    String pic=""; 
try{
 PreparedStatement prep = null;
 FileOutputStream file;
  pic=transid+"back"+".jpg";
String sql = "select collateralImageB from onedrive.loanrequest where transactionid=?";
Connection conn=data.Database.myconnection();
prep =conn.prepareStatement(sql);
prep.setString(1, transid);
ResultSet resultSet = prep.executeQuery();
resultSet.next();  
Blob clob = resultSet.getBlob("collateralImageB");
byte[] byteArr=clob.getBytes(1,(int)clob.length());
file =new FileOutputStream("C:\\Users\\User\\Documents\\Kambokwebnew.com\\new editted\\Kambokweb.com\\Kambokweb.com\\Kambokweb.com\\web\\photos\\"+pic);
file.write(byteArr);  
System.out.println("Image instantiated");
file.close(); 
prep.close();			//close connection
conn.close();			
}catch(Exception e){
e.printStackTrace();
}
return pic;
}

public static String loadPassport(String email){
    String passport="";
    

try{
 PreparedStatement prep = null;
 FileOutputStream file;
 passport=email+".jpg";
String sql = "select passport from onedrive.userpassport where email=?";
Connection conn=data.Database.myconnection();
prep =conn.prepareStatement(sql);
prep.setString(1, email);
ResultSet resultSet = prep.executeQuery();
resultSet.next();  
Blob blob = resultSet.getBlob("passport");
byte[] byteArr=blob.getBytes(1,(int)blob.length());
file =new FileOutputStream("C:\\Users\\User\\Documents\\Kambokwebnew.com\\new editted\\Kambokweb.com\\Kambokweb.com\\Kambokweb.com\\web\\photos\\"+passport);
file.write(byteArr);  
System.out.println("Image instantiated");
file.close(); 
prep.close();			//close connection
conn.close();			
}catch(SQLException e){
}   catch (IOException e) {
    }
return passport;
}


public static void loadIddelete(String pic,String pic2){
File f1=new File("C:\\Users\\User\\Documents\\Kambokwebnew.com\\new editted\\Kambokweb.com\\Kambokweb.com\\Kambokweb.com\\web\\photos\\"+pic);
File f2=new File("C:\\Users\\User\\Documents\\Kambokwebnew.com\\new editted\\Kambokweb.com\\Kambokweb.com\\Kambokweb.com\\web\\photos\\"+pic2);
f1.delete();
f2.delete();
      
}

public static void deletePassport(String passport){
File f1=new File("C:\\Users\\User\\Documents\\Kambokwebnew.com\\new editted\\Kambokweb.com\\Kambokweb.com\\Kambokweb.com\\web\\photos\\"+passport);
f1.delete();
     
}

}