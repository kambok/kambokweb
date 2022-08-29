<%-- 
    Document   : dashboard
    Created on : Jun 20, 2022, 3:18:46 PM
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
    <title>Loan Request</title>
 
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
  <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        
        setTimeout("preventBack()", 0.0);
        window.onunload = function () { null };
    </script>
</head>
<body>
      <script type = "text/javascript" >
          history.pushState(null, null, 'loanrequest.jsp');
          window.addEventListener('popstate', function (event) {
              history.pushState(null, null, 'loanrequest.jsp');
      });

     </script>
     
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>
     <script>
        window.onload = function(){time();}
        setInterval(time, 1000);
        

        function time(){
            var today = new Date();
            var h = today.getHours();
            var m = today.getMinutes();
            var s = today.getSeconds();
            var day = today.getDate();
            var month = today.getMonth()+1;
            var year = today.getFullYear();

            document.getElementById("ttime").value =  h + ":" + m +":" + s;
            document.getElementById("tdate").value = day + "/" + month + "/" + year;
        
       var p= document.getElementById("status").value;
       if(p!=""){
        document.getElementById("dd").style.display="none";
        document.getElementById("cc").innerHTML="You have an on going transaction at the moment...";
       }
    }
        

    </script>
    
    <%! String pic=""; %>
<%
    DataSupply us=(DataSupply)session.getAttribute("user");
    if(us!=null && us.getPosition().equals("Client")){
   
 
    
    }else{
    
    response.sendRedirect("index.jsp");
    
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
        <a class="nav-link active" href="loanrequest.jsp">
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
        <a class="nav-link" href="payment.jsp">
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
    <li class="breadcrumb-item"><a href="dashboard.jsp">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Overview</li>
  </ol>
</nav>
<h1 class="h2">Loan Request</h1>
<p>Fill the below form for your instant loan</p>
    

    
<div class="row">
    <div class="col-12 col-xl-1"></div>
    <div class="col-12 col-xl-10 mb-4 mb-lg-0">
        <section>
            <div class="container py-5 h-100">
              <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-12 col-lg-12 col-xl-12">
                  <div class="card form-container" style="border-radius: 1rem;">
                    <div class="card-body p-5">
                        <div class="form-title p-3 mb-4">
                            <h4 id="cc" class="text-danger text-center"></h4>
                            <h2 class="text-center text-primary">Apply for Loan</h2>
                        </div>
                        <form class="row g-3" action="Loansubmit" method="post" enctype="multipart/form-data">
                            <div class="col-md-6">
                              <label for="colname" class="form-label">Collateral Name</label>
                              <input type="text" class="form-control" id="colname" name="colname">
                            </div>
                            <div class="col-md-6">
                              <label for="coldescription" class="form-label">Collateral id</label>
                              <input type="text" class="form-control" id="coldescription" name="colid">
                            </div>
                           
                            <div class="col-md-6">
                              <label for="colimagef" class="form-label">Collateral Image (front)</label>
                              <input type="file" class="form-control" id="colimagef" name="colimagef">
                            </div>

                            <div class="col-md-6">
                                <label for="colimagef" class="form-label">Collateral Image (back)</label>
                                <input type="file" class="form-control" id="colimageb" name="colimageb">
                              </div>
                             <div class="col-md-6">
                              
                       <input type="hidden" class="form-control" id="tdate" name="tdate">
                        <input type="hidden" class="form-control" id="tu" value="<%=us.getEmail() %>" name="email">
                            </div>

                            <div class="col-md-6">
                         
                                <input type="hidden" class="form-control" id="ttime" name="ttime">
                                <input type="hidden" class="form-control" id="status" value="<%=us.getStatus()%>">
                              </div>
                             <div class="col-12">
                              <label for="colcondition" class="form-label">Collateral Condition/description</label>
                              <textarea class="form-control" id="colcondition" name="colcondition" cols="30" rows="5"></textarea>
                          
                            </div> 
                            <div class="col-12 d-flex justify-content-center">
                              <button type="submit" class="btn btn-primary" id="dd">Submit</button>
                            </div>
                          </form>  
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
    </div>
  <div class="col-12 col-xl-1"></div>
</div>
    
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
  
