<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">
    <head>
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
            input[type=text], input[type=password]{
                width: 90%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: vertical;
            }
            input[type=reset], input[type=submit]{
                background-color: #644334;
                color: white;
                padding: 12px 18px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                float: center;
                width: 20%;
            }
            input[type=reset]:hover, input[type=submit]:hover {
                background-color: #462f25;
            }
            select{
                width: 40%;
                padding: 9px;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: vertical;
            }
            table.search-sec input[type=search] {
                width:445px;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: vertical;
            }
            ::placeholder {
                color: black;
            }
            input[type="search"]:active, input[type="search"]:focus {
                color: black;
            }
            .search-button input[type=submit]{
                margin-left:5px; 
                width: 160%;
                padding-top: 5px;
            }
	</style><!-- UPDATE 26/6/2021  -->
    </head>
    <body onload="resetFilter()">
	<!-- header-bot-->
        <%@ include file="AdminNav.jsp" %>
        <!-- //header-bot -->
	<!-- top Products -->
	<div class="ads-grid">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l">Payment List
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
                            <!-- UPDATE 26/6/2021  -->
                            <div class="search-hotel">
                                <table class="search-sec">
                                    <tr>
                                        <center>
                                            <form method="post" onsubmit="setSearch()" action="PaymentController?action=searchItem">                              
                                                <select id="search" name="search" >
                                                    <option>All</option>
                                                    <option>COD</option>
                                                    <option>ONLINE PAYMENT</option>
                                                    <option>UNPAID</option>
                                                    <option>PAID</option>
                                                </select>  
                                                <input type="submit" value="Filter">
                                            </form>
                                        </center>
                                    </tr>
                                    <tr>
                                       <center>
                                        <form method="post" action="PaymentController?action=searchID">
                                            <td>
                                                <input type="search" placeholder= "Search by Order id here..." name="searchOrder">
                                            </td>
                                            <td> 
                                                <div class="search-button">
                                                    <span class="icon-input-btn" style="">
                                                        <input type="submit" value="Search">
                                                    </span>
                                                </div>
                                            </td>
                                        </form>
                                        </center>
                                    </tr>
                                </table>
                            </div>
                            <div class="table-responsive">
                                <table class="timetable_pay">
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Payment Amount(RM)</th>
                                        <th>Payment Type</th>
                                        <th>Payment Status</th>
                                        <th colspan="3">Actions</th>
                                    </tr>
                                    <c:choose>
                                        <c:when test="${ empty payments}">
                                            <td colspan="5" style="font-size: 20px; align-content: center;"><c:out value="No result found"/></td>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${payments}" var="payment">
                                                <tr>
                                                    <td><c:out value="${payment.orderID}"/></td>                                  
                                                    <td><c:out value="${payment.payAmount}"/></td>
                                                    <td><c:out value="${payment.payType}"/></td>
                                                    <td><c:out value="${payment.payStatus}"/></td> 
                                                    <td colspan="3">
                                                        <a href="PaymentController?action=viewPayment&id=${payment.payID}" class="btn btn-info">View</a>
                                                        <a href="PaymentController?action=updatePayment&id=${payment.payID}" class="btn btn-warning">Update</a>
                                                        <a href="PaymentController?action=deletePayment&id=${payment.payID}" class="btn btn-danger">Delete</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </table>
                            </div>
                            <script>
                                function setSearch(){
                                    var value = document.getElementById('search').value;
                                    localStorage.setItem("select", value); 
                                }
                                
                                function getSearch(){
                                    if (localStorage.getItem("select") != null) {// Check if there is selected date. 
                                          return localStorage.getItem("select");
                                    }
                                    else {
                                        return "All";
                                    }
                                }
                                
                                document.getElementById('search').value = getSearch();
                                 
                                function resetFilter() {
                                   localStorage.removeItem("select");
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
	<!-- //footer -->
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