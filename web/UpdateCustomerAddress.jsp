<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">
    <head>
	<title>RAMLY HALAL MART </title>
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
            .pay-opt {
                display: inline-flex;    
            }
            .pay-opt button {
                margin-left: 5px;
            }
            .product-sec2 {
                box-shadow: 0px 10px 15px 0px #D6D6D6;
                padding: 30px 20px;
                margin-bottom: 14px;
            }
            * {
                box-sizing: border-box;
            }
            label {
                padding: 12px 12px 12px 24px;
                display: inline-block;
                font-weight: normal;
            }
            small {
                font-size: 80%;
            }
            textarea {
                width: 100%;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: vertical;
            }
            input[type=tel] {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: vertical;
            }
            .col-25 {
                float: left;
                width: 15%;
                margin-top: 15px;
                margin-left: 15px;
            }
            .col-75 {
                float: left;
                width: 75%;
                margin-top: 15px;
                text-align: left;
             }
            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }
        </style>
    </head>
    <%@page import="ramly.model.Customer"%>
    <%@page import="ramly.model.Cart"%>
    <% Customer cust = (Customer) session.getAttribute("login");
        if(cust == null){
            response.sendRedirect("LoginCustomer.jsp");
        }
    %>
    <body>
        <!-- header-bot-->
	 <%@ include file="CustNav.jsp" %>
	<!-- top Products -->
	<div class="ads-grid">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l">Payment
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
                            <br>
                            <div class="table-responsive">
                                <table class="timetable_pay">
                                    <tr>
                                        <th> Item ID </th>
                                        <th> Item Name </th>
                                        <th> Unit Price </th>
                                        <th> Quantity </th>
                                        <th> Amount(RM) </th>
                                    </tr>
                                    <c:if test="${cart.lineItemCount == 0}">
                                        <tr> 
                                            <td colspan="4">- Cart is currently empty -</td>
                                        </tr>
                                    </c:if>
                                    <c:forEach var="item" items="${items}">  
                                        <tr>
                                            <td><c:out value="${item.getitemID()}"/></td>
                                            <td><c:out value="${item.getitemName()}"/></td>
                                            <td><c:out value="${item.getiQty()}"/></td>
                                            <td>RM<c:out value="${item.getitemPrice()}"/></td>
                                            <td>RM<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.getitemPrice() * item.getiQty()}"/></td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td colspan=4 class="timetable_pay2"> Subtotal </td>
                                        <td>RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${totalprice}"/></b></td>
                                    </tr>
                                    <tr>
                                        <th colspan=4 class="timetable_pay2"> Delivery charge (fix)</th>
                                        <th> RM 5.00 </th>
                                    </tr>
                                    <tr>
                                        <th colspan=4 class="timetable_pay2"><b> TOTAL </b></th>
                                        <th> 
                                            <c:set var="grandtotal" value="${0}"/>
                                            <c:set var="grandtotal" value="${totalprice + 5.0}"/>
                                            RM<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${grandtotal}"/>
                                        </th>
                                    </tr>		
                                </table>
                                </div>
                                    <div style="background-color: #f9f9f9">
                                    <br>
                                    <p style=" color: #000; font-weight: 600"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> Delivery Address </p>
                                    <form name="form1" method="post" id="ff" onsubmit="showAlertSuccessfulUpdate()" action="CustomerController?action=UpdateCustomerAddress&total=${totalprice}">
                                    <input type="text" name="custID" id="custID" value="<%=cust.getCustID()%>" readonly hidden><br>
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
                                            <label for="subject">Phone No. :</label>
                                        </div>
                                        <div class="col-75">
                                            <small>Example: "012-3456789" | Maximum 10 digits</small>
                                            <input type="tel" name="custPhone" id="custPhone" pattern="[0-9]{3}-[0-9]{7}" minlength="11" maxlength="11" value="<%=cust.getCustPhone()%>" required>
                                            <br>	
                                        </div>
                                    </div>
                                    <center>
                                        <br><br>
                                        <a href="OrderController?action=createOrder&total=${totalprice}" class="btn btn-warning"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</a>
                                        <input type="submit" value="Update" onclick="formValidation()" class="btn btn-success">
                                        <br><br>
                                    </center>
                                </form>
                                <hr>
                            </div>
                            <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                            <script>
                                function showAlertSuccessfulUpdate() {
                                    Swal.fire({
                                        position: 'top-center',
                                        icon: 'success',
                                        title: 'Information update successfully',
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
                                    var phone = document.getElementById("custPhone");
                                    var phoneValidity = phone.validity;
                                    var address = document.getElementById("custAddress");
                                    var addressValidity = address.validity;
                                    
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
   
                                    phone.reportValidity();
                                    address.reportValidity();
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
	<!-- footer -->
        <%@ include file="custFooter.html" %>
	<!-- //footer -->
	<!-- copyright -->
	<div class="copy-right">
        <div class="container">
            <p>© 2021 Ramly Halal Mart. All rights reserved | Design by Zephyr.</p>
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