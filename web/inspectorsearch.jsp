<%@page import="imageloader.Loader"%>
<%@page import="model.LoanDetailSupply"%>
<%@page import="model.DataSupply"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.LoanRequest"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Result</title>
 
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

.img-container{
    width: 100%;
    overflow: hidden;
}

.img-container img{
    width: 700px;
    transition: all 0.5s ease;
    object-fit: contain;
    transition: all 0.5s ease;;
}

.img-container img:hover{
   transform: scale(1.1);
}

.sub-img{
    display: flex;
    align-items: center;
    flex-direction: row;
    justify-content: center;
    height: 160px;
}

.sub-img .card{
    height: 100%;
    margin: 0 1rem;
    box-shadow: 0 0 20px rgba(0,0,0,0.2);
    border-radius: 20px;
    cursor: pointer;
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
}
.sub-img img{
    width: 150px;
    transition: all 0.5s ease;
    object-fit: contain;
    
}

.sub-img img:hover{
    transform: translateY(-5px);
}

#title{
    margin-top: 10px;
}
  
  </style>
  <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        
        setTimeout("preventBack()", 0.0);
        window.onunload = function () { null };
    </script>
   <script>  
var request;

function sendInfo() {  
var trid=document.myform.trid.value;
var phone=document.myform.phone.value;
var agentname=document.myform.agentName.value;
var agentemail=document.myform.agentEmail.value;
var lamount=document.myform.lamount.value;
var appamount=document.myform.appamount.value;
var interest=document.myform.interest.value;
var time=document.myform.time.value;
var date=document.myform.date.value;
var fname=document.myform.fname.value;
var lname=document.myform.lname.value;
var email=document.myform.email.value;

var url="VerifiedServlet?trid="+trid+"&phone="+phone+"&agentName="+agentname+"&agentEmail="+agentemail+"&lamount="+lamount+"&appamount="+appamount+"&interest="+interest+"&time="+time+"&date="+date+"&fname="+fname+"&lname="+lname+"&email="+email;
  
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
function sendInfo2() {  
var trid=document.myform.trid.value;

var url="DeniedServlet?trid="+trid;
  
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
document.getElementById('report').innerHTML=val;
document.getElementById("btn").disabled = true; 
document.getElementById("btn2").disabled = true; 
    
}else{
     document.getElementById("btn").disabled = false;
     document.getElementById("btn2").disabled = false;
}
}

</script> 
   <script>
    window.onload = function(){time();};
        setInterval(time, 1000);
        

        function time(){
            var today = new Date();
            var h = today.getHours();
            var m = today.getMinutes();
            var s = today.getSeconds();
            var day = today.getDate();
            var month = today.getMonth()+1;
            var year = today.getFullYear();

            document.getElementById("ttime").value =  h + ":" + m +":" + s;
            document.getElementById("tdate").value = day + "/" + month + "/" + year;
        }
</script>
</head>
<body>
    
     <script type = "text/javascript" >
          history.pushState(null, null, 'inspectorsearch.jsp');
          window.addEventListener('popstate', function (event) {
              history.pushState(null, null, 'inspectorsearch.jsp');
      });

     </script>
     
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>
    
    <%! String photo1 = "", photo2=""; %>
<%
    LoanDetailSupply loandetail = data.Database.verifyCol((String)session.getAttribute("trid"));
    photo1 = Loader.loadImageFront(loandetail.getTrid());
    photo2 = Loader.loadImageBack(loandetail.getTrid());
    
      session.setAttribute("photo1", photo1);
     session.setAttribute("photo2", photo2);
     Thread.sleep(2000);
%>



<div class="container-fluid">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10 col-xs-12 col-sm-12">
            <div class="container-fluid p-3">
                <div class="card p-4">
                    <h2 class="card-header text-center" style="border-bottom: 2px solid #000; font-size: 2.5rem;">Search Result</h2>
                    <br>
                    <div class="card-body p-7" >
                        <div class="row">
                            <div class="col-md-8 col-xs-12 col-sm-8">
                                <div class="container-fluid d-flex justify-content-center img-container">
                                    <a href="photos/<%=photo1%>" target="_new"><img class = "image" src="photos/<%=photo1%>" class="img-responsive"> </a>
                                </div>
                                <div class="info text-center p-2">
                                        <h3 id="title">Collateral Image (Front View)</h3>
                                    </div>
                            </div>
                              <div class="col-md-4 col-xs-12 col-sm-12 d-flex justify-content-center align-items-center">
                                  <div class="sub-img">
                                      <div class="card">
                                          <img src="photos/<%=photo1%>" alt="collateral image" onclick="imageUpdate('photos/<%=photo1%>')">
                                      </div>
                                      <div class="card">
                                          <img src="photos/<%=photo2%>" alt="collateral image" onclick="imageUpdate2('photos/<%=photo2%>')">
                                      </div>
                         
                                  </div>
                            </div>
                        </div>
                                      <br>
                          <div class="row">
                            
                          <div class="col-md-12">
                              <div class="card">
                                  <div class="table-responsive">
                                      <table class="table">
                                          <tr>
                                              <th class="px-5">Transaction ID:</th>
                                              <td><%= loandetail.getTrid() %></td>
                                          </tr>
                                          <tr>
                                              <th class="px-5">Applicant's Name:</th>
                                              <td><%= loandetail.getFirstname() + " "+ loandetail.getLastname() %></td>
                                          </tr>
                                          <tr>
                                              <th class="px-5">Collateral name:</th>
                                              <td><%= loandetail.getColname() %></td>
                                          </tr>
                                         <tr>
                                              <th class="px-5">Collateral ID:</th>
                                              <td><%= loandetail.getColId() %></td>
                                          </tr>
                                          <tr>
                                              <th class="px-5">Collateral Condition:</th>
                                              <td><%= loandetail.getCondition() %></td>
                                          </tr>
                                          <tr>
                                              <th class="px-5">Transaction Date:</th>
                                              <td><%= loandetail.getLoandate() %></td>
                                          </tr>
                                          <tr>
                                              <th class="px-5">Loan Expired Date:</th>
                                              <td><%= loandetail.getRepaydate() %></td>
                                          </tr>
                                          <tr>
                                              <th class="px-5">Loan Amount:</th>
                                              <td>₦<%= loandetail.getLoanamount() %></td>
                                          </tr>
                                          <tr>
                                              <th class="px-5">Approved Amount:</th>
                                              <td>₦<%= loandetail.getApproveamount() %></td>
                                          </tr>
                                          <tr>
                                              <th class="px-5">Interest:</th>
                                              <td>₦<%= loandetail.getInterest() %></td>
                                          </tr>
                                        
                                      </table>
                                           </div>
                                          <div class='row d-flex justify-content-center align-items-center'>
                                              <div class='col-md-8'>
                                                 
                                            <form name='myform' class="form" >
                                                
                                            <input type='hidden' name='trid' value='<%= loandetail.getTrid() %>'>
                                            <input type='hidden' name='agentName' value='<%= session.getAttribute("agentname") %>'>
                                           <input type='hidden' name='agentEmail' value='<%= session.getAttribute("agentemail") %>'>
                                            <input type='hidden' name='lamount' value='<%= loandetail.getLoanamount() %>'>
                                            <input type='hidden' name='appamount' value='<%= loandetail.getApproveamount() %>'>
                                            <input type='hidden' name='interest' value='<%= loandetail.getInterest() %>'>
                                            <input type='hidden' name='colname' value='<%= loandetail.getColname() %>'>
                                            <input type='hidden' name='time' id='ttime'>
                                            <input type='hidden' name='date' id='tdate'>
                                            <input type='hidden' name='fname' value='<%= loandetail.getFirstname() %>'>
                                            <input type='hidden' name='lname' value='<%= loandetail.getLastname() %>'>
                                            <input type='hidden' name='email' value='<%= loandetail.getEmail() %>'>
                                            <input type='hidden' name='phone' value='<%= loandetail.getPhone() %>'>
                                            
                                            <br>
                                            
                                            <div class='form-group d-flex justify-content-center'>
                                                <b id='report' class='text-center text-info'></b><br>
                                            <button type="button" class="btn btn-success" onclick='sendInfo();' id="btn" style="margin-right: 40px; width: 130px; font-size: 20px"> Verify</button>
                                            <button type="button" class="btn btn-danger" onclick='sendInfo2();' id="btn2" style="margin-right: 40px; width: 130px; font-size: 20px">Denied</button>
                                            <a href="inspectionDashboard.jsp" class="btn btn-dark" style="margin-right: 40px; width: 130px; font-size: 20px">Back</a>
                                            </div>
                                            </form>
                                              </div>
                                          </div>
                                  
                                </div>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-1"></div>
       
    </div>
</div> 
  <script type="text/javascript">
      function imageUpdate(i){
          document.querySelector(".image").src = i;
          document.querySelector("#title").innerHTML = "Collateral Image (Front View)"
      }
      function imageUpdate2(i){
          document.querySelector(".image").src = i;
          document.querySelector("#title").innerHTML = "Collateral Image (Back View)"
      }
  </script>
</body>
</html>
  