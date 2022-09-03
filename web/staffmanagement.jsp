<%-- 
    Document   : dashboard
    Created on : Jun 20, 2022, 3:18:46 PM
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="model.Admindetails"%>
<%@page import="model.AdminUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <META Http-Equiv="Expires" Content="0">

        <title>Staff Management</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> 
        <link rel="stylesheet" href="fontawesome-free-6.1.1-web/css/all.css" />
        <link rel="icon" type="image/x-icon" href="kam.png">

        <!--table-pagination css.min cdn-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">

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

            .add-user{
                width: 50%;
                font-size: 20px;
                font-weight: bold;   
            }


            main .model-container{
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100vh;
                pointer-events: none;
                opacity: 0;
                transition: visibility 0s, opacity 0.5s;
            }

            .model-container.show{
                opacity: 1;
                pointer-events: auto;
            }
            .model-container .model{
                position: relative;
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

            .model .close{
                position: absolute;
                top: 20px;
                right: 20px;
                font-weight: bolder;
                color: red;
                cursor: pointer;
            }


            //view user section
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
        <script type="text/javascript">
            function preventBack() {
                window.history.forward();
            }

            setTimeout("preventBack()", 0.0);
            window.onunload = function () {
                null
            };
        </script>

    </head>
    <body>
        <script type = "text/javascript" >
            history.pushState(null, null, 'staffmanagement.jsp');
            window.addEventListener('popstate', function (event) {
                history.pushState(null, null, 'staffmanagement.jsp');
            });

        </script>

        <%
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0"); //prevents caching at the proxy server
        %>

        <%!String name = "", position = "", email = "", email2 = "", p = "";%>
        <%
            ArrayList<Admindetails> us = (ArrayList<Admindetails>) session.getAttribute("admin");
            if (us == null) {
                response.sendRedirect("index.jsp");
            } else {
                for (Admindetails s : us) {
                    name = s.getName();
                    position = s.getPositon();
                    email = s.getUsername();
                    p = s.getPassword();
                }

                if ((position.equals("Admin") || position.equals("Admin")) && email != null) {

                } else {
                    response.sendRedirect("index.jsp");
                }
            }
        %> 
        <nav class="navbar navbar-light bg-light p-3">
            <div class="d-flex col-12 col-md-3 col-lg-2 mb-2 mb-lg-0 flex-wrap flex-md-nowrap justify-content-between">
                <a class="navbar-brand" href="#">
                    <img src="images/kam.png" width="40px" class="rounded-pill">&nbsp; <%=position%>

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
                    Hello, <%=name%>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <li><a class="dropdown-item" href="#">Settings</a></li>
                    <li><a class="dropdown-item" href="#">Messages</a></li>
                    <li><a class="dropdown-item" href="logout">Sign out</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="row">

                <div class="position-sticky pt-md-5">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="dashboard.jsp">
                                <i class="fa-solid fa-house mx-2"></i>
                                <span class="ml-2">Dashboard</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="viewrequest.jsp">
                                <i class="fa-solid fa-landmark mx-2"></i>
                                <span class="ml-2">View Request</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="history.html">
                                <i class="fa-solid fa-clock-rotate-left mx-2"></i>
                                <span class="ml-2">History</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="accountinfo.html">
                                <i class="fa-solid fa-file-invoice-dollar mx-2"></i>
                                <span class="ml-2">Account Info</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="staffmanagement">
                                <i class="fa-solid fa-file-pen mx-2"></i>
                                <span class="ml-1">Staff Management</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="loan-status.jsp">
                                <i class="fa-solid fa-sack-dollar mx-2"></i>
                                <span class="ml-2">Loan Status</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="confirmpayment.jsp">
                                <i class="fa-solid fa-file-invoice-dollar mx-2"></i>
                                <span class="ml-2">Confirm-payment</span>
                            </a>
                        </li>
                    </ul>
                </div>

        </nav>
        <main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4 ">

            <nav aria-label="breadcrumb" >
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Adminhome.jsp">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Overview</li>
                </ol>
            </nav>
            <div class="container-fluid form-container"  id="formDiv">
                <h1 class="h2">Staff Management System</h1>
                <p>This is the home page for staff management</p>

                <section class="staff-management-section container">
                    <div class="row my-4">
                        <div class="col-md-12">
                            <div class="row d-flex justify-content-start">
                                <div class="col-md-6">
                                    <button class="btn btn-secondary text-light p-2 add-user" id="addUser">Add User</button>
                                </div>
                            </div>
                            <div class="row d-flex justify-content-center align-items-center my-4">
                                <div class="col-md-12">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="invesment-history" class="table" style="width:100%">
                                                <thead>
                                                    <tr>
                                                        <th>First Name</th>
                                                        <th>Last Name</th>
                                                        <th>Email Address</th>
                                                        <th>Phone</th>
                                                        <th>Position</th>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        List<AdminUser> getStaff = data.Database.getStaff();
                                                        for (AdminUser adu : getStaff) {
                                                            email2 = adu.getEmail();
                                                            out.println("<tr><td>" + adu.getFirstname() + "</td><td>" + adu.getLastname() + "</td><td>" + adu.getEmail() + "</td><td>" + adu.getPhone() + "</td><td>" + adu.getPosition() + "</td><td><form action='viewStaff' method='post'><input type='hidden' name='email' value='" + adu.getEmail() + "'><button type='submit' class='btn btn-primary'>View</button></form></td><td><form action='edit' method='post'><input type='hidden' name='email' value='" + adu.getEmail() + "'><button type='submit' class='btn btn-info'>Edit</button></form></td><td><form action='deleteStaff.jsp'><input type='hidden' value='" + adu.getEmail() + "' name='email'><button type='submit' class='btn btn-danger'>Delete</button></form></td></tr>");
                                                        }

                                                    %>
                                                </tbody>

                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <br><br><br><br><br><br><br><br><br>
                <br><br><br><br><br><br><br><br><br>
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
            <!--Modal section-->
            <div class="row">
                <div class="col-md-12">
                    <div class="model-container d-flex justify-content-center align-items-center" id="modelContainer">
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-7 model text-center  ">
                                <div id="add-user-section">
                                    <h1>Add User</h1>
                                    <div class="row">
                                        <div class="col-md-12 p-3">
                                            <form action="Adduser" method="post" class="form">
                                                <div class="row">
                                                    <div class="col form-group">
                                                        <input type="text" name="firstn" id="1" required="required" class="form-control" placeholder="First Name" onmouseleave="validateInput();">
                                                    </div>
                                                    <div class="col form-group">
                                                        <input type="text" name="lastn" id="2"  class="form-control" placeholder="Last Name" onmouseleave="validateInput();">
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="row">
                                                    <div class="col form-group">
                                                        <input type="email" name="email" id="3" class="form-control" placeholder="Email" onmouseleave="validateInput();">
                                                    </div>
                                                    <div class="col form-group">
                                                        <input type="text" name="phone" id="4" class="form-control" placeholder="Phone number" onmouseleave="validateInput();">
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="row">
                                                    <div class="col form-group">
                                                        <input type="password" name="pass" id="5" class="form-control" placeholder="Password" onmouseleave="validateInput();">
                                                    </div>
                                                    <div class="col form-group">
                                                        <select name="position" class="form-control" id="6" onmouseleave="validateInput();">
                                                            <option value="Default">Select Position</option>
                                                            <option value="Customer Care">Customer care</option>
                                                            <option value="Finance">Payment Department</option>
                                                            <option value="Inspector">Inspection Department</option>
                                                            <option value="Client">Client</option>
                                                            <option value="Investor">Investor</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="row">
                                                    <button type="submit" class="btn btn-primary p-2" id="submitBtn" onmouseenter="validateInput();">Add</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <span id="close-btn" class="close">X</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </main>

    </div>


    <!--table pagination js.min cdn-->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
    <!--table pagination initialization-->
    <script type="text/javascript">
            $(document).ready(function () {
                $('#invesment-history').DataTable();
            });
                    const addUser = document.getElementById("addUser");
                    const modelContainer = document.getElementById("modelContainer");
                    const close = document.getElementById("close-btn");
                    const blurContainer = document.getElementById("formDiv");
                    addUser.addEventListener('click', function () {
                        
                        modelContainer.classList.add('show');
                        blurContainer.classList.add('blu');
                    });
            close.addEventListener('click', function () {
                modelContainer.classList.remove('show');
                blurContainer.classList.remove('blu');
            });

            function validateAdminPin(){
            var p1 = document.getElementById("adminPin").value;
                    var p2 = document.getElementById("adminPin2").value;
                    if (p2 != p1){
            document.getElementById("report").textContent = "Incorrect authorization pin";
                    document.getElementById("delete").disabled = true;
            } else{
            document.getElementById("report").textContent = "";
                    document.getElementById("delete").disabled = false;
            }


            function validateInput(){
            var fname = document.getElementById("1");
                    var lname = document.getElementById("2");
                    var email = document.getElementById("3");
                    var tel = document.getElementById("4");
                    var pass = document.getElementById("5");
                    var post = document.getElementById("6");
                    if (fname.value == ""){
            document.getElementById("submitBtn").style.backgroundColor = "lightgrey";
                    document.getElementById("submitBtn").disabled = true;
                    fname.placeholder = "Required field";
                    fname.style.borderColor = "red";
            }
            else{
            document.getElementById("submitBtn").style.backgroundColor = "#031b6b";
                    document.getElementById("submitBtn").disabled = false;
                    fname.placeholder = "";
                    fname.style.borderColor = "lightgrey";
            }

            if (lname.value == ""){
            document.getElementById("submitBtn").style.backgroundColor = "lightgrey";
                    document.getElementById("submitBtn").disabled = true;
                    lname.placeholder = "Required field";
                    lname.style.borderColor = "red";
            }
            else{
            document.getElementById("submitBtn").style.backgroundColor = "#031b6b";
                    document.getElementById("submitBtn").disabled = false;
                    lname.placeholder = "";
                    lname.style.borderColor = "lightgrey";
            }

            if (email.value == ""){
            document.getElementById("submitBtn").style.backgroundColor = "lightgrey";
                    document.getElementById("submitBtn").disabled = true;
                    email.placeholder = "Required field";
                    email.style.borderColor = "red";
            }
            else{
            document.getElementById("submitBtn").style.backgroundColor = "#031b6b";
                    document.getElementById("submitBtn").disabled = false;
                    email.placeholder = "";
                    email.style.borderColor = "lightgrey";
            }

            if (tel.value == ""){
            document.getElementById("submitBtn").style.backgroundColor = "lightgrey";
                    document.getElementById("submitBtn").disabled = true;
                    tel.placeholder = "Required field";
                    tel.style.borderColor = "red";
            }
            else{
            document.getElementById("submitBtn").style.backgroundColor = "#031b6b";
                    document.getElementById("submitBtn").disabled = false;
                    tel.placeholder = "";
                    tel.style.borderColor = "lightgrey";
            }

            if (pass.value == ""){
            document.getElementById("submitBtn").style.backgroundColor = "lightgrey";
                    document.getElementById("submitBtn").disabled = true;
                    pass.placeholder = "Required field";
                    pass.style.borderColor = "red";
            }
            else{
            document.getElementById("submitBtn").style.backgroundColor = "#031b6b";
                    document.getElementById("submitBtn").disabled = false;
                    pass.placeholder = "";
                    pass.style.borderColor = "lightgrey";
            }

            if (post.value == "Default"){
            document.getElementById("submitBtn").style.backgroundColor = "lightgrey";
                    document.getElementById("submitBtn").disabled = true;
                    post.option = "Required field";
                    post.style.borderColor = "red";
            }
            else{
            document.getElementById("submitBtn").style.backgroundColor = "#031b6b";
                    document.getElementById("submitBtn").disabled = false;
                    post.option = post.value;
                    post.style.borderColor = "lightgrey";
            }

            }
        }
    </script> 
</body>
</html>

