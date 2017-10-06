
<%@page import="ordered.Ordered"%>
<%@page import="ordered.OrderedDaoImpl"%>
<%@page import="ordered.OrderedDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="buy.Buy"%>
<%@page import="buy.BuyDaoImpl"%>
<%@page import="buy.BuyDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    

<!-- Latest compiled JavaScript -->
    <script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <%
        OrderedDao odao=new OrderedDaoImpl();
        Ordered o=odao.getOrderedP(Integer.parseInt(request.getParameter("id")));
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <h1 style="text-align: center; margin: auto; color: gainsboro;">Order Success</h1>
        <table class="table table-striped" style="margin: auto; width:50%;">
            <thead>
                <tr>
                    <th>Ordered id</th>
                    <th>Transaction Id</th>
                    <th>Product Id</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th><%=o.getId()%></th>
                    <th><%=o.getTransactions()%></th>
                    <th><%=o.getProduct()%></th>
                    <th><%=o.getStatus()%></th>
                </tr>
            </tbody>
        </table>
    </body>
</html>
