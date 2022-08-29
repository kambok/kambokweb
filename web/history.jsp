<%-- 
    Document   : history
    Created on : Jul 4, 2022, 4:27:16 PM
    Author     : User
--%>

<%@page import="model.LoanDetails"%>
<%@page import="java.util.List"%>
<%@page import="model.DataSupply"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>History</title>
 
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
</head>
<body>
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
            Hello, Kambok Mohammed
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
        <a class="nav-link active" href="history.jsp">
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
    <li class="breadcrumb-item"><a href="#">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Overview</li>
  </ol>
</nav>
<h1 class="h2">History</h1>
<p>Breakdown of all transactions</p>
    
<div class="card">
   <h5 class="card-header">My daily Activities</h5>
  <div class="card-body">
  <div class="table-responsive">
    <div id="piechart"></div>
	</div>
  </div>
   <script type="text/javascript">
      google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('number', 'Day');
      data.addColumn('number', 'Approved Loans');
      data.addColumn('number', 'Pending Loans');
      data.addColumn('number', 'Redeemed');

      data.addRows([
        [1,  37.8, 80.8, 41.8],
        [2,  30.9, 69.5, 32.4],
        [3,  25.4,   57, 25.7],
        [4,  11.7, 18.8, 10.5],
        [5,  11.9, 17.6, 10.4],
        [6,   8.8, 13.6,  7.7],
        [7,   7.6, 12.3,  9.6],
        [8,  12.3, 29.2, 10.6],
        [9,  16.9, 42.9, 14.8],
        [10, 12.8, 30.9, 11.6],
        [11,  5.3,  7.9,  4.7],
        [12,  6.6,  8.4,  5.2],
        [13,  4.8,  6.3,  3.6],
        [14,  4.2,  6.2,  3.4]
      ]);

      var options = {
        chart: {
          title: 'Estimated Loan amount',
          subtitle: 'in thousands of naira (NGN)'
        },
        width: 900,
        height: 500
      };

      var chart = new google.charts.Line(document.getElementById('piechart'));

      chart.draw(data, google.charts.Line.convertOptions(options));
    }
</script>
</div>
  


    <br />
<div class="row">
  <div class="col-12 col-xl-12 mb-4 mb-lg-0">
      <div class="card">
          <h5 class="card-header">Request Records</h5>
          <div class="card-body">
              <div class="table-responsive">
                <strong id="r"></strong>
        <table class="table">
                      <thead>
                        <tr>
                          <th >Tranid</th>
                          <th >Loan Amount</th>
                          <th >Interest</th>
                          <th >Duration</th>
                          <th >Date</th>
                          <th >Status</th>
                        
                        </tr>
                      </thead>
                      <%
                      List<LoanDetails> gethistory=data.Database.gethistory(us.getEmail());
                      for(LoanDetails ld:gethistory){
                          if(ld.getStatus().equals("Submitted")){
                          out.println("<tr class='text-primary'><td>"+ld.getTrid()+"</td><td>"+ld.getLoanamount()+"</td><td>"+ld.getInterest()+"</td><td>"+ld.getDuration()+"</td><td>"+ld.getLoandate()+"</td><td>"+ld.getStatus()+"</td></tr>");    
                          }else if(ld.getStatus().equals("Redeemed")){
                            out.println("<tr class='text-success'><td>"+ld.getTrid()+"</td><td>"+ld.getLoanamount()+"</td><td>"+ld.getInterest()+"</td><td>"+ld.getDuration()+"</td><td>"+ld.getLoandate()+"</td><td>"+ld.getStatus()+"</td></tr>");      
                          }else if(ld.getStatus().equals("Declined")){
                          out.println("<tr class='text-danger'><td>"+ld.getTrid()+"</td><td>"+ld.getLoanamount()+"</td><td>"+ld.getInterest()+"</td><td>"+ld.getDuration()+"</td><td>"+ld.getLoandate()+"</td><td>"+ld.getStatus()+"</td></tr>");        
                          }
                      }
                      
                      %>       
                    </table>
              </div>
                <a href="#" id="ls" style="visibility: hidden;" class="btn btn-block btn-light">View all</a>
          </div>
      </div>
  </div>

  <% 
               if(us.getTrid()!="" && us.getState().equals("Pending")){
               out.println("<script>document.getElementById('ls').style.visibility='visible';</script>");   
             
                }else{
                 out.println("<script>document.getElementById('r').innerHTML='No record';</script>");   
                
               }
               %>
</div>
<div class="row">
  <div class="col-12 col-xl-12 mb-4 mb-lg-0">
      <div class="card">
          <h5 class="card-header">Approved Records</h5>
          <div class="card-body">
              <div class="table-responsive">
                <strong id="r"></strong>
        <table class="table">
                      <thead>
                        <tr>
                          <th >Tranid</th>
                          <th >Loan Amount</th>
                          <th >Interest</th>
                          <th >Duration</th>
                          <th >Date</th>
                          <th >Status</th>
                        
                        </tr>
                      </thead>
                      <%
                      List<LoanDetails> gethistory2=data.Database.gethistory(us.getEmail());
                      for(LoanDetails ld:gethistory2){
                          if(ld.getStatus().equals("Submitted")){
                          out.println("<tr class='text-primary'><td>"+ld.getTrid()+"</td><td>"+ld.getLoanamount()+"</td><td>"+ld.getInterest()+"</td><td>"+ld.getDuration()+"</td><td>"+ld.getLoandate()+"</td><td>"+ld.getStatus()+"</td></tr>");    
                          }else if(ld.getStatus().equals("Redeemed")){
                            out.println("<tr class='text-success'><td>"+ld.getTrid()+"</td><td>"+ld.getLoanamount()+"</td><td>"+ld.getInterest()+"</td><td>"+ld.getDuration()+"</td><td>"+ld.getLoandate()+"</td><td>"+ld.getStatus()+"</td></tr>");      
                          }else if(ld.getStatus().equals("Declined")){
                          out.println("<tr class='text-danger'><td>"+ld.getTrid()+"</td><td>"+ld.getLoanamount()+"</td><td>"+ld.getInterest()+"</td><td>"+ld.getDuration()+"</td><td>"+ld.getLoandate()+"</td><td>"+ld.getStatus()+"</td></tr>");        
                          }
                      }
                      
                      %>       
                    </table>
              </div>
                <a href="#" id="ls" style="visibility: hidden;" class="btn btn-block btn-light">View all</a>
          </div>
      </div>
  </div>

  <% 
               if(us.getTrid()!="" && us.getState().equals("Pending")){
               out.println("<script>document.getElementById('ls').style.visibility='visible';</script>");   
             
                }else{
                 out.println("<script>document.getElementById('r').innerHTML='No record';</script>");   
                
               }
               %>
</div>    

<div class="row">
  <div class="col-12 col-xl-12 mb-4 mb-lg-0">
      <div class="card">
          <h5 class="card-header">Redeem Records</h5>
          <div class="card-body">
              <div class="table-responsive">
                <strong id="r"></strong>
        <table class="table">
                      <thead>
                        <tr>
                          <th >Tranid</th>
                          <th >Loan Amount</th>
                          <th >Interest</th>
                          <th >Duration</th>
                          <th >Date</th>
                          <th >Status</th>
                        
                        </tr>
                      </thead>
                      <%
                      List<LoanDetails> gethistory3=data.Database.gethistory(us.getEmail());
                      for(LoanDetails ld:gethistory3){
                          if(ld.getStatus().equals("Submitted")){
                          out.println("<tr class='text-primary'><td>"+ld.getTrid()+"</td><td>"+ld.getLoanamount()+"</td><td>"+ld.getInterest()+"</td><td>"+ld.getDuration()+"</td><td>"+ld.getLoandate()+"</td><td>"+ld.getStatus()+"</td></tr>");    
                          }else if(ld.getStatus().equals("Redeemed")){
                            out.println("<tr class='text-success'><td>"+ld.getTrid()+"</td><td>"+ld.getLoanamount()+"</td><td>"+ld.getInterest()+"</td><td>"+ld.getDuration()+"</td><td>"+ld.getLoandate()+"</td><td>"+ld.getStatus()+"</td></tr>");      
                          }else if(ld.getStatus().equals("Declined")){
                          out.println("<tr class='text-danger'><td>"+ld.getTrid()+"</td><td>"+ld.getLoanamount()+"</td><td>"+ld.getInterest()+"</td><td>"+ld.getDuration()+"</td><td>"+ld.getLoandate()+"</td><td>"+ld.getStatus()+"</td></tr>");        
                          }
                      }
                      
                      %>       
                    </table>
              </div>
                <a href="#" id="ls" style="visibility: hidden;" class="btn btn-block btn-light">View all</a>
          </div>
      </div>
  </div>

  <% 
               if(us.getTrid()!="" && us.getState().equals("Pending")){
               out.println("<script>document.getElementById('ls').style.visibility='visible';</script>");   
             
                }else{
                 out.println("<script>document.getElementById('r').innerHTML='No record';</script>");   
                
               }
               %>
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
  
