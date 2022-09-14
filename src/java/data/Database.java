package data;


import static data.Database.myconnection;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;
import org.apache.commons.fileupload.FileItem;

public class Database {
<<<<<<< HEAD
static String name="com.mysql.jdbc.Driver";
static String url="jdbc:mysql://localhost:3306/";
static String username="root";
static String password="kambok123";
static float total=0;
static float  deposit=0;
static float  balance=0;

public static Connection myconnection(){
    Connection con=null;
try{
	Class.forName(name).newInstance();
   con=DriverManager.getConnection(url,username,password);
   
}catch(Exception e){
System.out.println(e);}

	return con;
}
   
public static int clientusers(Users us){
    int i=0;
    try{
 Connection con=myconnection();
 String sql="insert into onedrive.register values (?,?,?,?,?)";
String sql2="insert into onedrive.login values(?,?)";
 String sql3="insert into onedrive.position values(?,?)";
 PreparedStatement prst=con.prepareStatement(sql2);
 prst.setString(1,us.getEmail());
 prst.setString(2, us.getPassword());
  PreparedStatement prst2=con.prepareStatement(sql3);
  prst2.setString(1, us.getEmail());
  prst2.setString(2, us.getPosition());
          
 PreparedStatement user=con.prepareStatement(sql);
user.setString(1, us.getFirstname());
user.setString(2, us.getLastname());
user.setString(3, us.getPhone());
user.setString(4, us.getPassword());
user.setString(5, us.getEmail());

 i=user.executeUpdate();
 i+=prst.executeUpdate();
 i+=prst2.executeUpdate();
 
 String urll="insert into onedrive.wallet values(?,?,?,?,?)";
 PreparedStatement wallet=con.prepareStatement(urll);
 wallet.setString(1, us.getEmail());
 wallet.setLong(2, Long.parseLong(VerificationCodegenerator.generatewallet()));
 wallet.setDouble(3,0.0);
 wallet.setDouble(4,0.0);
 wallet.setDouble(5,0.0);
 wallet.executeUpdate();
 
    }catch(Exception e){
        e.printStackTrace();
    }
    return i;
}

public static int LoanRequestSave(LoanRequest lr,FileItem fi,FileItem fi2){
    int i=0;
    try{
 Connection con=myconnection();
 String sql="insert into onedrive.loanrequest (colname,colid,colcondition,transactionid,mytime,mydate,collateralImageF,collateralImageB,status,email) values (?,?,?,?,?,?,?,?,?,?)";
 String sql2="insert into onedrive.loanrequesthistory (colname,colid,colcondition,transactionid,mytime,mydate,collateralImageF,collateralImageB,status,email) values (?,?,?,?,?,?,?,?,?,?)";

 PreparedStatement loanRequest=con.prepareStatement(sql);
loanRequest.setString(1, lr.getColname());
loanRequest.setString(2, lr.getColid());
loanRequest.setString(3, lr.getCondition());
loanRequest.setString(4, lr.getTrid());
loanRequest.setString(5, lr.getTime());
loanRequest.setString(6, lr.getDate());
 loanRequest.setBinaryStream(7, fi.getInputStream(),(int)fi.getSize());
 loanRequest.setBinaryStream(8, fi2.getInputStream(),(int)fi2.getSize());
 loanRequest.setString(9, lr.getStatus());
loanRequest.setString(10, lr.getEmail());
    
    i=loanRequest.executeUpdate();
     PreparedStatement loanRequest2=con.prepareStatement(sql2);
loanRequest2.setString(1, lr.getColname());
loanRequest2.setString(2, lr.getColid());
loanRequest2.setString(3, lr.getCondition());
loanRequest2.setString(4, lr.getTrid());
loanRequest2.setString(5, lr.getTime());
loanRequest2.setString(6, lr.getDate());
 loanRequest2.setBinaryStream(7, fi.getInputStream(),(int)fi.getSize());
 loanRequest2.setBinaryStream(8, fi2.getInputStream(),(int)fi2.getSize());
 loanRequest2.setString(9, lr.getStatus());
loanRequest2.setString(10, lr.getEmail());
    
    loanRequest2.executeUpdate();
 
    }catch(Exception e){
        e.printStackTrace();
    }
    return i;
}

public static int saveLoanDetails(LoanDetails ld){
    int i=0;
    try{
 Connection con=myconnection();
 String sql="insert into onedrive.loandetails values (?,?,?,?,?,?,?,?)";
 String sql1="insert into onedrive.loandetailshistory values (?,?,?,?,?,?,?,?)";
 String sql3="insert into onedrive.history values (?,?,?,?,?,?,?)";
String sql2="update onedrive.loanrequest set status='Submitted' where transactionid=?";

 PreparedStatement prst=con.prepareStatement(sql2);
 prst.setString(1, ld.getTrid());
 
 PreparedStatement loanRequest=con.prepareStatement(sql);
 PreparedStatement loanRequest1=con.prepareStatement(sql1);
loanRequest.setString(1, ld.getTrid());
loanRequest.setString(2, ld.getLoanamount());
loanRequest.setString(3, ld.getInterest());
loanRequest.setString(4, ld.getDuration());
loanRequest.setString(5, ld.getLoandate());
loanRequest.setString(6, ld.getRepaydate());
loanRequest.setString(7,ld.getStatus());
loanRequest.setString(8,ld.getEmail());

loanRequest1.setString(1, ld.getTrid());
loanRequest1.setString(2, ld.getLoanamount());
loanRequest1.setString(3, ld.getInterest());
loanRequest1.setString(4, ld.getDuration());
loanRequest1.setString(5, ld.getLoandate());
loanRequest1.setString(6, ld.getRepaydate());
loanRequest1.setString(7,ld.getStatus());
loanRequest1.setString(8,ld.getEmail());

PreparedStatement ps3=con.prepareStatement(sql3);
    ps3.setString(1, ld.getEmail());
    ps3.setString(2, ld.getTrid());
    ps3.setString(3, ld.getLoanamount());
    ps3.setString(4, ld.getInterest());
    ps3.setString(5, ld.getDuration());
    ps3.setString(6, ld.getLoandate());
    ps3.setString(7, ld.getStatus());
    ps3.executeUpdate();
    i=loanRequest.executeUpdate();
    loanRequest1.executeUpdate();
    i+=prst.executeUpdate();
    }catch(Exception e){
        e.printStackTrace();
    }
    return i;
}

public static int saveAdminuser(AdminUser em){
    int i=0;
    try{
 Connection con=myconnection();
 String sql="insert into onedrive.admin values(?,?,?,?)";
 String sql2="insert into onedrive.login values(?,?)";
 String sql3="insert into onedrive.position values(?,?)";
 String sql4="insert into onedrive.adminregister values(?,?,?,?,?,?)";
    
    PreparedStatement prst=con.prepareStatement(sql);

    prst.setString(1, em.getFirstname()+" "+em.getLastname());
    prst.setString(2, em.getEmail());
    prst.setString(3, em.getPassword());
    prst.setString(4, em.getPosition()); 
    i=prst.executeUpdate();
    
    PreparedStatement prst2=con.prepareStatement(sql2);
    prst2.setString(1, em.getEmail());
    prst2.setString(2, em.getPassword());
    i+=prst2.executeUpdate();
    
    PreparedStatement prst3=con.prepareStatement(sql3);
    prst3.setString(1, em.getEmail());
    prst3.setString(2, em.getPosition());
    i+=prst3.executeUpdate();
    
    PreparedStatement prst4 = con.prepareStatement(sql4);
    prst4.setString(1, em.getFirstname());
    prst4.setString(2, em.getLastname());
    prst4.setString(3, em.getPosition());
    prst4.setString(4, em.getPhone());
    prst4.setString(5, em.getEmail());
    prst4.setString(6, em.getPassword());
    i+=prst4.executeUpdate();

    }catch(Exception e){
        e.printStackTrace();
    }
    return i;
}


public static MakePayment getcollateralverifiedid(String pin){
     MakePayment cv=new MakePayment();
   try{  
Connection con=myconnection();
 String sql="select * from onedrive.collateralverified where verificationid='"+pin+"' AND status='verified' OR phone='"+pin+"'";
PreparedStatement ps=con.prepareStatement(sql);  

ResultSet r=ps.executeQuery();
 while(r.next()){
   
    cv.setEmail(r.getString(1));
    cv.setPhone(r.getString(2));
    cv.setVerificationid(r.getString(3));
    cv.setDate(r.getString(4));
    cv.setTime(r.getString(5));
    cv.setTrid(r.getString(6));
    cv.setLoanamount(r.getFloat(7));
    cv.setTotalamount(r.getFloat(8));
    cv.setInterest(r.getFloat(9));
    cv.setFirstname(r.getString(10));
    cv.setLastname(r.getString(11));
    cv.setStatus(r.getString(12));
    cv.setAgentname(r.getString(13));
    cv.setAgentemail(r.getString(14));
   
    } 

  String sql2="select * from onedrive.bank where email='"+cv.getEmail()+"'";
  PreparedStatement ps2=con.prepareStatement(sql2);  

ResultSet r2=ps2.executeQuery();
 while(r2.next()){
   
    cv.setAcctname(r2.getString(2));
    cv.setAcctno(r2.getString(3));
    cv.setBankname(r2.getString(4));
   }
 }catch(Exception s){
 
 }
 return cv;
}

public static int savaApprovedRequest(ApproveRequest ap){
    int i=0;
    try{
 Connection con=myconnection();
 String sql="insert into onedrive.approverequest values(?,?,?,?,?)";
 String sql3="insert into onedrive.approverequesthistory values(?,?,?,?,?)";
 String sql2="update onedrive.loanrequest set status='Approved' where transactionid=?";

 PreparedStatement prst=con.prepareStatement(sql);
  PreparedStatement prst2=con.prepareStatement(sql2);
  PreparedStatement prst3=con.prepareStatement(sql3);
    
 prst.setString(1, ap.getEmail());
 prst.setString(2, ap.getColname());
 prst.setString(3, ap.getTrid());
 prst.setString(4, ap.getAmount()); 
 prst.setString(5, ap.getStatus()); 
 i=prst.executeUpdate();
 
 
 prst3.setString(1, ap.getEmail());
 prst3.setString(2, ap.getColname());
 prst3.setString(3, ap.getTrid());
 prst3.setString(4, ap.getAmount()); 
 prst3.setString(5, "Approved");
 prst2.setString(1, ap.getTrid());
prst3.executeUpdate();
i+=prst2.executeUpdate();
 
    }catch(Exception e){
        e.printStackTrace();
    }
    return i;
}

public static int savaDeclineRequest(ApproveRequest ap){
    int i=0;
    try{
 Connection con=myconnection();
 String sql="insert into onedrive.declinedrequest values(?,?,?,?,?)";
 String sql2="update onedrive.loanrequest set status='Declined' where transactionid=?";

 PreparedStatement prst=con.prepareStatement(sql);
 PreparedStatement prst2=con.prepareStatement(sql2);
    
 prst.setString(1, ap.getEmail());
 prst.setString(2, ap.getColname());
 prst.setString(3, ap.getTrid());
 prst.setString(4, "not awarded"); 
 prst.setString(5, ap.getStatus()); 
 i=prst.executeUpdate();
 
 prst2.setString(1, ap.getTrid());

i+=prst2.executeUpdate();
 
    }catch(Exception e){
        e.printStackTrace();
    }
    return i;
}

public static int savaAddress(Address ap){
    int i=0;
    try{
 Connection con=myconnection();
 
  String sql2="select * from onedrive.address where email='"+ap.getEmail()+"'";
  PreparedStatement  ps2=con.prepareStatement(sql2);
    ResultSet r=ps2.executeQuery();
    if(r.next()){
    String sql3="update onedrive.address set address='"+ap.getAdress()+"',state='"+ap.getState()+"',phone='"+ap.getPhone()+"' ,occupation='"+ap.getOccupation()+"',purpose='"+ap.getPurpose()+"',gender='"+ap.getGender()+"' where email='"+ap.getEmail()+"'";
    PreparedStatement  ps3=con.prepareStatement(sql3);
    i=ps3.executeUpdate();
    }else{
    String sql="insert into onedrive.address values(?,?,?,?,?,?,?)";
    PreparedStatement prst=con.prepareStatement(sql);
   prst.setString(1, ap.getEmail());
   prst.setString(2, ap.getAdress());
   prst.setString(3, ap.getState());
   prst.setString(4, ap.getPhone());
   prst.setString(5, ap.getOccupation());
   prst.setString(6, ap.getPurpose());
   prst.setString(7, ap.getGender());
   i=prst.executeUpdate();
    }
   }catch(Exception e){
    e.printStackTrace();
   }
    return i;
}

public static int savaBank(Bank ap){
    int i=0;
    try{
    Connection con=myconnection();
    String sql2="select * from onedrive.bank where email='"+ap.getEmail()+"'";
    PreparedStatement  ps2=con.prepareStatement(sql2);
    ResultSet r=ps2.executeQuery();
    if(r.next()){
    String sql3="update onedrive.bank set acctname='"+ap.getAcctname()+"',acctno='"+ap.getAcctno()+"',bankname='"+ap.getBankname()+"' where email='"+ap.getEmail()+"'";
    PreparedStatement  ps3=con.prepareStatement(sql3);
    i=ps3.executeUpdate();
    }else{
    String sql="insert into onedrive.bank values(?,?,?,?)";
    PreparedStatement prst=con.prepareStatement(sql);
    prst.setString(1, ap.getEmail());
    prst.setString(2, ap.getAcctname());
    prst.setString(3, ap.getAcctno());
    prst.setString(4, ap.getBankname());
  
    i=prst.executeUpdate();
    }
    }catch(Exception e){
    e.printStackTrace();
    }
     return i;
}

public static String activate(String pin){
    int i=0;
    try{
 Connection con=myconnection();
String sql2="update onedrive.payment set status='Approved' where pin='"+pin+"' AND status='Pending' OR email='"+pin+"'";

  PreparedStatement prst=con.prepareStatement(sql2);
   

   i=prst.executeUpdate();
 

 
    }catch(Exception e){
        e.printStackTrace();
    }
    return "done";
}

public static String saveEditedpayment(Payment pt){
    int i=0;
try{
Connection con=myconnection();
String sql2="update onedrive.payment set balance='"+pt.getBalance()+"',deposit='"+pt.getDeposit()+"' ,total='"+pt.getTotal()+"' where pin='"+pt.getPin()+"' AND status='Pending' OR email='"+pt.getEmail()+"'";
PreparedStatement prst=con.prepareStatement(sql2);
i=prst.executeUpdate();
 }catch(Exception e){
        e.printStackTrace();
    }
    return "done";
}

public static int savaPaymentRequest(Payment ap){
    int i=0;
    try{
 Connection con=myconnection();
 String sql="insert into onedrive.payment values(?,?,?,?,?,?,?,?)";
 PreparedStatement prst=con.prepareStatement(sql);

    
 prst.setString(1, ap.getEmail());
 prst.setString(2, ap.getTrid());
 prst.setDouble(3, ap.getBalance());
 prst.setDouble(4, ap.getDeposit());
 prst.setDouble(5, ap.getTotal());
 prst.setString(6, ap.getStatus());
 prst.setString(7, ap.getDate());
 prst.setString(8, ap.getPin());
 
 i=prst.executeUpdate();
 
}catch(Exception e){
        e.printStackTrace();
    }
    return i;
}

public static String savafinance(Finance fc){
    int i=0;
    try{
 Connection con=myconnection();
 String sql="insert into onedrive.finance values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
 PreparedStatement prst=con.prepareStatement(sql);
       prst.setString(1, fc.getPtmid());
       prst.setString(2, fc.getPmtmethd());
       prst.setString(3, fc.getPmtpurpose());
       prst.setString(4, fc.getSendername());
       prst.setString(5, fc.getSendemail());
       prst.setString(6, fc.getTrid());
       prst.setString(7, fc.getAgentid());
       prst.setString(8, fc.getAgentname());
       prst.setString(9, fc.getReceivedsection());
       prst.setString(10, fc.getPmtpin());
       prst.setFloat(11, fc.getDeposit());
       prst.setFloat(12, fc.getBalance());
       prst.setFloat(13, fc.getTotal());
       prst.setFloat(14, fc.getBonus());
       prst.setString(15, fc.getStatus());
       prst.setString(16, fc.getDate());
       
       i=prst.executeUpdate();
 
}catch(Exception e){
        e.printStackTrace();
    }
    return "done";
}

public static String completepayment(Finance fc){
    int i=0;
    try{
 Connection con=myconnection();
 
 
 
 String sql="insert into onedrive.completepayment values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
 PreparedStatement prst=con.prepareStatement(sql);
       prst.setString(1, fc.getPtmid());
       prst.setString(2, fc.getPmtmethd());
       prst.setString(3, fc.getPmtpurpose());
       prst.setString(4, fc.getSendername());
       prst.setString(5, fc.getSendemail());
       prst.setString(6, fc.getTrid());
       prst.setString(7, fc.getAgentid());
       prst.setString(8, fc.getAgentname());
       prst.setString(9, fc.getReceivedsection());
       prst.setString(10, fc.getPmtpin());
       prst.setFloat(11, fc.getDeposit());
       prst.setFloat(12, fc.getBalance());
       prst.setFloat(13, fc.getTotal());
       prst.setFloat(14, fc.getBonus());
       prst.setString(15, fc.getStatus());
       prst.setString(16, fc.getDate());
       
       i=prst.executeUpdate();
 
}catch(Exception e){
        e.printStackTrace();
    }
    return "done";
}

public static boolean validate(Logindetails in){  
boolean status=false;  
try{  
Connection con=myconnection();
PreparedStatement ps=con.prepareStatement(  
"select * from onedrive.login where username=? and password=?");  
ps.setString(1,in.getUsername());  
ps.setString(2,in.getPassword());  
      
ResultSet rs=ps.executeQuery();  
status=rs.next();  
          
}catch(Exception e){System.out.println(e);
}  
return status;  
} 
 
public static Logindetails validatePosition(Logindetails in){ 
     Logindetails ln=new Logindetails();
   try{  
Connection con=myconnection();
String sql="select * from onedrive.position where username=?";
PreparedStatement ps=con.prepareStatement(sql);  
ps.setString(1,in.getUsername()); 

  ResultSet r=ps.executeQuery();
 while(r.next()){
  
   ln.setPosition(r.getString(2));
   }
          
}catch(Exception e){System.out.println(e);
}  
return ln;  
}

public static String extenstionupdate(LoanDetails ld,ExtensionDetails exd){ 
     Logindetails ln=new Logindetails();
   try{  
Connection con=myconnection();
 String sql="insert into onedrive.extension values(?,?,?,?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(sql);  
ps.setString(1,exd.getTrid()); 
ps.setString(2,exd.getExtid()); 
ps.setString(3,exd.getExtdate()); 
ps.setString(4,exd.getPredate()); 
ps.setInt(5,exd.getExtno()); 
ps.setInt(6,exd.getExduration()); 
ps.setDouble(7,exd.getExtinterest()); 
ps.setDouble(8,exd.getExtamount()); 
ps.setDouble(9,exd.getExttotal()); 
ps.executeUpdate();

String sql2="update onedrive.loandetails set amount='"+ld.getLoanamount()+"',interest='"+ld.getInterest()+"',duration='"+ld.getDuration()+"',loandate='"+ld.getLoandate()+"',repaydate='"+ld.getRepaydate()+"' where trid='"+ld.getTrid()+"'";
PreparedStatement prst=con.prepareStatement(sql2);
prst.executeUpdate();

          
}catch(Exception e){System.out.println(e);
}  
return "done";  
}

public static DataSupply getuserinfo(String email){
    DataSupply us=new DataSupply();
ArrayList<Payment>pp=new ArrayList<Payment>();
 try{  
Connection con=myconnection();
String sql="select * from onedrive.register where email=?";
PreparedStatement ps=con.prepareStatement(sql);  
ps.setString(1, email);

 ResultSet r=ps.executeQuery();
 while(r.next()){
   us.setFirstname(r.getString(1));
   us.setLastname(r.getString(2));
    us.setPhone(r.getString(3));
     us.setPassword(r.getString(4));
      us.setEmail(r.getString(5));
      us.setPosition("Client");
     
 }
 String sql2="select * from onedrive.loanrequest where email=?";
PreparedStatement ps2=con.prepareStatement(sql2);  
ps2.setString(1, email);
  ResultSet r2=ps2.executeQuery();
 while(r2.next()){
   us.setColname(r2.getString(2));
  us.setColid(r2.getString(3));
  us.setCondition(r2.getString(4));
  us.setTrid(r2.getString(5));
  us.setTime(r2.getString(6));
  us.setDate(r2.getString(7));
   us.setStatus(r2.getString(10));
  
 }
 
String sql3="select * from onedrive.approverequest where trid=?";
PreparedStatement ps3=con.prepareStatement(sql3);  
ps3.setString(1, us.getTrid());
 ResultSet r3=ps3.executeQuery();
 while(r3.next()){
   us.setAmount(r3.getString(4));
   us.setLoanstatus(r3.getString(5));
} 
 
 String sql4="select * from onedrive.loandetails where trid=?";
PreparedStatement ps4=con.prepareStatement(sql4);  
ps4.setString(1, us.getTrid());
 ResultSet r4=ps4.executeQuery();
 while(r4.next()){
   us.setLoanamount(r4.getString(2));
   us.setInterest(r4.getString(3));
   us.setDuration(r4.getString(4));
   us.setLoandate(r4.getString(5));
   us.setRepaydate(r4.getString(6));
  
} 
 
  String sql10="select * from onedrive.extension where trid=?";
PreparedStatement ps10=con.prepareStatement(sql10);  
ps10.setString(1, us.getTrid());
 ResultSet r10=ps10.executeQuery();
 while(r10.next()){
     us.setExtid(r10.getString(2));
     us.setPredate(r10.getString(4));
     us.setExtno(r10.getInt(5));
   }
 
 String sql5="select * from onedrive.payment where trid=?";
PreparedStatement ps5=con.prepareStatement(sql5);  
ps5.setString(1, us.getTrid());
 ResultSet r5=ps5.executeQuery();
 while(r5.next()){
     Payment pm=new Payment();
     pm.setBalance(r5.getFloat(3));
     pm.setDeposit(r5.getFloat(4));
     //pm.setTotal(r5.getFloat(5));
     pm.setStatus(r5.getString(6));
     pm.setDate(r5.getString(7));
     pm.setPin(r5.getString(8));
     pp.add(pm);
   }
 us.setPayment(pp);
 
  String sql6="select * from onedrive.address where email='"+us.getEmail()+"'";
PreparedStatement ps6=con.prepareStatement(sql6);  
 ResultSet r6=ps6.executeQuery();
 while(r6.next()){
     
     us.setAdress(r6.getString(2));
     us.setState(r6.getString(3));
     us.setPhone(r6.getString(4));
     us.setOccupation(r6.getString(5));
     us.setPurpose(r6.getString(6));
     us.setGender(r6.getString(7));
     }
 
String sql7="select * from onedrive.bank where email='"+us.getEmail()+"'";
PreparedStatement ps7=con.prepareStatement(sql7);  
ResultSet r7=ps7.executeQuery();
 while(r7.next()){
   
     us.setAcctname(r7.getString(2));
     us.setAcctno(r7.getString(3));
     us.setBankname(r7.getString(4));
    }
 
 String sql11="select * from onedrive.wallet where email='"+us.getEmail()+"'";
PreparedStatement ps11=con.prepareStatement(sql11);  
ResultSet r11=ps11.executeQuery();
 while(r11.next()){
   us.setWalletno(r11.getString(2));
   us.setCredit(r11.getDouble(3));
   us.setDebit(r11.getDouble(4));
   us.setTotal(r11.getDouble(5));
   }
 
 String sql8="select * from onedrive.admin where username=?";
PreparedStatement ps8=con.prepareStatement(sql8);
ps8.setString(1, email);
  ResultSet r8=ps8.executeQuery();
 while(r8.next()){
   us.setFirstname(r8.getString(1));
   us.setEmail(r8.getString(2));
   us.setPassword(r8.getString(3));
   us.setPosition(r8.getString(4));
   }
 
 String sql9 = "select * from onedrive.customercareregistry where email=?";
 PreparedStatement ps9=con.prepareStatement(sql9);
ps9.setString(1, email);
  ResultSet r9=ps9.executeQuery();
 while(r9.next()){
   us.setFirstname(r9.getString(1));
   us.setLastname(r9.getString(2));
   us.setPhone(r9.getString(3));
   us.setPassword(r9.getString(4));
   us.setEmail(r9.getString(5));
   us.setRegisteredBy(r9.getString(6));
   
   }
 }catch(Exception s){
 
 }
 return us;
}

public static History getfinalhistory(String email){
    History us=new History ();
   
ArrayList<ApproveRequest>ap=new ArrayList<>();
ArrayList<LoanDetails>ld=new ArrayList<>();
ArrayList<LoanRequest>lr=new ArrayList<>();

 try{  
Connection con=myconnection();

 String sql2="select * from onedrive.loanrequesthistory where email=?";
PreparedStatement ps2=con.prepareStatement(sql2);  
ps2.setString(1, email);
ResultSet r2=ps2.executeQuery();
 while(r2.next()){
  LoanRequest lor=new LoanRequest();
  lor.setColname(r2.getString(2));
  lor.setColid(r2.getString(3));
  lor.setCondition(r2.getString(4));
  lor.setTrid(r2.getString(5));
  lor.setTime(r2.getString(6));
  lor.setDate(r2.getString(7));
  lor.setStatus(r2.getString(10));
  lr.add(lor);
 }
 
String sql3="select * from onedrive.approverequesthistory where trid=?";
PreparedStatement ps3=con.prepareStatement(sql3);  
ps3.setString(1, us.getTrid());
 ResultSet r3=ps3.executeQuery();
 while(r3.next()){
  ApproveRequest apr=new ApproveRequest(); 
  apr.setEmail(r3.getString(1));
  apr.setColname(r3.getString(2));
  apr.setTrid(r3.getString(3));
  apr.setAmount(r3.getString(4));
  apr.setStatus(r3.getString(5));
  ap.add(apr);
} 
 
 String sql4="select * from onedrive.loandetailshistory where email=?";
PreparedStatement ps4=con.prepareStatement(sql4);  
ps4.setString(1, us.getTrid());
 ResultSet r4=ps4.executeQuery();
 while(r4.next()){
     LoanDetails ldh=new LoanDetails();
  ldh.setTrid(r4.getString(1));
  ldh.setLoanamount(r4.getString(2));
  ldh.setInterest(r4.getString(3));
  ldh.setDuration(r4.getString(4));
  ldh.setLoandate(r4.getString(5));
  ldh.setRepaydate(r4.getString(6));
  ldh.setStatus(r4.getString(7));
  ldh.setEmail(r4.getString(8));
  ld.add(ldh);
}
 
 us.setApproveRequests(ap);
 us.setLoanRequests(lr);
 us.setLoandetails(ld);
 

 }catch(Exception s){
 
 }
 return us;
}

public static Wallet getwallet(Wallet w){
    Wallet wa=new Wallet();
    try{
    Connection con=myconnection();
    String sql = "select * from onedrive.wallet where acctno=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, w.getAccount());
    ResultSet rs = ps.executeQuery();
    while(rs.next()){
       wa.setEmail(rs.getString(1));
    }
    }catch(Exception e){
    }
    
    
  return wa;  
}

public static List<Wallet> getallwallet(String w){
    List<Wallet> wt=new ArrayList();
    Wallet wal=new Wallet();
   try{
    Connection con=myconnection();
       String sq="select * from onedrive.wallet where email=?";
   PreparedStatement pss = con.prepareStatement(sq);
   pss.setString(1,w);
     ResultSet rs2 = pss.executeQuery();
    while(rs2.next()){
    wal.setAccount(rs2.getString(2));
    }
   String sql="select * from onedrive.wallethistory where acctno='"+wal.getAccount()+"' AND status='cr' OR pin='"+w+"'";
   PreparedStatement ps = con.prepareStatement(sql);
   ResultSet rs = ps.executeQuery();
    while(rs.next()){
     Wallet wa=new Wallet();
     wa.setAccount(rs.getString(1));
     wa.setCredit(rs.getDouble(2));
     wa.setBalance(rs.getDouble(3));
     wa.setSender(rs.getString(4));
     wa.setDate(rs.getString(5));
     wa.setPin(rs.getString(6));
     wa.setStatus(rs.getString(7));
     wt.add(wa);
     }
    
    }catch(Exception e){
    }
    
    
  return wt;  
}

public static Wallet getwalletemail(Wallet w){
    Wallet wa=new Wallet();
    try{
    Connection con=myconnection();
    String sql = "select * from onedrive.wallet where email=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, w.getEmail());
    ResultSet rs = ps.executeQuery();
    while(rs.next()){
       wa.setEmail(rs.getString(2));
    }
    }catch(Exception e){
    }
    
    
  return wa;  
}
public static Departmentinfo getdepartmentinfo(){
    Departmentinfo din=new Departmentinfo();
    try{
    Connection con=myconnection();
    String sql = "select * from onedrive.wallet where email='Training@kambok.com'";
    PreparedStatement ps = con.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();
    while(rs.next()){
       din.setTrainacctname(rs.getString(1));
       din.setTrainacctno(rs.getString(2));
       din.setTrianamount(rs.getDouble(5));
    }
    
     String sql2 = "select * from onedrive.wallet where email='Loan@kambok.com'";
    PreparedStatement ps2 = con.prepareStatement(sql2);
    ResultSet rs2 = ps2.executeQuery();
    while(rs2.next()){
       din.setLoanacctname(rs2.getString(1));
       din.setLoanacctno(rs2.getString(2));
       din.setLoanamount(rs2.getDouble(5));
    }
    }catch(Exception e){
    }
    
  return din;  
}

public static int debitclient(Wallet w,HttpSession hp){
   int i=0;
   double credit=0.0;
   double total=0.0;
   double debit=0.0;
    try{
    Connection con=myconnection();
    String sqll="select * from onedrive.wallet where acctno='"+w.getAccount()+"'";
    PreparedStatement pss = con.prepareStatement(sqll);
      ResultSet rs = pss.executeQuery();
    while(rs.next()){
       credit=rs.getDouble(3);
       debit=rs.getDouble(4);
       total=rs.getDouble(5);
       }
   String sql2="update onedrive.wallet set credit=?,debit=?,total=? where acctno=?";
    PreparedStatement pss2 = con.prepareStatement(sql2);
    double mycredit=w.getCredit();
    double finaldebit=0.0;
    double bal=0.0;
    if(debit>=mycredit){
        finaldebit=debit-mycredit;
        w.setDebit(finaldebit);
        bal=finaldebit;
        w.setTotal(0.0);
    }else if(debit==0){
        double fintotal=total+=mycredit;
        w.setTotal(fintotal);
        w.setDebit(0.0);
        bal=fintotal;
    }else{
        finaldebit=mycredit-debit;
        w.setTotal(finaldebit);
        w.setDebit(0.0);
        bal=finaldebit;
      }
  
    pss2.setDouble(1, w.getCredit());
    pss2.setDouble(2, w.getDebit());
    pss2.setDouble(3,w.getTotal());
     pss2.setString(4, w.getAccount());
    pss2.executeUpdate();
    
    double loancr=0.0;
    double loantotal=0.0;
    String sql3="select * from onedrive.wallet where acctno='3000000002'";
      PreparedStatement pss3 = con.prepareStatement(sql3);
       ResultSet rs3 = pss3.executeQuery();
      while(rs3.next()){
       loancr=rs3.getDouble(3);
       loantotal=rs3.getDouble(5);
       }
   String sql4="update onedrive.wallet set credit=?,total=? where acctno=?";
     PreparedStatement pss4 = con.prepareStatement(sql4);
     double cr=w.getCredit();
      double fintotal=loantotal+=cr;
     pss4.setDouble(1,w.getCredit());
     pss4.setDouble(2,fintotal);
     pss4.setString(3,"3000000002");
     pss4.executeUpdate();
    
    String sql5="insert into onedrive.wallethistory values(?,?,?,?,?,?,?)";
    String pin=PaymentCodegenerator.generateRegno();
    hp.setAttribute("pin", pin);
    PreparedStatement ps5 = con.prepareStatement(sql5);
      ps5.setString(1, w.getAccount());
      ps5.setDouble(2, w.getCredit());
      ps5.setDouble(3,bal);
      ps5.setString(4, w.getSender());
      ps5.setString(5, w.getDate());
      ps5.setString(6, pin);
      ps5.setString(7, w.getStatus());
        i+=ps5.executeUpdate();
        
     String sql6="insert into onedrive.wallethistory values(?,?,?,?,?,?,?)";
    PreparedStatement ps6= con.prepareStatement(sql6);
      ps6.setString(1,"3000000002");
      ps6.setDouble(2, w.getCredit());
      ps6.setDouble(3,fintotal);
      ps6.setString(4, w.getSender());
      ps6.setString(5, w.getDate());
      ps6.setString(6, PaymentCodegenerator.generateRegno());
      ps6.setString(7, w.getStatus());
     i+=ps6.executeUpdate();
    }catch(Exception ex){
        
    }
    return i;
}


public static Wallet getsinglewalletReceipt(String pin){
    Wallet wu=new Wallet();
  try{
    Connection con=myconnection();
    String url="select * from onedrive.wallethistory where pin='"+pin+"'";
    PreparedStatement ps= con.prepareStatement(url);
      ResultSet rs = ps.executeQuery();
    while(rs.next()){
      wu.setAccount(rs.getString(1));
      wu.setCredit(rs.getDouble(2));
      wu.setBalance(rs.getDouble(3));
      wu.setSender(rs.getString(4));
      wu.setDate(rs.getString(5));
      wu.setPin(rs.getString(6));
      wu.setStatus(rs.getString(7));
       }
    
       }catch(Exception ex){}
  return wu;
}


public static AdmininvestmentDetails getAdminRecord(AdmininvestmentDetails ad){
     
    AdmininvestmentDetails and=new AdmininvestmentDetails();
    int i=0;
   double cap=0.0;
   double total=0.0;
   double debit=0.0;
    try{
    Connection con=myconnection();
    //String url="select * from onedrive.admininvestment";
    
    String sqll="select * from onedrive.admininvestment where email='Loan@kambok.com'";
    PreparedStatement pss = con.prepareStatement(sqll);
      ResultSet rs = pss.executeQuery();
    while(rs.next()){
     and.setWalletno(rs.getString(1));
     and.setCapitalinvest(rs.getDouble(11));
    }
    
     String lo ="update onedrive.admininvestment set capitalinvest=? where walletno=?";
    PreparedStatement ppp=con.prepareStatement(lo);
    cap=and.getCapitalinvest();
    double newamount=ad.getCapitalinvest();
    double ftotal=cap+newamount;
    ppp.setDouble(1, ftotal);
    ppp.setString(2, "3000000002");
    ppp.executeUpdate();
    
    String sql2="insert into onedrive.admininvesthistory values(?,?,?,?,?,?)";   
    PreparedStatement pss2=con.prepareStatement(sql2);
    pss2.setString(1, ad.getWalletno());
    pss2.setString(2, ad.getDate());
    pss2.setString(3, ad.getType());
    pss2.setString(4, ad.getStatus());
    pss2.setDouble(5, ad.getCapitalinvest());
    pss2.setDouble(6, ftotal);
    i+=pss2.executeUpdate(); 
    
    }catch(Exception ex ){
    }
     

return and;
}

public static double gettotal(){
    double bal=0.0;
  try{
    Connection con=myconnection();
    //String url="select * from onedrive.admininvestment";
    
    String sqll="select * from onedrive.admininvestment where email='Loan@kambok.com'";
    PreparedStatement pss = con.prepareStatement(sqll);
      ResultSet rs = pss.executeQuery();
    while(rs.next()){
     bal=rs.getDouble(11);
    }
  }catch(Exception ex){}
  return bal;
}


public static double getmonthly(){
    double bal=0.0;
  try{
    Connection con=myconnection();
    //String url="select * from onedrive.admininvestment";
    
    String sqll="select * from onedrive.admininvestment where email='Loan@kambok.com'";
    PreparedStatement pss = con.prepareStatement(sqll);
      ResultSet rs = pss.executeQuery();
    while(rs.next()){
     bal=rs.getDouble(9);
    }
  }catch(Exception ex){}
  return bal;
}

public static double getmonthlyreturn(){
    double bal=0.0;
  try{
    Connection con=myconnection();
    //String url="select * from onedrive.admininvestment";
    
    String sqll="select * from onedrive.admininvestment where email='Loan@kambok.com'";
    PreparedStatement pss = con.prepareStatement(sqll);
      ResultSet rs = pss.executeQuery();
    while(rs.next()){
     bal=rs.getDouble(12);
    }
  }catch(Exception ex){}
  return bal;
}
public static double updatemonthly(double amt){
     AdmininvestmentDetails and=new AdmininvestmentDetails();
    int i=0;
  
    double bal=0.0;
  try{
    Connection con=myconnection();
    //String url="select * from onedrive.admininvestment";
    
    String sqll="select * from onedrive.admininvestment where email='Loan@kambok.com'";
    PreparedStatement pss = con.prepareStatement(sqll);
      ResultSet rs = pss.executeQuery();
    while(rs.next()){
     bal=rs.getDouble(9);
    }
    String lo ="update onedrive.admininvestment set monthlyinvest=? where walletno=?";
    PreparedStatement ppp=con.prepareStatement(lo);
   
    double ftotal=bal+amt;
    ppp.setDouble(1, ftotal);
    ppp.setString(2, "3000000002");
    ppp.executeUpdate();
  }catch(Exception ex){}
  return bal;
}

public static double monthlyreturn(double amt){
     AdmininvestmentDetails and=new AdmininvestmentDetails();
    int i=0;
  
    double bal=0.0;
  try{
    Connection con=myconnection();
    //String url="select * from onedrive.admininvestment";
    
    String sqll="select * from onedrive.admininvestment where email='Loan@kambok.com'";
    PreparedStatement pss = con.prepareStatement(sqll);
      ResultSet rs = pss.executeQuery();
    while(rs.next()){
     bal=rs.getDouble(12);
    }
    String lo ="update onedrive.admininvestment set monthlyreturn=? where walletno=?";
    PreparedStatement ppp=con.prepareStatement(lo);
   
    double ftotal=bal+amt;
    ppp.setDouble(1, ftotal);
    ppp.setString(2, "3000000002");
    ppp.executeUpdate();
  }catch(Exception ex){}
  return bal;
}
public static int updatewallet(Wallet w){
   int i=0;
   double credit=0.0;
   double total=0.0;
   double debit=0.0;
    try{
    Connection con=myconnection();
    //String url="select * from onedrive.admininvestment";
    
    String sqll="select * from onedrive.wallet where acctno='"+w.getAccount()+"'";
    PreparedStatement pss = con.prepareStatement(sqll);
      ResultSet rs = pss.executeQuery();
    while(rs.next()){
       credit=rs.getDouble(3);
       debit=rs.getDouble(4);
       total=rs.getDouble(5);
    }
    
    if(debit<=0){
    String sql = "update onedrive.wallet set credit=?,total=? where acctno=?";
    PreparedStatement ps = con.prepareStatement(sql);
     double baltotal=total+=w.getTotal();
     double finbal=baltotal-debit;
    ps.setDouble(1, w.getCredit());
    ps.setDouble(2, finbal);
    ps.setString(3, w.getAccount());
    ps.executeUpdate();
    
    String sql2="insert into onedrive.wallethistory values(?,?,?,?,?,?,?)";
    PreparedStatement ps2 = con.prepareStatement(sql2);
      ps2.setString(1, w.getAccount());
      ps2.setDouble(2, w.getCredit());
      ps2.setDouble(3,finbal);
      ps2.setString(4, w.getSender());
      ps2.setString(5, w.getDate());
      ps2.setString(6, PaymentCodegenerator.generateRegno());
      ps2.setString(7, w.getStatus());
      i=ps2.executeUpdate();
    }else{
    String sql = "update onedrive.wallet set credit=?,debit=?,total=? where acctno=?";
    PreparedStatement ps = con.prepareStatement(sql);
    double cr=w.getCredit();
    double finaldebit=0.0;
      if(debit>cr){
          finaldebit=debit-cr;
      }else{
      finaldebit=cr-debit;
      }
    ps.setDouble(1, w.getCredit());
    ps.setDouble(2, finaldebit);
    ps.setDouble(3, 0.0);
    ps.setString(4, w.getAccount());
    ps.executeUpdate();
    
    String sql2="insert into onedrive.wallethistory values(?,?,?,?,?,?,?)";
    PreparedStatement ps2 = con.prepareStatement(sql2);
      ps2.setString(1, w.getAccount());
      ps2.setDouble(2, w.getCredit());
      ps2.setDouble(3,0.0);
      ps2.setString(4, w.getSender());
      ps2.setString(5, w.getDate());
      ps2.setString(6, PaymentCodegenerator.generateRegno());
      ps2.setString(7, w.getStatus());
      
      i=ps2.executeUpdate();
=======
    static String name = "com.mysql.jdbc.Driver";
    static String url = "jdbc:mysql://localhost:3306/onedrive";
    static String username = "root";
    static String password = "israel4God";
    static float total = 0;
    static float deposit = 0;
    static float balance = 0;
    
    public static Connection myconnection() {
        Connection con = null;
        try {
            Class.forName(name).newInstance();
            con = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            System.out.println(e);
>>>>>>> aa28abda898f0939df5d6b38ad57710caaa461ed
        }
        return con;
    }

    public static int clientusers(Users us) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql = "insert into onedrive.register values (?,?,?,?,?)";
            String sql2 = "insert into onedrive.login values(?,?)";
            String sql3 = "insert into onedrive.position values(?,?)";
            PreparedStatement prst = con.prepareStatement(sql2);
            prst.setString(1, us.getEmail());
            prst.setString(2, us.getPassword());
            PreparedStatement prst2 = con.prepareStatement(sql3);
            prst2.setString(1, us.getEmail());
            prst2.setString(2, us.getPosition());

            PreparedStatement user = con.prepareStatement(sql);
            user.setString(1, us.getFirstname());
            user.setString(2, us.getLastname());
            user.setString(3, us.getPhone());
            user.setString(4, us.getPassword());
            user.setString(5, us.getEmail());

            i = user.executeUpdate();
            i += prst.executeUpdate();
            i += prst2.executeUpdate();

            String urll = "insert into onedrive.wallet values(?,?,?,?,?)";
            PreparedStatement wallet = con.prepareStatement(urll);
            wallet.setString(1, us.getEmail());
            wallet.setLong(2, Long.parseLong(VerificationCodegenerator.
                    generatewallet()));
            wallet.setDouble(3, 0.0);
            wallet.setDouble(4, 0.0);
            wallet.setDouble(5, 0.0);
            wallet.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static int LoanRequestSave(LoanRequest lr, FileItem fi, FileItem fi2) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql
                    = "insert into onedrive.loanrequest (colname,colid,colcondition,transactionid,mytime,mydate,collateralImageF,collateralImageB,status,email) values (?,?,?,?,?,?,?,?,?,?)";
            String sql2
                    = "insert into onedrive.loanrequesthistory (colname,colid,colcondition,transactionid,mytime,mydate,collateralImageF,collateralImageB,status,email) values (?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement loanRequest = con.prepareStatement(sql);
            loanRequest.setString(1, lr.getColname());
            loanRequest.setString(2, lr.getColid());
            loanRequest.setString(3, lr.getCondition());
            loanRequest.setString(4, lr.getTrid());
            loanRequest.setString(5, lr.getTime());
            loanRequest.setString(6, lr.getDate());
            loanRequest.setBinaryStream(7, fi.getInputStream(), (int) fi.
                    getSize());
            loanRequest.setBinaryStream(8, fi2.getInputStream(), (int) fi2.
                    getSize());
            loanRequest.setString(9, lr.getStatus());
            loanRequest.setString(10, lr.getEmail());

            i = loanRequest.executeUpdate();
            PreparedStatement loanRequest2 = con.prepareStatement(sql2);
            loanRequest2.setString(1, lr.getColname());
            loanRequest2.setString(2, lr.getColid());
            loanRequest2.setString(3, lr.getCondition());
            loanRequest2.setString(4, lr.getTrid());
            loanRequest2.setString(5, lr.getTime());
            loanRequest2.setString(6, lr.getDate());
            loanRequest2.setBinaryStream(7, fi.getInputStream(), (int) fi.
                    getSize());
            loanRequest2.setBinaryStream(8, fi2.getInputStream(), (int) fi2.
                    getSize());
            loanRequest2.setString(9, lr.getStatus());
            loanRequest2.setString(10, lr.getEmail());

            loanRequest2.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static int saveLoanDetails(LoanDetails ld) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql
                    = "insert into onedrive.loandetails values (?,?,?,?,?,?,?,?)";
            String sql1
                    = "insert into onedrive.loandetailshistory values (?,?,?,?,?,?,?,?)";
            String sql3 = "insert into onedrive.history values (?,?,?,?,?,?,?)";
            String sql2
                    = "update onedrive.loanrequest set status='Submitted' where transactionid=?";

            PreparedStatement prst = con.prepareStatement(sql2);
            prst.setString(1, ld.getTrid());

            PreparedStatement loanRequest = con.prepareStatement(sql);
            PreparedStatement loanRequest1 = con.prepareStatement(sql1);
            loanRequest.setString(1, ld.getTrid());
            loanRequest.setString(2, ld.getLoanamount());
            loanRequest.setString(3, ld.getInterest());
            loanRequest.setString(4, ld.getDuration());
            loanRequest.setString(5, ld.getLoandate());
            loanRequest.setString(6, ld.getRepaydate());
            loanRequest.setString(7, ld.getStatus());
            loanRequest.setString(8, ld.getEmail());

            loanRequest1.setString(1, ld.getTrid());
            loanRequest1.setString(2, ld.getLoanamount());
            loanRequest1.setString(3, ld.getInterest());
            loanRequest1.setString(4, ld.getDuration());
            loanRequest1.setString(5, ld.getLoandate());
            loanRequest1.setString(6, ld.getRepaydate());
            loanRequest1.setString(7, ld.getStatus());
            loanRequest1.setString(8, ld.getEmail());

            PreparedStatement ps3 = con.prepareStatement(sql3);
            ps3.setString(1, ld.getEmail());
            ps3.setString(2, ld.getTrid());
            ps3.setString(3, ld.getLoanamount());
            ps3.setString(4, ld.getInterest());
            ps3.setString(5, ld.getDuration());
            ps3.setString(6, ld.getLoandate());
            ps3.setString(7, ld.getStatus());
            ps3.executeUpdate();
            i = loanRequest.executeUpdate();
            loanRequest1.executeUpdate();
            i += prst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static int saveAdminuser(AdminUser em) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql = "insert into onedrive.admin values(?,?,?,?)";
            String sql2 = "insert into onedrive.login values(?,?)";
            String sql3 = "insert into onedrive.position values(?,?)";
            String sql4
                    = "insert into onedrive.adminregister values(?,?,?,?,?,?)";

            PreparedStatement prst = con.prepareStatement(sql);

            prst.setString(1, em.getFirstname() + " " + em.getLastname());
            prst.setString(2, em.getEmail());
            prst.setString(3, em.getPassword());
            prst.setString(4, em.getPosition());
            i = prst.executeUpdate();

            PreparedStatement prst2 = con.prepareStatement(sql2);
            prst2.setString(1, em.getEmail());
            prst2.setString(2, em.getPassword());
            i += prst2.executeUpdate();

            PreparedStatement prst3 = con.prepareStatement(sql3);
            prst3.setString(1, em.getEmail());
            prst3.setString(2, em.getPosition());
            i += prst3.executeUpdate();

            PreparedStatement prst4 = con.prepareStatement(sql4);
            prst4.setString(1, em.getFirstname());
            prst4.setString(2, em.getLastname());
            prst4.setString(3, em.getPosition());
            prst4.setString(4, em.getPhone());
            prst4.setString(5, em.getEmail());
            prst4.setString(6, em.getPassword());
            i += prst4.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static MakePayment getcollateralverifiedid(String pin) {
        MakePayment cv = new MakePayment();
        try {
            Connection con = myconnection();
            String sql
                    = "select * from onedrive.collateralverified where verificationid='"
                    + pin + "' AND status='verified' OR phone='" + pin + "'";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet r = ps.executeQuery();
            while (r.next()) {

                cv.setEmail(r.getString(1));
                cv.setPhone(r.getString(2));
                cv.setVerificationid(r.getString(3));
                cv.setDate(r.getString(4));
                cv.setTime(r.getString(5));
                cv.setTrid(r.getString(6));
                cv.setLoanamount(r.getFloat(7));
                cv.setTotalamount(r.getFloat(8));
                cv.setInterest(r.getFloat(9));
                cv.setFirstname(r.getString(10));
                cv.setLastname(r.getString(11));
                cv.setStatus(r.getString(12));
                cv.setAgentname(r.getString(13));
                cv.setAgentemail(r.getString(14));

            }

            String sql2 = "select * from onedrive.bank where email='" + cv.
                    getEmail() + "'";
            PreparedStatement ps2 = con.prepareStatement(sql2);

            ResultSet r2 = ps2.executeQuery();
            while (r2.next()) {

                cv.setAcctname(r2.getString(2));
                cv.setAcctno(r2.getString(3));
                cv.setBankname(r2.getString(4));
            }
        } catch (Exception s) {

        }
        return cv;
    }

    public static int savaApprovedRequest(ApproveRequest ap) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql = "insert into onedrive.approverequest values(?,?,?,?,?)";
            String sql3
                    = "insert into onedrive.approverequesthistory values(?,?,?,?,?)";
            String sql2
                    = "update onedrive.loanrequest set status='Approved' where transactionid=?";

            PreparedStatement prst = con.prepareStatement(sql);
            PreparedStatement prst2 = con.prepareStatement(sql2);
            PreparedStatement prst3 = con.prepareStatement(sql3);

            prst.setString(1, ap.getEmail());
            prst.setString(2, ap.getColname());
            prst.setString(3, ap.getTrid());
            prst.setString(4, ap.getAmount());
            prst.setString(5, ap.getStatus());
            i = prst.executeUpdate();

            prst3.setString(1, ap.getEmail());
            prst3.setString(2, ap.getColname());
            prst3.setString(3, ap.getTrid());
            prst3.setString(4, ap.getAmount());
            prst3.setString(5, "Approved");
            prst2.setString(1, ap.getTrid());
            prst3.executeUpdate();
            i += prst2.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static int savaDeclineRequest(ApproveRequest ap) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql
                    = "insert into onedrive.declinedrequest values(?,?,?,?,?)";
            String sql2
                    = "update onedrive.loanrequest set status='Declined' where transactionid=?";

            PreparedStatement prst = con.prepareStatement(sql);
            PreparedStatement prst2 = con.prepareStatement(sql2);

            prst.setString(1, ap.getEmail());
            prst.setString(2, ap.getColname());
            prst.setString(3, ap.getTrid());
            prst.setString(4, "not awarded");
            prst.setString(5, ap.getStatus());
            i = prst.executeUpdate();

            prst2.setString(1, ap.getTrid());

            i += prst2.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static int savaAddress(Address ap) {
        int i = 0;
        try {
            Connection con = myconnection();

            String sql2 = "select * from onedrive.address where email='" + ap.
                    getEmail() + "'";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ResultSet r = ps2.executeQuery();
            if (r.next()) {
                String sql3 = "update onedrive.address set address='" + ap.
                        getAdress() + "',state='" + ap.getState() + "',phone='"
                        + ap.getPhone() + "' ,occupation='" + ap.getOccupation()
                        + "',purpose='" + ap.getPurpose() + "',gender='" + ap.
                        getGender() + "' where email='" + ap.getEmail() + "'";
                PreparedStatement ps3 = con.prepareStatement(sql3);
                i = ps3.executeUpdate();
            } else {
                String sql
                        = "insert into onedrive.address values(?,?,?,?,?,?,?)";
                PreparedStatement prst = con.prepareStatement(sql);
                prst.setString(1, ap.getEmail());
                prst.setString(2, ap.getAdress());
                prst.setString(3, ap.getState());
                prst.setString(4, ap.getPhone());
                prst.setString(5, ap.getOccupation());
                prst.setString(6, ap.getPurpose());
                prst.setString(7, ap.getGender());
                i = prst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static int savaBank(Bank ap) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql2 = "select * from onedrive.bank where email='" + ap.
                    getEmail() + "'";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ResultSet r = ps2.executeQuery();
            if (r.next()) {
                String sql3 = "update onedrive.bank set acctname='" + ap.
                        getAcctname() + "',acctno='" + ap.getAcctno()
                        + "',bankname='" + ap.getBankname() + "' where email='"
                        + ap.getEmail() + "'";
                PreparedStatement ps3 = con.prepareStatement(sql3);
                i = ps3.executeUpdate();
            } else {
                String sql = "insert into onedrive.bank values(?,?,?,?)";
                PreparedStatement prst = con.prepareStatement(sql);
                prst.setString(1, ap.getEmail());
                prst.setString(2, ap.getAcctname());
                prst.setString(3, ap.getAcctno());
                prst.setString(4, ap.getBankname());

                i = prst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static String activate(String pin) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql2
                    = "update onedrive.payment set status='Approved' where pin='"
                    + pin + "' AND status='Pending' OR email='" + pin + "'";

            PreparedStatement prst = con.prepareStatement(sql2);

            i = prst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "done";
    }

    public static String saveEditedpayment(Payment pt) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql2 = "update onedrive.payment set balance='" + pt.
                    getBalance() + "',deposit='" + pt.getDeposit()
                    + "' ,total='" + pt.getTotal() + "' where pin='" + pt.
                    getPin() + "' AND status='Pending' OR email='" + pt.
                    getEmail() + "'";
            PreparedStatement prst = con.prepareStatement(sql2);
            i = prst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "done";
    }

    public static int savaPaymentRequest(Payment ap) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql = "insert into onedrive.payment values(?,?,?,?,?,?,?,?)";
            PreparedStatement prst = con.prepareStatement(sql);

            prst.setString(1, ap.getEmail());
            prst.setString(2, ap.getTrid());
            prst.setDouble(3, ap.getBalance());
            prst.setDouble(4, ap.getDeposit());
            prst.setDouble(5, ap.getTotal());
            prst.setString(6, ap.getStatus());
            prst.setString(7, ap.getDate());
            prst.setString(8, ap.getPin());

            i = prst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static String savafinance(Finance fc) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql
                    = "insert into onedrive.finance values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement prst = con.prepareStatement(sql);
            prst.setString(1, fc.getPtmid());
            prst.setString(2, fc.getPmtmethd());
            prst.setString(3, fc.getPmtpurpose());
            prst.setString(4, fc.getSendername());
            prst.setString(5, fc.getSendemail());
            prst.setString(6, fc.getTrid());
            prst.setString(7, fc.getAgentid());
            prst.setString(8, fc.getAgentname());
            prst.setString(9, fc.getReceivedsection());
            prst.setString(10, fc.getPmtpin());
            prst.setFloat(11, fc.getDeposit());
            prst.setFloat(12, fc.getBalance());
            prst.setFloat(13, fc.getTotal());
            prst.setFloat(14, fc.getBonus());
            prst.setString(15, fc.getStatus());
            prst.setString(16, fc.getDate());

            i = prst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "done";
    }

    public static String completepayment(Finance fc) {
        int i = 0;
        try {
            Connection con = myconnection();

            String sql
                    = "insert into onedrive.completepayment values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement prst = con.prepareStatement(sql);
            prst.setString(1, fc.getPtmid());
            prst.setString(2, fc.getPmtmethd());
            prst.setString(3, fc.getPmtpurpose());
            prst.setString(4, fc.getSendername());
            prst.setString(5, fc.getSendemail());
            prst.setString(6, fc.getTrid());
            prst.setString(7, fc.getAgentid());
            prst.setString(8, fc.getAgentname());
            prst.setString(9, fc.getReceivedsection());
            prst.setString(10, fc.getPmtpin());
            prst.setFloat(11, fc.getDeposit());
            prst.setFloat(12, fc.getBalance());
            prst.setFloat(13, fc.getTotal());
            prst.setFloat(14, fc.getBonus());
            prst.setString(15, fc.getStatus());
            prst.setString(16, fc.getDate());

            i = prst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "done";
    }

    public static boolean validate(Logindetails in) {
        boolean status = false;
        try {
            Connection con = myconnection();
            PreparedStatement ps = con.prepareStatement(
                    "select * from onedrive.login where username=? and password=?");
            ps.setString(1, in.getUsername());
            ps.setString(2, in.getPassword());

            ResultSet rs = ps.executeQuery();
            status = rs.next();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static Logindetails validatePosition(Logindetails in) {
        Logindetails ln = new Logindetails();
        try {
            Connection con = myconnection();
            String sql = "select * from onedrive.position where username=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, in.getUsername());

            ResultSet r = ps.executeQuery();
            while (r.next()) {

                ln.setPosition(r.getString(2));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return ln;
    }

    public static String extenstionupdate(LoanDetails ld, ExtensionDetails exd) {
        Logindetails ln = new Logindetails();
        try {
            Connection con = myconnection();
            String sql
                    = "insert into onedrive.extension values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, exd.getTrid());
            ps.setString(2, exd.getExtid());
            ps.setString(3, exd.getExtdate());
            ps.setString(4, exd.getPredate());
            ps.setInt(5, exd.getExtno());
            ps.setInt(6, exd.getExduration());
            ps.setDouble(7, exd.getExtinterest());
            ps.setDouble(8, exd.getExtamount());
            ps.setDouble(9, exd.getExttotal());
            ps.executeUpdate();

            String sql2 = "update onedrive.loandetails set amount='" + ld.
                    getLoanamount() + "',interest='" + ld.getInterest()
                    + "',duration='" + ld.getDuration() + "',loandate='" + ld.
                    getLoandate() + "',repaydate='" + ld.getRepaydate()
                    + "' where trid='" + ld.getTrid() + "'";
            PreparedStatement prst = con.prepareStatement(sql2);
            prst.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
        return "done";
    }

    public static DataSupply getuserinfo(String email) {
        DataSupply us = new DataSupply();
        ArrayList<Payment> pp = new ArrayList<Payment>();
        try {
            Connection con = myconnection();
            String sql = "select * from onedrive.register where email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet r = ps.executeQuery();
            while (r.next()) {
                us.setFirstname(r.getString(1));
                us.setLastname(r.getString(2));
                us.setPhone(r.getString(3));
                us.setPassword(r.getString(4));
                us.setEmail(r.getString(5));
                us.setPosition("Client");

            }
            String sql2 = "select * from onedrive.loanrequest where email=?";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setString(1, email);
            ResultSet r2 = ps2.executeQuery();
            while (r2.next()) {
                us.setColname(r2.getString(2));
                us.setColid(r2.getString(3));
                us.setCondition(r2.getString(4));
                us.setTrid(r2.getString(5));
                us.setTime(r2.getString(6));
                us.setDate(r2.getString(7));
                us.setStatus(r2.getString(10));

            }

            String sql3 = "select * from onedrive.approverequest where trid=?";
            PreparedStatement ps3 = con.prepareStatement(sql3);
            ps3.setString(1, us.getTrid());
            ResultSet r3 = ps3.executeQuery();
            while (r3.next()) {
                us.setAmount(r3.getString(4));
                us.setLoanstatus(r3.getString(5));
            }

            String sql4 = "select * from onedrive.loandetails where trid=?";
            PreparedStatement ps4 = con.prepareStatement(sql4);
            ps4.setString(1, us.getTrid());
            ResultSet r4 = ps4.executeQuery();
            while (r4.next()) {
                us.setLoanamount(r4.getString(2));
                us.setInterest(r4.getString(3));
                us.setDuration(r4.getString(4));
                us.setLoandate(r4.getString(5));
                us.setRepaydate(r4.getString(6));

            }

            String sql10 = "select * from onedrive.extension where trid=?";
            PreparedStatement ps10 = con.prepareStatement(sql10);
            ps10.setString(1, us.getTrid());
            ResultSet r10 = ps10.executeQuery();
            while (r10.next()) {
                us.setExtid(r10.getString(2));
                us.setPredate(r10.getString(4));
                us.setExtno(r10.getInt(5));
            }

            String sql5 = "select * from onedrive.payment where trid=?";
            PreparedStatement ps5 = con.prepareStatement(sql5);
            ps5.setString(1, us.getTrid());
            ResultSet r5 = ps5.executeQuery();
            while (r5.next()) {
                Payment pm = new Payment();
                pm.setBalance(r5.getFloat(3));
                pm.setDeposit(r5.getFloat(4));
                //pm.setTotal(r5.getFloat(5));
                pm.setStatus(r5.getString(6));
                pm.setDate(r5.getString(7));
                pm.setPin(r5.getString(8));
                pp.add(pm);
            }
            us.setPayment(pp);

            String sql6 = "select * from onedrive.address where email='" + us.
                    getEmail() + "'";
            PreparedStatement ps6 = con.prepareStatement(sql6);
            ResultSet r6 = ps6.executeQuery();
            while (r6.next()) {

                us.setAdress(r6.getString(2));
                us.setState(r6.getString(3));
                us.setPhone(r6.getString(4));
                us.setOccupation(r6.getString(5));
                us.setPurpose(r6.getString(6));
                us.setGender(r6.getString(7));
            }

            String sql7 = "select * from onedrive.bank where email='" + us.
                    getEmail() + "'";
            PreparedStatement ps7 = con.prepareStatement(sql7);
            ResultSet r7 = ps7.executeQuery();
            while (r7.next()) {

                us.setAcctname(r7.getString(2));
                us.setAcctno(r7.getString(3));
                us.setBankname(r7.getString(4));
            }

            String sql11 = "select * from onedrive.wallet where email='" + us.
                    getEmail() + "'";
            PreparedStatement ps11 = con.prepareStatement(sql11);
            ResultSet r11 = ps11.executeQuery();
            while (r11.next()) {
                us.setWalletno(r11.getString(2));
                us.setCredit(r11.getDouble(3));
                us.setDebit(r11.getDouble(4));
                us.setTotal(r11.getDouble(5));
            }

            String sql8 = "select * from onedrive.admin where username=?";
            PreparedStatement ps8 = con.prepareStatement(sql8);
            ps8.setString(1, email);
            ResultSet r8 = ps8.executeQuery();
            while (r8.next()) {
                us.setFirstname(r8.getString(1));
                us.setEmail(r8.getString(2));
                us.setPassword(r8.getString(3));
                us.setPosition(r8.getString(4));
            }

            String sql9
                    = "select * from onedrive.customercareregistry where email=?";
            PreparedStatement ps9 = con.prepareStatement(sql9);
            ps9.setString(1, email);
            ResultSet r9 = ps9.executeQuery();
            while (r9.next()) {
                us.setFirstname(r9.getString(1));
                us.setLastname(r9.getString(2));
                us.setPhone(r9.getString(3));
                us.setPassword(r9.getString(4));
                us.setEmail(r9.getString(5));
                us.setRegisteredBy(r9.getString(6));

            }
        } catch (Exception s) {

        }
        return us;
    }

    public static History getfinalhistory(String email) {
        History us = new History();

        ArrayList<ApproveRequest> ap = new ArrayList<>();
        ArrayList<LoanDetails> ld = new ArrayList<>();
        ArrayList<LoanRequest> lr = new ArrayList<>();

        try {
            Connection con = myconnection();

            String sql2
                    = "select * from onedrive.loanrequesthistory where email=?";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setString(1, email);
            ResultSet r2 = ps2.executeQuery();
            while (r2.next()) {
                LoanRequest lor = new LoanRequest();
                lor.setColname(r2.getString(2));
                lor.setColid(r2.getString(3));
                lor.setCondition(r2.getString(4));
                lor.setTrid(r2.getString(5));
                lor.setTime(r2.getString(6));
                lor.setDate(r2.getString(7));
                lor.setStatus(r2.getString(10));
                lr.add(lor);
            }

            String sql3
                    = "select * from onedrive.approverequesthistory where trid=?";
            PreparedStatement ps3 = con.prepareStatement(sql3);
            ps3.setString(1, us.getTrid());
            ResultSet r3 = ps3.executeQuery();
            while (r3.next()) {
                ApproveRequest apr = new ApproveRequest();
                apr.setEmail(r3.getString(1));
                apr.setColname(r3.getString(2));
                apr.setTrid(r3.getString(3));
                apr.setAmount(r3.getString(4));
                apr.setStatus(r3.getString(5));
                ap.add(apr);
            }

            String sql4
                    = "select * from onedrive.loandetailshistory where email=?";
            PreparedStatement ps4 = con.prepareStatement(sql4);
            ps4.setString(1, us.getTrid());
            ResultSet r4 = ps4.executeQuery();
            while (r4.next()) {
                LoanDetails ldh = new LoanDetails();
                ldh.setTrid(r4.getString(1));
                ldh.setLoanamount(r4.getString(2));
                ldh.setInterest(r4.getString(3));
                ldh.setDuration(r4.getString(4));
                ldh.setLoandate(r4.getString(5));
                ldh.setRepaydate(r4.getString(6));
                ldh.setStatus(r4.getString(7));
                ldh.setEmail(r4.getString(8));
                ld.add(ldh);
            }

            us.setApproveRequests(ap);
            us.setLoanRequests(lr);
            us.setLoandetails(ld);

        } catch (Exception s) {

        }
        return us;
    }

    public static Wallet getwallet(Wallet w) {
        Wallet wa = new Wallet();
        try {
            Connection con = myconnection();
            String sql = "select * from onedrive.wallet where acctno=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, w.getAccount());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                wa.setEmail(rs.getString(1));
            }
        } catch (Exception e) {
        }

        return wa;
    }

    public static List<Wallet> getallwallet(String w) {
        List<Wallet> wt = new ArrayList();
        Wallet wal = new Wallet();
        try {
            Connection con = myconnection();
            String sq = "select * from onedrive.wallet where email=?";
            PreparedStatement pss = con.prepareStatement(sq);
            pss.setString(1, w);
            ResultSet rs2 = pss.executeQuery();
            while (rs2.next()) {
                wal.setAccount(rs2.getString(2));
            }
            String sql = "select * from onedrive.wallethistory where acctno='"
                    + wal.getAccount() + "' AND status='cr' OR pin='" + w + "'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Wallet wa = new Wallet();
                wa.setAccount(rs.getString(1));
                wa.setCredit(rs.getDouble(2));
                wa.setBalance(rs.getDouble(3));
                wa.setSender(rs.getString(4));
                wa.setDate(rs.getString(5));
                wa.setPin(rs.getString(6));
                wa.setStatus(rs.getString(7));
                wt.add(wa);
            }

        } catch (Exception e) {
        }

        return wt;
    }

    public static Wallet getwalletemail(Wallet w) {
        Wallet wa = new Wallet();
        try {
            Connection con = myconnection();
            String sql = "select * from onedrive.wallet where email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, w.getEmail());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                wa.setEmail(rs.getString(2));
            }
        } catch (Exception e) {
        }

        return wa;
    }

    public static Departmentinfo getdepartmentinfo() {
        Departmentinfo din = new Departmentinfo();
        try {
            Connection con = myconnection();
            String sql
                    = "select * from onedrive.wallet where email='Training@kambok.com'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                din.setTrainacctname(rs.getString(1));
                din.setTrainacctno(rs.getString(2));
                din.setTrianamount(rs.getDouble(5));
            }

            String sql2
                    = "select * from onedrive.wallet where email='Loan@kambok.com'";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
                din.setLoanacctname(rs2.getString(1));
                din.setLoanacctno(rs2.getString(2));
                din.setLoanamount(rs2.getDouble(5));
            }
        } catch (Exception e) {
        }

        return din;
    }

    public static int debitclient(Wallet w, HttpSession hp) {
        int i = 0;
        double credit = 0.0;
        double total = 0.0;
        double debit = 0.0;
        try {
            Connection con = myconnection();
            String sqll = "select * from onedrive.wallet where acctno='" + w.
                    getAccount() + "'";
            PreparedStatement pss = con.prepareStatement(sqll);
            ResultSet rs = pss.executeQuery();
            while (rs.next()) {
                credit = rs.getDouble(3);
                debit = rs.getDouble(4);
                total = rs.getDouble(5);
            }
            String sql2
                    = "update onedrive.wallet set credit=?,debit=?,total=? where acctno=?";
            PreparedStatement pss2 = con.prepareStatement(sql2);
            double mycredit = w.getCredit();
            double finaldebit = 0.0;
            double bal = 0.0;
            if (debit >= mycredit) {
                finaldebit = debit - mycredit;
                w.setDebit(finaldebit);
                bal = finaldebit;
                w.setTotal(0.0);
            } else if (debit == 0) {
                double fintotal = total += mycredit;
                w.setTotal(fintotal);
                w.setDebit(0.0);
                bal = fintotal;
            } else {
                finaldebit = mycredit - debit;
                w.setTotal(finaldebit);
                w.setDebit(0.0);
                bal = finaldebit;
            }

            pss2.setDouble(1, w.getCredit());
            pss2.setDouble(2, w.getDebit());
            pss2.setDouble(3, w.getTotal());
            pss2.setString(4, w.getAccount());
            pss2.executeUpdate();

            double loancr = 0.0;
            double loantotal = 0.0;
            String sql3
                    = "select * from onedrive.wallet where acctno='3000000002'";
            PreparedStatement pss3 = con.prepareStatement(sql3);
            ResultSet rs3 = pss3.executeQuery();
            while (rs3.next()) {
                loancr = rs3.getDouble(3);
                loantotal = rs3.getDouble(5);
            }
            String sql4
                    = "update onedrive.wallet set credit=?,total=? where acctno=?";
            PreparedStatement pss4 = con.prepareStatement(sql4);
            double cr = w.getCredit();
            double fintotal = loantotal += cr;
            pss4.setDouble(1, w.getCredit());
            pss4.setDouble(2, fintotal);
            pss4.setString(3, "3000000002");
            pss4.executeUpdate();

            String sql5
                    = "insert into onedrive.wallethistory values(?,?,?,?,?,?,?)";
            String pin = PaymentCodegenerator.generateRegno();
            hp.setAttribute("pin", pin);
            PreparedStatement ps5 = con.prepareStatement(sql5);
            ps5.setString(1, w.getAccount());
            ps5.setDouble(2, w.getCredit());
            ps5.setDouble(3, bal);
            ps5.setString(4, w.getSender());
            ps5.setString(5, w.getDate());
            ps5.setString(6, pin);
            ps5.setString(7, w.getStatus());
            i += ps5.executeUpdate();

            String sql6
                    = "insert into onedrive.wallethistory values(?,?,?,?,?,?,?)";
            PreparedStatement ps6 = con.prepareStatement(sql6);
            ps6.setString(1, "3000000002");
            ps6.setDouble(2, w.getCredit());
            ps6.setDouble(3, fintotal);
            ps6.setString(4, w.getSender());
            ps6.setString(5, w.getDate());
            ps6.setString(6, PaymentCodegenerator.generateRegno());
            ps6.setString(7, w.getStatus());
            i += ps6.executeUpdate();
        } catch (Exception ex) {

        }
        return i;
    }

    public static Wallet getsinglewalletReceipt(String pin) {
        Wallet wu = new Wallet();
        try {
            Connection con = myconnection();
            String url = "select * from onedrive.wallethistory where pin='"
                    + pin + "'";
            PreparedStatement ps = con.prepareStatement(url);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                wu.setAccount(rs.getString(1));
                wu.setCredit(rs.getDouble(2));
                wu.setBalance(rs.getDouble(3));
                wu.setSender(rs.getString(4));
                wu.setDate(rs.getString(5));
                wu.setPin(rs.getString(6));
                wu.setStatus(rs.getString(7));
            }

        } catch (Exception ex) {
        }
        return wu;
    }

    public static int setadminCapital(AdmininvestmentDetails ad) {
        int i = 0;
        double capitalamount = 0.0;
        try {
            Connection con = myconnection();
            String admin
                    = "select * from onedrive.admininvestment where email=?";
            PreparedStatement ps = con.prepareStatement(admin);
            ps.setString(1, ad.getEmail());
            ps.executeUpdate();
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                capitalamount = rs.getDouble(11);
            }

            String sql
                    = "update onedrive.admininvestment set capitalinvest=? where email=?";
            PreparedStatement pss = con.prepareStatement(sql);
            capitalamount += ad.getCapitalinvest();
            pss.setDouble(1, capitalamount);
            pss.setString(1, ad.getEmail());

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return i;
    }

    public static int updatewallet(Wallet w) {
        int i = 0;
        double credit = 0.0;
        double total = 0.0;
        double debit = 0.0;
        try {
            Connection con = myconnection();
    //String url="select * from onedrive.admininvestment";

            String sqll = "select * from onedrive.wallet where acctno='" + w.
                    getAccount() + "'";
            PreparedStatement pss = con.prepareStatement(sqll);
            ResultSet rs = pss.executeQuery();
            while (rs.next()) {
                credit = rs.getDouble(3);
                debit = rs.getDouble(4);
                total = rs.getDouble(5);
            }
            if (debit <= 0) {
                String sql
                        = "update onedrive.wallet set credit=?,total=? where acctno=?";
                PreparedStatement ps = con.prepareStatement(sql);
                double baltotal = total += w.getTotal();
                double finbal = baltotal - debit;
                ps.setDouble(1, w.getCredit());
                ps.setDouble(2, finbal);
                ps.setString(3, w.getAccount());
                ps.executeUpdate();

                String sql2
                        = "insert into onedrive.wallethistory values(?,?,?,?,?,?,?)";
                PreparedStatement ps2 = con.prepareStatement(sql2);
                ps2.setString(1, w.getAccount());
                ps2.setDouble(2, w.getCredit());
                ps2.setDouble(3, finbal);
                ps2.setString(4, w.getSender());
                ps2.setString(5, w.getDate());
                ps2.setString(6, PaymentCodegenerator.generateRegno());
                ps2.setString(7, w.getStatus());
                i = ps2.executeUpdate();
            } else {
                String sql
                        = "update onedrive.wallet set credit=?,debit=?,total=? where acctno=?";
                PreparedStatement ps = con.prepareStatement(sql);
                double cr = w.getCredit();
                double finaldebit = 0.0;
                if (debit > cr) {
                    finaldebit = debit - cr;
                } else {
                    finaldebit = cr - debit;
                }
                ps.setDouble(1, w.getCredit());
                ps.setDouble(2, finaldebit);
                ps.setDouble(3, 0.0);
                ps.setString(4, w.getAccount());
                ps.executeUpdate();

                String sql2
                        = "insert into onedrive.wallethistory values(?,?,?,?,?,?,?)";
                PreparedStatement ps2 = con.prepareStatement(sql2);
                ps2.setString(1, w.getAccount());
                ps2.setDouble(2, w.getCredit());
                ps2.setDouble(3, 0.0);
                ps2.setString(4, w.getSender());
                ps2.setString(5, w.getDate());
                ps2.setString(6, PaymentCodegenerator.generateRegno());
                ps2.setString(7, w.getStatus());

                i = ps2.executeUpdate();
            }
        } catch (Exception e) {
        }

        return i;
    }

    public static AdminUser getstaffinfo(String email) {
        AdminUser adu = new AdminUser();
        try {
            Connection con = myconnection();
            String sql = "select * from onedrive.admin where username =?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                adu.setEmail(rs.getString(2));
                adu.setPassword(rs.getString(3));
                adu.setPosition(rs.getString(4));
            }

            String sql2 = "select * from onedrive.adminregister where email=?";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setString(1, email);
            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
                adu.setFirstname(rs2.getString(1));
                adu.setLastname(rs2.getString(2));
                adu.setPosition(rs2.getString(3));
                adu.setPhone(rs2.getString(4));
                adu.setEmail(rs2.getString(5));
                adu.setPassword(rs2.getString(6));
            }
        } catch (Exception e) {
        }
        return adu;
    }

    public static List<Payment> checkpayment(String status) {
        List<Payment> pp = new ArrayList<>();
        try {
            Connection con = myconnection();
            String sql5 = "select * from onedrive.payment where status=?";
            PreparedStatement ps5 = con.prepareStatement(sql5);
            ps5.setString(1, status);
            ResultSet r5 = ps5.executeQuery();
            while (r5.next()) {
                Payment pm = new Payment();
                pm.setEmail(r5.getString(1));
                pm.setTrid(r5.getString(2));
                pm.setBalance(r5.getFloat(3));
                pm.setDeposit(r5.getFloat(4));
                pm.setTotal(r5.getFloat(5));
                pm.setStatus(r5.getString(6));
                pm.setDate(r5.getString(7));
                pm.setPin(r5.getString(8));
                pp.add(pm);
            }

        } catch (Exception s) {

        }
        return pp;
    }

    public static LoanDetails extension(String status) {
        LoanDetails pm = new LoanDetails();
        try {
            Connection con = myconnection();
            String sql5 = "select * from onedrive.loandetails where trid=?";
            PreparedStatement ps5 = con.prepareStatement(sql5);
            ps5.setString(1, status);
            ResultSet r5 = ps5.executeQuery();
            while (r5.next()) {

                pm.setLoanamount(r5.getString(2));
                pm.setInterest(r5.getString(3));
                pm.setDuration(r5.getString(4));
                pm.setLoandate(r5.getString(5));
                pm.setRepaydate(r5.getString(6));
            }

        } catch (Exception s) {

        }
        return pm;
    }

    public static List<Payment> extpayment(String status) {
        List<Payment> pp = new ArrayList<>();
        try {
            Connection con = myconnection();
            String sql5 = "select * from onedrive.payment where trid='" + status
                    + "' AND status='Approved' OR email='" + status + "'";
            PreparedStatement ps5 = con.prepareStatement(sql5);

            ResultSet r5 = ps5.executeQuery();
            while (r5.next()) {
                Payment pm = new Payment();
                pm.setEmail(r5.getString(1));
                pm.setTrid(r5.getString(2));
                pm.setBalance(r5.getFloat(3));
                pm.setDeposit(r5.getFloat(4));
                pm.setTotal(r5.getFloat(5));
                pm.setStatus(r5.getString(6));
                pm.setDate(r5.getString(7));
                pm.setPin(r5.getString(8));
                pp.add(pm);
            }

        } catch (Exception s) {

        }
        return pp;
    }

    public static LoanDetailSupply verifyCol(String trid) {
        LoanDetailSupply loandetails = new LoanDetailSupply();
        try {
            Connection con = myconnection();
            String sql = "select * from onedrive.loandetails where trid = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, trid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                loandetails.setTrid(rs.getString(1));
                loandetails.setLoanamount(rs.getString(2));
                loandetails.setInterest(rs.getString(3));
                loandetails.setDuration(rs.getString(4));
                loandetails.setLoandate(rs.getString(5));
                loandetails.setRepaydate(rs.getString(6));
            }
            String sql2 = "select * from onedrive.approverequest where trid= ?";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setString(1, trid);
            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
                loandetails.setEmail(rs2.getString(1));
                loandetails.setColname(rs2.getString(2));
                loandetails.setTrid(rs2.getString(3));
                loandetails.setApproveamount(rs2.getString(4));

            }
            String sql3
                    = "select * from onedrive.loanrequest where transactionid = ?";
            PreparedStatement ps3 = con.prepareStatement(sql3);
            ps3.setString(1, trid);
            ResultSet rs3 = ps3.executeQuery();
            while (rs3.next()) {
                loandetails.setColId(rs3.getString(3));
                loandetails.setCondition(rs3.getString(4));
                loandetails.setTime(rs3.getString(6));
            }

            String sql4 = "select * from onedrive.register where email = '"
                    + loandetails.getEmail() + "'";

            PreparedStatement ps4 = con.prepareStatement(sql4);

            ResultSet rs4 = ps4.executeQuery();
            while (rs4.next()) {
                loandetails.setFirstname(rs4.getString(1));
                loandetails.setLastname(rs4.getString(2));
                loandetails.setPhone(rs4.getString(3));
            }
        } catch (Exception e) {
        }

        return loandetails;
    }

    public static List<CollateralVerify> getverifiedloan(HttpSession http) {
        List<CollateralVerify> pp = new ArrayList<>();
        try {
            Connection con = myconnection();
            String sql
                    = "select * from onedrive.collateralverified where status='verified'";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet r = ps.executeQuery();
            while (r.next()) {
                CollateralVerify cv = new CollateralVerify();
                cv.setEmail(r.getString(1));
                cv.setPhone(r.getString(2));
                cv.setVerificationid(r.getString(3));
                cv.setDate(r.getString(4));
                cv.setTime(r.getString(5));
                cv.setTrid(r.getString(6));
                cv.setLoanamount(r.getFloat(7));
                cv.setTotalamount(r.getFloat(8));
                cv.setInterest(r.getFloat(9));
                cv.setFirstname(r.getString(10));
                cv.setLastname(r.getString(11));
                cv.setStatus(r.getString(12));
                cv.setAgentname(r.getString(13));
                cv.setAgentemail(r.getString(14));
                pp.add(cv);
            }

            http.setAttribute("num", pp.size());
        } catch (Exception s) {

        }
        return pp;
    }

    public static List<Payment> admincheckpayment(String pin) {
        List<Payment> pp = new ArrayList<>();
        try {
            Connection con = myconnection();
            String sql5 = "select * from onedrive.payment where pin='" + pin
                    + "' AND status='Pending' OR email='" + pin + "'";
            PreparedStatement ps5 = con.prepareStatement(sql5);

            ResultSet r5 = ps5.executeQuery();
            while (r5.next()) {
                Payment pm = new Payment();
                pm.setEmail(r5.getString(1));
                pm.setTrid(r5.getString(2));
                pm.setBalance(r5.getFloat(3));
                pm.setDeposit(r5.getFloat(4));
                pm.setTotal(r5.getFloat(5));
                pm.setStatus(r5.getString(6));
                pm.setDate(r5.getString(7));
                pm.setPin(r5.getString(8));
                pp.add(pm);
            }

        } catch (Exception s) {

        }
        return pp;
    }

    public static Payment adminckecksinglepayment(String pin) {
        Payment pm = new Payment();
        try {
            Connection con = myconnection();
            String sql5 = "select * from onedrive.payment where pin='" + pin
                    + "' AND status='Pending' OR email='" + pin + "'";
            PreparedStatement ps5 = con.prepareStatement(sql5);

            ResultSet r5 = ps5.executeQuery();
            while (r5.next()) {

                pm.setEmail(r5.getString(1));
                pm.setTrid(r5.getString(2));
                pm.setBalance(r5.getFloat(3));
                pm.setDeposit(r5.getFloat(4));
                pm.setTotal(r5.getFloat(5));
                pm.setStatus(r5.getString(6));
                pm.setDate(r5.getString(7));
                pm.setPin(r5.getString(8));

            }

        } catch (Exception s) {

        }
        return pm;
    }

    public static List<Admindetails> getadmininfo(String email) {
        List<Admindetails> lst = new ArrayList<>();
        try {
            Connection con = myconnection();
            String sql = "SELECT * FROM onedrive.admin where username=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet r = ps.executeQuery();
            while (r.next()) {
                Admindetails admin = new Admindetails();

                admin.setName(r.getString(1));
                admin.setUsername(r.getString(2));
                admin.setPassword(r.getString(3));
                admin.setPositon(r.getString(4));

                lst.add(admin);
            }
        } catch (Exception s) {

        }
        return lst;
    }

    public static List<Users> getuserinfo2() {
        List<Users> list = new ArrayList<Users>();
        try {
            Connection con = myconnection();
            String sql = "select * from onedrive.register";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet r = ps.executeQuery();

            while (r.next()) {
                Users us = new Users();
                us.setFirstname(r.getString(1));
                us.setLastname(r.getString(2));
                us.setPhone(r.getString(3));
                us.setPassword(r.getString(4));
                us.setEmail(r.getString(5));
                us.setPosition("Client");
                list.add(us);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static List<LoanRequest> getloanupdate(String email) {
        List<LoanRequest> lst = new ArrayList<LoanRequest>();
        try {
            Connection con = myconnection();
            String sql = "select * from onedrive.loanrequest where email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet r = ps.executeQuery();
            while (r.next()) {
                LoanRequest lr = new LoanRequest();

                lr.setColname(r.getString(2));
                lr.setColid(r.getString(3));
                lr.setTrid(r.getString(5));
                lr.setTime(r.getString(6));
                lr.setDate(r.getString(7));
                lr.setStatus(r.getString(10));

                lst.add(lr);
            }
        } catch (Exception s) {

        }
        return lst;
    }

    public static List<LoanDetails> gethistory(String email) {
        List<LoanDetails> lst = new ArrayList<LoanDetails>();
        try {
            Connection con = myconnection();
            String sql = "select * from onedrive.history where email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet r = ps.executeQuery();
            while (r.next()) {
                LoanDetails lr = new LoanDetails();

                lr.setTrid(r.getString(2));
                lr.setLoanamount(r.getString(3));
                lr.setInterest(r.getString(4));
                lr.setDuration(r.getString(5));
                lr.setLoandate(r.getString(6));
                lr.setStatus(r.getString(7));

                lst.add(lr);
            }
        } catch (Exception s) {

        }
        return lst;
    }

    public static Finance getfinance(String pin) {
        Finance fc = new Finance();
        try {
            Connection con = myconnection();
            String sql = "select * from onedrive.finance where pmtpin='" + pin
                    + "' AND status='Successful' OR pmtid='" + pin + "'";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet r = ps.executeQuery();
            while (r.next()) {
                fc.setPtmid(r.getString(1));
                fc.setPmtmethd(r.getString(2));
                fc.setPmtpurpose(r.getString(3));
                fc.setSendername(r.getString(4));
                fc.setSendemail(r.getString(5));
                fc.setTrid(r.getString(6));
                fc.setAgentid(r.getString(7));
                fc.setAgentname(r.getString(8));
                fc.setReceivedsection(r.getString(9));
                fc.setPmtpin(r.getString(10));
                fc.setDeposit(r.getFloat(11));
                fc.setBalance(r.getFloat(12));
                fc.setTotal(r.getFloat(13));
                fc.setBonus(r.getFloat(14));
                fc.setStatus(r.getString(15));
                fc.setDate(r.getString(16));

            }

        } catch (Exception s) {

        }
        return fc;
    }

    public static Finance getfinance2(String pin) {
        Finance fc = new Finance();
        try {
            Connection con = myconnection();
            String sql = "select * from onedrive.completepayment where pmtid='"
                    + pin + "' AND status='Paid' OR senderemail='" + pin + "'";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet r = ps.executeQuery();
            while (r.next()) {
                fc.setPtmid(r.getString(1));
                fc.setPmtmethd(r.getString(2));
                fc.setPmtpurpose(r.getString(3));
                fc.setSendername(r.getString(4));
                fc.setSendemail(r.getString(5));
                fc.setTrid(r.getString(6));
                fc.setAgentid(r.getString(7));
                fc.setAgentname(r.getString(8));
                fc.setReceivedsection(r.getString(9));
                fc.setPmtpin(r.getString(10));
                fc.setDeposit(r.getFloat(11));
                fc.setBalance(r.getFloat(12));
                fc.setTotal(r.getFloat(13));
                fc.setBonus(r.getFloat(14));
                fc.setStatus(r.getString(15));
                fc.setDate(r.getString(16));

            }

        } catch (Exception s) {

        }
        return fc;
    }

    public static Finance calculateTotalPayment(String pin) {

        Finance fc = new Finance();
        try {
            Connection con = myconnection();
            String sql5 = "select *from onedrive.finance where trid='" + pin
                    + "' AND status='Successful' OR senderemail='" + pin + "'";
            PreparedStatement ps5 = con.prepareStatement(sql5);

            ResultSet r = ps5.executeQuery();
            while (r.next()) {

                fc.setPtmid(r.getString(1));
                fc.setPmtmethd(r.getString(2));
                fc.setPmtpurpose(r.getString(3));
                fc.setSendername(r.getString(4));
                fc.setSendemail(r.getString(5));
                fc.setTrid(r.getString(6));
                fc.setAgentid(r.getString(7));
                fc.setAgentname(r.getString(8));
                fc.setReceivedsection(r.getString(9));
                fc.setPmtpin(r.getString(10));
                deposit += r.getFloat(11);
                fc.setBalance(0);

                fc.setBonus(r.getFloat(14));
                fc.setStatus(r.getString(15));
                fc.setDate(r.getString(16));

            }
            fc.setDeposit(deposit);
            fc.setTotal(deposit);

        } catch (Exception s) {

        }
        return fc;
    }

    public static List<LoanRequest> getviewRequest(String status) {
        List<LoanRequest> lst = new ArrayList<LoanRequest>();
        try {
            Connection con = myconnection();
            String sql = "select * from onedrive.loanrequest where status=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);

            ResultSet r = ps.executeQuery();
            while (r.next()) {
                LoanRequest lr = new LoanRequest();

                lr.setColname(r.getString(2));
                lr.setColid(r.getString(3));
                lr.setCondition(r.getString(4));
                lr.setTrid(r.getString(5));
                lr.setTime(r.getString(6));
                lr.setDate(r.getString(7));
                lr.setStatus(r.getString(10));
                lr.setEmail(r.getString(11));
                lst.add(lr);
            }
        } catch (Exception s) {

        }
        return lst;
    }

    public static List<LoanRequest> getrequestid(String id) {
        List<LoanRequest> lst = new ArrayList<LoanRequest>();
        try {
            Connection con = myconnection();
            String sql
                    = "select * from onedrive.loanrequest where transactionid=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);

            ResultSet r = ps.executeQuery();
            while (r.next()) {
                LoanRequest lr = new LoanRequest();

                lr.setColname(r.getString(2));
                lr.setColid(r.getString(3));
                lr.setCondition(r.getString(4));
                lr.setTrid(r.getString(5));
                lr.setTime(r.getString(6));
                lr.setDate(r.getString(7));
                lr.setStatus(r.getString(10));
                lr.setEmail(r.getString(11));
                lst.add(lr);
            }
        } catch (Exception s) {

        }
        return lst;
    }

    public static int PassportSave(PassportUpload pu, FileItem fi) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql = "insert into onedrive.userpassport values (?,?)";

            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, pu.getEmail());
            pst.setBinaryStream(2, fi.getInputStream(), (int) fi.getSize());
            i = pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static int UpdatePassport(PassportUpload pu, FileItem fi) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql
                    = "update onedrive.userpassport set passport=? where email=?";

            PreparedStatement pst = con.prepareStatement(sql);
            pst.setBinaryStream(1, fi.getInputStream(), (int) fi.getSize());
            pst.setString(2, pu.getEmail());
            i = pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static int savePasswordChange(Users us) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql = "update onedrive.register set password=? where email=?";
            String sql2
                    = "update onedrive.login set password=? where username=?";

            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, us.getPassword());
            pst.setString(2, us.getEmail());

            i = pst.executeUpdate();

            PreparedStatement pst2 = con.prepareStatement(sql2);
            pst2.setString(1, us.getPassword());
            pst2.setString(2, us.getEmail());

            i += pst2.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static int deleteUser(Users us) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql = "DELETE  from onedrive.register where email=?";
            String sql2 = "DELETE from onedrive.login where username=?";
            String sql3 = "DELETE from onedrive.position where username=?";

            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, us.getEmail());
            i = pst.executeUpdate();

            PreparedStatement pst2 = con.prepareStatement(sql2);
            pst2.setString(1, us.getEmail());
            i += pst2.executeUpdate();

            PreparedStatement pst3 = con.prepareStatement(sql3);
            pst3.setString(1, us.getEmail());
            i += pst3.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static int saveCollateralVerify(CollateralVerify cv) {
        int i = 0;

        try {
            Connection con = myconnection();

            String sql
                    = "insert into onedrive.collateralverified values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, cv.getEmail());
            ps.setString(2, cv.getPhone());
            ps.setString(3, cv.getVerificationid());
            ps.setString(4, cv.getDate());
            ps.setString(5, cv.getTime());
            ps.setString(6, cv.getTrid());
            ps.setFloat(7, cv.getLoanamount());
            ps.setFloat(8, cv.getTotalamount());
            ps.setFloat(9, cv.getInterest());
            ps.setString(10, cv.getFirstname());
            ps.setString(11, cv.getLastname());
            ps.setString(12, cv.getStatus());
            ps.setString(13, cv.getAgentname());
            ps.setString(14, cv.getAgentemail());

            i = ps.executeUpdate();

            String sql2
                    = "update onedrive.loandetails set status = 'Verified' where trid= '"
                    + cv.getTrid() + "'";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            i += ps2.executeUpdate();

            String sql3
                    = "update onedrive.loanrequest set status = 'Verified' where transactionid= '"
                    + cv.getTrid() + "'";
            PreparedStatement ps3 = con.prepareStatement(sql3);
            i += ps3.executeUpdate();

        } catch (Exception e) {
        }

        return i;
    }

    public static String saveDeniedVerification(CollateralVerify cv) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql
                    = "insert into onedrive.collateralverified values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, cv.getEmail());
            ps.setString(2, cv.getPhone());
            ps.setString(3, cv.getVerificationid());
            ps.setString(4, cv.getDate());
            ps.setString(5, cv.getTime());
            ps.setString(6, cv.getTrid());
            ps.setFloat(7, cv.getLoanamount());
            ps.setFloat(8, cv.getTotalamount());
            ps.setFloat(9, cv.getInterest());
            ps.setString(10, cv.getFirstname());
            ps.setString(11, cv.getLastname());
            ps.setString(12, cv.getStatus());
            ps.setString(13, cv.getAgentname());
            ps.setString(14, cv.getAgentemail());

            i = ps.executeUpdate();

            String sql2
                    = "DELETE from onedrive.applicantverification where trid='"
                    + cv.getTrid() + "'";
            PreparedStatement prst2 = con.prepareStatement(sql2);
            i += prst2.executeLargeUpdate();
            String sql3
                    = "update onedrive.loanrequest set status = 'Denied' where transactionid= '"
                    + cv.getTrid() + "'";
            PreparedStatement ps3 = con.prepareStatement(sql3);
            i += ps3.executeUpdate();

            String sql4
                    = "update onedrive.loandetails set status = 'Denied' where trid= '"
                    + cv.getTrid() + "'";
            PreparedStatement ps4 = con.prepareStatement(sql4);
            i += ps4.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "done";
    }

    public static int saveApplicantVerification(ApplicantVerification av,
            FileItem fi) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql
                    = "insert into onedrive.applicantverification values (?,?,?,?,?)";

            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, av.getEmail());
            pst.setString(2, av.getPhone());
            pst.setString(3, av.getTrid());
            pst.setString(4, av.getApplicantEmail());
            pst.setBinaryStream(5, fi.getInputStream(), (int) fi.getSize());

            i = pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static List<LoanDetails> getApproveRequest(HttpSession session) {
        List<LoanDetails> ar = new ArrayList<>();
        try {
            Connection con = myconnection();
            String sql
                    = "select * from onedrive.loandetails where status = 'Submitted'";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                LoanDetails app = new LoanDetails();
                app.setTrid(rs.getString(1));
                app.setLoanamount(rs.getString(2));
                app.setInterest(rs.getString(3));
                app.setDuration(rs.getString(4));
                app.setLoandate(rs.getString(5));
                app.setRepaydate(rs.getString(6));
                app.setStatus(rs.getString(7));

                ar.add(app);
            }

            session.setAttribute("count", ar.size());

        } catch (Exception e) {
        }
        return ar;
    }

    public static List<ApplicantVerification> getVerifiedApplicant(String email) {
        List<ApplicantVerification> ar = new ArrayList<>();
        try {
            Connection con = myconnection();
            String sql
                    = "select * from onedrive.applicantverification where applicant_email = '"
                    + email + "'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ApplicantVerification av = new ApplicantVerification();
                av.setEmail(rs.getString(1));
                av.setPhone(rs.getString(2));
                av.setTrid(rs.getString(3));
                av.setApplicantEmail(rs.getString(4));

                ar.add(av);
            }

        } catch (Exception e) {
        }
        return ar;
    }

    public static int ccRegister(CustomerRegister cr) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql = "insert into onedrive.register values (?,?,?,?,?)";
            String sql1
                    = "insert into onedrive.customercareregistry values (?,?,?,?,?,?)";
            String sql2 = "insert into onedrive.login values(?,?)";
            String sql3 = "insert into onedrive.position values(?,?)";
            PreparedStatement prst = con.prepareStatement(sql2);
            prst.setString(1, cr.getEmail());
            prst.setString(2, cr.getPassword());

            PreparedStatement prst2 = con.prepareStatement(sql3);
            prst2.setString(1, cr.getEmail());
            prst2.setString(2, cr.getPosition());

            PreparedStatement user = con.prepareStatement(sql);
            user.setString(1, cr.getFirstname());
            user.setString(2, cr.getLastname());
            user.setString(3, cr.getPhone());
            user.setString(4, cr.getPassword());
            user.setString(5, cr.getEmail());

            PreparedStatement ps = con.prepareStatement(sql1);
            ps.setString(1, cr.getFirstname());
            ps.setString(2, cr.getLastname());
            ps.setString(3, cr.getPhone());
            ps.setString(4, cr.getPassword());
            ps.setString(5, cr.getEmail());
            ps.setString(6, cr.getRegisteredBy());

            i = user.executeUpdate();
            i += prst.executeUpdate();
            i += ps.executeUpdate();
            i += prst2.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static int LoanAgreement(LoanAgr lr, FileItem fi) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql
                    = "insert into onedrive.loanagreement values(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, lr.getEmail());
            ps.setString(2, lr.getTrid());
            ps.setBinaryStream(3, fi.getInputStream(), (int) fi.getSize());
            ps.setString(4, lr.getUploadBy());
            ps.setString(5, lr.getDate());
            ps.setString(6, lr.getTime());

            i = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static List<LoanDetails> print(String trid) {
        List<LoanDetails> loanDetail = new ArrayList<>();
        try {
            Connection con = myconnection();
            String sql = "select * from onedrive.loandetails where trid='"
                    + trid + "' AND status='Submitted'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                LoanDetails ld = new LoanDetails();
                ld.setTrid(rs.getString(1));
                ld.setLoanamount(rs.getString(2));
                ld.setInterest(rs.getString(3));
                ld.setDuration(rs.getString(4));
                ld.setLoandate(rs.getString(5));
                ld.setRepaydate(rs.getString(6));
                ld.setStatus(rs.getString(7));
                ld.setEmail(rs.getString(8));
                loanDetail.add(ld);
            }
        } catch (Exception s) {

        }
        return loanDetail;
    }

    public static List<LoanDetails> transactionRecord(String email) {
        List<LoanDetails> loanDetails = new ArrayList<>();
        try {
            Connection con = myconnection();
            String sql = "select * from onedrive.loandetails where email='"
                    + email + "'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                LoanDetails ld = new LoanDetails();
                ld.setTrid(rs.getString(1));
                ld.setLoanamount(rs.getString(2));
                ld.setInterest(rs.getString(3));
                ld.setDuration(rs.getString(4));
                ld.setLoandate(rs.getString(5));
                ld.setRepaydate(rs.getString(6));
                ld.setStatus(rs.getString(7));
                ld.setEmail(rs.getString(8));
                loanDetails.add(ld);
            }
        } catch (Exception s) {

        }
        return loanDetails;
    }

    public static List<Finance> saveLoanRedeem(String pin) {
        List<Finance> fc = new ArrayList<>();
        try {
            Connection con = myconnection();
            String sql = "select * from onedrive.completepayment where pmtpin='"
                    + pin + "' or trid='" + pin + "'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet r = ps.executeQuery();
            while (r.next()) {
                Finance fn = new Finance();
                fn.setPtmid(r.getString(1));
                fn.setPmtmethd(r.getString(2));
                fn.setPmtpurpose(r.getString(3));
                fn.setSendername(r.getString(4));
                fn.setSendemail(r.getString(5));
                fn.setTrid(r.getString(6));
                fn.setAgentid(r.getString(7));
                fn.setAgentname(r.getString(8));
                fn.setReceivedsection(r.getString(9));
                fn.setPmtpin(r.getString(10));
                fn.setDeposit(r.getFloat(11));
                fn.setBalance(r.getFloat(12));
                fn.setTotal(r.getFloat(13));
                fn.setBonus(r.getFloat(14));
                fn.setStatus(r.getString(15));
                fn.setDate(r.getString(16));

                fc.add(fn);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fc;
    }

    public static int saveRedeem(Redeem rl) {
        int i = 0;

        try {
            Connection con = myconnection();
            String sql
                    = "insert into onedrive.redeem_history values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, rl.getTrid());
            ps.setString(2, rl.getAgentname());
            ps.setString(3, rl.getAgentemail());
            ps.setString(4, rl.getItemowner());
            ps.setString(5, rl.getOwneremail());
            ps.setString(6, rl.getRedeemdate());
            ps.setString(7, rl.getReceiptNo());
            ps.setFloat(8, rl.getAmount());
            ps.setFloat(9, rl.getBalance());
            ps.setString(10, rl.getPmtdate());
            ps.setString(11, rl.getPmtid());
            ps.setString(12, rl.getPmtagent());
            ps.setString(13, rl.getPmtagentid());

            i = ps.executeUpdate();

            String sql2
                    = "update onedrive.loanrequest set status='Redeemed' where transactionid = '"
                    + rl.getTrid() + "' ";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            i += ps2.executeUpdate();

            String sql3
                    = "update onedrive.loandetails set status='Redeemed' where trid = '"
                    + rl.getTrid() + "' ";
            PreparedStatement ps3 = con.prepareStatement(sql3);
            i += ps3.executeUpdate();
        } catch (Exception e) {
        }

        return i;
    }

    public static Redeem getRedeemInfo(String trid) {
        Redeem us = new Redeem();
        try {
            Connection con = myconnection();
            String sql10 = "SELECT * FROM onedrive.redeemloan where trid='"
                    + trid + "'";
            PreparedStatement ps10 = con.prepareStatement(sql10);
            ResultSet r10 = ps10.executeQuery();
            while (r10.next()) {
                us.setTrid(r10.getString(1));
                us.setAgentname(r10.getString(2));
                us.setAgentemail(r10.getString(3));
                us.setItemowner(r10.getString(4));
                us.setOwneremail(r10.getString(5));
                us.setRedeemdate(r10.getString(6));
                us.setReceiptNo(r10.getString(7));
                us.setReceiptNo(r10.getString(7));
                us.setReceiptNo(r10.getString(7));
            }
        } catch (Exception e) {
        }
        return us;
    }

//sendpayment section
    public static int saveSendPayment(MakePayment mk) {
        int i = 0;
        double debit = 0.0;
        double credit = 0.0;
        double total = 0.0;
        double balloan = 0.0;
        String acctno = "";
        String loanacctno = "";

<<<<<<< HEAD
public static int saveSendPayment(MakePayment mk){
    int i=0;
    double debit=0.0;
    double credit=0.0;
    double total=0.0;
    double balloan=0.0;
    String acctno="";
    String loanacctno="";
    
       try{
     Connection con=myconnection();
       
    String sqlloan="select * from onedrive.wallet where email='Loan@kambok.com'";
    PreparedStatement ploan = con.prepareStatement(sqlloan);
    ResultSet rloan = ploan.executeQuery();
    while(rloan.next()){
       balloan=rloan.getDouble(5);
       loanacctno=rloan.getString(2);
=======
        try {
            Connection con = myconnection();

            String sqlloan
                    = "select * from onedrive.wallet where email='Loan@kambok.com'";
            PreparedStatement ploan = con.prepareStatement(sqlloan);
            ResultSet rloan = ploan.executeQuery();
            while (rloan.next()) {
                balloan = rloan.getDouble(5);
                loanacctno = rloan.getString(2);
            }

            if (balloan > mk.getCamount()) {
                double bal = balloan - mk.getCamount();
                String loanbal
                        = "update onedrive.wallet set total=? where email=?";
                PreparedStatement loanb = con.prepareStatement(loanbal);
                loanb.setDouble(1, bal);
                loanb.setString(2, "Loan@kambok.com");
                loanb.executeUpdate();

                String sqlloan1
                        = "insert into onedrive.wallethistory values(?,?,?,?,?,?,?)";
                PreparedStatement psloan2 = con.prepareStatement(sqlloan1);

                psloan2.setString(1, loanacctno);
                psloan2.setDouble(2, mk.getCamount());
                psloan2.setDouble(3, bal);
                psloan2.setString(4, mk.getAgentname());
                psloan2.setString(5, mk.getDate());
                psloan2.setString(6, PaymentCodegenerator.generateRegno());
                psloan2.setString(7, "dr");
                psloan2.executeUpdate();

                String sqll = "select * from onedrive.wallet where email='"
                        + mk.getEmail() + "'";
                PreparedStatement pss = con.prepareStatement(sqll);
                ResultSet rs = pss.executeQuery();
                while (rs.next()) {
                    acctno = rs.getString(2);
                    debit = rs.getDouble(4);
                    total = rs.getDouble(5);
                }

                String sqql
                        = "update onedrive.wallet set debit=?,total=? where email=?";
                PreparedStatement pp = con.prepareStatement(sqql);
                double finadebit = 0.0;
                double deb = mk.getCtotal();
                if (deb > total) {
                    finadebit = deb - total;
                } else {
                    finadebit = total - deb;
                }
                pp.setDouble(1, finadebit);
                pp.setDouble(2, 0.0);
                pp.setString(3, mk.getEmail());
                pp.executeUpdate();

                String sql2
                        = "insert into onedrive.wallethistory values(?,?,?,?,?,?,?)";
                PreparedStatement ps2 = con.prepareStatement(sql2);

                ps2.setString(1, acctno);
                ps2.setDouble(2, mk.getCtotal());
                ps2.setDouble(3, 0.0);
                ps2.setString(4, mk.getAgentname());
                ps2.setString(5, mk.getDate());
                ps2.setString(6, PaymentCodegenerator.generateRegno());
                ps2.setString(7, "dr");
                i += ps2.executeUpdate();

                String sql
                        = "insert into onedrive.makepayment values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, mk.getPmtid());
                ps.setString(2, mk.getVerificationid());
                ps.setString(3, mk.getTrid());
                ps.setString(4, mk.getFirstname());
                ps.setString(5, mk.getLastname());
                ps.setString(6, mk.getEmail());
                ps.setString(7, mk.getPhone());
                ps.setString(8, mk.getDate());
                ps.setString(9, mk.getTime());
                ps.setString(10, mk.getVerifiedstatus());
                ps.setInt(11, mk.getNoexpired());
                ps.setInt(12, mk.getNoextension());
                ps.setInt(13, mk.getNoliquidate());
                ps.setFloat(14, mk.getCamount());
                ps.setFloat(15, mk.getCint());
                ps.setFloat(16, mk.getCtotal());
                ps.setFloat(17, mk.getPamount());
                ps.setFloat(18, mk.getPint());
                ps.setFloat(19, mk.getPtoal());
                ps.setString(20, mk.getBankname());
                ps.setString(21, mk.getAcctno());
                ps.setString(22, mk.getAcctname());
                ps.setString(23, mk.getAgentname());
                ps.setString(24, mk.getPaymentmethod());
                i += ps.executeUpdate();
                String url
                        = "delete from onedrive.collateralverified where verificationid='"
                        + mk.getVerificationid() + "'";
                PreparedStatement pss2 = con.prepareStatement(url);
                pss2.executeUpdate();
            } else {
                i = 3;
            }
        } catch (Exception ex) {
>>>>>>> aa28abda898f0939df5d6b38ad57710caaa461ed
        }
        return i;
    }

    public static List<AdminUser> getStaff() {
        List<AdminUser> adminUser = new ArrayList<>();
        try {
            Connection con = myconnection();
            String sql = "SELECT * FROM onedrive.adminregister";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AdminUser adu = new AdminUser();
                adu.setFirstname(rs.getString(1));
                adu.setLastname(rs.getString(2));
                adu.setPosition(rs.getString(3));
                adu.setPhone(rs.getString(4));
                adu.setEmail(rs.getString(5));
                adu.setPassword(rs.getString(6));
                adminUser.add(adu);
            }
        } catch (Exception e) {
        }
        return adminUser;
    }

    public static int editStaff(AdminUser adminUser) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql = "update onedrive.adminregister set position='"
                    + adminUser.getPosition() + "', phone='" + adminUser.
                    getPhone() + "' where email='" + adminUser.getEmail() + "'";
            String sql2 = "update onedrive.admin set position='" + adminUser.
                    getPosition() + "' where username='" + adminUser.getEmail()
                    + "'";
            String sql3 = "update onedrive.position set position='" + adminUser.
                    getPosition() + "' where username='" + adminUser.getEmail()
                    + "'";
            PreparedStatement ps = con.prepareStatement(sql);
            i = ps.executeUpdate();

            PreparedStatement ps2 = con.prepareStatement(sql2);
            i += ps2.executeUpdate();

            PreparedStatement ps3 = con.prepareStatement(sql3);
            i += ps3.executeUpdate();

        } catch (Exception e) {
        }

        return i;
    }

    public static int deleteStaff(AdminUser adminUser) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql = "DELETE FROM onedrive.adminregister where email=?";
            String sql2 = "DELETE FROM onedrive.admin where username=?";
            String sql3 = "DELETE FROM onedrive.login where username=?";
            String sql4 = "DELETE FROM onedrive.position where username=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, adminUser.getEmail());
            i = ps.executeUpdate();
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setString(1, adminUser.getEmail());
            i += ps2.executeUpdate();
            PreparedStatement ps3 = con.prepareStatement(sql3);
            ps3.setString(1, adminUser.getEmail());
            i += ps3.executeUpdate();
            PreparedStatement ps4 = con.prepareStatement(sql4);
            ps4.setString(1, adminUser.getEmail());
            i += ps4.executeUpdate();

        } catch (Exception e) {
        }
        return i;
    }

    public static AdminUser viewSingleStaff(String email) {
        AdminUser adu = new AdminUser();
        try {
            Connection con = myconnection();

            String sql = "SELECT * FROM onedrive.adminregister WHERE email='"
                    + email + "'";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                adu.setFirstname(rs.getString(1));
                adu.setLastname(rs.getString(2));
                adu.setPosition(rs.getString(3));
                adu.setPhone(rs.getString(4));
                adu.setEmail(rs.getString(5));
                adu.setPassword(rs.getString(6));
            }
        } catch (Exception e) {
        }
        return adu;
    }

    public static int LoanAds(Ads ads) {
        int i = 0;

        try {
            Connection con = myconnection();
            String sql = "insert into onedrive.loanads values (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, ads.getAdsAmount());
            ps.setDouble(2, ads.getInvestBalance());
            ps.setString(3, ads.getDate());
            ps.setString(4, ads.getAdsID());
            ps.setString(5, ads.getAdsPackage());
            ps.setString(6, ads.getAdsStatus());

            i = ps.executeUpdate();
        } catch (Exception e) {
        }
        return i;
    }

    public static List<Ads> GetLoanAds() {
        List<Ads> ads = new ArrayList<>();
        try {
            Connection con = myconnection();
            String sql = "select * from onedrive.loanads";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Ads ad = new Ads();
                ad.setAdsAmount(rs.getDouble(1));
                ad.setInvestBalance(rs.getDouble(2));
                ad.setDate(rs.getString(3));
                ad.setAdsID(rs.getString(4));
                ad.setAdsPackage(rs.getString(5));
                ad.setAdsStatus(rs.getString(6));
                ads.add(ad);
            }
        } catch (Exception e) {
        }
        return ads;
    }

    public static Ads GetLoanAdsViaId(String adsId) {
        Ads ads = new Ads();
        try {
            Connection con = myconnection();
            String sql1 = "SELECT * FROM onedrive.loanads where ads_id='"+ adsId + "'";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ResultSet rs = ps1.executeQuery();
            while (rs.next()) {
                ads.setAdsAmount(rs.getDouble(1));
                ads.setInvestBalance(rs.getDouble(2));
                ads.setDate(rs.getString(3));
                ads.setAdsID(rs.getString(4));
                ads.setAdsPackage(rs.getString(5));
                ads.setAdsStatus(rs.getString(6));
            }
        } catch (Exception e) {
        }
        return ads;
    }

    public static Wallet getWallet(String email) {
        Wallet wallet = new Wallet();
        try {
            Connection con = myconnection();
            String sql1 = "SELECT * FROM onedrive.wallet where email='" + email
                    + "'";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                wallet.setEmail(rs1.getString(1));
                wallet.setAcctno(rs1.getString(2));
                wallet.setCredit(rs1.getDouble(3));
                wallet.setDebit(rs1.getDouble(4));
                wallet.setTotal(rs1.getDouble(5));
            }
        } catch (Exception e) {
        }
        return wallet;
    }

    public static int Investment(Investment invest) {
        int i = 0;

        try {
            Connection con = myconnection();
            String sql = "insert into onedrive.investment values (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, invest.getEmail());
            ps.setString(2, invest.getInvestAmt());
            ps.setString(3, invest.getDate());
            ps.setString(4, invest.getAdsID());
            ps.setString(5, invest.getAdsPackage());
            ps.setString(6, invest.getInvestId());

            i = ps.executeUpdate();
        } catch (Exception e) {
        }
        return i;
    }
    
    public static int Investor(InvestorDetails invest) {
        int i = 0;

        try {
            Connection con = myconnection();
            String sql = "insert into onedrive.investor values (?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, invest.getEmail());
            ps.setString(2, invest.getWalletId());
            ps.setString(3, invest.getTranspin());

            i = ps.executeUpdate();
        } catch (Exception e) {
        }
        return i;
    }
    
<<<<<<< HEAD
    String sql2="insert into onedrive.wallethistory values(?,?,?,?,?,?,?)";
    PreparedStatement ps2 = con.prepareStatement(sql2); 
    
      ps2.setString(1, acctno);
      ps2.setDouble(2, mk.getCtotal());
      ps2.setDouble(3, 0.0);
      ps2.setString(4, mk.getAgentname());
      ps2.setString(5, mk.getDate());
      ps2.setString(6, PaymentCodegenerator.generateRegno());
      ps2.setString(7, "dr");
      i+=ps2.executeUpdate();
       
       String sql = "insert into onedrive.makepayment values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
       PreparedStatement ps = con.prepareStatement(sql);
       ps.setString(1, mk.getPmtid());
       ps.setString(2, mk.getVerificationid());
       ps.setString(3, mk.getTrid());
       ps.setString(4, mk.getFirstname());
       ps.setString(5, mk.getLastname());
       ps.setString(6, mk.getEmail());
       ps.setString(7, mk.getPhone());
       ps.setString(8, mk.getDate());
       ps.setString(9, mk.getTime());
       ps.setString(10, mk.getVerifiedstatus());
       ps.setInt(11, mk.getNoexpired());
       ps.setInt(12, mk.getNoextension());
       ps.setInt(13, mk.getNoliquidate());
       ps.setFloat(14, mk.getCamount());
       ps.setFloat(15, mk.getCint());
       ps.setFloat(16, mk.getCtotal());
       ps.setFloat(17, mk.getPamount());
       ps.setFloat(18, mk.getPint());
       ps.setFloat(19, mk.getPtoal());
       ps.setString(20, mk.getBankname());
       ps.setString(21, mk.getAcctno());
       ps.setString(22, mk.getAcctname());
       ps.setString(23, mk.getAgentname());
       ps.setString(24, mk.getPaymentmethod());
       i+=ps.executeUpdate();
      String url="delete from onedrive.collateralverified where verificationid='"+mk.getVerificationid()+"'";
      PreparedStatement pss2 = con.prepareStatement(url); 
      pss2.executeUpdate();
       }else{
       i=3;
       }
}catch(Exception ex){
}
    return i;
}

public static List<AdminUser> getStaff(){
    List<AdminUser> adminUser = new ArrayList<>();
    try{
        Connection con = myconnection();
        String sql = "SELECT * FROM onedrive.adminregister";
        PreparedStatement ps = con.prepareStatement(sql);
       
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
           AdminUser adu= new AdminUser(); 
            adu.setFirstname(rs.getString(1));
            adu.setLastname(rs.getString(2));
            adu.setPosition(rs.getString(3));
            adu.setPhone(rs.getString(4));
            adu.setEmail(rs.getString(5));
            adu.setPassword(rs.getString(6));
            adminUser.add(adu);
        }
    }catch(Exception e){}
    return adminUser;
}

public static int editStaff(AdminUser adminUser){
    int i = 0;
    try{
        Connection con = myconnection();
        String sql = "update onedrive.adminregister set position='"+adminUser.getPosition()+"', phone='"+adminUser.getPhone()+"' where email='"+adminUser.getEmail()+"'";
        String sql2 = "update onedrive.admin set position='"+adminUser.getPosition()+"' where username='"+adminUser.getEmail()+"'";
        String sql3 = "update onedrive.position set position='"+adminUser.getPosition()+"' where username='"+adminUser.getEmail()+"'";
        PreparedStatement ps = con.prepareStatement(sql);
        i=ps.executeUpdate();
        
        PreparedStatement ps2 = con.prepareStatement(sql2);
        i+=ps2.executeUpdate();
        
        PreparedStatement ps3 = con.prepareStatement(sql3);
        i+=ps3.executeUpdate();
        
    }catch(Exception e){}
    
    return i;
} 

public static int deleteStaff(AdminUser adminUser){
    int i=0;
     try{
        Connection con = myconnection();
        String sql = "DELETE FROM onedrive.adminregister where email=?";
        String sql2 = "DELETE FROM onedrive.admin where username=?";
        String sql3 = "DELETE FROM onedrive.login where username=?";
        String sql4 = "DELETE FROM onedrive.position where username=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, adminUser.getEmail());
        i=ps.executeUpdate();
        PreparedStatement ps2 = con.prepareStatement(sql2);
        ps2.setString(1, adminUser.getEmail());
        i+=ps2.executeUpdate();
        PreparedStatement ps3 = con.prepareStatement(sql3);
        ps3.setString(1, adminUser.getEmail());
        i+=ps3.executeUpdate();
        PreparedStatement ps4 = con.prepareStatement(sql4);
        ps4.setString(1, adminUser.getEmail());
        i+=ps4.executeUpdate();
        
    }catch(Exception e){}
    return i;
}

public static AdminUser viewSingleStaff(String email){
    AdminUser adu= new AdminUser();
     try{
        Connection con = myconnection();
        
        String sql = "SELECT * FROM onedrive.adminregister WHERE email='"+email+"'";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            adu.setFirstname(rs.getString(1));
            adu.setLastname(rs.getString(2));
            adu.setPosition(rs.getString(3));
            adu.setPhone(rs.getString(4));
            adu.setEmail(rs.getString(5));
            adu.setPassword(rs.getString(6));
        }
    }catch(Exception e){}
    return adu;
}



public static Wallet getWallet(String email){
    Wallet wallet = new Wallet();
    try{
       Connection con=myconnection(); 
       String sql1 = "SELECT * FROM onedrive.wallet where email='"+email+"'";
        PreparedStatement ps1 = con.prepareStatement(sql1);
        ResultSet rs1=ps1.executeQuery();
        while(rs1.next()){
            wallet.setEmail(rs1.getString(1));
            wallet.setAcctno(rs1.getString(2));
            wallet.setCredit(rs1.getDouble(3));
            wallet.setDebit(rs1.getDouble(4));
            wallet.setTotal(rs1.getDouble(5));            
        }
    }catch(Exception e){}
    return wallet;
}

public static int Investment(Investment invest){
    int i=0;
=======
    public static int saveInvestorTpin(InvestorDetails tpin){
        int i=0;
        try{
            Connection con = myconnection();
            String sql = "UPDATE onedrive.investor set transpin = '"+tpin.getTranspin()+"' where email = '"+tpin.getEmail()+"'";
            PreparedStatement ps = con.prepareStatement(sql);
            i = ps.executeUpdate();
        }catch(Exception e){}
        return i;
    }
>>>>>>> aa28abda898f0939df5d6b38ad57710caaa461ed
    
    public static InvestorDetails getInvestor(String email) {
        InvestorDetails id = new InvestorDetails();
        try {
            Connection con = myconnection();
            String sql1 = "SELECT * FROM onedrive.investor where email='" + email+ "'";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                id.setEmail(rs1.getString(1));
                id.setWalletId(rs1.getString(2));
                id.setTranspin(rs1.getString(3));
            }
        } catch (Exception e) {
        }
        return id;
    }
    
    public static InvestorDetails getInvestorDetails(String email) {
        InvestorDetails id = new InvestorDetails();
        try {
            Connection con = myconnection();
            String sql1 = "SELECT * FROM onedrive.investordetails where email='" + email+ "'";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                id.setEmail(rs1.getString(1));
                id.setWalletId(rs1.getString(2));
                id.setWalletBalance(rs1.getDouble(3));
                id.setCredit(rs1.getDouble(4));
                id.setDebit(rs1.getDouble(5));
                id.setInvestmentHistory(rs1.getDouble(6));
                id.setInterest(rs1.getDouble(7));
                id.setMonth(rs1.getInt(8));
                id.setDays(rs1.getInt(9));
                id.setYear(rs1.getInt(10));
                id.setDate(rs1.getString(11));
            }
        } catch (Exception e) {
        }
        return id;
    }
    
    public static List<InvestorDetails> getInvestmentId(String email){
        List<InvestorDetails> investRecord = new ArrayList<>();
        try{
            Connection con = myconnection();
            String sql1 = "SELECT investmentID FROM onedrive.investordetails where email='"+email+"'";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                InvestorDetails id = new InvestorDetails();
                id.setInvestmentID(rs1.getString(1));
                investRecord.add(id);
            }
        }catch(Exception e){}
        return investRecord;
    }
    
    public static List<InvestorDetails> getInvestmentId2(String email){
        List<InvestorDetails> investRecord = new ArrayList<>();
        try{
            Connection con = myconnection();
            String sql1 = "SELECT * FROM onedrive.investordetails where email='"+email+"'";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                InvestorDetails id = new InvestorDetails();
                id.setInvestmentID(rs1.getString(1));
                id.setEmail(rs1.getString(2));
                id.setWalletId(rs1.getString(3));
                id.setWalletBalance(rs1.getDouble(4));
                id.setCredit(rs1.getDouble(5));
                id.setDebit(rs1.getDouble(6));
                id.setInvestmentHistory(rs1.getDouble(7));
                id.setInterest(rs1.getDouble(8));
                id.setMonth(rs1.getInt(9));
                id.setDays(rs1.getInt(10));
                id.setYear(rs1.getInt(11));
                id.setDate(rs1.getString(12));
                id.setStatus(rs1.getString(13));
                investRecord.add(id);
            }
        }catch(Exception e){}
        return investRecord;
    }
    
    public static List<InvestorDetails> getInvestmentRecord(String investId){
        List<InvestorDetails> investRecord = new ArrayList<>();
        try{
            Connection con = myconnection();
            String sql1 = "SELECT * FROM onedrive.investordetails where investmentID='" + investId+ "'";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                InvestorDetails id = new InvestorDetails();
                id.setInvestmentID(rs1.getString(1));
                id.setEmail(rs1.getString(2));
                id.setWalletId(rs1.getString(3));
                id.setWalletBalance(rs1.getDouble(4));
                id.setCredit(rs1.getDouble(5));
                id.setDebit(rs1.getDouble(6));
                id.setInvestmentHistory(rs1.getDouble(7));
                id.setInterest(rs1.getDouble(8));
                id.setMonth(rs1.getInt(9));
                id.setDays(rs1.getInt(10));
                id.setYear(rs1.getInt(11));
                id.setDate(rs1.getString(12));
                id.setStatus(rs1.getString(13));
                investRecord.add(id);
            }
        }catch(Exception e){}
        return investRecord;
    }
    
    public static int LoanInvest (InvestorDetails invest, Ads ads, Wallet wallet) {
        int i = 0;
        try {
            Connection con = myconnection();
            String sql = "update onedrive.loanads set investBalance=?, ads_status=?, package=? where ads_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, ads.getInvestBalance());
            ps.setString(2, ads.getAdsStatus());
            ps.setString(3, ads.getAdsPackage());
            ps.setString(4, ads.getAdsID());
            i = ps.executeUpdate();
            
            String sql2 = "insert into onedrive.wallethistory (acctno, amount, balance, sender, date, status) values(?,?,?,?,?,?)";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setString(1, wallet.getAcctno());
            ps2.setDouble(2, wallet.getCredit());
            ps2.setDouble(3, wallet.getBalance());
            ps2.setString(4, wallet.getSender());
            ps2.setString(5, wallet.getDate());
            ps2.setString(6, wallet.getStatus());
            i += ps2.executeUpdate();
            
            String sql3 = "insert into onedrive.investordetails values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps3 = con.prepareStatement(sql3);
            ps3.setString(1, invest.getInvestmentID());
            ps3.setString(2, invest.getEmail());
            ps3.setString(3, invest.getWalletId());
            ps3.setDouble(4, invest.getWalletBalance());
            ps3.setDouble(5, invest.getCredit());
            ps3.setDouble(6, invest.getDebit());
            ps3.setDouble(7, invest.getInvestmentHistory());
            ps3.setDouble(8, invest.getInterest());
            ps3.setInt(9, invest.getMonth());
            ps3.setInt(10, invest.getDays());
            ps3.setInt(11, invest.getYear());
            ps3.setString(12, invest.getDate());
            ps3.setString(13, invest.getStatus());
            i += ps3.executeUpdate();
            
            String sql4 = "update onedrive.wallet set debit=?, total=? where acctno=?";
            PreparedStatement ps4 = con.prepareStatement(sql4);
            ps4.setDouble(1, wallet.getDebit());
            ps4.setDouble(2, wallet.getTotal());
            ps4.setString(3, wallet.getAcctno());
            i += ps4.executeUpdate();
        } catch (Exception e) {
        }
        return i;
    }
    
    public static int InvestmentReturn (InvestorDetails invest) {
            
        int i = 0;

        try {
            Connection con = myconnection();
            String sql = "update onedrive.wallet set credit='"+invest.getCredit()+"', total='"+invest.getWalletBalance()+"' where acctno='"+invest.getWalletId()+"'";
            PreparedStatement ps = con.prepareStatement(sql);
            i = ps.executeUpdate();
            
            String sql2 = "insert into onedrive.investmenthistory values (?,?,?,?,?,?,?,?)";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setString(1, invest.getInvestmentID());
            ps2.setString(2, invest.getEmail());
            ps2.setString(3, invest.getWalletId());
            ps2.setDouble(4, invest.getInvestmentHistory());
            ps2.setDouble(5, invest.getInterest());
            ps2.setDouble(6, invest.getTotalAmount());
            ps2.setString(7, invest.getDate());
            ps2.setString(8, invest.getReturnDate());
            
            i+= ps2.executeUpdate();
            
            String sql3 = "insert into onedrive.investordetails (investmentID, email, walletID, walletBalance, credit, investmentHistory, interest, month, days, year, date, status) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps3 = con.prepareStatement(sql3);
            ps3.setString(1, invest.getInvestmentID());
            ps3.setString(2, invest.getEmail());
            ps3.setString(3, invest.getWalletId());
            ps3.setDouble(4, invest.getWalletBalance());
            ps3.setDouble(5, invest.getCredit());
            ps3.setDouble(6, invest.getInvestmentHistory());
            ps3.setDouble(7, invest.getInterest());
            ps3.setInt(8, invest.getMonth());
            ps3.setInt(9, invest.getDays());
            ps3.setInt(10, invest.getYear());
            ps3.setString(11, invest.getReturnDate());
            ps3.setString(12, invest.getStatus());
            i+= ps3.executeUpdate();
            
            String sql4 = "update onedrive.investordetails set status = '"+invest.getStatus()+"' where investmentID='"+invest.getInvestmentID()+"'";
            PreparedStatement ps4 = con.prepareStatement(sql4);
            i+= ps4.executeUpdate();
        }catch(Exception e){}
        return i;
    }
    
    public static InvestorDetails getInvestorCurrentRecord(String email){
        InvestorDetails id = new InvestorDetails();
        try{
            Connection con = myconnection();
            String sql1 = "SELECT * FROM  onedrive.investmenthistory where email='" + email+ "'";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                id.setInvestmentID(rs1.getString(1));
                id.setEmail(rs1.getString(2));
                id.setWalletId(rs1.getString(3));
                id.setInvestmentHistory(rs1.getDouble(4));
                id.setInterest(rs1.getDouble(5));
                id.setTotalAmount(rs1.getDouble(6));
                id.setDate(rs1.getString(7));
                id.setReturnDate(rs1.getString(8));               
            }
        }catch(Exception e){}
        return id;
    }
    
    public static List<InvestorDetails> getInvestorCurrentRecord2(String investId){
        List<InvestorDetails> ir = new ArrayList<>();
        try{
            Connection con = myconnection();
            String sql1 = "SELECT * FROM onedrive.investmenthistory where investmentID='" + investId+ "'";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                InvestorDetails id = new InvestorDetails();
                id.setInvestmentID(rs1.getString(1));
                id.setEmail(rs1.getString(2));
                id.setWalletId(rs1.getString(3));
                id.setInvestmentHistory(rs1.getDouble(4));
                id.setInterest(rs1.getDouble(5));
                id.setTotalAmount(rs1.getDouble(6));
                id.setDate(rs1.getString(7));
                id.setReturnDate(rs1.getString(8)); 
                ir.add(id);
            }
        }catch(Exception e){}
        return ir;
    }
    
    public static int message(Message message){
        int i=0;
        try{
            Connection con = myconnection();
            String sql = "insert into onedrive.message value (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, message.getEmail());
            ps.setString(2, message.getInvestmentId());
            ps.setString(3, message.getMessageId());
            ps.setString(4, message.getStatus());
            i = ps.executeUpdate();
        }catch(Exception e){}
        return i;
    }
     
    public static List<Message> getMessage(String email){
        List<Message> msg = new ArrayList<>();
        try{
            Connection con = myconnection();
            String sql1 = "SELECT * FROM onedrive.message where email='" + email+ "'";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                Message message = new Message();
                message.setEmail(rs1.getString(1));
                message.setInvestmentId(rs1.getString(2));
                message.setMessageId(rs1.getString(3));
                message.setStatus(rs1.getString(4));
                msg.add(message);
            }
        }catch(Exception e){}
        return msg;
    }
    
    public static List<Message> getMessage2(String investmentId){
        List<Message> msg = new ArrayList<>();
        try{
            Connection con = myconnection();
            String sql1 = "SELECT * FROM onedrive.message where investmentId='" + investmentId+ "'";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                Message message = new Message();
                message.setEmail(rs1.getString(1));
                message.setInvestmentId(rs1.getString(2));
                message.setMessageId(rs1.getString(3));
                message.setStatus(rs1.getString(4));
                msg.add(message);
            }
        }catch(Exception e){}
        return msg;
    }
    
    public static List<Message> getMessage3(String messageId){
        List<Message> msg = new ArrayList<>();
        try{
            Connection con = myconnection();
            String sql1 = "SELECT * FROM onedrive.message where messageId='" + messageId+ "'";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                Message message = new Message();
                message.setEmail(rs1.getString(1));
                message.setInvestmentId(rs1.getString(2));
                message.setMessageId(rs1.getString(3));
                message.setStatus(rs1.getString(4));
                msg.add(message);
            }
        }catch(Exception e){}
        return msg;
    }

}
