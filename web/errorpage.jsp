
<%@page import="imageloader.Loader"%>
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
    <%! String pic=""; %>
    
    <%
    pic = (String)session.getAttribute("passport");
    if(pic!=null || pic!="null"){
        Loader.deletePassport(pic);
    }
    %>
    <script>
        history.pushState(null,'index.jsp', location.href);
        window.addEventListener('popstate', function(event){
        history.pushState(null,'index.jsp', location.href)
    });
    
    window.onunload = function(){
        window.location.href = "<%=request.getContextPath()%>index.jsp";
    }
    </script>
    <section class="vh-100">
        <div class="container py-5 h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
              <div class="row d-flex justify-content-center align-items-center">
                  <div class="col-12 col-md-12 col-lg-6, col-xl-5">
                      <div class="logo-container text-center">
                          <img class="rounded-circle shadow" src="kam.png" alt="logo" width="100">
                          <h4 class="text-secondary">KAMBOK LOAN</h4>
                      </div>
                  </div>
              </div>
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
              <div class="card form-container" style="border-radius: 1rem;">
                <div class="card-body p-5 text-center">
                    <div class="form-title p-3 mb-4">
                        <h2>Login</h2>
                    </div>
                    <form action="Admin" method="post">
                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text p-3">
                                            <span class="fa fa-user"></span>
                                        </span>                    
                                    </div>
                                    <input type="email" class="form-control" placeholder="Username" required="required" name="username">
                                </div>
                            </div> 
                        </div>
                      
                        <!-- Password input -->
                        <div class="form-outline mb-4">
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text p-3">
                                            <span class="fa fa-lock"></span>
                                        </span>                    
                                    </div>
                                    <input type="password" class="form-control" placeholder="Password" required="required" name="pass">
                                </div>
                            </div> 
                        </div>
                      
                        <!-- 2 column grid layout for inline styling -->
                        <div class="row mb-4 check-group">
                          <div class="col d-flex justify-content-center">
                            <!-- Checkbox -->
                            <div class="form-check">
                              <input class="form-check-input" type="checkbox" value="" id="form2Example34" checked />
                              <label class="form-check-label" for="form2Example34"> Remember me </label>
                            </div>
                          </div>
                      
                          <div class="col">
                            <!-- Simple link -->
                            <a href="#!">Forgot password?</a>
                          </div>
                        </div>
                        <b id="report"></b>
                        <!-- Submit button -->
                        <div class="row d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary btn-block mb-4 submitBtn ">Sign in</button>
                        </div>
                      
                        <!-- Register buttons -->
                        <div class="text-center">
                          <p>Don't have account'? <a href="register.jsp">Register</a></p>
                          <p>or sign up with:</p>
                          <button type="button" class="btn btn-primary btn-floating mx-1">
                            <i class="fab fa-facebook-f"></i>
                          </button>
                      
                          <button type="button" class="btn btn-primary btn-floating mx-1">
                            <i class="fab fa-google"></i>
                          </button>
                      
                          <button type="button" class="btn btn-primary btn-floating mx-1">
                            <i class="fab fa-twitter"></i>
                          </button>
                      
                          <button type="button" class="btn btn-primary btn-floating mx-1">
                            <i class="fab fa-github"></i>
                          </button>
                        </div>
                      </form>    
      
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    <!--scroll reveal-->
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