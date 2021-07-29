<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            .product-sec2 {
                box-shadow: 0px 10px 15px 0px #D6D6D6;
                padding: 30px 20px;
                margin-bottom: 14px;
            }
            * {
                box-sizing: border-box;
            }
            input[type=text], input[type=password]{
                width: 90%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: vertical;
            }
            label {
                padding: 12px 12px 12px 60px;
                display: inline-block;
            }
            input[type=reset], input[type=submit] {
                background-color: #644334;
                color: white;
                padding: 10px 20px;
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
    <%@page import="ramly.model.Customer"%>
    <% Customer cust = (Customer) session.getAttribute("login");
        if(cust == null){
            response.sendRedirect("LoginCustomer.jsp");
        }
    %>
    <body>
        <!-- header-bot-->
	<%@ include file="CustNav.jsp" %>
        <!-- header-botS -->
        <div class="ads-grid">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l">Shopping Cart
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
                            <center>
                                <a href="ItemController?action=custCatalogue"><button class="btn btn-secondary"><span class="fa fa-backward" aria-hidden="true"></span> Continue Shopping</button></a>
                            </center>
                            <br><br>
                            <div class="table-responsive">
                                <table class="timetable_pay">
                                    <tr>
                                        <th>Item ID</th>
                                        <th>Name</th>
                                        <th>Quantity</th>
                                        <th>Unit Price </th>
                                        <th>Total</th>
                                        <th colspan="2">Action</th>
                                    </tr>
                                    <c:if test="${totalPrice == 0}">
                                      <tr>
                                        <td colspan="4">- Cart is currently empty -</td>
                                      </tr>
                                    </c:if>
                                    <c:set var="totalPrice" value="${0}" />
                                    <c:forEach var="item" items="${items}">                       
                                        <tr>
                                            <td><c:out value="${item.getitemID()}"/></td>
                                            <td><c:out value="${item.getitemName()}"/></td>
                                            <td><c:out value="${item.getiQty()}"/></td>
                                            <td>RM<c:out value="${item.getitemPrice()}"/></td>
                                            <td>RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.getitemPrice()*item.getiQty()}"/></td>
                                            <td colspan="2">
                                            <!-- AFIQ - Start. Handle kalau stock habis takleh add dah kat cart  -->    
                                                <a href="CartController?action=minusFromCart&id=${item.getitemID()}"><button class="btn btn-danger" onclick="showAlertMinus()">Minus</button></a>
                                                <c:if test="${item.itemQty >= 1}">
                                                   <a href="CartController?action=addToCart&id=${item.getitemID()}"><button class="btn btn-success" onclick="showAlertAdd()">Add</button></a>
                                                </c:if>
                                                <c:if test="${item.itemQty < 1}">
                                                    <button class="btn btn-success" disabled>Out of Stock</button>
                                                </c:if>
                                            </td>
                                            <!-- End.  -->
                                        </tr>
                                        <c:set var="total" value="${item.getitemPrice() * item.getiQty()}"/>
                                        <c:set var="totalPrice" value="${totalPrice+total}"/>
                                        <tr>
                                            <th colspan="6"> </th>
                                        </tr>
                                    </c:forEach>
                                    <!--Total-->
                                    <tr>
                                        <th colspan="5"><b>TOTAL PRICE</th>
                                        <th>RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${totalPrice}"/></th>
                                    </tr>
                                </table>
                                <!-- AFIQ - Start. Handle payment cart kalau takde item  -->
                                <br><br>
                                <center>
                                    <c:if test="${totalPrice == 0}">  
                                        <a disabled><button class="btn btn-success" disabled>Proceed to Payment</button></a>
                                        <br><br> 
                                    </c:if> 
                                    <c:if test="${totalPrice != 0}">  
                                        <a href="OrderController?action=createOrder&total=${totalPrice}"><button class="btn btn-success">Proceed to Payment</button></a>
                                        <br><br>
                                    </c:if> 
                                </center>        
                                <!-- End.  -->
                            </div>
                            <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                            <script>
                                function showAlertAdd() {
                                    Swal.fire({
                                        position: 'top-center',
                                        icon: 'success',
                                        title: 'Item added to cart successfully',
                                        showConfirmButton: false,
                                        timer: 4500
                                    });
                                }
                                function showAlertMinus() {
                                    Swal.fire({
                                        position: 'top-center',
                                        icon: 'success',
                                        title: 'Item minus from cart successfully',
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