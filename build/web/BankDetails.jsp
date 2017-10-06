
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="buy.Buy"%>
<%@page import="java.util.List"%>
<%@page import="buy.BuyDaoImpl"%>
<%@page import="buy.BuyDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                                     
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <%
    BuyDao bdao=new BuyDaoImpl();
    List<Buy> list=bdao.getBuy();
    request.setAttribute("buys", list);
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <h1 style="margin:auto; text-align: center;">Bank Details</h1>
        <table class="table table-striped" style="margin: auto; width: 70%;">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Bank Name</th>
                    <th>Card Number</th>
                    <th>Expire Date</th>
                    <th>Card Holder Name</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${buys}" var="b">
                <tr>
                    <th>${b.getId()}</th>
                    <th>${b.getBank()}</th>
                    <th>${b.getCard()}</th>
                    <th>${b.getExpire_date()}</th>
                    <th>${b.getHolder()}</th>
                    <th><a href="deletebuys?id=${b.getId()}" class="btn btn-danger">Delete</a></th>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
