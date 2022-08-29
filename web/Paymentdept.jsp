<%@page import="model.Departmentinfo"%>
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

    <title>Paymentdept</title>
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
  	  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
   
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
 
 <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
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
  
#loader {
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: 1;
  width: 120px;
  height: 120px;
  margin: -76px 0 0 -76px;
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
 
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
      
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:1 } 
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom { 
  from{ bottom:-100px; opacity:1 } 
  to{ bottom:0; opacity:1 }
}

#myDiv {
  display: none;
  text-align: center;
  } 
.row,.h2{text-align: left;}
  </style>
  <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        
        setTimeout("preventBack()", 0.0);
        window.onunload = function () { null };
    </script>
 
 </head>
<body onload="myFunction()" style="margin:0;">

<div id="loader"></div>
 <div style="display:none;" id="myDiv" class="animate-bottom">   
    <script>
var myVar;

function myFunction() {
  myVar = setTimeout(showPage, 3000);
}

function showPage() {
  document.getElementById("loader").style.display = "none";
  document.getElementById("myDiv").style.display = "block";
}
</script>
     <script type = "text/javascript" >
          history.pushState(null, null, 'Paymentdept.jsp');
          window.addEventListener('popstate', function (event) {
              history.pushState(null, null, 'Paymentdept.jsp');
      });

     </script>
     
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>

<%!String name="",position="",email=""; Departmentinfo dfin =new Departmentinfo(); %>
    <%
   AdminUser s = (AdminUser)session.getAttribute("staff");
      name=s.getFirstname() + " " + s.getLastname();
      position=s.getPosition();
      email=s.getEmail();
   
    if((position.equals("Admin") || position.equals("Finance")) &&  email!=null){
        
        dfin=data.Database.getdepartmentinfo();
    }else{
    response.sendRedirect("index.jsp");
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
  <button class="btn btn-dark" type="submit">Search</button>
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
        <a class="nav-link active" aria-current="page" href="Paymentdept.jsp">
          <i class="fa-solid fa-house mx-2"></i>
          <span class="ml-2">Dashboard</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="paymentreceipt.jsp">
          <i class="fa-solid fa-clock-rotate-left mx-2"></i>
          <span class="ml-2">Payment Receipt</span>
        </a>
      </li>
   <li class="nav-item">
        <a class="nav-link" href="processpayment.jsp">
          <i class="fa-solid fa-file-invoice-dollar mx-2"></i>
          <span class="ml-2">Debit Wallet</span>
        </a>
      </li>
     <li class="nav-item">
        <a class="nav-link" href="confirmpayment.jsp">
          <i class="fa-solid fa-file-invoice-dollar mx-2"></i>
          <span class="ml-2">Credit Wallet</span>
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
    <li class="breadcrumb-item " aria-current="page"></li>
    <li class="breadcrumb-item active" aria-current="page">Total Value:100000</li>
  </ol>
</nav>

    <div class="row">
  <div class="col-12 col-md-6 col-lg-6 mb-4 mb-lg-0">
      <div class="card">
          <h5 class="card-header text-info ">Loan Department</h5>
          <div class="card-body">
            <h5 class="card-title">Wallet ID: <%=dfin.getLoanacctno()%></h5>
            <p class="card-text">Wallet Name: <%=dfin.getLoanacctname()%></p>
            <p class="card-text text-success">Wallet Amount: <%=dfin.getLoanamount()%></p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-6">
      <div class="card">
          <h5 class="card-header text-success">Training Department</h5>
            <div class="card-body">
            <h5 class="card-title">Wallet ID: <%=dfin.getTrainacctno()%></h5>
            <p class="card-text">Wallet Name: <%=dfin.getTrainacctname()%></p>
            <p class="card-text text-success">Wallet Amount: <%=dfin.getTrianamount()%></p>
          </div>
        </div>
  </div>
</div>
         
<div class="row my-4">
  <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0">
      <div class="card">
          <h5 class="card-header text-warning" >Monthly Invest</h5>
          <div class="card-body">
            <h5 class="card-title">15 Nos</h5>
            <p class="card-text">Total worth: N140,000.00</p>
            <p class="card-text text-success"><a href="#">View history</a></p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
      <div class="card">
          <h5 class="card-header text-primary">Capital Amount</h5>
          <div class="card-body">
            <h5 class="card-title">10 Nos</h5>
            <p class="card-text">Total worth: N55,000.00</p>
            <p class="card-text text-primary"><a href="#">View history</a></p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
      <div class="card">
          <h5 class="card-header text-dark" >Monthly Return</h5>
          <div class="card-body">
            <h5 class="card-title">4 Nos</h5>
            <p class="card-text">Total worth: N40,000.00</p>
            <p class="card-text text-danger"><a href="#">View history</a></p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
      <div class="card">
          <h5 class="card-header text-danger">Yearly Return</h5>
          <div class="card-body">
           <h5 class="card-title">4 Nos</h5>
            <p class="card-text">Total worth: N40,000.00</p>
            <p class="card-text text-success"><a href="#">View history</a></p>
          </div>
        </div>
  </div>
 
  </div>
<div class="row my-4">
  <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0">
      <div class="card">
          <h5 class="card-header text-warning" >Monthly Investor</h5>
          <div class="card-body">
            <h5 class="card-title">15 Nos</h5>
            <p class="card-text">Total worth: N140,000.00</p>
            <p class="card-text text-success">1At 8.2% rate daily</p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
      <div class="card">
          <h5 class="card-header text-primary">Capital Investor</h5>
          <div class="card-body">
            <h5 class="card-title">10 Nos</h5>
            <p class="card-text">Total worth: N55,000.00</p>
            <p class="card-text text-primary">At 8.2% rate daily</p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
      <div class="card">
          <h5 class="card-header text-dark" >Monthly Return</h5>
          <div class="card-body">
            <h5 class="card-title">4 Nos</h5>
            <p class="card-text">Total worth: N40,000.00</p>
            <p class="card-text text-danger">At 8.2% rate daily</p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
      <div class="card">
          <h5 class="card-header text-danger">Yearly Return</h5>
          <div class="card-body">
           <h5 class="card-title">4 Nos</h5>
            <p class="card-text">Total worth: N40,000.00</p>
            <p class="card-text text-success">2.5% increase since last month</p>
          </div>
        </div>
  </div>
 
    
    
</div>
<div class="row my-4">
  <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0">
      <div class="card">
          <h5 class="card-header text-warning" >Extended</h5>
          <div class="card-body">
            <h5 class="card-title">15 Nos</h5>
            <p class="card-text">Total worth: N140,000.00</p>
            <p class="card-text text-success">1At 8.2% rate daily</p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
      <div class="card">
          <h5 class="card-header text-primary">Sold</h5>
          <div class="card-body">
            <h5 class="card-title">10 Nos</h5>
            <p class="card-text">Total worth: N55,000.00</p>
            <p class="card-text text-primary">At 8.2% rate daily</p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
      <div class="card">
          <h5 class="card-header text-dark" >Liquidated</h5>
          <div class="card-body">
            <h5 class="card-title">4 Nos</h5>
            <p class="card-text">Total worth: N40,000.00</p>
            <p class="card-text text-danger">At 8.2% rate daily</p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
      <div class="card">
          <h5 class="card-header text-danger">Expired</h5>
          <div class="card-body">
           <h5 class="card-title">4 Nos</h5>
            <p class="card-text">Total worth: N40,000.00</p>
            <p class="card-text text-success">2.5% increase since last month</p>
          </div>
        </div>
  </div>
 
    
    
</div>
 
  
<div class="row">
  

<div class="col-12 col-xl-12">
       
<div class="card">
  <h5 class="card-header">Transaction History</h5>
  <div class="card-body">
  <div class="table-responsive">
      <div class="row">
          <div class="col-sm-2"></div>
           <div class="col-sm-8">
     <canvas id="myChart" style="width:100%;max-width:600px"></canvas>
           </div>
       <div class="col-sm-2"></div>
	</div>
  </div>
<script>
    var a=10;
    var b=11;
    var c=8;
    var d=9;
    var e=7;
    var f=16;
var xValues = ["Current","Pickup", "Extension", "Sold", "Liquidated", "Expired"];
var yValues = [f,a, b, c, d, e];
var barColors = ["teal","green", "Blue","gold","brown","red"];

new Chart("myChart", {
  type: "bar",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    legend: {display: false},
    title: {
      display: true,
      text: "Transaction Analysis"
    }
  }
});
</script>

  </div>
</div>
</div>
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
  

      
  </div>
</div>
</div>
          
         
  


  
</body>
</html>
  
