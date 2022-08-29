
<%@page import="model.Wallet"%>
<%@page import="model.Finance"%>
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

    <title>ViewRequest</title>
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
      function myprint(divName){
          
       var printContents = document.getElementById(divName).innerHTML;
       
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
   
      }
</script> 
  

  <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        
        setTimeout("preventBack()", 0.0);
        window.onunload = function () { null };
    </script>
   
 </head>
<body>
	
<!-- Testing github	 -->
     <script type = "text/javascript" >
          history.pushState(null, null, 'Receipt.jsp');
          window.addEventListener('popstate', function (event) {
              history.pushState(null, null, 'Receipt.jsp');
      });

     </script>
     
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>

         <%!String name="",position="",email="";
         Wallet fc=new Wallet();
         %>
    <%
   AdminUser s = (AdminUser)session.getAttribute("staff");
      name=s.getFirstname() + " " + s.getLastname();
      position=s.getPosition();
      email=s.getEmail();
    
  if((position.equals("Admin") || position.equals("Finance")) && (!email.equals("") || email!=null)){
    
         fc=data.Database.getsinglewalletReceipt((String)session.getAttribute("pin"));
         double ds=fc.getBalance();
       
          if(fc!=null){
           
            
            }else{
        response.sendRedirect("confirmpayment.jsp");
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

    
<div class="card" id="mpt">
  <h5 class="card-header">Payment Receipt</h5>
  <div class="card-body">
     
      <div class="row">
          <div class="col-sm-1"></div>
          <div class="col-sm-10">
              <center>
              <img src="kam.png" width="50" />
              <h2>kambok</h2>
              <h6>Email:</h6>
              <h6>Phone:</h6>
          </center>
              <hr />
              <big>Transaction Description</big>
              <hr />
              <div class="table-responsive">
              <table class="table">
                  <tr><th>Pmt ID</th>
                      <td><%=fc.getPin()%></td>
                      <th>Date</th>
                      <td><%=fc.getDate()%></td>
                      <th>Wallet ID</th>
                      <td><%=fc.getAccount()%></td>
                    </tr>
                  <tr>
                      <th>Amount</th>
                      <td><%=fc.getCredit()%></td>
                      <th>Balance</th>
                      <td><%=fc.getBalance()%></td>
                      <th>Status</th>
                      <td><%="Successful"%></td>
                      
                  </tr>
                  
                   
                  
              </table>
              <hr />
              <center>
              <big>*** Thank You ***</big>
              </center>
              </div>
          </div>
          <div class="col-sm-1"></div>        
      </div>
                  <div class="row">
                      <div class="col-sm-1"></div>
              <div class="col-sm-6">
               
                     <%=session.getAttribute("time")%>
              </div><div class="col-sm-5">
                      <%=new java.util.Date()%>
              </div>
                  </div>
              <center>
                  <b>Services offered at kambok and given by <%= fc.getSender()%> </b>
              </center>
          </div>
          </div>
              
              <button type="button" class="btn btn-success p-2 mt-3" onclick="myprint('mpt');">print</button>
  


    

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
  <div class="col-12 col-xl-12 mb-4 mb-lg-0">
    
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
  
