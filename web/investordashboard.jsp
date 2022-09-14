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

        <!----bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

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

            .walletId{
                background: -webkit-linear-gradient(#066785, #128d6f);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                opacity: 0.8;
                font-weight: normal;
                font-size: 2vmax;
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
                right: 0;
                font-weight: 500;
                width: 380px;
                font-size: 16px;
                transition: all .2s ease;
                background-color: #6ea194;
                box-shadow: 0 2px 20px rgba(0,0,0,0.08);
                border-radius: 10px;
            }

            .tooltiptext::after{
                content: "";
                position: absolute;
                top: -12px;
                right: 10px;
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
            
            @media(max-width: 460px){
                .tooltiptext{
                top: 40px;
                right: -100%;
                font-weight: 500;
                width: 280px;
                font-size: 12px;
            }
            .tooltiptext::after{
                top: -12px;
                right: 35px;
            }
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

            #messageBody:hover{
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <script>
            window.onload = function () {sendInfo(); sendInfo2();}
            var request;
                function sendInfo() {
                    var email = document.myform.email.value;
                    var url = "InvestorInterestReturn?email=" + email;
                    if (window.XMLHttpRequest) {
                            request = new XMLHttpRequest();
                    }else if (window.ActiveXObject) {
                            request = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    try{
                        request.onreadystatechange = getInfo;
                        request.open("GET", url, true);
                        request.send();
                    }catch (e){alert("Unable to connect to server");}
                }


            function getInfo() {
                if (request.readyState == 4) {
                    var val = request.responseText;
                    document.getElementById('report').innerHTML = val;
//                    location.reload();
                }
            }

            function sendInfo2() {
                var email = document.myform.email.value;
                var url = "ReturnMessage?email=" + email;
                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                }else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }
                try{
                    request.onreadystatechange = getInfo2;
                    request.open("GET", url, true);
                    request.send();
                }catch (e){alert("Unable to connect to server");}
            }


            function getInfo2() {
                if (request.readyState == 4) {
                    var val = request.responseText;
                    if (val !== "") {
                        document.getElementById('message').innerHTML = val;
                        document.getElementById('msg-container').classList.remove('d-none');
                        document.getElementById('msg-container').classList.add('d-flex');
                    }
                }
            }
            
//            function markAsRead(){        
//                        alert(messageId);
////                var url = "MarkAsRead?mar=" + mar.value;
////                if (window.XMLHttpRequest) {
////                    request = new XMLHttpRequest();
////                }else if (window.ActiveXObject) {
////                    request = new ActiveXObject("Microsoft.XMLHTTP");
////                }
////                try{
////                    request.onreadystatechange = getInfo3;
////                    request.open("GET", url, true);
////                    request.send();
////                }catch (e){alert("Unable to connect to server");}
//            }
//            
//            function getInfo3() {
//                if (request.readyState == 4) {
//                    var val = request.responseText;
//                    alert(val);
////                    document.getElementById('report').innerHTML = val;
////                    location.reload();
//                }
//            }
        </script>
        <script>
            history.pushState(null, 'investordashboard.jsp', location.href);
                    window.addEventListener('popstate', function (event) {
                    history.pushState(null, 'investordashboard.jsp', location.href)
                    });        </script>
        <%!String name = "", position = "", email = "", pic = "", date = "", loanamount
                    = "", total = "", interest = "", firstname = "", lastname
                    = "";
            double totalInvestment = 0;%>

        <%
            AdminUser us = (AdminUser) session.getAttribute("staff");
            Wallet wallet = data.Database.getWallet(us.getEmail());
            InvestorDetails investorDetails = data.Database.getInvestorDetails(
                    us.getEmail());
            InvestorDetails investorDetails2 = data.Database.getInvestor(us.
                    getEmail());
            name = us.getFirstname() + " " + us.getLastname();
            position = us.getPosition();
            email = us.getEmail();
            session.setAttribute("agentname", name);
            session.setAttribute("agentemail", email);

            if ((position.equals("Investor") || position.equals("Admin"))
                    && email != null) {

            } else {
                response.sendRedirect("index.jsp");
            }
            InvestorDetails currentRecord = data.Database.
                    getInvestorCurrentRecord(us.getEmail());
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
            <form name="myform">
                <input type="hidden" id="email" name="email" value="<%=us.getEmail()%>">
            </form>
            <div class="col-12 col-md-5 col-lg-8 d-flex align-items-center justify-content-md-end mt-3 mt-md-0">
                <div class="mr-3 mt-1">

                </div>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle position-relative" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
                        <span id="msg-container" class="spinner-grow position-absolute top-0 end-90 translate-middle badge rounded-pill bg-danger d-none justify-content-center align-items-center"><b id="message" class="text-center" style="font-weight:bold; font-size: large;"></b></span>
                        Hello, <%=us.getFirstname() + " " + us.getLastname()%>
                    </button>

                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <li><a class="dropdown-item" href="investor-bio.jsp"><i class="fa-solid fa-gear mx-2 sicon"></i> <span class="txt"> Settings</span></a></li>
                        <li><a class="dropdown-item btn" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><i class="fa-solid fa-envelope mx-2 sicon"></i><span class="txt"> Messages</span>&nbsp;<i class="fa-solid fa-circle-exclamation text-danger"></i></a></li>
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

                <!--offcanvas-->
                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
                    <div class="offcanvas-header">
                        <h5 id="offcanvasRightLabel" class="fw-bolder">Messages</h5>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <%!String investId = "", investStatus = "", interestDate
                                    = "", msgStatus
                                    = "", walletId = "", msgID = "", msginvestId
                                    = "", idHolder = "";
                            double walletBal = 0, amount = 0, interest2 = 0, credit
                                    = 0;
                            int msgSize = 0;%>
                        <%
                            List<Message> message = data.Database.
                                    getMessage(us.getEmail());
                            msgSize = message.size();
                            for (Message msg : message) {
                                msgStatus = msg.getStatus();
                                msgID = msg.getMessageId();
                                msginvestId = msg.getInvestmentId();

                                if (msgStatus.equals("Unread")) {
                                    List<InvestorDetails> invest
                                            = data.Database.
                                            getInvestorCurrentRecord2(
                                                    msginvestId);
                                    for (InvestorDetails id : invest) {
                                        investId = id.getInvestmentID();
                                        investStatus = id.getStatus();
                                        interestDate = id.getReturnDate();
                                        walletId = id.getWalletId();
                                        amount = id.getInvestmentHistory();
                                        interest2 = id.getInterest();
                                        credit = id.getTotalAmount();
                                        out.println("<div class='accordion mb-3' id='accordionExample'>");
                                            out.println("<div class='accordion-item'>");
                                                    out.println("<h2 class='accordion-header' id='headingOne'>");
                                                        out.println("<div class=''>");
//                                                            out.println("<form name='markAsReadForm' action='MarkAsRead' method='post' id='formSubmit'>");
//                                                                out.println("<div class='form-check m-1'>");
//                                                                    //out.println("<input class='form-check-input' type='checkbox' name='mar' id='mar' value='"+msgID+"' style='width:22px; height:25px; margin-top:0; margin-right:0;' onchange='markAsRead();this.form.submit()'>");
//                                                                    out.println("<input class='form-check-input' type='checkbox' name='mar' id='mar' value='"+msgID+"' style='width:22px; height:25px; margin-top:0; margin-right:0;' onclick='markAsRead();'>");
//                                                                    out.println("<p style='font-size:15px; margin-left-0;'> Mark as read");
//                                                                    out.println("</p>");
//                                                                out.println("</div>");    
//                                                            out.println("</form>");
                                                        out.println("<form name='msgForm' method='post' class='messageForm' action='MarkAsRead' id='f"+msgID+"'><input type='hidden' id='e"+msgID+"' class='i' value='"+msgID+"' name='mar'><button class='btn btn-primary msgBtn' id='b"+msgID+"'>Mark As Read</button></form>");
                                                        HttpSession session1 = request.getSession();
                                                        session1.setAttribute("messageId", msgID);
                                                        out.println(session1.getAttribute("messageId"));
                                                        
                                                        out.println("<script>");
                                                            out.println("const messageId = "+session1.getAttribute("messageId")+";");
                                                       
                                                        out.println("</script>");
                                                        
                                                        out.println("</div>");
                                                        out.println("<div class='d-flex flex-row'>");
                                                            out.println("<button class='accordion-button' type='button' data-bs-toggle='collapse' data-bs-target='#A"+msgID+"' aria-expanded='true' aria-controls='"+msgID+"'>Investment Return ("+msgID+")");
                                                            out.println("</button>");
                                                        out.println("</div>");
                                                    out.println("</h2>");
                                                out.println("<div id='A"+msgID+"' class='accordion-collapse collapse' aria-labelledby='headingOne' data-bs-parent='#accordionExample'>");
                                                    out.println("<div class='accordion-body'>");
                                                        out.println(
                                                        "<p class='text-justify d-inline-block pr-3' >Your investment with Investment-ID <b>"
                                                        + investId
                                                        + "</b> has expired. "
                                                        + "You invested a total sum of ₦<b>"
                                                        + amount
                                                        + "</b> to yield an interest of ₦<b>"
                                                        + interest2 + "</b>. "
                                                        + "In regards to that, a total sum of ₦<b>"
                                                        + credit
                                                        + "</b> has been credited to your wallet with wallet-ID"
                                                        + "<b>" + walletId
                                                        + "</b>. </br> Kindly look up for other loan advertisment to invest on.</p>");
                                                    out.println("</div>");
                                                out.println("</div>");
                                            out.println("</div>");
                                        out.println("</div>");
                                        
                                        
                                    }
                                }
                            }
                        %>
                        <script>
                            document.querySelectorAll(".messageForm").forEach(function(item){
                                item.querySelectorAll(".messageForm").addEventListener("submit-", function(event){
                                    event.preventDefault()
                                  });
                            });
                        </script>
                    </div>  
                </div>
                <script>
                            var offcanvasElementList = [].slice.call(document.querySelectorAll('.offcanvas'))
                            var offcanvasList = offcanvasElementList.map(function (offcanvasEl) {
                            return new bootstrap.Offcanvas(offcanvasEl);
                            }); 
                            
                    function showMsgID(){
                       const msgBtn = document.getElementById("b<%=msgID%>")
                       alert(msgBtn);
                    }
                </script>

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
                            <h5 class="card-header">Accumulated interest</h5>
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
                                        <button type="button" class="btn rounded-circle info-btn d-flex"><i class="fa-solid fa-circle-question text-dark"></i>
                                            <div class="tooltiptext p-2 text-left">
                                                <h6 class="text-dark pb-2">Terms & Conditions</h6>
                                                <ul>
                                                    <li><b>Sharing of authorization pin:</b></li>
                                                    <small>You must not share or grant a third party access to your account.</small>
                                                    <li><b>Lose due to negligence:</b></li>
                                                    <small>You're solely responsible to any lose/loses incurred due to your negligence.</small>
                                                    <li><b>Wallet ID:</b></li>
                                                    <small>Your wallet ID shall serve as your unique identity number which will be required when funding/crediting your account</small>
                                                    <li><b>Wallet Balance:</b></li>
                                                    <small>Wallet balance means your total asset/money you have in your account</small>
                                                </ul>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-12 d-flex">
                                        <h5 class="text-left walletId">Wallet ID: <input type="text" value="<%=investorDetails2.getWalletId()%>" style="background: transparent; border: none; outline: none; font-weight: bold" id="walletId" name="walletId" readonly="true"></h5>
                                    </div>
                                </div>
                                <div class="row p-2 mx-2">
                                    <div class="col">

                                        <h5 class="label text-left"> <span></span> Available Balance</h5>
                                        <h1 class="amt text-left"><input  type="password" value="₦<%=wallet.getTotal()%>" style="background: transparent; border: none; outline: none; font-weight: bold" id="amt" name="amt" readonly="true"></h1>
                                        <h3 class="ledger text-left">Ledger Balance:<input  type="password" value="₦<%=wallet.getTotal()%>" style="background: transparent; border: none; outline: none; font-weight: normal; -webkit-text-security: asterisk" id="ledger" readonly="true">
                                            <span class="hide-figure d-flex justify-content-start p-2"><i class="fas fa-eye" style="cursor: pointer" id="hide-figure" onclick="toggle()"></i></span>
                                        </h3>
                                        <script>
                                                    var state = false;
                                                    const eye = document.querySelector("#hide-figure");
                                                    function toggle() {
                                                    if (state) {
                                                    document.getElementById("amt").setAttribute("type", "text");
                                                            document.getElementById("ledger").setAttribute("type", "text");
                                                            eye.classList.add('fa-eye-slash');
                                                            eye.classList.remove('fa-eye');
                                                            state = false;
                                                    } else {
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
                                            <p class="description">Investment ID: <span class="text-info"><%=currentRecord.getInvestmentID()%></span></p>
                                            <div class="col investment-content">
                                                <div class="owl-carousel owl-theme my-4 ">
                                                    <div class="item p-2">
                                                        <div class="card border-0 box-1">
                                                            <div class="card-body text-center">
                                                                <div class="row d-flex justify-content-between">
                                                                    <div class="col-md-12 text-left p-3 ">
                                                                        <div class="col"><p class="sub-title">Invested Amount</p></div>
                                                                        <div class="col d-flex justify-content-between">
                                                                            <h2 id="amount" class="card-content">₦<%=currentRecord.getInvestmentHistory()%></h2>
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
                                                                            <h2 id="interest" class="card-content">₦<%=currentRecord.getInterest()%></h2>
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
                                                                            <h2 id="total" class="card-content">₦<%=currentRecord.getTotalAmount()%></h2>
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
                                                                        <div class="col"><p class="sub-title">Investment Duration</p></div>
                                                                        <div class="col d-flex justify-content-between">
                                                                            <h2 class="card-content"><%=currentRecord.getDate()%> - <%=currentRecord.getReturnDate()%></h2>
                                                                            <h2 id="bg-icon" class="rounded-circle bg-icon-4 d-flex justify-content-center align-items-center"><i class="fa-solid fa-calendar-check text-light"></i></h2>
                                                                        </div>
                                                                        <div class="col"> <p class="sub-title">All investment will be liquidated after 30 days</p></div>
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
                                                                        label: ["Investment", "Interest", "Profit", "Bonus"],
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
                                                        document.getElementById("total").innerHTML = document.getElementById("total").innerHTML.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                                        document.getElementById("amount").innerHTML = document.getElementById("amount").innerHTML.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                                        document.getElementById("interest").innerHTML = document.getElementById("interest").innerHTML.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                                        document.getElementById("amt").value = document.getElementById("amt").value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                                        document.getElementById("ledger").value = document.getElementById("ledger").value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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
                                                        loop: true,
                                                        slideSpeed: 1000,
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
                                                                items: 2
                                                                }
                                                        }
                                                })
                                                
//           function timedRefresh(timeoutPeriod){
//               setTimeout("location.reload(true);", timeoutPeriod);
//           }
//           window.onload = timedRefresh(1000);
        </script>
    </body>
</html>

