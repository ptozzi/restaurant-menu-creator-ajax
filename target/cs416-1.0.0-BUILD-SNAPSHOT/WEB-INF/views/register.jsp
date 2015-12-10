<%-- 
    Document   : register
    Created on : Nov 29, 2015, 11:30:15 PM
    Author     : Anthony Brignano
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="eng">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
        <title>Register</title>
        <script type="text/javascript"
    src="http://code.jquery.com/jquery-1.10.1.min.js">
        <script type="text/javascript">
      function checkUsername() {
        $.ajax({
          url: 'checkusername',
          data: "passedUsername=" + document.getElementById('username').value,
          success: function (data) {
            $('#result').html(data);
          }
        });
      }
    </script>
    </head>
    <body>
        <h1 class="text-center">Register</h1>

        <div class="login-container">

            <div class="login-card">

                <div class="login-form" >
                    <!--
                        Establish variable registerURL below (set to /register by default)
                    -->
                    <c:url var="registerURL" value="/register" />
                    <form action="usersaved" method="post" class="form-horizontal">

                        <!--Username input text box-->
                        <div class="input-group input-sm">
                            <label class="input-group-addon" for="username"><i class="fa fa-user"></i></label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" onkeyup="checkUsername();" required>
                        </div>
                        <div id="result">${message}</div>

                        <!--Password input text box-->
                        <div class="input-group input-sm">
                            <label class="input-group-addon" for="password"><i class="fa fa-lock"></i></label> 
                            <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
                        </div>

                        <!--Password confirmation input text box-->
                        <div class="input-group input-sm">
                            <label class="input-group-addon" for="confirm_password"><i class="fa fa-check"></i></label> 
                            <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="Confirm Password" required>
                        </div>

                        <!--Used to prevent against CSRF attacks-->
                        <input type="hidden" name="${_csrf.parameterName}"   value="${_csrf.token}" />


                        <!--
                            Button group below: contains Register button
                        -->
                        <div class="text-center">
                            <div class="btn-group inline">

                                <!--Register button-->
                                <div class="btn">
                                    <input type="submit" class="btn btn-block btn-primary btn-success" value="Register" >
                                </div>

                            </div>
                            <div>${error}</div>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
