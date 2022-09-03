<%-- 
    Document   : register
    Created on : Jun 22, 2022, 11:05:00 AM
    Author     : ABRAHAM
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="model.Users"%>
<%@page import="model.LoanRequest"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="fontawesome-free-6.1.1-web/css/all.css" />
        <style>
            body{
                min-height: 100vh;
                background: url(bg3.png),-webkit-linear-gradient(bottom left, #ebe3e363,#eee);
            }


            .model-container{
                position: fixed;
                top: 0;
                left: 0;
                width: 100vw;
                height: 100vh;
                pointer-events: none;
                opacity: 0;
                /*background-color:rgba(0, 0, 0, 0.3);*/
            }

            .model-container.show{
                opacity: 1;
                pointer-events: auto;
            }
            .model{
                background-color: #fff;
                padding: 30px 50px;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.2);  
            }

            .model p{
                opacity: 0.7;
                font-size: 18px;
            }



            .form-container{
                box-shadow: 0 5px 4px rgba(0, 0, 0, 0.5); 
            }
            .submitBtn{
                width: 120px;
                font-size: 20px;
                font-weight: bold;
            }

            .form-title h2{
                font-size: 3rem;
                font-weight: bold;
                letter-spacing: 2px;
                color: #54575a;
            }

            .form-control{
                outline: none;
            }



        </style>


    </head>
    <body>
        <%! String name = "", position = "", email = "", transactionid = "", collateralName = "", collateralID = "", status = "", time = "", date = "";%>

        <%

            List<Users> us = data.Database.getuserinfo2();
            ArrayList<String> emailCollect = new ArrayList<String>();
            for (Users user : us) {
                email = user.getEmail();
                emailCollect.add(email);
            }

        %>

        <div class="container">
            <div class="row p-3 mb-4 ">
                <div class="col-md-8 col-sm-10 col-xs-10 mx-auto">
                    <div class="card shadow mx-auto p-3">
                        <div class="row d-flex  align-items-center">
                            <div class="col-md-6 col-sm-4 col-xs-4 welcome-page p-3">
                                <div class="row d-flex flex-column">
                                    <div class="col text-center p-2">
                                        <img class="rounded-circle shadow img-fluid" src="kam.png" alt="logo" width="60">
                                        <h3 class="text-info">Kambok Loan</h3>
                                        <p class="text-secondary">We'll never share your information to a third party without your prior consent</p>
                                    </div>
                                    <div class="col sign-up-img">
                                        <img src="signup.jpg" class="img-fluid" />
                                        <div class="text-center">
                                            <p>Already have an account'? <a href="index.jsp">Login</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-8 col-xs-8 p-3">
                                <h3 class="text-info pb-2">Sign up Form</h3>
                                <form action="Register" method="post">
                                    <div class="row d-flex justify-content-center">
                                            <!-- Name input -->
                                            <div class="form-outline mb-4">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text p-3">
                                                                <span class="fa fa-user"></span>
                                                            </span>                    
                                                        </div>
                                                        <input type="text" class="form-control" name="firstn" placeholder="First name" required="required">
                                                    </div>
                                                </div> 
                                            </div>
                                            <!-- Name input -->
                                            <div class="form-outline mb-4">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text p-3">
                                                                <span class="fa fa-user"></span>
                                                            </span>                    
                                                        </div>
                                                        <input type="text" class="form-control" name="lastn" placeholder="Last Name " required="required">
                                                    </div>
                                                </div> 
                                            </div>
                                    </div>
                                    <!-- Phone input -->
                                    <div class="form-outline mb-4">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text p-3">
                                                        <span class="fa fa-phone"></span>
                                                    </span>                    
                                                </div>
                                                <input type="text" class="form-control" name="phone" placeholder="Phone number" required="required">
                                            </div>
                                        </div> 
                                    </div>
                                    <!-- Email input -->
                                    <div class="form-outline mb-4">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text p-3">
                                                        <span class="fa fa-envelope"></span>
                                                    </span>                    
                                                </div>
                                                <input type="email" class="form-control"  name="email" placeholder="Email" required="required" id="email" onchange="confirmEmail();">
                                            </div>
                                            <h6 class="text-danger text-center" id="report2"></h6>
                                        </div> 
                                    </div>
                                    <input type="hidden" class="form-control" id="confirmemail" value="<%=emailCollect%>" >
                                    <!-- Password input -->
                                    <div class="form-outline mb-4">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text p-3">
                                                        <span class="fa fa-lock"></span>
                                                    </span>                    
                                                </div>
                                                <input type="password" class="form-control" name="pass" placeholder="password" required="required" id="pass">
                                            </div>
                                        </div> 
                                    </div>
                                    <!-- Confirm Password input -->
                                    <div class="form-outline mb-4">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text p-3">
                                                        <span class="fa fa-lock"></span>
                                                    </span>                    
                                                </div>
                                                <input type="password" class="form-control" placeholder="Confirm password" required="required" name="confirm-password" id="confirmpass"
                                                       onmouseleave="ConfirmPassword();"   >
                                            </div>
                                        </div> 
                                    </div>
                                    <b id="report"></b>                 
                                    <!-- Submit button -->
                                    <div class="row d-flex justify-content-center">
                                        <button type="submit" class="btn btn-primary btn-block mb-4 submitBtn ">Sign up</button>
                                    </div>
                                </form> 
                            </div>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
        <!--Alert Model Popup-->

        <div class="row model-container d-flex justify-content-center align-items-center">
            <div class="col-md-8">
                <div id="model-container" class="offset-md-auto">
                    <div class="model text-center ">
                        <h1>User already exist <span style="font-size: 22px; text-align: center;">&#128512;</span></h1>
                        <p>This email is already registered</p>
                        <p>Do you want to <span class="text-primary"><a href="index.jsp" style="text-decoration: none"> login </a></span> OR <a href="register.jsp" style="text-decoration: none"> change email?</a></p>

                        <button class="btn btn-primary" id="close-model">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <script>

                    function ConfirmPassword(){
                    let password = document.getElementById("pass").value;
                            let confirmpassword = document.getElementById("confirmpass").value;
                            let report = document.getElementById("report");
                            const button = document.querySelector('button');
                            if (confirmpassword != password){
                    button.disabled = true;
                            report.style.color = "red";
                            report.innerHTML = "Password does not match! Try again";
                    } else{
                    report.innerHTML = "";
                            button.disabled = false;
                    }
                    }

            function confirmEmail(){
            const button = document.querySelector('button');
                    let email = document.getElementById("email").value;
                    let email2 = document.getElementById("confirmemail").value;
                    var report = document.getElementById("report2");
                    if (email2.includes(email)){
            button.disabled = true;
                    report.style.color = "red";
                    report.innerHTML = "User already exit!";
            } else if (email == ""){
            button.disabled = false;
                    report.innerHTML = "";
            } else{
            button.disabled = false;
                    report.innerHTML = "";
            }
            }
        </script>

        <script src="scrollreveal.min.js"></script>
        <script type="text/javascript">

                    const sr = ScrollReveal({
                    origin: 'top',
                            distance: '60px',
                            duration:2500,
                            delay: 300,
                            reset: true
                    })
                    sr.reveal('.container')
                    sr.reveal('.form-container', {delay: 500})
                    sr.reveal('.form-title', {delay: 600, origin: 'bottom'})
                    sr.reveal('.form-group', {delay: 700, origin: 'left'})
                    sr.reveal('.check-group', {delay: 800, origin: 'bottom'})
                    sr.reveal('.btn-floating', {interval: 100})

        </script>

    </body>
</html>