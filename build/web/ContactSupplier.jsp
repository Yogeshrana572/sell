<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="supplier.Supplier"%>
<%@page import="java.util.List"%>
<%@page import="supplier.SupplierDaoImpl"%>
<%@page import="supplier.SupplierDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Supplier</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <% 
    SupplierDao sdao=new SupplierDaoImpl();
    List<Supplier> list=sdao.getSupplier();
    request.setAttribute("product", list);
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <h1 style="margin: auto; text-align: center; width: 80%;">Contact Supplier</h1><br>
        <table class="table table-striped" style="margin: auto; width: 80%;">
            <thead>
                <tr>
                    <th>Supplier ID</th>
                    <th>Supplier Name</th>
                    <th>Company Name</th>
                    <th>Number</th>
                    <th>Email</th>
                    <th>Contact</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${product}" var="x">
                    <tr>
                        <td>${x.getId()}</td>
                        <td>${x.getSupplier_name()}</td>
                        <td>${x.getCompany_name()}</td>
                        <td>${x.getContact()}</td>
                        <td>${x.getEmail()}</td>
                        <td><button class="btn btn-success" disabled>Contact</button></td>
                    </tr>
            </c:forEach>
            </tbody>
        </table>
    </body>
</html>
