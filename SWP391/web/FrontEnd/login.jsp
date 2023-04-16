<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login V1</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="FrontEnd/Login_v1/images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="FrontEnd/Login_v1/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="FrontEnd/Login_v1/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="FrontEnd/Login_v1/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="FrontEnd/Login_v1/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="FrontEnd/Login_v1/vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="FrontEnd/Login_v1/css/util.css">
        <link rel="stylesheet" type="text/css" href="FrontEnd/Login_v1/css/main.css">
        <!--===============================================================================================-->
    </head>
    <body>

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                        <a href="home"><img src="FrontEnd/img/logo1.png" alt="IMG"></a>
                    </div>

                    <form action="customerlogin" method="post" class="login100-form validate-form">
                        <span class="login100-form-title">
                            Customer Login
                        </span>

                        <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                            <input class="input100" type="text" name="email" placeholder="Email">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Password is required">
                            <input class="input100" type="password" name="password" placeholder="Password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>
                        <% if (request.getAttribute("error") != null) {%>
                        <div class="w-100">
                            <%=request.getAttribute("error")%>
                        </div>
                        <%}%>
                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Login
                            </button>
                        </div>

                        <div class="text-center p-t-12">
                            <span class="txt1">
                                Forgot
                            </span>
                            <a class="txt2" href="forgot">
                                Email / Password?
                            </a>
                        </div>

                    </form>
                </div>
            </div>
        </div>




        <!--===============================================================================================-->	
        <script src="FrontEnd/Login_v1/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="FrontEnd/Login_v1/vendor/bootstrap/js/popper.js"></script>
        <script src="FrontEnd/Login_v1/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="FrontEnd/Login_v1/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="FrontEnd/Login_v1/vendor/tilt/tilt.jquery.min.js"></script>
        <script >
            $('.js-tilt').tilt({
                scale: 1.1
            });
        </script>
        <!--===============================================================================================-->
        <script src="FrontEnd/Login_v1/js/main.js"></script>

    </body>
</html>