<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        .some-text img{
            width: 200px;
            margin-top: -10px;
        }
	</style>
    </head>
    <%@page import="ramly.model.Rider"%>
    <% Rider rider = (Rider) session.getAttribute("login");
        if(rider == null){
            response.sendRedirect("LoginRider.jsp");
        }
    %>
    <body>
	<!-- header-bot-->
        <%@ include file="RiderNav.jsp" %>
	<!-- //header-bot -->
	<!-- top Products -->
	<div class="ads-grid">
            <div class="container">
                <!-- form -->
                <div class="agileinfo-ads-display col-md-13 w3l-rightpro">
                    <div class="wrapper">
                        <!-- first section -->
                        <div class="product-sec2">
                            <h3 class="agileinfo_sign">Welcome <%=rider.getRiderName()%></h3>
                            <center>
                                <div class="some-text">
                                    <img src="images/delivery.png">
                                    <p>Lets get some work done!</p>
                                </div>
                            </center>
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