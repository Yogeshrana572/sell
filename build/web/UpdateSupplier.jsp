
<%@page import="java.util.List"%>
<%@page import="company.Company"%>
<%@page import="company.CompanyDaoImpl"%>
<%@page import="company.CompanyDao"%>
<%@page import="supplier.Supplier"%>
<%@page import="supplier.SupplierDaoImpl"%>
<%@page import="supplier.SupplierDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Supplier</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <% 
    SupplierDao sdao=new SupplierDaoImpl();
    Supplier s=sdao.getSupplier(Integer.parseInt(request.getParameter("id")));
    
    
        CompanyDao cdao=new CompanyDaoImpl();
        List<Company> lis=cdao.getCompany();
        request.setAttribute("compn", lis);
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        
        <form action="supplierupdate?id=<%=s.getId()%>" method="post" style="text-align: center; margin:auto;width: 80%;">
            <input type="text" value="<%=s.getId()%>" class="form-control" disabled>
            <br>
            <input type="text" name="sname"  value="<%=s.getSupplier_name()%>" class="form-control">
            <br>
            <input type="email" name="sname" class="form-control" value="<%=s.getEmail()%>">
            <br>
            <input type="password" name="sname" class="form-control" value="<%=s.getPassword()%>">
            <br>
            <select name="sname" class="form-control">
                <option value="<%=s.getGender()%>"><%=s.getGender()%></option>
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>
            <br>
            <select name="sname" class="form-control">
                <option value="<%=s.getCompany_name()%>"><%=s.getCompany_name()%></option>
                <c:forEach items="${compn}" var="c">
                    <option value="${c.getC_name()}">${c.getC_name()}</option>
                </c:forEach>
            </select>
            <br>
            <textarea name="sname" class="form-control"><%=s.getCompany_description()%></textarea>
            <br>
            <input type="number" name="sname" class="form-control" value="<%=s.getContact()%>" onkeypress="if(this.value.length===12) {return false;}">
            <br>
            <button class="btn btn-primary">Update Supplier</button>
        </form>
    </body>
</html>
