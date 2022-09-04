<%-- 
    Document   : dashboard
    Created on : Jun 20, 2022, 3:18:46 PM
    Author     : User
--%>

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

    <title>View Staff</title>
 
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

.add-user{
    width: 50%;
    font-size: 20px;
    font-weight: bold;   
}

  
main .model-container{
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
    position: relative;
    background-color: #fff;
    padding: 30px 50px;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.2);
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


//view user section
 .lt{
          background-color: #8cd9e530;
          border: none;
      }
      
      .spread{
          letter-spacing: 6px;
          font-weight: bolder;
      }
      .light-text{
          color: darkgrey;
      }
      
      .rt{
          opacity: 0.9;
          font-weight: normal;
      }
      
      .breadcrumb{
          border-radius: 18px;
      }
      
      .text-r{
          border-bottom: 1px solid #8cd9e5c0;
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
          history.pushState(null, null, 'editStaff.jsp');
          window.addEventListener('popstate', function (event) {
              history.pushState(null, null, 'editStaff.jsp');
      });

     </script>
     
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>

    <%!String name="",position="",email="", email2="";%>
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
    AdminUser staff = data.Database.viewSingleStaff((String)session.getAttribute("staffEmail"));
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
        <a class="nav-link" aria-current="page" href="dashboard.jsp">
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
        <a class="nav-link" href="accountinfo.html">
          <i class="fa-solid fa-file-invoice-dollar mx-2"></i>
          <span class="ml-2">Account Info</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="staffmanagement.jsp">
          <i class="fa-solid fa-file-pen mx-2"></i>
          <span class="ml-1">Staff Management</span>
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
    </ul>
</div>
  
</nav>
<main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4 ">
        
<nav aria-label="breadcrumb" >
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="staffmanagement.jsp">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Overview</li>
  </ol>
</nav>
<div class="container-fluid">
<h1 class="h2 text-primary text-center">Edit Staff Information</h1>

<section class="staff-management-section container">
    <div class="row my-4">
        <div class="card lt p-3">
            <div class="row ">
                <div class="col-md-12">
                    <div class='card-body'>
                        <form class='form' action="saveEditStaff" method="post">
                            <div class='row d-flex'>
                                <div class='form-group col-md-6'>
                                <h5 class="light-text">First name</h5>
                                <input type='text' value='<%= staff.getFirstname() %>' readonly class="form-control" style="font-size: 20px; font-weight: 500;">
                            </div>
                            <div class='form-group col-md-6'>

                                <h5 class="light-text">Last name</h5>
                                <input type='text'  value='<%= staff.getLastname() %>' readonly class="form-control" style="font-size: 20px; font-weight: 500;">
                            </div>
                            </div>
                            <br>
                            <div class='row d-flex'>
                                <div class='form-group col-md-6'>
                                <h5 class="light-text">Email Address</h5>
                                <input type='text' value="<%= staff.getEmail() %>" readonly  class="form-control" style="font-size: 20px; font-weight: 500;"  name="email">
                            </div>
                            <br>
                           <div class='form-group col-md-6'>
                                <h5 class="light-text">Employee Status</h5>
                                <input type='text'  disabled="true" value='Full Time' class="form-control" style="font-size: 20px; font-weight: 500;">
                            </div>
                            </div>
                            <br>
                            <div class='row d-flex'>
                                <div class='form-group col-md-6'>
                                    <h5 class="light-text">Position</h5>
                                    <select name="position" class="form-control" style="font-size: 20px; font-weight: 500;">
                                        <option ><%= staff.getPosition() %></option>
                                        <option value="Customer Care">Customer care</option>
                                        <option value="Finance">Payment Department</option>
                                        <option value="Inspector">Inspection Department</option>
                                        <option value="Client">Client</option>
                                        <option value="Investor">Investor</option>
                                    </select>
                                </div>
                                <div class='form-group col-md-6'>
                                    <h5 class="light-text">Phone number</h5>
                                    <input type='text' name="phone" placeholder='<%= staff.getPhone() %>' class="form-control" style="font-size: 20px; font-weight: 500;">
                                </div>   
                            </div> 
                                <br><br>
                            <div class="row d-flex justify-content-between align-items-center">
                            <div class="col-md-6 ">
                                <a href="staffmanagement.jsp" class="btn btn-primary" style="width: 150px; font-size: 20px;">Close</a>
                            </div>
                            <div class="col-md-6">
                                <button type='submit' class="btn btn-primary" style="width: 150px; font-size: 20px;">Submit</button>
                            </div>
                            </div>
                        </form> 
                    </div>
                </div>
            </div>      
        </div>
       </div>
    </section>
</div>

<br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br>
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
 </main>

  </div>
</div>
</div>
  
</body>
</html>
  
