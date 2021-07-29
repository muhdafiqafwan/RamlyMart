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
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<style>
            .product-sec2 {
                box-shadow: 0px 10px 15px 0px #D6D6D6;
                padding: 30px 20px;
                margin-bottom: 14px;
            }
            * {
                box-sizing: border-box;
            }
             .some-text img{
                width: 120px;
                margin-top: -5px;
            }
            select{
                width: 30%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: vertical;
            }
	</style>
    </head>
    <%@page import="ramly.model.Admin"%>
    <% Admin admin = (Admin) session.getAttribute("login");
        if(admin == null){
            response.sendRedirect("LoginAdmin.jsp");
        }
    %>
    <body onload="resetFilter()">
	<!-- header-bot-->
	<%@ include file="AdminNav.jsp" %>	
	<!-- //header-bot -->
	<!-- top Products -->
	<div class="ads-grid">
            <div class="container">
                <h3 class="tittle-w3l">Report
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
                <!-- form -->
                <div class="agileinfo-ads-display col-md-13 w3l-rightpro">
                    <div class="wrapper">
                        <!-- first section -->
                        <div class="product-sec2">                
                            <form name="form1" method="post" id="ff" action="ReportController?action=viewReport" style="margin: 0; padding: 0;">        
                                <center>
                                    <select id="month" name="month" required>
                                        <option value="" disabled selected >Select Month</option>
                                        <option value="01">January</option>
                                        <option value="02">February</option>
                                        <option value="03">March</option>
                                        <option value="04">April</option>
                                        <option value="05">May</option>
                                        <option value="06">June</option>
                                        <option value="07">July</option>
                                        <option value="08">August</option>
                                        <option value="09">September</option>
                                        <option value="10">October</option>
                                        <option value="11">November</option>
                                        <option value="12">December</option>
                                    </select>
                                    <input type="submit" name="search" class="btn btn-primary" value="Select">
                                </center>
                                <br><br>
                            </form>
                            <div id="printableArea">
                                <h2 style="text-align: center;">Month: <c:out value="${requestScope.monthName}" /></h2>
                                <br>
                                <table class="timetable_pay">
                                    <thead>
                                        <tr>
                                            <th>Total Customer</th>
                                            <th>Total Order</th>
                                            <th>Total Sales</th>
                                            <th>Average Total Sales</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><c:if test="${order.totalCust != null}"><c:out value="${order.totalCust}" /></c:if></td>
                                            <td><c:if test="${order.totalOrder != null}"><c:out value="${order.totalOrder}" /></c:if></td>
                                            <td><c:if test="${order.totalSales != null}">RM<c:out value="${order.totalSales}" /></c:if></td>
                                            <td><c:if test="${order.totalAvgSales != null}">RM<c:out value="${order.totalAvgSales}" /></c:if></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>    
                            <br><br>  
                            <c:if test="${order.totalCust == null}">  
                                <center>
                                    <a class="btn btn-default" disabled>Print</a><br><br>
                                </center>
                            </c:if> 
                            <c:if test="${order.totalCust != null}">  
                                <center>
                                    <input type="submit" value="Print" onClick="printDiv('printableArea')" style="width: 10%;">
                                </center>
                            </c:if>                                                                                                                       
                            <script>	
                                function printDiv(divName) {
                                    var printContents = document.getElementById(divName).innerHTML;
                                    var originalContents = document.body.outerHTML;
                                    document.body.innerHTML = printContents;
                                    window.print();
                                    document.body.innerHTML = originalContents;
                                }
                                
                                $(function() {
                                    var selectOptions;
                                    if(localStorage.getItem("selectOptions")) {
                                        selectOptions = JSON.parse(localStorage.getItem("selectOptions"));
                                        Object.keys(selectOptions).forEach(function(select) {
                                          $("select[name="+select+"]").val(selectOptions[select]);
                                        });
                                   } else {
                                      selectOptions = {};
                                   }
                                   $("select").change(function() {
                                        var $this =  $(this),
                                            selectName = $this.attr("name");
                                       selectOptions[selectName] = $this.val();
                                       localStorage.setItem("selectOptions", JSON.stringify(selectOptions));
                                     });

                                 });
                                 
                                 function resetFilter() {
                                    localStorage.removeItem("selectOptions");
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