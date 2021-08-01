<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>RAMLY HALAL MART</title>
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
            ::before, ::after {
            box-sizing: border-box;
            }
            .section {
                background-color:#EDD787;
                min-height: 100vh;
                display:block;
                padding: 0 400px;
            }
            .section .container {
                padding-top: 40px;
                padding-bottom: 70px;
            }
            .padd-15 {
                padding-left:-1px;
                padding-right: 1px;
            }
            .col-25 {
                float: left;
                width:15%;
                margin-top: 15px;
                margin-left: 15px;
            }
            .col-75 {
                float: left;
                width: 80%;
                margin-top: 15px;
                text-align: left;
             }
            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }
            input[type=text], input[type=password], input[type=email], input[type=tel], textarea {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: vertical;
            }
            input[type=checkbox] {
                margin: 12px 12px 12px 200px;
            }
            input[readonly] {
                color: graytext;
                background: buttonface;
                outline: none;
            }
            label {
                padding: 12px 12px 12px 0;
                display: inline-block;
            }
            small {
                font-size: 80%;
            }
            .product-sec2 {
                box-shadow: 0px 10px 15px 0px #D6D6D6;
                padding: 0px;
                margin-bottom: 14px;
            }
        </style>
    </head>
    <%@page import="ramly.model.Customer"%>
    <% Customer cust = (Customer) session.getAttribute("login");
        if(cust == null){
            response.sendRedirect("LoginCustomer.jsp");
        }
    %>
    <body>
        <!-- header-bot-->
        <%@ include file="CustNav.jsp" %>
        <!-- //header lists -->
        <!-- top Products -->
        <div class="ads-grid">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l">Update Profile
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
                <!-- //tittle heading -->		
                <div class="product-sec2"><br>
                    <br>
                    <div class="card">
                        <div class="card-body">        
                            <form name="form1" method="post" id="ff" onsubmit="showAlertSuccessfulUpdate()" action="CustomerController?action=updateCustomer">
                                <center>
                                    <div class="row">
                                        <div class="col-25">
                                            <label for="name">User ID :</label>
                                        </div>	
                                        <div class="col-75">
                                            <input type="text" name="custID" id="custID" value="<%=cust.getCustID()%>" readonly><br>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-25">
                                            <label for="name">Name :</label>
                                        </div>
                                        <div class="col-75">
                                            <input type="text" name="custName" pattern="[a-zA-Z ]+" id="custName" value="<%=cust.getCustName()%>" required><br>	
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-25">
                                            <label for="name">No. Phone:</label>
                                        </div>
                                        <div class="col-75">
                                            <small>Example: "012-3456789" | Maximum 10 digits</small>
                                            <input type="tel" name="custPhone" id="custPhone" pattern="[0-9]{3}-[0-9]{7}" minlength="11" maxlength="11" value="<%=cust.getCustPhone()%>" required><br>	
                                        </div>
                                     </div>  
                                    <div class="row">
                                        <div class="col-25">
                                            <label for="name">Email :</label>
                                        </div>
                                        <div class="col-75">
                                            <input type="email" name="custEmail" id="custEmail" value="<%=cust.getCustEmail()%>" readonly><br>	
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-25">
                                            <label for="subject">Address :</label>
                                        </div>
                                        <div class="col-75">
                                            <textarea name="custAddress" id="custAddress" required><%=cust.getCustAddress()%></textarea>
                                            <br>	
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-25">
                                            <label for="name">Username :</label>
                                        </div>	
                                        <div class="col-75">
                                            <input type="text" name="custUsername" pattern="[A-Za-z]+" id="custUsername" value="<%=cust.getCustUsername()%>" required><br>	
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-25">
                                            <label for="name">Password :</label>
                                        </div>
                                        <div class="col-75">
                                            <small>Example: "Aliabu123" | Mininum 6 characters</small>
                                            <input type="password" name="custPassword" id="custPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" minlength="6" value="<%=cust.getCustPassword()%>" required><br>	
                                        </div>
                                    </div>
                                </center>
                                <div class="row">
                                    <input type="checkbox" onclick="showPassword()">Show Password
                                </div>
                            </form>
                            <center>
                                <br><br>
                                <button style="font-size: 17px;" onclick="history.back();" class="btn btn-warning"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button>
                                <input style="font-size: 17px;" type="submit" form="ff" value="Update" onclick="formValidation()" class="btn btn-success"> 
                                <br><br>
                            </center> 
                            <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                            <script>
                                function showAlertSuccessfulUpdate() {
                                    Swal.fire({
                                        position: 'top-center',
                                        icon: 'success',
                                        title: 'Profile update successfully',
                                        showConfirmButton: false,
                                        timer: 4500
                                    });
                                }
                                function showPassword() {
                                    var x = document.getElementById("custPassword")

                                    if(x.type === "password") {
                                        x.type = "text";
                                    }
                                    else {
                                        x.type = "password";
                                    }
                                }
                                function formValidation() {
                                    var name = document.getElementById("custName");
                                    var nameValidity = name.validity;
                                    var phone = document.getElementById("custPhone");
                                    var phoneValidity = phone.validity;
                                    var address = document.getElementById("custAddress");
                                    var addressValidity = address.validity;
                                    var username = document.getElementById("custUsername");
                                    var usernameValidity = username.validity;
                                    var password = document.getElementById("custPassword");
                                    var passwordValidity = password.validity;

                                    if(nameValidity.valueMissing) {
                                        name.setCustomValidity("Please fill out this field!");
                                    }
                                    else if(nameValidity.patternMismatch) {
                                        name.setCustomValidity("Must be letters only!");
                                    }
                                    else {
                                        name.setCustomValidity("");
                                    }
                                    
                                    if(phoneValidity.valueMissing) {
                                        phone.setCustomValidity("Please fill out this field!");
                                    }
                                    else if(phoneValidity.patternMismatch) {
                                        phone.setCustomValidity("Must contain 10 digits, has dash (-) character and please use the correct format! Example: xxx-xxxxxxx ");
                                    }
                                    else if(phoneValidity.tooLong) {
                                        phone.setCustomeValidity("Phone number entered exceeds 11 digits!");
                                    }
                                    else if(phoneValidity.tooShort) {
                                        phone.setCustomeValidity("Phone number entered subceeds 11 digits!");
                                    }
                                    else {
                                        phone.setCustomValidity("");
                                    }
                                    
                                    if(addressValidity.valueMissing) {
                                        address.setCustomValidity("Please fill out this field!");
                                    }
                                    else {
                                        address.setCustomValidity("");
                                    }
                                    
                                    if(usernameValidity.valueMissing) {
                                        username.setCustomValidity("Please fill out this field!");
                                    }
                                    else if(usernameValidity.patternMismatch) {
                                        username.setCustomValidity("Must be letters only!");
                                    }
                                    else {
                                        username.setCustomValidity("");
                                    }
                                    
                                    if(passwordValidity.valueMissing) {
                                        password.setCustomValidity("Please fill out this field!");
                                    } 
                                    else if(passwordValidity.patternMismatch) {
                                        password.setCustomValidity("Must contain a digit, a lowercase letter, a uppercase letter and at least 6 characters!");
                                    }
                                    else if(passwordValidity.tooShort) {
                                        password.setCustomValidity("Password entered subceeds 6 digits!");
                                    }
                                    else {
                                        password.setCustomValidity("");
                                    }
                                    name.reportValidity();
                                    phone.reportValidity();
                                    address.reportValidity();
                                    username.reportValidity();
                                    password.reportValidity();
                                }
                            </script>        
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- js-files -->
        <!-- jquery -->
        <script src="js/jquery-2.1.4.min.js"></script>
        <!-- //jquery -->
        <!-- for bootstrap working -->
        <script src="js/bootstrap.js"></script>
        <!-- //for bootstrap working -->
        <!-- //js-files -->
    </body>
</html>`