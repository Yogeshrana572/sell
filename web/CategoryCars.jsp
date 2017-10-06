 
<%@page import="supplier.SupplierDaoImpl"%>
<%@page import="supplier.SupplierDao"%>
<%@page import="cars.Cars"%>
<%@page import="cars.CarsDao"%>
<%@page import="cars.CarsDaoImpl"%>
<%@page import="addcategory.AddCategory"%>
<%@page import="java.util.List"%>
<%@page import="addcategory.AddCategoryDaoImpl"%>
<%@page import="addcategory.AddCategoryDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  
<script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
    </head>
        <%
            
    SupplierDao sdao=new SupplierDaoImpl();
    
request.setAttribute("sup", sdao);
            CarsDao crdao=new CarsDaoImpl();
//            Cars cr=crdao.getCars();
            List<Cars> list=crdao.getCarC((request.getParameter("cr_comp")));
            request.setAttribute("car", list);
        %>
    <body>
        <c:import url="header.jsp"></c:import>
        
        <div class="row">
<div class="w3-row-padding w3-margin-top">
        <c:forEach items="${car}" var="cr">
            <h1 style="text-align: center;"><span>&bullet;</span> ${cr.getCr_comp()} Cars &bullet;</h1>
            <br>
  <div class="w3-third">
      <a href="Buy.jsp?id=${cr.getId()}" style="text-decoration: none;">
    <div class="w3-card-2">
      <img src="${cr.getCr_img()}" style="width:100%">
      <div class="w3-container">
        <h4>${cr.getCr_name()}</h4>
      </div>
    </div>
      </a>
  </div>

</c:forEach>
    </div>
</div>
    </body>
</html>
