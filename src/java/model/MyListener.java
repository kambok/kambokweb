
package model;

import java.sql.*;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class MyListener implements ServletContextListener{
  
          
static String name="com.mysql.jdbc.Driver";
static String url="jdbc:mysql://localhost:3306/";
static String username="root";
static String password="kambok123";

public static Connection myconnection(){
    Connection con=null;
try{
	Class.forName(name).newInstance();
   con=DriverManager.getConnection(url,username,password);
   
}catch(Exception e){
System.out.println(e);}

	return con;
}
    public void contextInitialized(ServletContextEvent event) {  
    try{  
        Connection con=myconnection();
        String database = "create database onedrive";
        String sql="create table onedrive.loanRequest(id int not null AUTO_INCREMENT,colname varchar(200),colid varchar(200),colcondition varchar(200),transactionid varchar(100),mytime varchar(100),mydate varchar(200),collateralImageF longBlob,collateralImageB longBlob,status varchar(100),email varchar(200),PRIMARY KEY(id))";
        String sql2="create table onedrive.register(firstname varchar(200),lastname varchar(200),phone varchar(200),password varchar(200),email varchar(200), primary key(email))";   
        String sql3="create table onedrive.adminregister(firstname varchar(200),lastname varchar(200),position varchar(200),phone varchar(200),email varchar(200),password varchar(200))";
        String sql4="create table onedrive.approverequest(email varchar(100),colname varchar(100),trid varchar(100),amount varchar(100),status varchar(100))";
        String sql5="create table onedrive.declinedRequest(email varchar(100),colname varchar(100),trid varchar(100),amount varchar(100),status varchar(100))";
        String sql6="create table onedrive.loandetails(trid varchar(100),amount varchar(100),interest varchar(100),duration varchar(100),loandate varchar(100),repaydate varchar(100),status varchar(100), email varchar(200))";
        String sql7="create table onedrive.history(email varchar(100),trid varchar(100),loanamount varchar(100),interest varchar(100),duration varchar(100),date varchar(100),status varchar(100))";
        String sql8="create table onedrive.payment(email varchar(100),trid varchar(100),balance double,deposit double,total double,status varchar(100),Date varchar(100),pin varchar(100))";
        String sql9="create table onedrive.address(email varchar(100),address varchar(100),state varchar(100),phone varchar(100),occupation varchar(100),purpose varchar(100),gender varchar(100) )";
        String sql10="create table onedrive.bank(email varchar(100),acctname varchar(100), acctno varchar(100),bankname varchar(100))";
        String sql11 = "create table onedrive.admin (name varchar(200), username varchar(200), password varchar(200), position varchar(200))";
        String sql12 = "create table onedrive.login (username varchar(200), password varchar(200))";
        String sql13 = "create table onedrive.position(username varchar(200), position varchar(200))";
        String sql14 = "insert into onedrive.admin values ('Kamoru Mohammed', 'kambok@gmail.com', 'admin123', 'Admin')";
        String sql15 = "insert into onedrive.login values ('kambok@gmail.com', 'admin123')";
        String sql16 = "insert into onedrive.position values ('kambok@gmail.com', 'Admin')";
        String sql17 = "create table onedrive.userpassport (email varchar(100), passport longBlob)";
        String sql18 = "create table onedrive.collateralverified(email varchar(100),phone varchar(100),verificationid varchar(100),date varchar(100),time varchar(100),trid varchar(100),loanamount float,total float,interest float, firstname varchar(100),lastname varchar(100),status varchar(100),agentname varchar(100),agentemail varchar(100))";
        String sql19 = "create table onedrive.applicantverification(agent_email varchar(100), phone varchar(100), trid varchar(100), applicant_email varchar(100), applicantid longblob)";
        String sql20 = "create table onedrive.completepayment(pmtid varchar(100),pmtmethod varchar(100),pmtpurpose varchar(100),sendername varchar(100),senderemail varchar(100),trid varchar(100),agentid varchar(100),agentname varchar(100),receiversection varchar(100),pmtpin varchar(100), deposit float,balance float,total float,bonus float,status varchar(100),date varchar(100))";
        String sql21="create table onedrive.finance(pmtid varchar(100),pmtmethod varchar(100),pmtpurpose varchar(100),sendername varchar(100),senderemail varchar(100),trid varchar(100),agentid varchar(100),agentname varchar(100),receiversection varchar(100),pmtpin varchar(100), deposit float,balance float,total float,bonus float,status varchar(100),date varchar(100))";
        String sql22="create table onedrive.processpayment(psid varchar(100),trid varchar(100),verifiedid varchar(100),verifiedstatus varchar(100), email varchar(100),phone varchar(100), amount float,expired int,extension int,liquidated int,curent int,firstname varchar(100),lastname varchar(100),date varchar(100),time varchar(100),camt float,cint float,ctotal float,pamt float,pint float,ptotal float)";
        String sql23="create table onedrive.customercareregistry(firstname varchar(200),lastname varchar(200),phone varchar(200),password varchar(200),email varchar(200), RegisteredBy varchar(200))";   
        String sql24="create table onedrive.loanagreement(Email varchar(200),trid varchar(200),loanagreement longBlob,UploadBy varchar(200),date varchar(200), time varchar(200))";   
        String sql25="create table onedrive.loanrequesthistory(id int not null AUTO_INCREMENT,colname varchar(200),colid varchar(200),colcondition varchar(200),transactionid varchar(100),mytime varchar(100),mydate varchar(200),collateralImageF longBlob,collateralImageB longBlob,status varchar(100),email varchar(200),PRIMARY KEY(id))";
        String sql26="create table onedrive.approverequesthistory(email varchar(100),colname varchar(100),trid varchar(100),amount varchar(100),status varchar(100))";
        String sql27="create table onedrive.loandetailshistory(trid varchar(100),amount varchar(100),interest varchar(100),duration varchar(100),loandate varchar(100),repaydate varchar(100),status varchar(100), email varchar(200))";
        String sql28="create table onedrive.extension(trid varchar(100),extid varchar(100),extdate varchar(100),predate varchar(100),extno numeric,exduration numeric, extinterest double,extamount double,extotal double)";
        String sql29="create table onedrive.wallet(email varchar(100),acctno varchar(100),credit double,debit double,total double)";
        String sql30 = "create table onedrive.redeem_history(trid varchar(100), agentname varchar(100), agentemail varchar(100), item_owner_name varchar(100), item_owner_email varchar(100), redeem_date varchar(100), receiptNo varchar(100), amount float, balance float, pmtdate varchar(100), pmptpin varchar(100), pmtagent varchar(100), pmtagentID varchar(100))";
        String sql31 = "create table onedrive.wallethistory(acctno varchar(100),amount double,balance double,sender varchar(100),date varchar(100),pin varchar(100),status varchar(100))";
        String sql32 = "insert into onedrive.wallet values ('Loan@kambok.com','3000000002',0.0,0.0,0.0)";
        String sql33 = "insert into onedrive.wallet values ('Training@kambok.com','3000000001',0.0,0.0,0.0)";
        String sql34 = "create table onedrive.makepayment(pmtid varchar(100),verifiedid varchar(100),trid varchar(100),firstname varchar(100),lastname varchar(100),email varchar(100), phone varchar(100), date varchar(100), time varchar(100), VerifiedStatus varchar(100),Noexpired int,Noextension int,Noliquidate int,camount float,cinterest float,ctotal float,pamount float,pinterest float,ptotal float,bankname varchar(100),acctno varchar(100),acctname varchar(100),agentname varchar(100),paymentmethod varchar(100));";
        String sql35="create table onedrive.admininvestment(walletno varchar(100),email varchar(100),refid varchar(100),month int,days int,year int,date varchar(100),status varchar(100),monthlyinvest double,yearlreturn double,capitalinvest double,monthlyreturn double)";
        String sql36="create table onedrive.admininvesthistory(walletno varchar(100),date varchar(100),type varchar(100),status varchar(100),amount double,balance double)";
        String sql37="insert into onedrive.admininvestment values('3000000002','Loan@kambok.com','9218902',0,0,0,'date','valid',0.0,0.0,0.0,0.0)";
        PreparedStatement ps1 = con.prepareStatement(database);
        ps1.executeUpdate();
        PreparedStatement ps=con.prepareStatement(sql);
        ps.executeUpdate();
        PreparedStatement ps2=con.prepareStatement(sql2);
        ps2.executeUpdate();
        PreparedStatement ps3=con.prepareStatement(sql3);
        ps3.executeUpdate();
        PreparedStatement ps4=con.prepareStatement(sql4);
        ps4.executeUpdate();
        PreparedStatement ps5=con.prepareStatement(sql5);
        ps5.executeUpdate();
        PreparedStatement ps6=con.prepareStatement(sql6);
        ps6.executeUpdate();
        PreparedStatement ps7=con.prepareStatement(sql7);
        ps7.executeUpdate(); 
        PreparedStatement ps8=con.prepareStatement(sql8);
        ps8.executeUpdate();
        PreparedStatement ps9=con.prepareStatement(sql9);
        ps9.executeUpdate();
        PreparedStatement ps10=con.prepareStatement(sql10);
        ps10.executeUpdate();
        PreparedStatement ps11=con.prepareStatement(sql11);
        ps11.executeUpdate();
        PreparedStatement ps12=con.prepareStatement(sql12);
        ps12.executeUpdate();
        PreparedStatement ps13=con.prepareStatement(sql13);
        ps13.executeUpdate();
        PreparedStatement ps14=con.prepareStatement(sql14);
        ps14.executeUpdate();
        PreparedStatement ps15=con.prepareStatement(sql15);
        ps15.executeUpdate();
        PreparedStatement ps16=con.prepareStatement(sql16);
        ps16.executeUpdate();
        PreparedStatement ps17=con.prepareStatement(sql17);
        ps17.executeUpdate();
        PreparedStatement ps18=con.prepareStatement(sql18);
        ps18.executeUpdate();
        PreparedStatement ps19=con.prepareStatement(sql19);
        ps19.executeUpdate();
        PreparedStatement ps20=con.prepareStatement(sql20);
        ps20.executeUpdate();
        PreparedStatement ps21=con.prepareStatement(sql21);
        ps21.executeUpdate();
        PreparedStatement ps22=con.prepareStatement(sql22);
        ps22.executeUpdate();
        PreparedStatement ps23=con.prepareStatement(sql23);
        ps23.executeUpdate();
        PreparedStatement ps24=con.prepareStatement(sql24);
        ps24.executeUpdate();
        PreparedStatement ps25=con.prepareStatement(sql25);
        ps25.executeUpdate();
        PreparedStatement ps26=con.prepareStatement(sql26);
        ps26.executeUpdate();
        PreparedStatement ps27=con.prepareStatement(sql27);
        ps27.executeUpdate();
        PreparedStatement ps28=con.prepareStatement(sql28);
        ps28.executeUpdate();
        PreparedStatement ps29=con.prepareStatement(sql29);
        ps29.executeUpdate();
        PreparedStatement ps30=con.prepareStatement(sql30);
        ps30.executeUpdate();
        PreparedStatement ps31=con.prepareStatement(sql31);
        ps31.executeUpdate();
        PreparedStatement ps32=con.prepareStatement(sql32);
        ps32.executeUpdate();
        PreparedStatement ps33=con.prepareStatement(sql33);
        ps33.executeUpdate();
        PreparedStatement ps34=con.prepareStatement(sql34);
        ps34.executeUpdate();
        PreparedStatement ps35=con.prepareStatement(sql35);
        ps35.executeUpdate();
        PreparedStatement ps36=con.prepareStatement(sql36);
        ps36.executeUpdate();
        PreparedStatement ps37=con.prepareStatement(sql37);
        ps37.executeUpdate();
    }catch(Exception e){e.printStackTrace();}  
    }  
      
    public void contextDestroyed(ServletContextEvent arg0) {} 
    
    }  
