<%-- 
    Document   : bio
    Created on : Jun 27, 2022, 9:26:08 AM
    Author     : ABRAHAM
--%>


<%@page import="model.DataSupply"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bio</title>
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
  	  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
   <link rel="icon" type="image/x-icon" href="kam.png">
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

.profile{
    width: 180px;
    height: 130px;
    overflow: hidden;
    margin-left: 40px;
    
}

.profile img{
    
    object-fit: fill;
}
  
  
  </style>
  <script>
  var request;

function sendInfo()  
{ 
var email=document.myform.email.value;
var address=document.myform.address.value;
var state=document.myform.state.value;
var purpose=document.myform.purpose.value;
var phone=document.myform.phone.value;
var occupation=document.myform.occupation.value;
var gender=document.myform.gender.value;

if(gender!="" && occupation!="" && purpose!="" && state!="" && phone!="" && address!=""){
  
   var url="saveBio?email="+email+"&address="+address+"&state="+state+"&purpose="+purpose+"&phone="+phone+"&occupation="+occupation+"&gender="+gender;
  
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
}else{
  document.getElementById('dis').innerHTML="fill all information";  
    }
}
  
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('dis').innerHTML=val; 
location.reload();
} 
}
</script>
<script type="text/javascript">
      function preventBack(){
          window.history.forward();
      }
      setTimeout("preventBack()", 0);
      window.onunload = function(){null};
  </script>
  

</head>

<body>
    
     <script>
        history.pushState(null,'bio.jsp', location.href);
        window.addEventListener('popstate', function(event){
        history.pushState(null,'bio.jsp', location.href)
    });
    </script>
    

    <%
       DataSupply us= (DataSupply)session.getAttribute("user");
       
       if(us!=null && us.getPosition().equals("Client")){
           if(us.getGender() == null){
               us.setGender("");
               us.setState("");
               us.setCountry("");
               us.setAdress("");
               us.setDob("");
               us.setOccupation("");
               us.setPurpose("");
               
           }
       }else{
           response.sendRedirect("index.jsp");
       }
       
      
    %>
    
    
    <%
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
    %>

<nav class="navbar navbar-light bg-light p-3">
  <div class="d-flex col-12 col-md-3 col-lg-2 mb-2 mb-lg-0 flex-wrap flex-md-nowrap justify-content-between">
      <a class="navbar-brand" href="#">
          <img src="image/users/" width="40px" class="rounded-pill user-passport">&nbsp; <%= us.getPosition() %>
		  
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
            Hello, <%= us.getFirstname() +" "+us.getLastname() %>
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Messages</a></li>
            <li><a class="dropdown-item" href="Logout">Sign out</a></li>
          </ul>
        </div>
  </div>
</nav>
    
<div class="container-fluid">
<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">       
<div class="position-sticky pt-md-5">
  <ul class="nav flex-column">
      <li class="nav-item">
        <a class="nav-link " aria-current="page" href="dashboard.jsp">
          <i class="fa-solid fa-house mx-2"></i>
          <span class="ml-2">Dashboard</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="loanrequest.jsp">
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
        <a class="nav-link active" href="bio.jsp">
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
<div class="row d-flex justify-content-space-around align-items-center">
        <div class="col">
            <h1 class="h2">Personal Information</h1>
        <p>Fill the below form for your instant loan</p>
        </div>
       </div>
    
    <br>
    
<div class="card">
  <h5 class="card-header">Personal Information</h5>
  <div class="card-body">
      <strong id="dis" class="text-success"></strong>
      <form class="row g-3" name="myform">
                            <div class="col-md-4">
                              <label for="colname" class="form-label">First Name</label>
                              <input type="text" readonly class="form-control" id="fname" value="<%=us.getFirstname()%>" name="fname">
                            </div>
            <div class="col-md-4">
                              <label for="colname" class="form-label">Last Name</label>
                              <input type="text" readonly class="form-control" id="total" value="<%=us.getLastname()%>" name="total">
                            </div>
            <div class="col-md-4">
                              <label for="colname" class="form-label">Email</label>
                              <input type="text" readonly class="form-control" id="date" value="<%=us.getEmail()%>" name="email">
                            </div>
                      <div class="col-md-4">
                              <label for="colname" class="form-label">Phone</label>
                              <input type="text"  class="form-control" id="fname" value="<%=us.getPhone()%>" name="phone">
                            </div>
            <div class="col-md-4">
                              <label for="colname" class="form-label">Address</label>
                              <input type="text"  class="form-control" id="total" value="<%=us.getAdress()%>" name="address">
                            </div>
            <div class="col-md-4">
                              <label for="colname" class="form-label">State</label>
                              <input type="text"  class="form-control" id="date" value="<%=us.getState()%>" name="state">
                            </div>
                       <div class="col-md-4">
                              <label for="colname" class="form-label">Gender</label>
                              <input type="text"  class="form-control" id="fname" value="<%=us.getGender()%>" name="gender">
                            </div>
            <div class="col-md-4">
                              <label for="colname" class="form-label">Purpose</label>
                              <input type="text"  class="form-control" id="total" value="<%=us.getPurpose()%>" name="purpose">
                            </div>
            <div class="col-md-4">
                              <label for="colname" class="form-label">Occupation</label>
                              <input type="text"  class="form-control" id="date" value="<%=us.getOccupation()%>" name="occupation">
                            </div>
          <div class="col-12">
                            
              <input type="button" class="btn btn-secondary" onclick="sendInfo();" value="save">
                            </div>
       </form>
  </div>
</div>
</main> 
                
    <br /> <br />     <br /> <br /> 

    <div class="row d-flex justify-content-center">
        <div class="col-md-2"></div>
        <div class="col-md-8 ">
             <footer class="pt-5 d-flex justify-content-between text-center">
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
        <div class="col-md-2"></div>
        
    </div>
</div>  
</body>
</html>
  

