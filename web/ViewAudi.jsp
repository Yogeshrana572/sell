 
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
    

    </head>
        <%
            
    SupplierDao sdao=new SupplierDaoImpl();
    
request.setAttribute("sup", sdao);
            CarsDao crdao=new CarsDaoImpl();
           
            List<Cars> list=crdao.getCarC(Integer.parseInt(request.getParameter("id")));
            request.setAttribute("car", list);
        %>
    <body>
        <c:import url="header.jsp"></c:import>
<table class="table table-striped" style="margin: auto; width: 90%;">
            <thead>
            <th>Car Company</th>
            <th>Car Name</th>
            <th>Car Model</th>
            <th>Car Color</th>
            <th>Car Speed</th>
            <th>Car Seat</th>
            <th>Fuel Type</th>
            <th>Fuel Capacity</th>
            <th>Transmission</th>
            <th>Price</th>
            <th>Gears</th>
            <th>Car Image</th>
             </thead>
            <tbody>
                  <tr>
                  <c:forEach items="${car}" var="cr">
                        <th>${cr.getCr_comp()}</th>
                        <th>${cr.getCr_name()}</th>
                        <th>${cr.getCr_model()}</th>
                        <th>${cr.getCr_color()}</th>
                        <th>${cr.getCr_speed()}</th>
                        <th>${cr.getCr_seat()}</th>
                        <th>${cr.getCr_fuel()}</th>
                        <th>${cr.getCr_fuelcap()}</th>
                        <th>${cr.getCr_transmission()}</th>
                        <th>${cr.getCr_price()}</th>
                        <th>${cr.getCr_gears()}</th>
                        <th><img src="${cr.getCr_img()}" width="auto;" height="200px"></th>
                    </tr>
            </c:forEach>
            </tbody>
        </table>


    </body>
</html>
