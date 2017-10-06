
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="supplier.SupplierDao"%>
<%@page import="supplier.SupplierDaoImpl"%>
<%@page import="supplier.Supplier"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Supplier</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <% 
        try {
                if(!request.getSession().getAttribute("role").toString().equalsIgnoreCase("admin")){
                    response.sendRedirect("denied.jsp");
                }
            } catch (Exception e) {
                request.setAttribute("error", "<script>alert('LogIn First');</script>");
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        
    SupplierDao sdao=new SupplierDaoImpl();
    List<Supplier> list=sdao.getSupplier();
    request.setAttribute("product", list);
    
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <h1 style="text-align: center; margin: auto;">View Supplier</h1>
        
        <table class="table table-striped" style=" margin: auto; width:90%;">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Supplier_id</th>
                    <th>Company_name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${product}" var="x">
                <tr>
                    <td>${x.getId()}</td>
                    <td>${x.getSupplier_id()}</td>
                    <td>${x.getCompany_name()}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
