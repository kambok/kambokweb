<%-- 
    Document   : Advertisement
    Created on : Aug 8, 2022, 6:02:20 AM
    Author     : Depittaz
--%>

<%@page import="model.Ads"%>
<%@page import="java.util.List"%>
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

    <title>Advertisement</title>
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
  	  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
   
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> 
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
          history.pushState(null, null, 'Advertisement.jsp');
          window.addEventListener('popstate', function (event) {
              history.pushState(null, null, 'Advertisement.jsp');
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
    
     <script>
      window.onload=function(){checkdate();}  
    function checkdate(){
     var date=new Date();
     var day=date.getDate();  
     var month=date.getMonth()+1;  
     var year=date.getFullYear();  
     day=checkTime(day);  	
     month=checkTime(month);  
     document.getElementById("date").value=month+"/"+day+"/"+year;  
     console.log(month+"/"+day+"/"+year);
       
   }
    function checkTime(i){  
	if (i<10){  
	  i="0" + i;  
	 }  
	return i;} 
  </script>
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
  <h5 class="card-header">Loan Advertisement</h5>
  <div class="card-body">
      <form action="LoanAds" method="post">
          <label for="ads" class="form-label">Loan Amount</label>
          <input class="form-control" type="text" placeholder="Loan Amount" id="adsAmount" name="adsAmount">
          <input type="hidden" id="date" name="date">
          <input type="hidden" id="adsID" name="adsID">
          <input type="hidden" id="adsStatus" name="adsStatus" value="Pending">
          <b id="report" class="text-danger"></b>
          <button type="submit" class="btn btn-secondary">Post Ads</button>
      </form>
  </div>
</div>
  
    
<div class="row">
  <div class="row">
  <div class="col-12 col-xl-8 mb-4 mb-lg-0">
      <div class="card">
          <h2 class="card-header">Ads History</h2>
          <div class="card-body">
              <div class="table-responsive">
                  <table id="invesment-history" class="table" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Amount</th>
                                    <th>ID</th>
                                    <th>Date</th>
                                    <th>Package</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List <Ads> loanAds = data.Database.GetLoanAds();
                                    for(Ads ads: loanAds){
                                        out.println("<tr>");
                                            out.println("<td>"+ads.getAdsAmount()+"</td>");
                                            out.println("<td>"+ads.getAdsID()+"</td>");
                                            out.println("<td>"+ads.getDate()+"</td>");
                                            out.println("<td>"+ads.getAdsPackage()+"</td>");
                                            out.println("<td>"+ads.getAdsStatus()+"</td>");
                                        out.println("</tr>");
                                    }
                                %>
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