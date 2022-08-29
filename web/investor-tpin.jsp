<%-- 
    Document   : history
    Created on : Jul 4, 2022, 2:33:06 PM
    Author     : ABRAHAM
--%>

<%@page import="imageloader.Loader"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Account</title>
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
  	  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
   
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js@3.8.0/dist/chart.min.js"></script> 
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

iframe{
    width: 100%;
    height: 120vh;
}

main .model-container{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    pointer-events: none;
    opacity: 0;
    //background-color:rgba(0, 0, 0, 0.3);
    transition: opacity 0.3s ease-in;
    }

main .model-container.show{
    opacity: 1;
    pointer-events: auto;
}
main .model-container .model{
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

.model{
    position: relative;
}

.model .close{
    position: absolute;
    top: 20px;
    right: 20px;
    font-weight: bolder;
    color: red;
    cursor: pointer;
}
        
        
  
  
  </style>
  

</head>
<body>
    
<script>
        history.pushState(null,'investor-tpin.jsp', location.href);
        window.addEventListener('popstate', function(event){
        history.pushState(null,'investor-tpin.jsp', location.href)
    });
    </script>
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
    
    
    <%
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
    %>

<nav class="navbar navbar-light bg-light p-3">
  <div class="d-flex col-12 col-md-3 col-lg-2 mb-2 mb-lg-0 flex-wrap flex-md-nowrap justify-content-between">
      <a class="navbar-brand" href="investordashboard.jsp">
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
            Hello, <%=us.getFirstname()+" "+us.getLastname()%>
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <li><a class="dropdown-item" href="Logout">Sign out</a></li>
          </ul>
        </div>
  </div>
</nav>
    
<div class="container-fluid">
<nav id="sidebar" class="col-md-4 col-lg-2 d-md-block bg-light sidebar collapse">
  <div class="row">
        
<div class="position-sticky pt-md-5">
  <ul class="nav flex-column mx-3" id="navbar">
      <li class="nav-item  ">
        <a class="nav-link active" aria-current="page" href="investor-bio.jsp">
          <i class="fa-solid fa-id-card"></i>
          <span class="ml-2">Profile</span>
        </a>
      </li>
      <li class="nav-item  active">
        <a class="nav-link" aria-current="page" href="bio.jsp">
          <i class="fa-solid fa-building-columns"></i>
          <span class="ml-2">Account Info</span>
        </a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="investor-security.jsp">
          <i class="fas fa-lock"></i>
          <span class="ml-2">Password</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="uploadpassport.jsp">
          <i class="fas fa-upload"></i>
          <span class="ml-2">Upload Passport</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="investor-tpin.jsp">
          <i class="fa-solid fa-key"></i>
          <span class="ml-2">Transaction Pin</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="investor-deleteaccount.jsp">
          <i class="fas fa-trash-alt"></i>
          <span class="ml-2">Delete Account</span>
        </a>
      </li>
    </ul>
</div>
      
      <!--CONTROLLING THE ACTIVE LINK-->
<!--      <script>
         var navbar = document.getElementById("navbar");
         var link = document.getElementsByClassName("nav-link");
         for(var i = 0; i < link.length; i++){
             link[i].addEventListener("click", function(){
                 var currentLink = document.getElementsByClassName("active");
                 currentLink[0].className = currentLink[0].className.replace(" active", "");
                 this.className += " active";
             });
         }
      </script>-->
</nav>
<main class="col-md-8 ml-sm-auto col-lg-10 px-md-4 py-4">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="investordashboard.jsp">Home</a></li>
          <li class="breadcrumb-item active" aria-current="page">Transaction Pin</li>
        </ol>
       </nav>     
<div class="row form-container" id="formDiv">
    <div class="col-12 col-xl-1"></div>
    <div class="col-12 col-xl-10 mb-4 mb-lg-0">
        <section>
            <div class="container py-5 h-100">
              <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-8">
                    <h2 class="h2 text-center text-info">Authorization PIN</h2>
                    <p class="text-danger text-center"><span><i class="fa-solid fa-triangle-exclamation text-warning"></i></span> Do not share this pin with anybody. Keep it safe</p>
                <br><br>
                <form action="investor-tpin.jsp" method="" id="myform">                                            
                        <!-- Confirm Password input -->
                        <div class="form-outline mb-4">
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text p-3">
                                            <span><i class="fa-solid fa-key"></i></span>
                                        </span>                    
                                    </div>
                                    <input type="password" class="form-control" placeholder="Enter Authorization Pin" id= "tpin" required="required" maxlength="4" name="tpin">
                                    
                                </div>
                                <h6 style="margin-top: 5px; float: right; color: #4a4a4a; font-size: 18px; font-weight: normal;" class="text-secondary"><span style="font-weight: bold;" id="input-counter"></span>/4</h6>
                            </div> 
                        </div>
   
                             
                          <div class="col">
                              <b id="report" class="text-center"></b> 
                            <!-- Simple link -->
                            <a style="float: right; display: none;" id="forgot" href="#!">Forgot password?</a>
                          </div>
                          <br>
                        <!-- Submit button -->
                        <div class="row d-flex justify-content-center">
                            <button type="submit" class="btn btn-primary btn-block mb-4" id="submitBtn" onmouseenter="validatePin()"><h5>Submit</h5></button>
                        </div>
                        
                        
                </form>        
             
                </div>
              </div>
            </div>
          </section>
    </div>
  <div class="col-12 col-xl-1"></div>
</div> 
    <br><br> <br> <br> <br> <br> <br> <br> <br> <br> <br>   
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
    <div class="row">
        <div class="col-md-12">
            <div class="model-container d-flex justify-content-center align-items-center" id="modelContainer">
               <div class="row">
                   <div class="col-md-5 col-sm-12 col-xs-12"></div>
                <div class="col-md-5 col-sm-7 col-xs-7 model text-center  ">
                   <h3 class="text-center text-info">Set Authorization PIN</h3>
                    <p>You're about to set your transaction pin</p>
                    <h5>Are you sure?</h5>
                    <br><br>
                    <form action="SetTransactionPin" method="post">
                        <input type="password" class="form-control" placeholder="Enter Password" id= "pass" required="required" style="height: 55px;" name="password" onmouseleave="validatePass()">
                        <p class="text-danger" id="r"></p>
                    <input type="hidden" name="tpin" id="pin">
                    <input type="hidden" name="pass" id="1" visible="false">
                    <br><br>
                     <button type="submit"  class="btn btn-success p-2" style="width: 100%; font-size: 20px; font-weight: bold;" id="submit">Yes</button>
                    </form>
                     <span id="close-btn" class="close">X</span>
                   </div>
            </div>
            </div>
        </div>
        
    </div>
  </main>
  </div>
    <script>
        const open = document.getElementById("submitBtn");
        const modelContainer = document.getElementById("modelContainer");
        const close = document.getElementById("close-btn");
        const blurContainer = document.getElementById("formDiv");
        const myform = document.getElementById("myform");
        const tpin = document.getElementById("tpin");
        const inputCounter = document.getElementById("input-counter");
        const submit= document.getElementById("submit");
       
        
        //Input counting function
        function validatePin(){
            const count = tpin.value.length;
           document.getElementById("input-counter").textContent = count;
           if(count<4){
               document.getElementById("tpin").placeholder = "Your pin must be 4-digit"
               document.getElementById("tpin").style.borderColor = "red";
               document.getElementById("submitBtn").style.backgroundColor = "lightgrey";
               document.getElementById("submitBtn").style.border = "lightgrey";
               document.getElementById("submitBtn").disabled = true;
           }else{
             document.getElementById("tpin").placeholder = "";
             document.getElementById("tpin").style.borderColor = "lightgrey";
             document.getElementById("submitBtn").style.backgroundColor = "#0d6efd";
             document.getElementById("submitBtn").disabled = false;
           }
        }
        
        tpin.addEventListener("input", validatePin);
        tpin.addEventListener("mouseout", validatePin);
        
      
       myform.addEventListener('submit', ()=>{
            event.preventDefault();
            
            var pinInput = document.getElementById("tpin").value;
            var pin = document.getElementById("pin");
            pin.value = pinInput;
        });
        
        function validatePass(){
             const p = document.getElementById("1").value='<%= us.getPassword() %>';
             const pass = document.getElementById("pass").value;
             const btn =  document.getElementById("submit");
             
           if(p!=pass){
              document.getElementById("r").textContent = "Incorrect password";
              btn.style.backgroundColor = "lightgrey";
              btn.style.border = "lightgrey";
              btn.disabled = true;
           }else{
               document.getElementById("r").textContent = "";
               btn.style.backgroundColor = "#28a745";
               btn.style.border = "#28a745";
               btn.disabled = false;
           }
        }
                     
        open.addEventListener('click', ()=>{
            modelContainer.classList.add('show');
            blurContainer.classList.add('blu');
        });
        close.addEventListener('click', ()=>{
            modelContainer.classList.remove('show');
            blurContainer.classList.remove('blu');
        });
        
      
    </script>
</body>
</html>
  
