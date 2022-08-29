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
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js@3.8.0/dist/chart.min.js"></script> 
        <link rel="stylesheet" href="fontawesome-free-6.1.1-web/css/all.css" />

        <!--owl carousel min.css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" 
              integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!--owl carousel Theme min.css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" 
              integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!--table-pagination css.min cdn-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
        
        <!--Modal-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

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
                #bg-icon{
                    width: 40px;
                    height: 40px;
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
                background: url(background3.jpg),-webkit-linear-gradient(bottom left, #eee, lightgrey);
                background-position: center;
                background-size: cover;
                background-repeat: no-repeat;
                transition: all .3s ease;
                min-height: 30vh;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                position: relative;
            }

            .box-area:hover{
                transform: scale(1.01);
            }

            .alarm-image img{
                max-width: 120px;
            }

            .card-title{
                font-size: 3.5vmax;
                font-weight: bold;
                background: -webkit-linear-gradient(#066785, #128d6f);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
            }

            .card-text{
                font-size: 2vmax;
            }

            .invest-btn{
                width: 80%;
                padding: 10px 15px;
                font-size: 1.7vmax;
                font-weight: bold;
                border-radius: 20px;
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
                font-size: 1.2vmax;
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

            .package-icon{
                max-width: 100px;
            }

            @media (max-width: 1024px) {
                #bg-icon{
                    width: 45px;
                    height: 45px;
                }
                .alarm-image img{
                    max-width: 50px;
                }
                .package-icon{
                    max-width: 60px;
                }
            }
            @media only screen and (max-width: 768px) {
                #bg-icon{
                    width: 45px;
                    height: 45px;
                }
            }
        </style>
    </head>
    <body>

        <script>
            history.pushState(null, 'investment-news-feed.jsp', location.href);
            window.addEventListener('popstate', function (event) {
                history.pushState(null, 'investment-news-feed.jsp', location.href)
            });
        </script>
        <%!String name = "", position = "", email = "", pic = "", pic2 = "", id = "", transid = "", phone = "", verificationid = "", date = "", 
                loanamount = "", total = "", interest = "", firstname = "", lastname = "", applicantemail = "", email2 = "",
                adsAmt="", adsId="", adsStatus=""
        ;%>

        <%
            AdminUser us = (AdminUser) session.getAttribute("staff");
            Wallet wallet = data.Database.getWallet(us.getEmail());
            name = us.getFirstname() + " " + us.getLastname();
            position = us.getPosition();
            email = us.getEmail();
            if ((position.equals("Investor") || position.equals("Admin"))&& email!= null) {

            } else {
                response.sendRedirect("index.jsp");
            }
            
             List<Ads> loanAds = data.Database.GetLoanAds();
             for (Ads ads : loanAds) {
                 adsAmt = ads.getAdsAmount();
                 adsId = ads.getAdsID();
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
                    <img src="photos/users/<%=pic%>" width="40px" class="rounded-pill">&nbsp; <%=us.getPosition()%>

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
                        Hello, <%=us.getFirstname() + " " + us.getLastname()%>
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
                                <a class="nav-link" href="investordashboard.jsp">
                                    <i class="fa-solid fa-house"></i>
                                    <span class="ml-2">Dashboard</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="investment-history.jsp">
                                    <i class="fa-solid fa-clock-rotate-left"></i>
                                    <span class="ml-2">History</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="investment-news-feed.jsp">
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
                                <h2 class="text-dark display-5">₦550,000.00</h2>
                                <h5 class="text-success">At 10% rate monthly</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
                        <div class="card shadow">
                            <h5 class="card-header">Total accumulating interest</h5>
                            <div class="card-body">
                                <h2 class="display-5 text-dark">₦55,000.00</h2>
                                <h5 class="text-primary">Accrued Interest</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
                        <div class="card shadow">
                            <h5 class="card-header">Bonus</h5>
                            <div class="card-body">
                                <h2 class="display-5 text-dark">₦5,000.00</h2>
                                <h5 class="text-info">Based on investment pack</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 mb-4 mb-lg-0 col-lg-3">
                        <div class="card shadow">
                            <h5 class="card-header">Investment Pack</h5>
                            <div class="card-body">
                                <h2 class="text-primary display-5"><i class="fa-solid fa-medal" style="font-size: 30px;"></i> Bronze</h2>
                                <h5 class="text-secondary ">Investment above ₦1M </h5>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row d-flex justify-content-center align-items-center">
                    <div class="col-12 col-xl-12 mb-4 mb-lg-0">
                        <br>
                        <section class="adverts">
                            <div class="container-fluid my-5">
                                <h2 class="header text-left display-5 mb-3">Available Loan Adverts</h2>
                                <div class="row d-flex justify-content-center">
                                    <div class="col-md-11 p-4">
                                        <div class="owl-carousel owl-theme ">
                                            <%
                                                for (Ads ads : loanAds) {
                                                    if (ads.getAdsStatus().equals("Pending")) {
                                                        out.println("<div class='item p-2'>");
                                                        out.println("<div class='card border-0 box-area'>");
                                                        out.println("<div class='card-header bg-info text-light'>");
                                                        out.println("Posted on:  "+ ads.getDate()+ "");
                                                        out.println("</div>");
                                                        out.println("<div class='row'>");
                                                        out.println("<div class='col-md-12 d-flex justify-content-end'>");
                                                        out.println("<div class='alarm-image'>");
                                                        out.println("<img src='alarm.png' class='img-fluid' />");
                                                        out.println("</div>");
                                                        out.println("</div>");
                                                        out.println("</div>");
                                                        out.println("<div class='row d-flex justify-content-center align-items-center'>");
                                                        out.println("<div class='col-md-6 col-sm-8 col-xs-8'>");
                                                        out.println("<div class='img-responsive'>");
                                                        out.println("<img src='ad-img.png' class='img-fluid' />");
                                                        out.println("</div>");
                                                        out.println("</div>");

                                                        out.println("<div class='col-md-6'>");
                                                        out.println("<div class='card-body text-center'>");
                                                        out.println("<div class='row d-flex justify-content-center align-items-center'>");
                                                        if (ads.getAdsPackage().equals("Bronze")) {
                                                            out.println("<img src='bronz.png' alt='Bronze' class='rounded float-start img-fluid package-icon' />");
                                                            out.println("<small class='text-warning' style='font-size: 20px; font-weight: bold; letter-spacing: 2px;'>Bronze Pack</small>");
                                                        } else if (ads.getAdsPackage().equals("Gold")) {
                                                            out.println("<img src='gold.png' alt='Gold' class='rounded float-start img-fluid package-icon' />");
                                                            out.println("<small class='text-warning' style='font-size: 20px; font-weight: bold; letter-spacing: 2px;'>Gold Pack</small>");
                                                        } else if (ads.getAdsPackage().equals("Platinum")) {
                                                            out.println("<img src='platinum.png' alt='Platinum' class='rounded float-start img-fluid package-icon' />");
                                                            out.println("<small class='text-warning' style='font-size: 20px; font-weight: bold; letter-spacing: 2px;'>Platinum Pack</small>");
                                                        }
                                                        out.println("</div>");

                                                        out.println("<input type='hidden' name='adsId' value='"+ads.getAdsID()+"'>");
                                                        out.println("<h5 class='card-title'>₦"+ ads.getAdsAmount()+ "</h5>");
                                                        out.println("<p class='card-text'>Get a 10% interest upon any amount invested at the end of 30days</p>");
                                                        out.println("<form action='GetInvestInfo' method='post'><input type='hidden' name='adsId' value='"+ads.getAdsID()+"'><button type='submit' class='btn btn-info invest-btn'>Invest Now</button></form>");
//                                                        out.println("<a href='Invest.jsp' class='btn btn-info invest-btn'>Invest Now</a>");
                                                        out.println("</div>");
                                                        out.println("</div>");
                                                        out.println("</div>");
                                                        out.println("</div>");
                                                        out.println("</div>");
                                                    }else{
                                                       out.println("<div class='item p-2'>");
                                                        out.println("<div class='card border-0 box-area'>");
                                                            out.println("<div class='card-header bg-info text-light'>");
                                                              out.println("<marquee width='80%' direction='left'>");
                                                                out.println("<h3>No available advert for investment. Check back later!</h3>");
                                                              out.println("</marquee>");
                                                            out.println("</div>");
                                                            out.println("<div class='row'>");
                                                                out.println("<div class='col-md-12 d-flex justify-content-end'>");
                                                                    out.println("<div class='alarm-image'>");
                                                                        out.println("<img src='alarm.png' class='img-fluid' />");
                                                                    out.println("</div>");
                                                                out.println("</div>");
                                                            out.println("</div>");
                                                            out.println("<div class='row d-flex justify-content-center align-items-center'>");
                                                                out.println("<div class='col-md-6 col-sm-8 col-xs-8'>");
                                                                    out.println("<div class='img-responsive'>");
                                                                        out.println("<img src='ad-img.png' class='img-fluid' />");
                                                                    out.println("</div>");
                                                                out.println("</div>");
                                                                out.println("<div class='col-md-6'>");
                                                                    out.println("<div class='card-body text-center'>");
                                                                        out.println("<h5 class='card-title'>NOT AVAILABLE!</h5>");
                                                                    out.println("</div>");
                                                                out.println("</div>");
                                                            out.println("</div>");
                                                          out.println("</div>");
                                                       out.println("</div>");
                                                    }
                                                }
                                            %>

                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
     
                        <br>
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
                                            var a = 20000;
                                            var b = 18000;
                                            var c = 2000;
                                            var f = 200000;
                                            var xValues = ["Investment", "Interest", "Profit", "Bonus"];
                                            var yValues = [f, a, b, c];
                                            var barColors = ["teal", "green", "orange", "gold"];

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
                    </div>
                </div> 

                <br><br> <br> <br> <br> <br> <br> <br> <br> <br> <br>   
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
                loop: true,
                slideSpeed: 4000,
                margin: 10,
                nav: true,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 1
                    },
                    1000: {
                        items: 1
                    }
                }
            });
        </script>

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

