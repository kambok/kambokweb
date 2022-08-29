  
<%@page import="java.util.List"%>
<%@page import="model.LoanRequest"%>
<%@page import="imageloader.Loader"%>
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
var email=document.myform.email.value;
var colname=document.myform.colname.value;
var trid=document.myform.trid.value;
var amount=document.myform.amount.value;


var url="ApproveRequest?email="+email+"&colname="+colname+"&trid="+trid+"&amount="+amount;
  
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
  
function sendInfo2()  
    {  
        var email=document.myform.email.value;
        var colname=document.myform.colname.value;
        var trid=document.myform.trid.value;
        var amount=document.myform.amount.value;
            var url="Declined_Request?email="+email+"&colname="+colname+"&trid="+trid;
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
document.getElementById('dd').innerHTML=val;  
} 
}
</script>
    
 </head>
<body>
     <script type = "text/javascript" >
          history.pushState(null, null, 'view.jsp');
          window.addEventListener('popstate', function (event) {
              history.pushState(null, null, 'view.jsp');
      });

     </script>
     
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>
    <%!String pic1="",pic2="",trid="",colname="",colid="",cond="",email="",status="";%>
    <%
    List<LoanRequest> lr=data.Database.getrequestid(request.getParameter("v"));
    
    for(LoanRequest l:lr){
      trid=l.getTrid();
      colname=l.getColname();
      colid=l.getColid();
      cond=l.getCondition();
      email=l.getEmail();
      status = l.getStatus();
    }
    %>
<nav class="navbar navbar-light bg-light p-3">
  <div class="d-flex col-12 col-md-3 col-lg-2 mb-2 mb-lg-0 flex-wrap flex-md-nowrap justify-content-between">
      <a class="navbar-brand" href="#">
         <img src="images/kam.png" width="40px" class="rounded-pill">&nbsp; Admin
		  
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
            Hello, Kambok Mohammed
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Messages</a></li>
            <li><a class="dropdown-item" href="#">Sign out</a></li>
          </ul>
        </div>
  </div>
</nav>
    <br />
<div class="container">
    <div class="row">
<div class="col-md-12">
        
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="viewrequest.jsp"><span class="btn btn-primary">Back</span></a></li>
   
  </ol>
</nav>
<h1 class="h2">Request Information</h1>
<div class="card">
    <h5 class="card-header">Loan</h5>
    <div class="card-body">
        <%
        String tranid=request.getParameter("v");
       
         pic1= Loader.loadImageFront(tranid);
         pic2=Loader.loadImageBack(tranid);
         
         session.setAttribute("pic1", pic1);
          session.setAttribute("pic2", pic2);
         Thread.sleep(2000);
        
        %>
        <div class="row">
            <div class="col-md-6">
      <div class="card">
          <h5 class="card-header">Image Front</h5>
          <div class="card-body text-center image-container">
               <a href="photos/<%=pic1%>" target="_new"><img src="photos/<%=pic1%>" class="circle img-fluid " width="400" height="400px"> </a>
          </div>
        </div>
  </div>
  <div class="col-md-6">
      <div class="card">
          <h5 class="card-header">Image Back</h5>
          <div class="card-body text-center image-container">
              <a href="photos/<%=pic2%>" target="_new"><img src="photos/<%=pic2%>" class="circle img-fluid " width="400" height="400px"> </a>
          </div>
        </div>
  </div>
  </div>        
        <br/>
          <div class="row">
              <div class="col-md-6">
        <div class="table-responsive">
            <table class="table text-center table-bordered table-success text-dark table-stripped">
                <tr>
                    <th>Transaction Id</th>
                    <th class="text-secondary"><%=trid%></th> 
                     
                </tr>   
                 <tr>
                     <th>Collateral Name</th>
                     <th class="text-secondary"><%=colname%></th> 
                     
                </tr>
                <tr>
                     <th>Collateral Id</th>
                     <th class="text-secondary"><%=colid%></th> 
                     
                </tr>
                <tr>
                     <th>Collateral Condition</th>
                     <th class="text-secondary"><%=cond%></th> 
                     
                </tr>
                
            </table>   
        </div>
              </div>
                     
             <div class="col-md-6">
                 <form class="form" name="myform">
                     <div class="form-group">
                         <input type="text" class="form-control" placeholder="Amount" name="amount">
                     </div>
                     <div class="form-group">
                         <input type="hidden" class="form-control"  name="trid" value="<%=trid%>">
                         <input type="hidden" class="form-control"  name="colname" value="<%=colname%>">
                     
                         <input type="hidden" class="form-control"  name="email" value="<%=email%>">
                     </div>
                     <br />
                     <div class="row d-flex justify-content-between align-items-center">
                             
                   <div class="col form-group">
                       <button class="btn btn-success" id="approveBtn" type="button" onclick="sendInfo();">Approve</button>
                     </div> 
                         <input type="hidden" class="form-control" id="status" value="<%= status %>" >
                         <div class="col form-group">
                             <button id="declinedBtn" class="btn btn-danger" style="float: right;" type="button" onclick="sendInfo2();">Declined</button>
                     </div> 
                     </div>
                     <big id="dd" class="text-success text-center"></big>
                    
                 </form>
                         <script>
                                 var status = document.getElementById("status").value;
                                    if(status!="pending"){
                                        document.getElementById("dd").innerHTML = "The request has been "+status;
                                        document.getElementById("approveBtn").disabled = true;
                                        document.getElementById("declinedBtn").disabled = true;
                                    }else{
                                        document.getElementById("approveBtn").disabled = false;
                                        document.getElementById("declinedBtn").disabled = false;

                                    }
                         </script>
        
              </div>         
          </div>    
     
                     
  </div>
  </div>
</div>
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
  
