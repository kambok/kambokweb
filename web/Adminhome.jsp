<%-- 
    Document   : dashboard
    Created on : Jun 20, 2022, 3:18:46 PM
    Author     : User
--%>

<%@page import="model.Admindetails"%>
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

    <title>Adminhome</title>
 
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
          history.pushState(null, null, 'Adminhome.jsp');
          window.addEventListener('popstate', function (event) {
              history.pushState(null, null, 'Adminhome.jsp');
      });

     </script>
     
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>

    <%!String name="",position="",email="";%>
    <%
    ArrayList<Admindetails> us=(ArrayList<Admindetails>)session.getAttribute("admin");
    if(us==null){
     response.sendRedirect("index.jsp");
   }else{
      for(Admindetails s:us){
      name=s.getName();
      position=s.getPositon();
      email=s.getUsername();
      }  
   
    
    if((position.equals("Admin") || position.equals("Admin")) &&  email!=null){
        
    }else{
    response.sendRedirect("index.jsp");
    }   
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
      <li class="nav-item">
        <a class="nav-link active" aria-current="page" href="dashboard.jsp">
          <i class="fa-solid fa-house mx-2"></i>
          <span class="ml-2">Dashboard</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="viewrequest.jsp">
          <i class="fa-solid fa-landmark mx-2"></i>
          <span class="ml-2">View Request</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="history.html">
          <i class="fa-solid fa-clock-rotate-left mx-2"></i>
          <span class="ml-2">History</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="fundaccount.jsp">
          <i class="fa-solid fa-file-invoice-dollar mx-2"></i>
          <span class="ml-2">Fund Account</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="staffmanagement.jsp">
          <i class="fa-solid fa-file-pen mx-2"></i>
          <span class="">Staff Management</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="loan-status.jsp">
          <i class="fa-solid fa-sack-dollar mx-2"></i>
          <span class="ml-2">Loan Status</span>
        </a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="confirmpayment.jsp">
          <i class="fa-solid fa-file-invoice-dollar mx-2"></i>
          <span class="ml-2">Confirm-payment</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Advertisement.jsp">
          <i class="fa-solid fa-file-invoice-dollar mx-2"></i>
          <span class="ml-2">Advertise Loan</span>
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
<h1 class="h2">Dashboard</h1>
<p>This is the homepage of a simple admin interface</p>
    
<div class="card">
  <h5 class="card-header">Approved Loan</h5>
  <div class="card-body">
    <h5 class="card-title">25 Nos</h5>
    <p class="card-text">Total worth: N550,000.00</p>
    <p class="card-text text-success">At 8.2% rate daily</p>
  </div>
</div>
  

<div class="row my-4">
  <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0">
      <div class="card">
          <h5 class="card-header">Redeemed Loan</h5>
          <div class="card-body">
            <h5 class="card-title">15 Nos</h5>
            <p class="card-text">Total worth: N140,000.00</p>
            <p class="card-text text-success">1At 8.2% rate daily</p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
      <div class="card">
          <h5 class="card-header">Pending Loans</h5>
          <div class="card-body">
            <h5 class="card-title">10 Nos</h5>
            <p class="card-text">Total worth: N55,000.00</p>
            <p class="card-text text-primary">At 8.2% rate daily</p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
      <div class="card">
          <h5 class="card-header">Cancelled Loans</h5>
          <div class="card-body">
            <h5 class="card-title">4 Nos</h5>
            <p class="card-text">Total worth: N40,000.00</p>
            <p class="card-text text-danger">At 8.2% rate daily</p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
      <div class="card">
          <h5 class="card-header">Estimated Gain</h5>
          <div class="card-body">
            <h5 class="card-title">64k</h5>
            <p class="card-text">Feb 1 - May 1, 2022</p>
            <p class="card-text text-success">2.5% increase since last month</p>
          </div>
        </div>
  </div>
</div>
    
<div class="row">
  <div class="col-12 col-xl-8 mb-4 mb-lg-0">
      <div class="card">
          <h5 class="card-header">Latest loan request</h5>
          <div class="card-body">
              <div class="table-responsive">
                  <table class="table">
                      <thead>
                        <tr>
                          <th >Tranid</th>
                          <th >Loan Amount</th>
                          <th >Interest</th>
                          <th >Duration</th>
                          <th >Date</th>
                          <th >Status</th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row">17371705</th>
                          <td>500,000</td>
                          <td>N100,000</td>
                          <td>30 days</td>
                          <td>10th june</td>
                          <td class="text-success">Approved</td>
                          <td><a href="#" class="btn btn-sm btn-primary">View</a></td>
                        </tr>
                         <tr>
                          <th scope="row">17371705</th>
                          <td>500,000</td>
                          <td>N100,000</td>
                          <td>30 days</td>
                          <td>10th june</td>
                          <td class="text-secondary">Pending</td>
                          <td><a href="#" class="btn btn-sm btn-primary">View</a></td>
                        </tr>
                         <tr>
                          <th scope="row">17371705</th>
                          <td>500,000</td>
                          <td>N100,000</td>
                          <td>30 days</td>
                          <td>10th june</td>
                          <td class="text-success">Approved</td>
                          <td><a href="#" class="btn btn-sm btn-primary">View</a></td>
                        </tr>
                         <tr>
                          <th scope="row">17371705</th>
                          <td>500,000</td>
                          <td>N100,000</td>
                          <td>30 days</td>
                          <td>10th june</td>
                          <td class="text-success">Approved</td>
                          <td><a href="#" class="btn btn-sm btn-primary">View</a></td>
                        </tr>
                        <tr>
                          <th scope="row">17371705</th>
                          <td>500,000</td>
                          <td>N100,000</td>
                          <td>30 days</td>
                          <td>10th june</td>
                          <td class="text-success">Approved</td>
                          <td><a href="#" class="btn btn-sm btn-primary">View</a></td>
                        </tr>
                         <tr>
                          <th scope="row">17371705</th>
                          <td>500,000</td>
                          <td>N100,000</td>
                          <td>30 days</td>
                          <td>10th june</td>
                          <td class="text-danger">Declined</td>
                          <td><a href="#" class="btn btn-sm btn-primary">View</a></td>
                        </tr>
						 <tr>
                          <th scope="row">17371705</th>
                          <td>500,000</td>
                          <td>N100,000</td>
                          <td>30 days</td>
                          <td>10th june</td>
                          <td class="text-secondary">Pending</td>
                          <td><a href="#" class="btn btn-sm btn-primary">View</a></td>
                        </tr>
						 <tr>
                          <th scope="row">17371705</th>
                          <td>500,000</td>
                          <td>N100,000</td>
                          <td>30 days</td>
                          <td>10th june</td>
                          <td class="text-success">Approved</td>
                          <td><a href="#" class="btn btn-sm btn-primary">View</a></td>
                        </tr>
						 <tr>
                          <th scope="row">17371705</th>
                          <td>500,000</td>
                          <td>N100,000</td>
                          <td>30 days</td>
                          <td>10th june</td>
                          <td class="text-secondary">Pending</td>
                          <td><a href="#" class="btn btn-sm btn-primary">View</a></td>
                        </tr>
						 <tr>
                          <th scope="row">17371705</th>
                          <td>500,000</td>
                          <td>N100,000</td>
                          <td>30 days</td>
                          <td>10th june</td>
                          <td class="text-danger">Declined</td>
                          <td><a href="#" class="btn btn-sm btn-primary">View</a></td>
                        </tr>
						 <tr>
                          <th scope="row">17371705</th>
                          <td>500,000</td>
                          <td>N100,000</td>
                          <td>30 days</td>
                          <td>10th june</td>
                          <td class="text-success">Approved</td>
                          <td><a href="#" class="btn btn-sm btn-primary">View</a></td>
                        </tr>
                      </tbody>
                    </table>
              </div>
                <a href="#" class="btn btn-block btn-light">View all</a>
          </div>
      </div>
  </div>

<div class="col-12 col-xl-4">
       
<div class="card">
  <h5 class="card-header">My daily Activities</h5>
  <div class="card-body">
  <div class="table-responsive">
    <div id="piechart"></div>
	</div>
<script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Task', 'Hours per Day'],
  ['Work', 8],
  ['Eat',2],
  ['Sleep', 8]
  ,['Read',6]
]);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':'My Daily Activity', 'width':420, 'height':550};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.BarChart(document.getElementById('piechart'));
  chart.draw(data,options);
}
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
  


      </main>
  </div>
</div>
</div>
  



  
</body>
</html>
  
