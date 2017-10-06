
<%@page import="company.Company"%>
<%@page import="company.CompanyDaoImpl"%>
<%@page import="company.CompanyDao"%>
<%@page import="java.util.List"%>
<%@page import="addcategory.AddCategoryDaoImpl"%>
<%@page import="addcategory.AddCategoryDao"%>
<%@page import="addcategory.AddCategory"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Supplier</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <% 
    AddCategory ac=new AddCategory();
    AddCategoryDao acdao=new AddCategoryDaoImpl();
    
    List<AddCategory> list=acdao.getAddCategory();
    request.setAttribute("categori", list);
    
    
        CompanyDao cdao=new CompanyDaoImpl();
        List<Company> lis=cdao.getCompany();
        request.setAttribute("compn", lis);
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        
        <h1 style="text-align: center; margin: auto;"> Add Supplier</h1><br>
        <form action="suppliersignup" method="post" style="text-align: center; margin:auto;width: 80%;">
            <input type="text" name="sname" placeholder="Supplier Name" class="form-control">
            <br>
            <input type="email" name="sname" placeholder="Email Address" class="form-control">
            <br>
            <input type="password" name="sname" id="pwd" placeholder="Password" class="form-control">
            
            <br>
            <select name="sname" class="form-control">
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>
            <br>
        
            <select name="sname" class="form-control" >
                <option value="company">--Company Name--</option>
            <c:forEach items="${compn}" var="x">                
                    <option value="${x.getC_name()}"> ${x.getC_name()}</option>    
                </c:forEach>
            </select>
        
            <br>
            <textarea name="sname" class="form-control" placeholder="Company Description"></textarea>
            <br>
            <input type="number" name="sname" placeholder="contact" class="form-control" onkeypress="if(this.value.length===12) {return false;}">
            <br>
            <button class="btn btn-primary">Add Supplier</button>
        </form>
    </body>
</html>
