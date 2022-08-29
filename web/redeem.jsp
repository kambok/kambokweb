<%-- 
    Document   : dashboard
    Created on : Jun 20, 2022, 3:18:46 PM
    Author     : User
--%>

<%@page import="model.Finance"%>
<%@page import="model.ApplicantVerification"%>
<%@page import="model.DataSupply"%>
<%@page import="model.LoanDetailSupply"%>
<%@page import="model.Admindetails"%>
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

    <title>Inspection</title>
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

.model-container{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    pointer-events: none;
    opacity: 0;
    transition: visibility 0s, opacity 0.5s;
}

.model-container.show{
    opacity: 1;
    pointer-events: auto;
}
.model-container .model{
    background-color: #fff;
    padding: 30px 50px;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.2);  
}

.model{
    position: relative;
}

.model p{
    opacity: 0.7;
    font-size: 18px;
}

.form-container.blu{
    filter: blur(5px);
}

.model .close{
    position: absolute;
    top: 20px;
    right: 20px;
    font-weight: bolder;
    color: red;
    cursor: pointer;
}

  
  </style>
<script>  
var request;

function sendInfo()  
{  
var pin=document.myform.payment_pin.value;



var url="RedeemLoan?payment_pin="+pin;
  
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
document.getElementById('report').innerHTML=val; 

} 
}
</script> 
  
  <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        
        setTimeout("preventBack()", 0.0);
        window.onunload = function () { null };
    </script>
 
 </head>
<body>

     <script type = "text/javascript" >
          history.pushState(null, null, 'redeem.jsp');
          window.addEventListener('popstate', function (event) {
              history.pushState(null, null, 'redeem.jsp');
      });

     </script>
     
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>


   <%!String name="", position="",email="", cv="";%>
   
    <%
       AdminUser s = (AdminUser)session.getAttribute("staff");
      name=s.getFirstname() + " " + s.getLastname();
      position=s.getPosition();
      email=s.getEmail();
    if((position.equals("Inspector") || position.equals("Admin")) &&  email!=null){
        
    }else{
    response.sendRedirect("index.jsp");
    }   
   
    %> 

<nav class="navbar navbar-light bg-light p-3">
  <div class="d-flex col-12 col-md-3 col-lg-2 mb-2 mb-lg-0 flex-wrap flex-md-nowrap justify-content-between">
      <a class="navbar-brand" href="#">
          <img src="images/kam.png" width="40px" class="rounded-pill">&nbsp; <%=position %>
		  
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
               Hello, <%=name %>
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
         <li class="nav-item ml-4">
        <a class="nav-link" href="inspectionDashboard.jsp">
          <i class="fa-solid fa-calendar-check mx-2"></i>
          <span class="ml-2" >Inspect</span>
        </a>
         </li>
         <li class="nav-item ml-4">
        <a class="nav-link active" href="redeem.jsp">
          <i class="fa-solid fa-gift mx-2"></i>
          <span class="ml-2">Redeem</span>
        </a>
         </li>
    </ul>
</div>
  
</nav>
<main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
        
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Overview</li>
  </ol>
</nav>
<div class="card">
  <h5 class="card-header">Confirm payment</h5>
  <div class="card-body">
       <form class="row g-3" name="myform">
                <div class="col-md-10 d-flex">
                  <input type="text"  class="form-control p-3" id="tri" name="payment_pin" placeholder="Enter payment pin or transaction ID">
                  <input type="button" class="btn btn-info p-3 display-2" onclick="sendInfo();"  value="Search" style="width: 120px; border-radius: 0 5px 5px 0; margin-left: -20px;">
                </div>    
                </form>
  </div>
</div>
    <br><br>
<div class="row">
  <div class="col-12 col-xl-12 mb-4 mb-lg-0">
      <div class="card">
          <h5 class="card-header">Confirm loan repayment</h5>
          <div class="card-body">
              <div class="row d-flex justify-content-center align-items-center">
                  <div class="col-md-8 text-center">
                    <div class="col text-center text-danger" id="report">

                    </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
</div>
</main> 
</body>
</html>
  
