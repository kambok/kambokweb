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
    <title>Dashboard</title>
 
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
        
        
  
  
  </style>
  

</head>
<body>
    

<%! String pic =""; %>
    
    <%
       DataSupply us= (DataSupply)session.getAttribute("user");
       if(us.getEmail()!=null && us.getPosition().equals("Client")){
                  
       }else{
           response.sendRedirect("index.jsp");
       }
       
      
       
       String email = request.getParameter("email");
       pic = Loader.loadPassport(us.getEmail());
    %>

<nav class="navbar navbar-light bg-light p-3">
  <div class="d-flex col-12 col-md-3 col-lg-2 mb-2 mb-lg-0 flex-wrap flex-md-nowrap justify-content-between">
      <a class="navbar-brand" href="ClientDashboard.jsp">
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
            Hello, <%=us.getFirstname() +" "+us.getLastname() %>
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <li><a class="dropdown-item" href="Logout">Sign out</a></li>
          </ul>
        </div>
  </div>
</nav>
    
<div class="container-fluid">
<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
  <div class="row">
        
<div class="position-sticky pt-md-5">
  <ul class="nav flex-column" id="navbar">
      <li class="nav-item">
          <a class="nav-link" aria-current="page" href="settings.jsp">
          <i class="fas fa-shield"></i>
          <span class="ml-2">Security</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="uploadpassport.jsp" >
          <i class="fas fa-upload"></i>
          <span class="ml-2">Upload Passport</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="tc.jsp" >
          <i class="fas fa-exclamation-circle"></i>
          <span class="ml-2">Terms & Condition</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="deleteaccount.jsp">
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
<main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
        <div class="row d-flex justify-content-center py-5">
    <div class="col-md-10">
        <div class="container">
            <h2 class="h2 text-center text-info">Terms & Conditions</h2>
            <br><br>
        <p>
            <ol>
                <li>
                    <h4>
                        Introduction
                    </h4>
                    <ul>
                    <li>Definitions and Interpretation
                        <p>
                            In this Agreement the following terms shall have the following meanings:
                        </p>
                        <p>
                            “Content” means any text, graphics, images, audio, video, software, data compilations and any other form of information capable 
                            of being stored in a digital format and that appears on or forms part of this Website or wider services by KBC;
                        </p>
                        <p>"KBC" means Kambok corporation</p>
                        <p>“Service” means collectively any online facilities, tools, services or 
                        <p>“System” means any online communications infrastructure that TFG makes available through the Website either now 
                        <p>“User” / “Users” means any third party that accesses the Website and is not employed by KBC and acting in the course of their employment; and</p>
                        <p>The “Site” means the KBC owned websites that you are using, including, but not limited to (www.kambokloan.com) and any sub-domains of this site (e.g. www.kambokloan.com)unless expressly excluded by their own terms and conditions.</p>
                        <p>“KBC Owned Websites” means controlled, majority owned or where TFG controls the Data or Content of a website. It also covers any owned content on third party platforms, if applicable.</p>
                    </li>
                    </ul>
                </li>
                <li><h4>Terms</h4>
                    <ul>
                    <li>The Site is provided to you subject to these <a href="tc.jsp">Terms and our Privacy Policy</a>. Please read these <a href="tc.jsp">Terms and our Privacy Policy</a> before using our Site. 
                        By using our Site you are agreeing to be bound by these <a href="tc.jsp">Terms and our Privacy Policy</a>. 
                        If you don’t agree to these Terms or our Privacy Policy, you should stop using and accessing the Site. 
                        If you breach any of these Terms, your right to access and use the Site will cease immediately.</p>
                    </li>
                    </ul>
                </li>
                <a href="tc2.jsp">Read more</a>
                
            </ol>
        </p>
        </div>
    </div>
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
  </main>
  </div>
    
</body>
</html>
  
