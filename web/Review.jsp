<%-- 
    Document   : View
    Created on : Jun 23, 2022, 9:36:21 PM
    Author     : ABRAHAM
--%>

<%@page import="model.DataSupply"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.LoanRequest"%>

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
 <title>View</title>
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

.image-container{
    object-fit: cover;
    width: 100%;
    height: 380px;
    overflow: hidden;
}

.image-container img{
    max-width: 180px;
}
  
  
  </style>
   
 <script>  
    var request;

    function sendInfo()  
    {  
        var email=document.myform.email.value;
        var colname=document.myform.colname.value;
        var trid=document.myform.trid.value;
        var amount=document.myform.amount.value;

        var url="Approve_Request?email="+email+"&colname="+colname+"&trid="+trid+"&amount="+amount;

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
        document.getElementById('dd').innerHTML=val;  
        } 
    }
</script>   
</head>
<body>

    <%
        DataSupply ds = (DataSupply)session.getAttribute("user");
    %>
<nav class="navbar navbar-light bg-light p-3">
  <div class="d-flex col-12 col-md-3 col-lg-2 mb-2 mb-lg-0 flex-wrap flex-md-nowrap justify-content-between">
      <a class="navbar-brand" href="#">
          <span class="fa fa-user"></span>&nbsp; <%= ds.getPosition() %>
		  
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
            Hello, <%= ds.getFirstname() +" "+ds.getLastname() %>
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Messages</a></li>
            <li><a class="dropdown-item" href="Logout">Sign out</a></li>
          </ul>
        </div>
  </div>
</nav>
    <br />
<div class="container">
    <div class="row">
<div class="col-md-12">
        
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="loanapp.jsp"><span class="btn btn-primary">Back</span></a></li>
  </ol>
</nav>
<h1 class="h2">Request Information</h1>
<div class="card">
    <h5 class="card-header">Loan</h5>
    <div class="card-body">

   <div class="row">
  <div class="col-md-12">
      <div class="card">
          <div class="table-responsive">
              <table class="table">
                  <tr>
                      <th>First Name:</th>
                      <td><%= ds.getFirstname()%></td>
                  </tr>
                  <tr>
                      <th>Last name:</th>
                      <td><%= ds.getLastname() %></td>
                  </tr>
                 <tr>
                      <th>Transaction ID:</th>
                      <td><%= ds.getTrid()%></td>
                  </tr>
                  <tr>
                      <th>Transaction Start Date:</th>
                      <td><%= request.getParameter("loandate")%></td>
                  </tr>
                  <tr>
                      <th>Transaction Expired Date:</th>
                      <td><%= request.getParameter("repaydate") %></td>
                  </tr>
                  <tr>
                      <th>Duration</th>
                      <td><%= request.getParameter("days") + " days" %></td>
                  </tr>
                  <tr>
                      <th>Loan Amount</th>
                      <td><%= "₦"+request.getParameter("amount") %></td>
                  </tr>
                  <tr>
                      <th>Interest</th>
                      <td><%= "₦"+request.getParameter("interest") %></td>
                  </tr>
                  <tr>
                      <th>Collateral Name:</th>
                      <td><%= ds.getColname() %></td>
                  </tr>
                  <tr>
                      <th>Collateral ID:</th>
                      <td><%= ds.getColid()%></td>
                  </tr>
                  <tr>
                      <th>Collateral Condition/Description:</th>
                      <td><%= ds.getCondition()%></td>
                  </tr>
              </table>
          </div> 
        </div>
  </div>
  </div>
    <br>
   <div class="row">
  <div class="col-md-12">
      <div class="card">
          <div class="container">
              
          </div> 
        </div>
  </div>
  </div>
  </div>
  </div>
</div>
    </div>
        <div class="row">
            <div class="col-md-12"> 
                <br><br>
 <ol class="d-flex justify-content-between">
    <li class="breadcrumb-item"><a href="loanapp.jsp"><span class="btn btn-primary">Cancel</span></a></li>
    <li style="list-style: none;">
        
        <form action="Finish" method="get">
            <input type="hidden" name="email" value="<%= ds.getEmail() %>">
            <input type="hidden" name="tid" value="<%= ds.getTrid()%>">
            <input type="hidden" name="ld" value="<%= request.getParameter("loandate")%>">
            <input type="hidden" name="rd" value="<%= request.getParameter("repaydate") %>">
            <input type="hidden" name="d" value="<%= request.getParameter("days")%>">
            <input type="hidden" name="amt" value="<%= request.getParameter("amount") %>">
            <input type="hidden" name="int" value="<%= request.getParameter("interest") %>">
          
            <button type="submit" class="btn btn-primary"><i class="fa-solid fa-paper-plane-top"></i> Submit</button>
        </form></li>
  </ol>
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
  