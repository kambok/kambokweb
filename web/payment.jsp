<%@page import="model.Payment"%>
<%@page import="model.DataSupply"%>
<%@page import="java.util.List"%>
<%@page import="model.LoanRequest"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
 <link rel="icon" type="image/x-icon" href="kam.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
  	  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
   
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> 
 <link rel="stylesheet" href="fontawesome-free-6.1.1-web/css/all.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
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
  <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        
        setTimeout("preventBack()", 0.0);
        window.onunload = function () { null };
    </script>
          <script>  
var request;

setInterval(extension, 2000); 
function extension()  
{  
var trid=document.myform.trid.value;
var rdate=document.myform.rdate.value;
 var today=new Date(rdate);
 var days=today.getDay();
 var month=today.getMonth();
 var year=today.getFullYear();

var url="Extension?t="+trid+"&m="+month+"&d="+days+"&y="+year;
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try  
{  
request.onreadystatechange=getInfo2;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}
}

function sendInfo()  
{  
var email=document.myform.email.value;
var total=document.myform.total.value;
var trid=document.myform.trid.value;
var deposit=document.myform.deposit.value;
var balance=document.myform.balance.value;


var url="Processpayment?email="+email+"&deposit="+deposit+"&trid="+trid+"&balance="+balance+"&total="+total;
  
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

function getInfo2(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('col').innerHTML=val; 

} 
}

</script>
    
</head>
<body>
      <script type = "text/javascript" >
          history.pushState(null, null, 'payment.jsp');
          window.addEventListener('popstate', function (event) {
              history.pushState(null, null, 'payment.jsp');
      });

     </script>
     
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>
     <script>
       
   function calculate()  
{  
var total=Number(document.myform.total.value);
var trid=document.myform.trid.value;
var deposit=Number(document.myform.deposit.value);
var balance=document.myform.balance.value;
var pstatus=document.myform.pstatus.value;
var tt=Number(total);
var dep=Number(deposit);
var bal=Number(balance);

if(pstatus=="Approved"){
if(dep<=tt){
document.getElementById("balance").value=total-deposit
 
}else{
   document.getElementById("balance").value="invalid amount";
   
}
}else{
 document.getElementById("balance").value=total-deposit   
    
}
}

  window.onload=function(){checkdate();}  
   function checkdate(){
       var ext=document.myform.extt.value();   
 var pre=document.myform.pred.value(); 
   alert(pre);
     var deposit=document.myform.deposit.value;
     if(deposit=="" || deposit==null){
     document.querySelector("#oo").disabled=true; 
 }else{
      document.querySelector("#oo").disabled=false;    
 }
 var dpt=Number(document.myform.deposit.value);
 var bt=document.myform.balance.value;
 if(dpt<=0 || bt=="invalid amount"){
   document.querySelector("#oo").disabled=true;    
 }else{
    document.querySelector("#oo").disabled=false;   
 }
 

                               
   }
   
   function getreload(){
    location.reload();   
   }
 </script>
   
<%
    DataSupply us=(DataSupply)session.getAttribute("user");
    if(us==null){
         response.sendRedirect("index.jsp");
        
    }else{
    
if(us.getPosition().equals("Client")){
   
        if(us.getLoanamount()!=null && us.getInterest()!=null){
      //double loanamount=Double.parseDouble(us.getLoanamount());
      //double interst=Double.parseDouble(us.getInterest());
       
        
      
        }else{
        us.setTotal(0.0);
        us.setTrid("");
        us.setRepaydate("");
        us.setLoandate("");
        us.setLoanstatus("");
        }
        }else{
         response.sendRedirect("index.jsp");
        }
    
    }
    
    
    %>
       
<nav class="navbar navbar-light bg-light p-3">
  <div class="d-flex col-12 col-md-3 col-lg-2 mb-2 mb-lg-0 flex-wrap flex-md-nowrap justify-content-between">
      <a class="navbar-brand" href="#">
          <img src="images/kam.png" width="40px" class="rounded-pill">&nbsp; <%=us.getPosition() %>
		  
      </a>
      <button class="navbar-toggler d-md-none collapsed mb-3" type="button" data-toggle="collapse" data-target="#sidebar" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
      </button>
  </div>
  <div class="col-12 col-md-4 col-lg-2">
  <form action="kambok.jsp">
      <div class="input-group">
  <input type="text" class="form-control" placeholder="Search">
  <button class="btn btn-dark" type="submit">Search</button>
  </form>
</div>
  </div>
  <div class="col-12 col-md-5 col-lg-8 d-flex align-items-center justify-content-md-end mt-3 mt-md-0">
      <div class="mr-3 mt-1">

      </div>
      <div class="dropdown">
          <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
              Hello,<%=us.getFirstname() +" "+us.getLastname() %>
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
        <a class="nav-link " aria-current="page" href="dashboard.jsp">
          <i class="fa-solid fa-house mx-2"></i>
          <span class="ml-2">Dashboard</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="loanrequest.jsp">
          <i class="fa-solid fa-landmark mx-2"></i>
          <span class="ml-2">Loan Request</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="history.jsp">
          <i class="fa-solid fa-clock-rotate-left mx-2"></i>
          <span class="ml-2">History</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="accountinfo.jsp">
          <i class="fa-solid fa-file-invoice-dollar mx-2"></i>
          <span class="ml-2">Account Info</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="bio.jsp">
          <i class="fa-solid fa-file-pen mx-2"></i>
          <span class="ml-2">Update Bio</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="loan-status.jsp">
          <i class="fa-solid fa-sack-dollar mx-2"></i>
          <span class="ml-2">Loan Status</span>
        </a>
      </li>
       <li class="nav-item">
        <a class="nav-link active" href="payment.jsp">
          <i class="fa-solid fa-file-invoice-dollar mx-2"></i>
          <span class="ml-2">Redeem/pay</span>
        </a>
      </li>
    </ul>
</div>
  
</nav>
<main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
        
<nav aria-label="breadcrumb">
  <ol class="breadcrumb p-3">
   
      <li class="breadcrumb-item active text-success" aria-current="page"><h2 class="text-primary"><code>Wallet Number:<%=us.getWalletno()%></code></h2></li>
  </ol>
</nav>
  <div class="row">
      <div class="col-12 col-md-12 col-lg-12 col-xl-12">
        <div class="card form-container" style="border-radius: 1rem;">
                    <div class="card-body p-5">
                        
 <p class="text-success" style="float:left;"><big class="h2" >₦<%=us.getTotal()-us.getDebit()%>0</big></p>
<p class="text-success" style="float:right;"><small><%=us.getRepaydate()%></small></p>    
                    </div>
        </div>
      </div>  
  </div>
      <div class="row">
      <div class="col-12 col-md-12 col-lg-12 col-xl-12">
        <div class="form-container" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">
                        
                        <button class="btn btn-success btn-lg">send</button>    
                         </div>
        </div>
      </div> 
            <div class="col-md-12">
                            <button type="button" class="text-primary" style="background-color:white;border: none;" data-toggle="collapse" data-target="#demo">View Transaction</button>
                             </div>
                            
  </div>
                    
     <br /><br /><br />
     <br /><br /><br />
     <br /><br /><br />
    
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
  


      </main>
  </div>
</div>
</div>
  



  
</body>
</html>
  
