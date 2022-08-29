<%-- 
    Document   : dashboard
    Created on : Jun 20, 2022, 3:18:46 PM
    Author     : User
--%>

<%@page import="model.MakePayment"%>
<%@page import="model.CollateralVerify"%>
<%@page import="model.Payment"%>
<%@page import="imageloader.Loader"%>
<%@page import="java.util.List"%>
<%@page import="model.LoanRequest"%>
<%@page import="model.AdminUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<META Http-Equiv="Expires" Content="0">

    <title>Send payment</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
  	  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
   
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> 
 <link rel="stylesheet" href="fontawesome-free-6.1.1-web/css/all.css" />
 <link rel="icon" type="image/x-icon" href="kam.png">
  <style>
  
.sidebar {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  z-index: 100;
  padding: 90px 0 0;
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
  z-index: 99;
}

@media (max-width: 767.98px) {
  .sidebar {
    top: 11.5rem;
    padding: 0;
  }
}

.navbar {
  box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .1);
}

@media (min-width: 767.98px) {
  .navbar {
    top: 0;
    position: sticky;
    z-index: 999;
  }
}

.sidebar .nav-link {
  color: #333;
}

.sidebar .nav-link.active {
  color: #0d6efd;
}

i{
  font-size: 1.3rem;
  text-align: left;
}

.nav-item a{
  transition: .5s ease;
  text-align: left;
}

.nav-item a:hover{
  color: #0d6efd;
}
  
  
  </style>
         <script>  
var request;

function sendInfo()  
{  
var pid=document.myform.pid.value;
var vid=document.myform.vid.value;
var tid=document.myform.tid.value;
var fn=document.myform.fn.value;
var ln=document.myform.ln.value;
var em=document.myform.e.value;
var phone=document.myform.p.value;
var date=document.myform.d.value;
var time=document.myform.t.value;
var vs=document.myform.vs.value;
var noep=document.myform.noep.value;
var noex=document.myform.noex.value;
var noli=document.myform.noli.value;
var camt=document.myform.camt.value;
var cint=document.myform.cint.value;
var ctotal=document.myform.ctotal.value;
var pamt=document.myform.pamt.value;
var pint=document.myform.pint.value;
var ptotal=document.myform.ptotal.value;
var bankname=document.myform.bankname.value;
var acctname=document.myform.acctname.value;
var acctno=document.myform.acctno.value;
var agentname=document.myform.agentname.value;
var pmethod=document.myform.pmethod.value;


//var url="SendPayment?pid="+pid+"&vid="+vid+"&pmethod="+pmethod+"&acctname="+acctname+"&acctno="+acctno+"&bankname="+bankname+"&ptotal="+ptotal+"&pint="+pint+"&pamt="+pamt;
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try  
{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}
}
  
  
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('cf').innerHTML=val; 

} 
}



</script> 
  
  <script>
  function dp(){
  var tc=document.getElementById("c");
  var dc=document.getElementById("d");
  var ec=document.getElementById("e");
  tc.style.display="inline-block";
  dc.style.display="block";

 tc.style.fontSize="20px";
 ec.style.display="none";
  }
  
  </script>
  <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        
        setTimeout("preventBack()", 0.0);
        window.onunload = function () { null };
    </script>
    <script>
 function calculate()  
{  
var total=Number(document.myform.total.value);
var trid=document.myform.trid.value;
var deposit=Number(document.myform.deposit.value);
var balance=document.myform.balance.value;
var tt=Number(total);
var dep=Number(deposit);
var bal=Number(balance);
if(dep<=tt){
document.getElementById("balance").value=total-deposit
 
}else{
   document.getElementById("balance").value="invalid amount";
   
}
}
</script>
 </head>
<body>
     <script type = "text/javascript" >
          history.pushState(null, null, 'sendpayment.jsp');
          window.addEventListener('popstate', function (event) {
              history.pushState(null, null, 'sendpayment.jsp');
      });

     </script>
     
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>

   
    
     <%!String name="",position="",email="";
 MakePayment cv=new MakePayment();
 
  static float isnonef(String nu){
           float a=0.0f;
       if(nu==null){
           a=0.0f;
       }else{
          a= Float.parseFloat(nu);
       }
       return a;
       }
 
         static int isnonei(String nu){
         int a=0;
       if(nu.equals(null)){
           a=0;
       }else{
          a= Integer.parseInt(nu);
       }
       return a;
       }
    %>
    <%
   AdminUser s = (AdminUser)session.getAttribute("staff");
      name=s.getFirstname() + " " + s.getLastname();
      position=s.getPosition();
      email=s.getEmail();
    if((position.equals("Admin") || position.equals("Finance")) && (!email.equals("") || email!=null)){
       
        cv=data.Database.getcollateralverifiedid((String)session.getAttribute("pin"));
     
        if(cv.getVerificationid()!=null){
           
        }else{
             response.sendRedirect("processpayment.jsp");
             
                }
        
    }else{
    response.sendRedirect("index.html");
    }   
    
    %> 
<nav class="navbar navbar-light bg-light p-3">
  <div class="d-flex col-12 col-md-3 col-lg-2 mb-2 mb-lg-0 flex-wrap flex-md-nowrap justify-content-between">
      <a class="navbar-brand" href="#">
          <img src="images/kam.png" width="40px" class="rounded-pill">&nbsp; <%=position%>
		  
      </a>
      <button class="navbar-toggler d-md-none collapsed mb-3" type="button" data-toggle="collapse" data-target="#sidebar" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
      </button>
  </div>
  <div class="col-12 col-md-4 col-lg-2">
  <form action="kambok.jsp">
      <div class="input-group">
  <input type="text" class="form-control" placeholder="Search">
  <button class="btn btn-dark" type="submit" >Search</button>
  </form>
</div>
  </div>
  <div class="col-12 col-md-5 col-lg-8 d-flex align-items-center justify-content-md-end mt-3 mt-md-0">
      <div class="mr-3 mt-1">

      </div>
      <div class="dropdown">
          <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
              Hello,<%=name%>
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Messages</a></li>
            <li><a class="dropdown-item" href="logout">Sign out</a></li>
          </ul>
        </div>
  </div>
</nav>
    
<div class="container-fluid">
<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
  <div class="row">
        
<div class="position-sticky pt-md-5">
  <ul class="nav flex-column">
      <li class="nav-item">
        <a class="nav-link " aria-current="page" href="Paymentdept.jsp">
          <i class="fa-solid fa-house mx-2"></i>
          <span class="ml-2">Dashboard</span>
        </a>
      </li>
     
         <li class="nav-item">
        <a class="nav-link active" href="confirmpayment.jsp">
          <i class="fa-solid fa-file-invoice-dollar mx-2"></i>
          <span class="ml-2">Make-payment</span>
        </a>
         </li>
    </ul>
</div>
  
</nav>
<main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
        
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="Paymentdept.jsp">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Overview</li>
  </ol>
</nav>

    
<div class="card">
  <h5 class="card-header">View payment</h5>
  <div class="card-body">
      
      <form class="row g-3" name="myform" action="SendPayment" method="post">
                            <div class="col-md-4">
                              <label for="colname" class="form-label">Payment ID</label>
                              <input type="text" readonly class="form-control" id="pid" value="<%=model.PaymentCodegenerator.generateRegno()%>" name="pid">
                            </div>
            <div class="col-md-4">
                              <label for="colname" class="form-label">Verified ID</label>
                              <input type="text" readonly onchange="calculate();" class="form-control" id="vid" value="<%=cv.getVerificationid()%>" name="vid">
                            </div>
            <div class="col-md-4">
                              <label for="colname" class="form-label">Transaction ID</label>
                              <input type="text" readonly class="form-control" id="tid" value="<%=cv.getTrid()%>" name="tid">
                            </div>
                      <div class="col-md-4">
                              <label for="colname" class="form-label">First Name</label>
                              <input type="text" readonly class="form-control" id="date" value="<%=cv.getFirstname()%>" name="fn">
                            </div>
            <div class="col-md-4">
                              <label for="colname" class="form-label">Last Name</label>
                              <input type="text" readonly class="form-control" id="pmtpin" value="<%=cv.getLastname()%>" name="ln">
                            </div>
            <div class="col-md-4">
                              <label for="colname" class="form-label">Email</label>
                              <input type="text" readonly class="form-control" id="e" value="<%=cv.getEmail()%>" name="e">
                            </div>
                       <div class="col-md-4">
                              <label for="colname" class="form-label">Phone</label>
                              <input type="text" readonly  readonly class="form-control" id="p" value="<%=cv.getPhone()%>" name="p">
                            </div>
            <div class="col-md-4">
                              <label for="colname" class="form-label">Date</label>
                              <input type="text" readonly class="form-control" id="d" value="<%=cv.getDate()%>" name="d">
                            </div>
             <div class="col-md-4">
                              <label for="colname" class="form-label">Time</label>
                              <input type="text" readonly class="form-control" id="t" value="<%=cv.getTime()%>" name="t">
                            </div>
                            
            <div class="col-md-4">
                              <label for="colname" class="form-label">Vstatus</label>
                              <input type="text" readonly readonly class="form-control" id="vs" value="<%=cv.getStatus()%>" name="vs">
                            </div>
            <div class="col-md-4">
                              <label for="colname" class="form-label">No(Expired)</label>
                              <input type="text" readonly readonly class="form-control" id="agentname" value="<%=cv.getNoexpired()%>" name="noep">
                            </div>
                              <div class="col-md-4">
                              <label for="colname" class="form-label">No(Extension)</label>
                              <input type="text" readonly class="form-control" id="agentid" value="<%=cv.getNoextension()%>" name="noex">
                            </div>
             <div class="col-md-4">
                              <label for="colname" class="form-label">No(Liquidate)</label>
                              <input type="text" readonly readonly class="form-control" id="agentid" value="<%=cv.getNoliquidate()%>" name="noli">
                            </div>
            <div class="col-md-4">
                              <label for="colname" class="form-label">C(Amount)</label>
                              <input type="text" readonly class="form-control"  value="<%=cv.getLoanamount()%>"name="camt" >
                            </div>
                            <div class="col-md-4">
                              <label for="colname" class="form-label">C(interest)</label>
                              <input type="text" readonly class="form-control"  value="<%=cv.getInterest()%>" name="cint" >
                            </div>
                            <div class="col-md-4">
                              <label for="colname" class="form-label">C(Total)</label>
                              <input type="text" readonly class="form-control"  value="<%=cv.getTotalamount()%>" name="ctotal">
                            </div>
                             <div class="col-md-4">
                              <label for="colname" class="form-label">P(Amount)</label>
                              <input type="text" readonly  class="form-control"  value="<%=cv.getApproveamount() %>" name="pamt">
                            </div>
                            <div class="col-md-4">
                              <label for="colname" class="form-label">P(interest)</label>
                              <input type="text" readonly  class="form-control"  value="<%=cv.getPint()%>" name="pint" >
                            </div>
                            <div class="col-md-4">
                              <label for="colname" class="form-label">P(Total)</label>
                              <input type="text" readonly class="form-control"  value="<%=cv.getPtoal()%>" name="ptotal">
                            </div>
                             <div class="col-md-4">
                              <label for="colname" class="form-label">Bank Name</label>
                              <input type="text"  readonly class="form-control"  value="<%=cv.getBankname()%>" name="bankname" >
                            </div>
                            <div class="col-md-4">
                              <label for="colname" class="form-label">Acct Name</label>
                              <input type="text" readonly  class="form-control"  value="<%=cv.getAcctname()%>" name="acctname" >
                            </div>
                            <div class="col-md-4">
                              <label for="colname" class="form-label">Acct No</label>
                              <input type="text"  readonly class="form-control"  value="<%=cv.getAcctno()%>" name="acctno" >
                            </div>
                             <div class="col-md-4">
                              <label for="colname" class="form-label">Agent Name</label>
                              <input type="text" readonly class="form-control"  value="<%=name%>" name="agentname">
                            </div>
                            <div class="col-md-4">
                              <label for="colname" class="form-label">Payment Method</label>
                              <select class="form-control" name="pmethod"><option value="cash">Cash</option><option value="bank">Bank</option> </select>
                              <input type="hidden"  class="form-control"  value="<%=email%>" name="agentemail">
                            </div>
          <div class="col-6">
                <label for="colname" class="form-label"></label><br /> <br />           
                <input type="submit" class="btn btn-secondary"  value="Approve">
                <input type="button" class="btn btn-secondary" onclick="sendInfo();" value="Decline">
                            </div>
                    
       </form>
  </div>

</div>



    

                  <br />
                  <br />
                  <br />
                  <br />
                  <br />
                  <br />
                  <br />
                  <br />
                  <br />
                  <br />
                  <br />
                  <br />
                  <br />
                  <br />
                  <br />
                  <br />
                  <br />
                  <br />
<div class="row">
  <div class="col-12 col-xl-10 mb-4 mb-lg-0">
    
<footer class="pt-5 d-flex justify-content-between">
  <span>Copyright &copy; 2022-2024 <a href="https://kambokinfotech.com">Kambok Infotech Limited</a></span>
  <ul class="nav m-0">
      <li class="nav-item">
        <a class="nav-link text-secondary" aria-current="page" href="#">Privacy Policy</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-secondary" href="#">Terms and conditions</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-secondary" href="#">Contact</a>
      </li>
    </ul>
</footer>
  
</div>

</div>
  </div>

  



  
</body>
</html>
  
