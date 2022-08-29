<%-- 
    Document   : View
    Created on : Jun 23, 2022, 9:36:21 PM
    Author     : ABRAHAM
--%>

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
  
  <script>
      window.onload=function(){checkdate();}  
    function checkdate(){
     var date=new Date();
     var day=date.getDate();  
     var month=date.getMonth()+1;  
     var year=date.getFullYear();  
     day=checkTime(day);  	
     month=checkTime(month);  
     document.getElementById("redeemdate").value=month+"/"+day+"/"+year;  
     console.log(month+"/"+day+"/"+year);
       
   }
    function checkTime(i){  
	if (i<10){  
	  i="0" + i;  
	 }  
	return i;} 
  </script>
</head>
<% AdminUser s = (AdminUser)session.getAttribute("staff");%>
<body>
    <div class="bg-image"></div>
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-md-8 body-content col-sm-12 col-xs-12 p-5">
            <div class="card  bg-light p-5">
                <h4 class="text-dark text-left">Loan Payment Details</h4>
                <br>
                <div class="row d-flex">
                    <div class="col">
                    <button class="btn btn-info lt text-dark"><i class="fa-solid fa-money-bill-trend-up rounded-circle bg-light p-2"></i> Method: <span class="text-warning"><%= request.getParameter("pmethod") %> </span></button>
                </div>
                <div class="col">
                    <button class="btn btn-info lt text-dark"><i class="fa-solid fa-circle-check rounded-circle bg-light p-2"></i> Payment status: <span class="text-warning"><%= request.getParameter("status") %> </span></button>
                </div>
                </div>
                <br>
                <div class="row d-flex">
                    <div class="col mx-2 m-3">
                    <p class="text-dark">Amount</p>
                    <h2 class="text-dark spread">₦<%= request.getParameter("amount") %></h2>
                    </div>
                    <div class="col mx-2 m-3">
                    <p class="text-dark">Balance</p>
                    <h2 class="text-dark spread">₦<%= request.getParameter("balance") %></h2>
                    </div>
                </div>
                <hr class="hr text-info"/>
                <div class="col mx-2 m-3">
                   <p class="text-dark">Transaction ID: <%= request.getParameter("trid") %></p> 
                </div>

                <div class="breadcrumb lt p-3">
                    <div class="row ">
                        <div class="col-md-12">
                            <div class="row text-r">
                                <p class="light-text">Sender Name</p>
                                <h4 class="text-dark rt"><%= request.getParameter("sendername") %></h4>
                            </div>
                             <br>
                            <div class="row text-r">
                                <p class="light-text">Sender Email</p>
                                <h4 class="text-dark rt"><%= request.getParameter("senderemail") %></h4>
                            </div>
                             <br>
                             <div class="row text-r d-flex">
                                 <div class="col">
                                     <p class="light-text">Payment Date</p>
                                    <h4 class="text-dark rt"><%= request.getParameter("pdate") %></h4>
                                 </div>
                                 <div class="col">
                                     <p class="light-text">Payment Pin</p>
                                    <h4 class="text-dark rt"><%= request.getParameter("paymentpin") %></h4>
                                 </div>
                             </div>
                              <br>
                            <div class="row text-r">
                                <p class="light-text">Beneficiary Name</p>
                                <h4 class="text-dark rt">Kambok Infotech</h4>
                            </div>
                            <br>
                            <div class="row text-r">
                                <p class="light-text">Payment verified by:</p>
                                <h4 class="text-dark rt"><%= request.getParameter("agentname") %></h4>
                            </div>
                            
                             <br>
                            <div class="row text-r">
                                <p class="light-text">Verifier ID:</p>
                                <h4 class="text-dark rt"><%= request.getParameter("agentid") %></h4>
                            </div>
                            
                            <br>
                            <div class="row text-r">
                                <p class="light-text">Received Department:</p>
                                <h4 class="text-dark rt"><%= request.getParameter("receivedsection") %></h4>
                            </div>
                        </div>
                    </div>
                </div>
                <form action="redeemServlet" method="post">
                    <input type="hidden" id="redeemdate" name="redeemdate">
                    <input type="hidden" name="agentname" value="<%= s.getFirstname() +" "+ s.getLastname() %>">
                    <input type="hidden" name="agentemail" value="<%= s.getEmail() %>">
                    <input type="hidden" name="trid" value="<%= request.getParameter("trid") %>">
                    <input type="hidden" name="ownername" value="<%= request.getParameter("sendername") %>">
                    <input type="hidden" name="owneremail" value="<%= request.getParameter("senderemail") %>">
                    <input type="hidden" name="amount" value="<%= request.getParameter("amount") %>">
                    <input type="hidden" name="balance" value="<%= request.getParameter("balance") %>">
                    <input type="hidden" name="pmtpin" value="<%= request.getParameter("paymentpin") %>">
                    <input type="hidden" name="pmtagent" value="<%= request.getParameter("agentname") %>">
                    <input type="hidden" name="pmtagentID" value="<%= request.getParameter("agentid") %>">
                    <input type="hidden" name="pmtdate" value="<%= request.getParameter("pdate") %>">
                    
                    <div class="row d-flex justify-content-center">
                        <div class="col">
                            <button type="submit" class="btn btn-success">Redeem</button>
                        </div>
                        <div class="col">
                            <a href="redeem.jsp" class="btn btn-warning" style="float: right">Close</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
  