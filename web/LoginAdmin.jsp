<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">
    <head>
	<title>Admin</title>
	<!--/tags -->
	<%@ include file="meta.html" %>
	<!--//tags -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/font-awesome.css" rel="stylesheet">
	<!--pop-up-box-->
	<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
	<!--//pop-up-box-->
	<!-- price range -->
	<link rel="stylesheet" type="text/css" href="css/jquery-ui1.css">
	<!-- fonts -->
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
	<style>
            .product-sec2 {
                box-shadow: 0px 10px 15px 0px #D6D6D6;
                padding: 30px 20px;
                margin-bottom: 14px;
            }
            * {
                box-sizing: border-box;
            }
            label {
              padding: 12px 12px 12px 60px;
              display: inline-block;
            }
            input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button { 
                -webkit-appearance: none; 
                margin: 0; 
            }
            input[type=number], input[type=password]{
                width: 90%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: vertical;
            }
            input[type=reset], input[type=submit] {
              background-color: #644334;
              color: white;
              padding: 12px 20px;
              border: none;
              border-radius: 4px;
              cursor: pointer;
              float: center;
              width: 20%;
            }
            input[type=reset]:hover, input[type=submit]:hover {
              background-color: #462f25;
            }
	</style>
    </head>
    <body>
	<!-- header-bot-->
	<%@ include file="MainNav.jsp" %>
	<!-- //header-bot -->
	<!-- top Products -->
	<div class="ads-grid">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l">Admin
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
                <!-- //tittle heading -->
                <!-- form -->
                <div class="agileinfo-ads-display col-md-13 w3l-rightpro">
                    <div class="wrapper">
                        <!-- first section -->
                        <div class="product-sec2">
                            <h3 class="agileinfo_sign">Log In</h3>
                            <p align="center">Log In now, Let's start your work.</p>
                            <p align="center"><span style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span></p>
                            <form name="form" onsubmit="showAlertSuccessfulLogin()" action="LoginController?action=loginAdmin" method="post">
                                <div class="row">
                                    <div class="col-25">
                                        <label for="name">Identification Number</label>
                                    </div>
                                    <center>
                                        <div class="col-75">
                                            <input type="number" id="adminID" name="adminID" min="0" required>
                                        </div>
                                    </center>
                                </div>						  
                                <div class="row">
                                    <div class="col-25">
                                        <label for="name">Password</label>
                                    </div>
                                    <center>
                                        <div class="col-75">
                                            <input type="password" id="adminPassword" name="adminPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" minlength="6" required> 
                                        </div>    
                                    </center>
                                </div>
                                <div class="row">
                                    <br>
                                </div>
                                <div class="row" align="center">
                                      <br>
                                     <input type="reset" value="Reset"></input>   <input type="submit" value="Login"></input>
                                </div>  
                            </form>
                            <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                            <script>
                                function showAlertSuccessfulLogin() {
                                    Swal.fire({
                                            position: 'top-center',
                                            icon: 'success',
                                            title: ' successfully Login',
                                            showConfirmButton: false,
                                            timer: 4500
                                    });
                                }
                            </script>
                        </div>
                        <!-- //first section -->
                    </div>
                </div>
                <!-- //form -->
            </div>
	</div>
	<!-- //top products -->
	<!-- copyright -->
	<div class="copy-right">
            <div class="container">
                <p>Â© 2021 Ramly Halal Mart. All rights reserved | Design by Zephyr.</p>
            </div>
	</div>
	<!-- //copyright -->
	<!-- js-files -->
	<!-- jquery -->
	<script src="js/jquery-2.1.4.min.js"></script>
	<!-- //jquery -->
	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<!-- //js-files -->
    </body>
</html>