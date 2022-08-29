<%-- 
    Document   : View
    Created on : Jun 23, 2022, 9:36:21 PM
    Author     : ABRAHAM
--%>

<%@page import="model.Redeem"%>
<%@page import="model.AdminUser"%>
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
      *{
          margin: 0;
          padding: 0;
          box-sizing: border-box;
      }
      body{
        width: 100%;
        height: auto;
        background: url(bg2.png);
        background-repeat: no-repeat;
        background-size: cover;
        overflow-x: hidden;
      }
      
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

</head>
<% Redeem ds = data.Database.getRedeemInfo((String)session.getAttribute("info"));%>
<body id='body'>
    <div class="bg-image"></div>
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-md-8 body-content col-sm-12 col-xs-12 p-5">
            
            <div class="card  bg-light p-5" id='data'>
                <div class="row d-flex justify-content-center align-items-center">
                  <div class="col-12 col-md-12 col-lg-6, col-xl-5">
                      <div class="logo-container text-center">
                          <img class="rounded" src="kam.png" alt="logo" width="60">
                         
                          <h4 class="text-secondary">KAMBOK LOAN</h4>
                      </div>
                  </div>
                   
              </div>
                 <br> <br>
                <h4 class="text-dark text-left ">Loan Redeem Receipt</h4>
                <br>
                <hr class="hr text-info"/>
                <div class="col mx-2 m-3">
                   <p class="text-dark">Transaction ID: <%= ds.getTrid() %></p> 
                </div>

                <div class="breadcrumb lt p-3">
                    <div class="row ">
                        <div class="col-md-12">
                            <div class="row text-r">
                                <p class="light-text">Receiver's Name</p>
                                <h4 class="text-dark rt"><%= ds.getItemowner() %></h4>
                            </div>
                             <br>
                            <div class="row text-r">
                                <p class="light-text">Receiver's Email</p>
                                <h4 class="text-dark rt"><%= ds.getOwneremail() %></h4>
                            </div>
                             <br>
                             <div class="row text-r d-flex">
                                 <div class="col">
                                     <p class="light-text">Redeemed Date</p>
                                    <h4 class="text-dark rt"><%= ds.getRedeemdate() %></h4>
                                 </div>
                                 <div class="col">
                                     <p class="light-text">Receipt No.</p>
                                    <h4 class="text-dark rt"># <%= ds.getReceiptNo() %></h4>
                                 </div>
                             </div>
                            <br>
                            <div class="row text-r">
                                <p class="light-text">Redeemed by:</p>
                                <h4 class="text-dark rt"><%= ds.getAgentname() %></h4>
                            </div>
                            <br>
                            <div class="row text-r">
                                <p class="light-text">Verify Department:</p>
                                <h4 class="text-dark rt">Inspection</h4>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="row d-flex justify-content-center">
                        <div class="col">
                            <button type="button" class="btn btn-success" onclick='myprint()'>Print</button>
                        </div>
                        <div class="col">
                            <a href="redeem.jsp" class="btn btn-warning" style="float: right">Close</a>
                        </div>
                    </div>
            </div>
        </div>
    </div>
<script>
    function myprint(){
        var body = document.getElementById('body').innerHTML;
        var data = document.getElementById('data').innerHTML;
        document.getElementById('body').innerHTML = data;
        window.print();
        document.getElementById('body').innerHTML = body;
   }
</script>
</body>
</html>
  