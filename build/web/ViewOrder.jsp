
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="ordered.Ordered"%>
<%@page import="ordered.OrderedDaoImpl"%>
<%@page import="ordered.OrderedDao"%>
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
    <% try {
            if(!request.getSession().getAttribute("role").toString().equalsIgnoreCase("admin")){
                response.sendRedirect("denied.jsp");
            }
        } catch (Exception e) {
            request.setAttribute("error", "<script>alert('LogIn First');</script>");
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        OrderedDao odao=new OrderedDaoImpl();
        List<Ordered> list=odao.getOrdered();
        request.setAttribute("ordr", list);
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <h1 style="text-align: center; margin: auto;">Total Orders</h1>
        <table class="table table-striped" style="margin: auto; width: 50%;">
            <thead>
                <tr>
                    <th>Ordered id</th>
                    <th>Product id</th>
                    <th>Transaction id</th>
                    <th>Status</th>
                    <th>Cancel</th>
                    <th>Place</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${ordr}" var="o">
                <tr>
                    <th>${o.getId()}</th>
                    <th>${o.getProduct()}</th>
                    <th>${o.getTransactions()}</th>
                    <th>${o.getStatus()}</th>
                    <th><a href="cancelorder?id=${o.getId()}" class="btn btn-danger">Cancel</a></th>
                    <th><a href="placeorder?id=${o.getId()}" class="btn btn-danger">Place</a></th>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </body>
</html>
