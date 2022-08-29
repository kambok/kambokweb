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
    <title>Investor Dashboard</title>
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
  	  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
   
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="fontawesome-free-6.1.1-web/css/all.css" />
 
 <!--owl carousel min.css-->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" 
       integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" 
       crossorigin="anonymous" referrerpolicy="no-referrer" />
  <!--owl carousel Theme min.css-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" 
        integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  
  <!--    Chart CDN   -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>

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

main{
    background: -webkit-linear-gradient(top right, #f5f6fa, #f5faf9);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
}

.wallet{
    background: url(bg3.png),-webkit-linear-gradient(bottom left, #eee,#ccc);
    border-radius: 20px;
    height: auto;
}

.title{
    background: -webkit-linear-gradient(#066785, #128d6f);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-shadow: 0 6px 10px rgba(0,0,0,0.3);
    letter-spacing: 1.5px;
    font-size: 2.5vmax;
}

.label{
    background: -webkit-linear-gradient(#066785, #128d6f);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    opacity: 0.7;
    font-weight: normal;
    font-size: 2vmax;
}

.amt{
    font-size: 5.2vmax;
    font-weight: bolder;
    background: -webkit-linear-gradient(#066785, #128d6f);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-shadow: 0 2px 10px rgba(0,0,0,0.2);
}

.ledger{
    background: -webkit-linear-gradient(#066785, #128d6f);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    opacity: 0.8;
    font-weight: normal;
    font-size: 2vmax;
}



.info-btn{
    width: 2em;
    height: 2em;
    display: flex;
    justify-content: center;
    align-items:center;
    text-align: center;
    background: transparent;
    position: relative;
    border: 2px solid #066785;
    font-size: 1rem;
}

.info-btn i{
    background: transparent;
    font-size: 1.3em;
}
.tooltiptext{
    visibility: hidden;
    padding: 3px 0;
    position: absolute;
    z-index: 1;
    top: 40px;
    left: -110px;
    font-weight: 500;
    width: 230px;
    font-size: 16px;
    transition: all .2s ease;
}

.tooltiptext::after{
  content: "";
  position: absolute;
  bottom: 85%;
  left: 60%;
  margin-left: -19px;
  border-width: 7px;
  border-style: solid;
  border-color: transparent transparent #066785 transparent;
}

.info-btn:hover .tooltiptext {
    visibility: visible;
}

.btn-fund-wallet{
    background: -webkit-linear-gradient(#066785, #128d6f);
    color: #fff;
    font-size: 1.2vmax;
    font-weight: bold;
    letter-spacing: 1.5px;
}

.ad-card{
    background: url(bg3.png),-webkit-linear-gradient(bottom left, #eee,#ccc);
    border-radius: 20px;
    min-height: 30vh;
}

.header{
    background: -webkit-linear-gradient(#066785, #128d6f);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    font-weight: bold;
    text-shadow: 0 0 15px rgba(0,0,0,0.2);
}


.box-area{
    background: url(background2.jpg),-webkit-linear-gradient(bottom left, #eee, lightgrey);
    background-position: center;
    background-size: cover;
    background-repeat: no-repeat;
    box-shadow: rgba(0, 0, 0, 0.35) 0px 2px 7px;
    transition: all .3s ease;
    min-height: 30vh;
}

.box-area:hover
{
    transform: scale(1.03);
}

.card-title{
    font-size: 2vmax;
    font-weight: bold;
    background: -webkit-linear-gradient(#066785, #128d6f);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.card-text{
    font-size: 1.5vmax;
}

.investment-card{
    min-height: 45vh;
    border-radius: 20px;
    box-shadow: inset 5px 0px 20px rgba(0,0,0,0.2), 0px 0px 7px rgba(0,0,0,0.2) ;
}

.box-1,.box-2, .box-3, box-4{
    width: 100%;
    min-height: 15vh;
    border-radius: 20px;
}

.box-1{
    background: rgba(10, 192, 201, 0.1);
}
.box-2{
    background: rgba(47, 245, 7, 0.1);
}

.box-3{
    background: rgba(237, 7, 245, 0.1);
}
.box-4{
    background: rgba(255, 214, 92, 0.1);
}

.investment-title{
    color: #38464a;
    font-size: 2vmax;
    letter-spacing: 1.8px;
}

.description, .card-title, .sub-title{
    color: #6d878c;
    font-weight: 500;
}

.card-content{
    color: #38464a;
    font-size: 1.5vmax;
    font-weight: bolder;
}

#bg-icon{
    width: 60px;
    height: 60px;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
}

#bg-icon i{
    font-size: 22px;
}

.bg-icon-1{
    background-color: rgb(10, 192, 201); 
}

.bg-icon-2{
    background-color: rgb(47, 245, 7);
}

.bg-icon-3{
    background-color: rgb(237, 7, 245);
}
.bg-icon-4{
    background-color: rgb(255, 214, 92);
}

#myChart{
    width: 100%;
  height: 100%;
  display: block;
  overflow: hidden;
}

@media (max-width: 767.98px) {
  #bg-icon{
    width: 40px;
    height: 40px;
}
}
@media (max-width: 1024px) {
  #bg-icon{
    width: 45px;
    height: 45px;
}
}
  </style>
  

</head>
<body>
    
<script>
        history.pushState(null,'investordashboard.jsp', location.href);
        window.addEventListener('popstate', function(event){
        history.pushState(null,'investordashboard.jsp', location.href)
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

  <div class="col-12 col-md-5 col-lg-8 d-flex align-items-center justify-content-md-end mt-3 mt-md-0">
      <div class="mr-3 mt-1">

      </div>
      <div class="dropdown">
          <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
            Hello, <%=us.getFirstname()+" "+us.getLastname()%>
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
              <li><a class="dropdown-item" href="investor-bio.jsp"><i class="fa-solid fa-gear mx-2 sicon"></i> <span class="txt"> Settings</span></a></li>
              <li><a class="dropdown-item" href="#"><i class="fa-solid fa-envelope mx-2 sicon"></i><span class="txt"> Messages</span></a></li>
              <li><a class="dropdown-item" href="logout"><i class="fa-solid fa-right-from-bracket mx-2 sicon"></i><span class="txt">Sign out</span></a></li>
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
        <a class="nav-link active" aria-current="page" href="investordashboard.jsp">
          <i class="fa-solid fa-house"></i>
          <span class="ml-2">Dashboard</span>
        </a>
      </li>
      <li class="nav-item  active">
        <a class="nav-link" aria-current="page" href="investment-history.jsp">
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
<main class="col-md-8 ml-sm-auto col-lg-10 px-md-4 py-4">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="investordashboard.jsp">Home</a></li>
          <li class="breadcrumb-item active" aria-current="page">Over view</li>
        </ol>
       </nav>  
    <br>
    <div class="row my-4">
  <div class="col-12 col-md-6 col-lg-3 mb-4 mb-lg-0">
      <div class="card shadow">
          <h5 class="card-header">Total Investment</h5>
          <div class="card-body">
            <h5 class="card-title">₦550,000.00</h5>
            <p class="card-text text-success display-5">At 10% rate monthly</p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
      <div class="card shadow">
          <h5 class="card-header">Total accumulating interest</h5>
          <div class="card-body">
            <h5 class="card-title">₦55,000.00</h5>
            <p class="card-text text-primary display-5">Accrued Interest</p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
      <div class="card shadow">
          <h5 class="card-header">Bonus</h5>
          <div class="card-body">
            <h5 class="card-title">₦5,000.00</h5>
            <p class="card-text text-info display-5">Based on investment pack</p>
          </div>
        </div>
  </div>
  <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
      <div class="card shadow">
          <h5 class="card-header">Investment Pack</h5>
          <div class="card-body">
              <h5 class="card-title"><i class="fa-solid fa-medal" style="font-size: 30px;"></i> Bronze</h5>
            <p class="card-text text-secondary display-5">Investment above ₦1M </p>
          </div>
        </div>
  </div>
</div>
    <br>
<div class="row d-flex justify-content-center align-items-center">
    <div class="col-12 col-xl-12 mb-4 mb-lg-0">
        <div class="wallet-container row d-flex justify-content-center p-2">
            <!--wallet section-->
            <section class="wallet col-md-11 shadow p-4">
                
                <div class="row p-4 ">
                    <div class="col-md-12 d-flex justify-content-between">
                        <h3 class="title text-left"> <span><i class="fas fa-wallet rounded-circle"></i></span> Wallet</h3>
                        <button type="button" class="btn rounded-circle info-btn"><i class="fa-solid fa-circle-question text-dark"></i>
                        <span class="tooltiptext text-info">Terms & Conditions</span>
                        </button>
                    </div>
                    
                </div>
                <div class="row p-2 mx-2">
                    <div class="col">
                        
                        <h5 class="label text-left"> <span></span> Available Balance</h5>
                        <h1 class="amt text-left"><input type="password" value="₦55,000.00" style="background: transparent; border: none; outline: none; font-weight: bold" id="amt"></h1>
                        <h3 class="ledger text-left">Ledger Balance:<input type="password" value="₦55,000.00" style="background: transparent; border: none; outline: none; font-weight: normal; -webkit-text-security: asterisk" id="ledger">
                            <span class="hide-figure d-flex justify-content-start p-2"><i class="fas fa-eye" style="cursor: pointer" id="hide-figure" onclick="toggle()"></i></span>
                        </h3>
                        <script>
                            var state = false;
                            const eye = document.querySelector("#hide-figure");
                            function toggle(){
                                if(state){
                                    document.getElementById("amt").setAttribute("type", "text");
                                    document.getElementById("ledger").setAttribute("type", "text");
                                    eye.classList.add('fa-eye-slash');
                                    eye.classList.remove('fa-eye');
                                    state = false;
                                }else{
                                    document.getElementById("amt").setAttribute("type", "password");
                                    document.getElementById("ledger").setAttribute("type", "password");
                                    eye.classList.remove('fa-eye-slash');
                                    eye.classList.add('fa-eye');
                                   state = true;
                                }
                            }
                        </script>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8 d-flex justify-content-between align-items-center">
                        <button class="btn btn-fund-wallet mx-2"><i class="fa-solid fa-hard-drive text-light"></i> Fund Wallet</button>
                        <button class="btn btn-fund-wallet mx-2"><i class="fa-solid fa-money-bill-transfer text-light"></i> Withdraw</button>
                    </div>  
                    <div class="col-md-2"></div>
                </div>
            </section>
        </div>
        <br><br>
        <br><br>
        <section class="investments">
            <div class="container-fluid my-5">
                <div class="row d-flex justify-content-center align-items-center">
                    <div class="col-md-12 p-3">
                        <div class="card investment-card p-5">
                            <h2 class="investment-title my-3">Current Investments</h2>
                            <p class="description">Investment ID: <span class="text-info">234683954AD</span></p>
                            <div class="col investment-content">
                                <div class="owl-carousel owl-theme my-4 ">
                            <div class="item p-2">
                                <div class="card border-0 box-1">
                                 <div class="card-body text-center">
                                     <div class="row d-flex justify-content-between">
                                         <div class="col-md-12 text-left p-3 ">
                                             <div class="col"><p class="sub-title">Invested Amount</p></div>
                                             <div class="col d-flex justify-content-between">
                                                 <h2 class="card-content">₦75,000.00</h2>
                                                 <h2 id="bg-icon" class="rounded-circle bg-icon-1 d-flex justify-content-center align-items-center"><i class="fa-solid fa-paper-plane text-light"></i></h2>
                                             </div>
                                             <div class="col"> <p class="sub-title">At the rate of 10% per month</p></div>
                                         </div>
                                     </div>
                                </div>
                              </div>
                            </div>
                            <!--item ends-->
                            
                             <div class="item  p-2">
                                <div class="card border-0 box-2">
                                <div class="card-body text-center">
                                    <div class="row d-flex justify-content-between">
                                         <div class="col-md-12 text-left p-3 ">
                                             <div class="col"><p class="sub-title">Interest</p></div>
                                             <div class="col d-flex justify-content-between">
                                                 <h2 class="card-content">₦7,500.00</h2>
                                                 <h2 id="bg-icon" class="rounded-circle bg-icon-2 d-flex justify-content-center align-items-center"><i class="fa-solid fa-medal text-light"></i></h2>
                                             </div>
                                             <div class="col"> <p class="sub-title">Accumulated interest after 30days</p></div>
                                         </div>
                                     </div>
                                </div>
                              </div>
                            </div>
                            <!--item ends-->
                            
                             <div class="item  p-2">
                                <div class="card border-0 box-3">
                                <div class="card-body text-center">
                                    <div class="row d-flex justify-content-between">
                                         <div class="col-md-12 text-left p-3 ">
                                             <div class="col"><p class="sub-title">Total</p></div>
                                             <div class="col d-flex justify-content-between">
                                                 <h2 class="card-content">₦82,500.00</h2>
                                                 <h2 id="bg-icon" class="rounded-circle bg-icon-3 d-flex justify-content-center align-items-center"><i class="fa-solid fa-money-bill-trend-up text-light"></i></h2>
                                             </div>
                                             <div class="col"> <p class="sub-title">Invested amount + Interest after 30 days</p></div>
                                         </div>
                                     </div>
                                </div>
                              </div>
                            </div>
                            <!--item ends-->
                            
                            <div class="item  p-2">
                                <div class="card border-0 box-4">
                                <div class="card-body text-center">
                                    <div class="row d-flex justify-content-between">
                                         <div class="col-md-12 text-left p-3 ">
                                             <div class="col"><p class="sub-title">Investment Dates</p></div>
                                             <div class="col d-flex justify-content-between">
                                                 <h2 class="card-content">03/08/2022 - 03/09/2022</h2>
                                                 <h2 id="bg-icon" class="rounded-circle bg-icon-4 d-flex justify-content-center align-items-center"><i class="fa-solid fa-calendar-check text-light"></i></h2>
                                             </div>
                                             <div class="col"> <p class="sub-title">Any investment done after 10:00pm of that day will automatically roll over</p></div>
                                         </div>
                                     </div>
                                </div>
                              </div>
                            </div>
                            <!--item ends-->
                        </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <div class="row d-flex justify-content-center">
        <div class="col-12 col-xl-10 mb-4 mb-lg-0">
        <div class="card shadow">
          <div class="card">
            <h5 class="card-header">Transaction Statistic</h5>
            <div class="card-body">
            <div class="table-responsive">
            <div class="row d-flex justify-content-center">
                 <div class="col-sm-10">
                    <canvas id="myChart" style="width:100%;" scrolling="no"></canvas>
                 </div>
              </div>
  </div>
        <script type="text/javascript">
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
                  label: ["Investment","Interest", "Profit", "Bonus"],
                  backgroundColor: barColors,
                  data: yValues
                }]
              },
              options: {
                legend: {position: 'top', maxLines: 3},
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
    

<script src="path/to/chartjs/dist/chart.js"></script>
<!--Owl carousel Jquery cdn-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" 
integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" 
crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!--Owl carousel min.js-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" 
integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" 
crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!--initialize owl carousel-->

<script>
    $('.owl-carousel').owlCarousel({
    autoplay: true,
    loop:true,
    slideSpeed:1000,
    margin:10,
    nav:true,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:1
        },
        1000:{
            items:2
        }
    }
})
</script>
</body>
</html>
  
