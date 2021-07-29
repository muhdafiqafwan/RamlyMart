<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            input[type=text], input[type=number], input[type=file], select{
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
            select { 
                background: #ffffff ; 
                background-image: none; 
                width: 90%; 
                height: 180%; 
                color: black; 
                cursor: pointer; 
                border-radius:3px; 
            } 
	</style>
    </head>
    <%@page import="ramly.model.Admin"%>
    <% Admin admin = (Admin) session.getAttribute("login");
        if(admin == null){
            response.sendRedirect("LoginAdmin.jsp");
        }
    %>
    <body>
	<!-- header-bot-->
	<%@ include file="AdminNav.jsp" %>
	<!-- //header-bot -->
	<!-- top Products -->
	<div class="ads-grid">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l">Update item
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
                            <form method="post" class="form-group" onsubmit="showAlertSuccessfulUpdate()" action="ItemController?action=updateItem" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-25">
                                        <label for="itemName">Item Name: </label>
                                    </div>
                                    <center>
                                        <div class="col-75">
                                            <input type="text" name="itemName" id="itemName"  value="<c:out value="${item.itemName}"/>"  required>
                                            <input type="hidden" name="itemID" id="itemName" value="<c:out value="${item.itemID}"/>"/><br>
                                        </div>
                                    </center>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-25">
                                        <label for="itemPrice">Item Price: </label>
                                    </div>
                                    <center>
                                        <div class="col-75">
                                        <input type="number" step="any" name="itemPrice" id="itemPrice" min="1" value="<c:out value="${item.itemPrice}"/>" required>
                                        </div>
                                    </center>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-25">
                                    <label for="itemQty">Item Quantity: </label>
                                    </div>
                                    <center>
                                        <div class="col-75">
                                            <input type="number" name="itemQty" id="itemQty" min="0" value="<c:out value="${item.itemQty}"/>" required>
                                        </div>
                                    </center>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-25">
                                        <label for="itemQty">Item Type: </label>
                                    </div>
                                    <center>
                                        <div class="col-75">
                                            <div class="select"> 
                                                <select name="itemType">
                                                    <option value="Burger">Burger</option>
                                                    <option value="Sausage">Sausage</option>
                                                    <option value="Nuggets">Nuggets</option>
                                                    <option value="Others">Others</option>
                                                </select>
                                            </div>
                                        </div>
                                    </center>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-25">
                                        <label for="itemDescription">Item Description: </label>
                                    </div>
                                    <center>
                                        <div class="col-75">
                                            <input type="text" name="itemDescription" id="itemDescription" value="<c:out value="${item.itemDescription}"/>" required="required" />
                                        </div>
                                    </center>
                                </div>
                                <br>						
                                <div class="row" align="center">
                                    <br>
                                    <a href="ItemController?action=catalogue" class="btn btn-warning"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</a>
                                    <input type="reset" class="btn btn-danger" value="Reset"></input>   <input type="submit"  class="btn btn-success" value="Update" ></input>
                                </div>
                            </form>
                            <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                            <script>
                                function showAlertSuccessfulUpdate() {
                                    Swal.fire({
                                        position: 'top-center',
                                        icon: 'success',
                                        title: 'Item update successfully',
                                        showConfirmButton: false,
                                        timer: 4500
                                    })
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