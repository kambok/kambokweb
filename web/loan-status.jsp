<%-- 
    Document   : loan-status
    Created on : Jun 22, 2022, 2:55:30 PM
    Author     : User
--%>

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
    <title>Dashboard</title>
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
  	  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
 
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> 
 <link rel="stylesheet" href="fontawesome-free-6.1.1-web/css/all.css" />
  
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
 
 </head>
<body>
     <script type = "text/javascript" >
          history.pushState(null, null, 'loan-status.jsp');
          window.addEventListener('popstate', function (event) {
              history.pushState(null, null, 'loan-status.jsp');
      });

     </script>
     
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>

    <%! String pic=""; %>
    <%
    DataSupply us=(DataSupply)session.getAttribute("user");
    if(us!=null && us.getPosition().equals("Client")){
   
    if(us.getColname()==null){
    
    us.setColname("");
    us.setColid("");
    us.setTrid("");
    us.setTime("");
    us.setDate("");
    us.setStatus("");
    }else{
      
    }
    
    }else{
    
    response.sendRedirect("index.html");
    
    }
    pic = (String)session.getAttribute("passport");
    
    %>
    

<nav class="navbar navbar-light bg-light p-3">
  <div class="d-flex col-12 col-md-3 col-lg-2 mb-2 mb-lg-0 flex-wrap flex-md-nowrap justify-content-between">
      <a class="navbar-brand" href="#">
         <img src="photos/users/<%=pic%>" width="40px" class="rounded-pill">&nbsp; <%=us.getPosition() %>
		  
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
          <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
            Hello, <%=us.getFirstname() +" "+us.getLastname()%>
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
        <a class="nav-link" aria-current="page" href="dashboard.jsp">
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
        <a class="nav-link active" href="loan-status.jsp">
          <i class="fa-solid fa-sack-dollar mx-2"></i>
          <span class="ml-2">Loan Status</span>
        </a>
      </li>
        <li class="nav-item">
        <a class="nav-link " href="payment.jsp">
          <i class="fa-solid fa-file-invoice-dollar mx-2"></i>
          <span class="ml-2">Redeem/pay</span>
        </a>
      </li>
    </ul>
</div>
  
</nav>
<main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
        
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="dashboard.html">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Overview</li>
  </ol>
</nav>


    
<div class="card">
  <h5 class="card-header">Loan Status</h5>
  <div class="card-body">
 
    <div class="table-responsive">
        <strong id="r"></strong>
        <table class="table" id="ls" style="visibility:hidden;">
         <tr>
         <th>Transaction ID</th>
          <th>Collateral Name</th>
          <th>Collateral ID</th>
          <th>Transaction Time</th>
          <th>Transaction Date</th>
                <th><div id="beepBox" class="spinner-grow text-warning d-flex justify-content-center" style="height: 0px" role="status">
        <span class="visually-hidden"></span>
      </div></th>
        </tr>   
        <tr>
            <td ><p id="t1"><%=us.getTrid()%></p></td>   
            <td id="t2"><%=us.getColname() %></td>
             <td id="t3"><%=us.getColid()%></td>
              <td id="t4"><%=us.getDate() %></td>
               <td id="t5"><%=us.getTime()%></td>
               <td id="t6"><a  href="proceed.jsp" style="text-decoration: none" class="text-warning"><input type="text" id="input_status" class="text-success" value="<%= us.getStatus() %>" disabled="true" style="border: none; outline: none; background-color: transparent; font-weight: bold; width: 90px"></a></td>  
        </tr>
    </table>
    </div>
               <% 
               if(us.getTrid()!=""){
               out.println("<script>document.getElementById('ls').style.visibility='visible';</script>");   
             
                }else{
                 out.println("<script>document.getElementById('r').innerHTML='No record';</script>");   
                
               }
               %>
  </div>
</div>
        
        <script>
        let statusInput = document.getElementById("input_status").value;
        var beep = document.getElementById("beepBox");
        
        if(statusInput =="null" || statusInput == "" ){
            beep.style.width = 0;
            beep.style.height = 0;            
        }else{
            beep.style.width = "30px";
            beep.style.height = "30px";
        }
    </script>
<br />
<br /><br /><br /><br /><br /><br /><br /><br /><br />
<br /><br /><br /><br /><br /><br /><br /><br /><br />
    
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
  
