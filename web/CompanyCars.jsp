
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="company.Company"%>
<%@page import="java.util.List"%>
<%@page import="company.CompanyDao"%>
<%@page import="company.CompanyDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company & Cars</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  
<script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <% 
        
    CompanyDao cdao=new CompanyDaoImpl();
    List<Company> list=cdao.getCompany();
    Company c=cdao.getCompany(Integer.parseInt(request.getParameter("id")));
    request.setAttribute("comp", list);
    %>
    <body>
        <c:import url="header.jsp"></c:import>
       
        <h1 style="text-align: center; margin: auto;"><%=c.getC_name()%></h1>
    </body>
</html>
