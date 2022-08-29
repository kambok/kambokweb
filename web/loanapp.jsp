  
<%@page import="model.DataSupply"%>
<%@page import="java.util.List"%>
<%@page import="model.LoanRequest"%>
<%@page import="imageloader.Loader"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LoanApp</title>
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
  	  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
   
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
.image-container{
    width: 100%;
    height:400px;
    object-fit: cover;
    overflow: hidden;
        
    
}
  
  </style>
  <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        
        setTimeout("preventBack()", 0.0);
        window.onunload = function () { null };
    </script>
 
       <script>  
var request;

function sendInfo()  
{  
var duration=document.myform.days.value;
var amount=document.myform.amount.value;
var appamount=document.myform.appamount.value;


var url="LoanCalculator?amount="+amount+"&duration="+duration+"&appamount="+appamount;
  
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
document.getElementById('interest').value=val;  
} 
}

//   function Calculate(){
//    
//    var amount=document.myform.amount.value;
//    var loandate=document.myform.loandate.value;
//    var repaydate=document.myform.repaydate.value;
//    var days=document.myform.days.value;
//    
//     
//     
//    if(isNaN(loandate)&&isNaN(repaydate)){
//        
//     var date1 = new Date(loandate);  
//    var date2 = new Date(repaydate);  
//     var time_difference = date2.getTime() - date1.getTime();  
//     var result = time_difference / (1000 * 60 * 60 * 24);  
//       var rs=Math.round(result);
//      var day=parseInt(rs);
//      
//     var am=parseInt(amount);
//      
//  if(days>30){
//      document.getElementById("interest").value="Change Date";
//     document.getElementById("days").value=day; 
//     document.getElementById("cc").innerHTML="Maximum duration(30)Days"; 
//   
// }
// else{
//   
//    if(am<=10000){
//     var int=Math.round(am*2.2);
//     var inter=int/100;
//     document.getElementById("cc").innerHTML="";
//     if(day<=28){ 
//     var interest=inter*14;
//      document.getElementById("interest").value=interest;
//      document.getElementById("days").value=day;
//      }else if(day>23 && day<=30){
//          var int=am*2;
//          var inter=int/100;
//     var interest= Math.round(inter*day);
//      document.getElementById("interest").value=interest;
//      document.getElementById("days").value=day;
//  }
//       else{
//       var interest= Math.round(inter*day); 
//         document.getElementById("interest").value=interest;
//      document.getElementById("days").value=day;
//      }
//     
//  }else if(am>10000 && am<=40000){
//   
//                    var int=am*1.8;
//     var inter=int/100;
//     document.getElementById("cc").innerHTML="";
//     if(day<7){
//     var interest= Math.round(inter*6.9);
//      document.getElementById("interest").value=interest;
//      document.getElementById("days").value=day;
//      }else if(day>23 && day<=30){
//          var int=am*1.6;
//          var inter=int/100;
//     var interest= Math.round(inter*day);
//      document.getElementById("interest").value=interest;
//      document.getElementById("days").value=day;
//  }
//       else{
//       var interest= Math.round(inter*day); 
//         document.getElementById("interest").value=interest;
//      document.getElementById("days").value=day;
//      }
//      
//  }else if(am>40000 && am<=100000){
//   
//                    var int=am*0.9;
//     var inter=int/100;
//     document.getElementById("cc").innerHTML="";
//     if(day<7){
//     var interest= Math.round(inter*6.9);
//      document.getElementById("interest").value=interest;
//      document.getElementById("days").value=day;
//      }else if(day>23 && day<=30){
//          var int=am*0.8;
//          var inter=int/100;
//     var interest= Math.round(inter*day);
//      document.getElementById("interest").value=interest;
//      document.getElementById("days").value=day;
//  }
//       else{
//       var interest= Math.round(inter*day); 
//         document.getElementById("interest").value=interest;
//      document.getElementById("days").value=day;
//      }
//      
//  }else if(am>100000){
//   
//     document.getElementById("cc").innerHTML="Maximum Loan Amount Exceeded(100,000)";
//  
//      document.getElementById("interest").value="";
//      document.getElementById("days").value=day;
// 
//      
//  }  
//       
//   }
//   
// }else{
//     document.getElementById("cc").innerHTML="";
//         document.getElementById("interest").value="";
//     document.getElementById("days").value="";
// }
//   
//    
//   
//         }
         
         function mydate(){
    var amount=document.myform.amount.value;
    var loandate=document.myform.loandate.value;
    var repaydate=document.myform.repaydate.value;
    var days=document.myform.days.value;
    if(isNaN(loandate)&&isNaN(repaydate)){
        
     var date1 = new Date(loandate);  
    var date2 = new Date(repaydate);  
     var time_difference = date2.getTime() - date1.getTime();  
     var result = time_difference / (1000 * 60 * 60 * 24);  
     var rs=Math.round(result);
      var day=parseInt(rs);
     var am=parseInt(amount);
      
  if(day>30){
      document.getElementById("interest").value="Change Date";
     document.getElementById("days").value=day; 
       document.getElementById("cc").innerHTML="Maximum duration(30)Days";
         document.querySelector("#pp").disabled=true;
   }else if(day<0){
     document.getElementById("interest").value="Change Date";
     document.getElementById("days").value=day; 
     document.getElementById("cc").innerHTML="invalid date";
     document.querySelector("#pp").disabled=true;
   }
 else{
        document.querySelector("#pp").disabled=false;
  document.getElementById("cc").innerHTML="";
    document.getElementById("days").value=day;} 
    }else{
        document.querySelector("#pp").disabled=false;
         document.getElementById("interest").value="";
     document.getElementById("days").value="";
       
 }
  }
  
   window.onload=function(){checkdate();}  
   function checkdate(){
    var date=new Date();
    var day=date.getDate();  
    var month=date.getMonth()+1;  
    var year=date.getFullYear();  
    day=checkTime(day);  	
    month=checkTime(month);  
document.getElementById("loandate").value=month+"/"+day+"/"+year;   
       
   }
   function checkTime(i){  
	if (i<10){  
	  i="0" + i;  
	 }  
	return i;}  


function checkapp(){
var amount=Number(document.myform.amount.value);
var app=Number(document.myform.appamount.value);   
    if(amount>app){
     document.getElementById("ct").innerHTML="unauthorized amount";
     document.querySelector("#pp").disabled=true; 
     document.querySelector("#pt").disabled=true; 
     document.querySelector("#repaydate").disabled=true; 
    }else{
         document.querySelector("#pp").disabled=false; 
         document.querySelector("#pt").disabled=false; 
         document.querySelector("#repaydate").disabled=false; 
        document.getElementById("ct").innerHTML="";
    }
}
</script>
    
 </head>
<body>
     <script type = "text/javascript" >
          history.pushState(null, null, 'loanapp.jsp');
          window.addEventListener('popstate', function (event) {
              history.pushState(null, null, 'loanapp.jsp');
      });

     </script>
      <%! String pic=""; %>
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>
<%
DataSupply us=(DataSupply)session.getAttribute("user");
    if(us!=null && us.getPosition().equals("Client")){
   
    
    }else{
    
    response.sendRedirect("index.jsp");
    
    }
    
    pic = (String)session.getAttribute("passport");
    %> 
<nav class="navbar navbar-light bg-light p-3">
  <div class="d-flex col-12 col-md-3 col-lg-2 mb-2 mb-lg-0 flex-wrap flex-md-nowrap justify-content-between">
      <a class="navbar-brand" href="#">
          <img src="photos/users/<%=pic%>" width="40px" class="rounded-pill">&nbsp; <%=us.getPosition()%>
		  
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
              Hello, <%=us.getFirstname()+" "+us.getLastname() %>
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Messages</a></li>
            <li><a class="dropdown-item" href="logout">Sign out</a></li>
          </ul>
        </div>
  </div>
</nav>
    <br />
<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
<div class="col-md-8">
    <strong id="ct" class="text-danger"></strong>       

<h1 class="h2">Loan Form</h1>
<form class="form" name="myform" action="Review.jsp">
                     <p><input type="checkbox" required="required" checked="checked"><label style="font-size:14px;"> &nbsp;Fill All Information </label></p>
  <div class="form-group">  
    <label for="exampleInputEmail1">Loan Amount <span class="fas fa-money-bill"></span></label> <br /> 
    <input type="number" class="form-control" name="amount" onchange="mydate();sendInfo();checkapp();" required="required" id="loanamount" value="1000" pattern="[0-9]{0-6}" placeholder="Loan Amount" onkeyup="Validation1()" style="height:50px;border:none;border-bottom:2px solid navy;outline:none;font-size:20px;">  
    <input type="hidden" class="form-control" name="appamount"  required="required" id="appamount"   value="<%= us.getAmount()%>" style="height:50px;border:none;border-bottom:2px solid navy;outline:none;font-size:20px;">  
  </div> &nbsp;&nbsp;
 
<div class="form-group">  
    <label for="middlename">Date of Loan <span class="fas fa-calendar-alt"></span></label> <br /> 
    <input type="text" class="form-control" checked    name="loandate" required="required" readonly id="loandate" style="height:50px;border:none;border-bottom:2px solid navy;outline:none;font-size:20px;">  
  </div>&nbsp;&nbsp;<br /><br />
<div class="form-group">  
    <label for="exampleInputEmail1">Repayment Date <span class="fas fa-calendar-alt"></span></label><br />  
    <input type="date" class="form-control"   name="repaydate" onchange="mydate();sendInfo();" required="required" id="repaydate"  onkeyup="Validation3()" style="height:50px;border:none;border-bottom:2px solid navy;outline:none;font-size:20px;">  
</div>&nbsp;&nbsp;
<div class="form-group">  
    <label for="exampleInputEmail1">Duration(Days) <span class="fas fa-calendar-check"></span></label><br />  
    <input type="text" class="form-control" name="days" readonly required="required" id="days"  onkeyup="Validation3()" style="height:50px;border:none;border-bottom:2px solid navy;outline:none;font-size:20px;">  
<span id="cc" style="color:red;padding:5px;font-size:18px;"></span>  
</div>
  <br /><br />
  <div class="form-group">  
    <label for="exampleInputEmail1">Interest Charged <span class="fas fa-money"></span></label><br />  
    <input type="text" class="form-control" name="interest" readonly required="required" id="interest"  onkeyup="Validation3()" style="height:50px;border:none;border-bottom:2px solid navy;outline:none;font-size:20px;">  
  </div>
<div class="form-group"> &nbsp;&nbsp;
    <br /><br />
      <label for="exampleInputEmail1"><span class="glyphicon glyphicon-up"></span></label>
      
      <button type="button" class="btn btn-info btn-lg" id="pt" onclick="sendInfo();" style="height:50px;">Calculate</button>&nbsp; &nbsp; &nbsp; 
      <button type="submit" id="pp" class="btn btn-success btn-lg" style="height:50px;"><i class="fa fa-paper-plane"></i> Proceed</button><br />
  </div><br />
  

<span id="dd" style="color:green;padding:5px;font-size:18px;"></span><br />
  
                 </form>

    </div>
         <div class="col-md-2"></div>
    </div>

        <div class="row">
            <div class="col-md-12">   
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

      </div>


</div> 



  
</body>
</html>
  
