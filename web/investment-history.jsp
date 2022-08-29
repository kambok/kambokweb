<%-- 
    Document   : dashboard
    Created on : Jun 20, 2022, 3:18:46 PM
    Author     : User
--%>



<%@page import="model.AdminUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page errorPage="errorpage.jsp" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<META Http-Equiv="Expires" Content="0">

    <title>Dashboard</title>
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
  	  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
   
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
 <link rel="stylesheet" href="fontawesome-free-6.1.1-web/css/all.css" />
 <link rel="icon" type="image/x-icon" href="kam.png">
 
 <!--table-pagination css.min cdn-->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
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
          history.pushState(null, null, 'investment-history.jsp');
          window.addEventListener('popstate', function (event) {
              history.pushState(null, null, 'investment-history.jsp');
      });

     </script>
     
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>

<%!String name="", position="",email="", pic="",pic2="", id="", transid="", phone="", verificationid="", date = "", loanamount="", total = "", interest="", firstname="", lastname="", applicantemail="", email2="";%>
    
    <%
    
    
       AdminUser us = (AdminUser)session.getAttribute("staff");
      name=us.getFirstname() + " " + us.getLastname();
      position=us.getPosition();
      email=us.getEmail();
      session.setAttribute("agentname", name);
      session.setAttribute("agentemail", email);
    
    if((position.equals("Investor") || position.equals("Admin")) &&  email!=null){
        
    }else{
    response.sendRedirect("index.jsp");
    } 
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
    </div>
</form>
  </div>
  <div class="col-12 col-md-5 col-lg-8 d-flex align-items-center justify-content-md-end mt-3 mt-md-0">
      <div class="mr-3 mt-1">

      </div>
      <div class="dropdown">
          <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
              Hello, <%=us.getFirstname()+" "+us.getLastname()%>
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
              <li><a class="dropdown-item" href="settings.jsp"><i class="fa-solid fa-gear mx-2 sicon"></i> <span class="txt"> Settings</span></a></li>
              <li><a class="dropdown-item" href="#"><i class="fa-solid fa-envelope mx-2 sicon"></i><span class="txt"> Messages</span></a></li>
              <li><a class="dropdown-item" href="logout"><i class="fa-solid fa-right-from-bracket mx-2 sicon"></i><span class="txt">Sign out</span></a></li>
          </ul>
        </div>
  </div>
</nav>
    
<div class="container-fluid">
<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
  <div class="row">
        
<div class="position-sticky pt-md-5">
  <ul class="nav flex-column mx-3" id="navbar">
      <li class="nav-item  ">
        <a class="nav-link" href="investordashboard.jsp">
          <i class="fa-solid fa-house"></i>
          <span class="ml-2">Dashboard</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" aria-current="page" href="investment-history.jsp">
          <i class="fa-solid fa-clock-rotate-left"></i>
          <span class="ml-2">History</span>
        </a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="investment-news-feed.jsp">
          <i class="fa-solid fa-volume-high"></i>
          <span class="ml-2">News Feed</span>
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
<h1 class="h2">History</h1>
<p>View all transaction history</p>

<div class="row my-4">
  <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0">
      <div class="card">
          <h5 class="card-header">Total Investment</h5>
          <div class="card-body">
            <h5 class="card-title">15 Nos</h5>
            <p class="card-text">Total worth: N140,000.00</p>
            <p class="card-text text-success">1At 8.2% rate daily</p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
      <div class="card">
          <h5 class="card-header">Total accumulating interest</h5>
          <div class="card-body">
            <h5 class="card-title">10 Nos</h5>
            <p class="card-text">Total worth: N55,000.00</p>
            <p class="card-text text-primary">At 8.2% rate daily</p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
      <div class="card">
          <h5 class="card-header">Bonus</h5>
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
          <h2 class="card-header">Investment History</h2>
          <div class="card-body">
              <div class="table-responsive">
                  <table id="invesment-history" class="table" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Investment ID</th>
                                    <th>Amount</th>
                                    <th>Interest</th>
                                    <th>Investment Date</th>
                                    <th>Cashout Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>573647464XD</td>
                                    <td>₦200,000.00</td>
                                    <td>₦20,000.00</td>
                                    <td>22/07/2022</td>
                                    <td>22/08/2022</td>
                                </tr>
                                <tr>
                                    <td>583647464CD</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>23/07/2022</td>
                                    <td>23/08/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦70,000.00</td>
                                    <td>₦7,000.00</td>
                                    <td>30/07/2022</td>
                                    <td>30/08/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>583647464CD</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>23/07/2022</td>
                                    <td>23/08/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦70,000.00</td>
                                    <td>₦7,000.00</td>
                                    <td>30/07/2022</td>
                                    <td>30/08/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>583647464CD</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>23/07/2022</td>
                                    <td>23/08/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦70,000.00</td>
                                    <td>₦7,000.00</td>
                                    <td>30/07/2022</td>
                                    <td>30/08/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>583647464CD</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>23/07/2022</td>
                                    <td>23/08/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦70,000.00</td>
                                    <td>₦7,000.00</td>
                                    <td>30/07/2022</td>
                                    <td>30/08/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>873647464AD</td>
                                    <td>₦50,000.00</td>
                                    <td>₦5,000.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>893647464ED</td>
                                    <td>₦100,000.00</td>
                                    <td>₦10,500.00</td>
                                    <td>09/08/2022</td>
                                    <td>09/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>473647464ED</td>
                                    <td>₦55,000.00</td>
                                    <td>₦5,500.00</td>
                                    <td>03/08/2022</td>
                                    <td>03/09/2022</td>
                                </tr>
                                <tr>
                                    <td>893647464ED</td>
                                    <td>₦100,000.00</td>
                                    <td>₦10,500.00</td>
                                    <td>09/08/2022</td>
                                    <td>09/09/2022</td>
                                </tr>
                            </tbody>
                           
                        </table>
              </div>
          </div>
      </div>
  </div>

<div class="col-12 col-xl-4">
       
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
    var a=20000;
    var b=18000;
    var c=2000;
    var f=200000;
var xValues = ["Investment","Interest", "Profit", "Bonus"];
var yValues = [f,a, b, c];
var barColors = ["teal","green", "orange","gold"];

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

  </main>
 </div>
<!--table pagination js.min cdn-->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<!--table pagination initialization-->
<script type="text/javascript">
    $(document).ready(function () {
    $('#invesment-history').DataTable();
});
</script>
</body>
</html>
  
