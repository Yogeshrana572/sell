
<%@page import="addcategory.AddCategory"%>
<%@page import="addcategory.AddCategoryDao"%>
<%@page import="addcategory.AddCategoryDaoImpl"%>
<%@page import="supplier.SupplierDaoImpl"%>
<%@page import="supplier.SupplierDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="cars.Cars"%>
<%@page import="java.util.List"%>
<%@page import="cars.CarsDaoImpl"%>
<%@page import="cars.CarsDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cars</title>
                             
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <%
    CarsDao crdao=new CarsDaoImpl();
    List<Cars> list=crdao.getCars();
    request.setAttribute("car", list);
    
    SupplierDao sdao=new SupplierDaoImpl();
    
request.setAttribute("sup", sdao);
    AddCategory ac=new AddCategory();
    AddCategoryDao acdao=new AddCategoryDaoImpl();
    request.setAttribute("cat", acdao);
    %>
        
    <body>
        <c:import url="header.jsp"></c:import>
        <h1 style="text-align: center; margin: auto;">Cars</h1>
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
            <th>Features</th>
           
            <th>Car Image</th>
            <%
                    try {
                         if(!request.getSession().getAttribute("role").toString().equalsIgnoreCase("buyer"))
                         {
                    %>
            <th>Delete</th>
            <th>Update</th>
                                <%   }
                        } catch (Exception e) {
                            request.setAttribute("error", "<script>alert('LogIn First');</script>");
                            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                            rd.forward(request, response);
                        }
                    %>

            </thead>
            <tbody>
                <c:forEach items="${car}" var="cr">
                    <tr>
                        <td>${cr.getCr_comp()}</td>
                        <td>${cr.getCr_name()}</td>
                        <td>${cr.getCr_model()}</td>
                        <td>${cr.getCr_color()}</td>
                        <td>${cr.getCr_speed()}</td>
                        <td>${cr.getCr_seat()}</td>
                        <td>${cr.getCr_fuel()}</td>
                        <td>${cr.getCr_fuelcap()}</td>
                        <td>${cr.getCr_transmission()}</td>
                        <td>${cr.getCr_price()}</td>
                        <td>${cr.getCr_features()}</td>
           
                        <td><img src="${cr.getCr_img()}" width="100" height="100"</td>
                        <%
                    try {
                         if(!request.getSession().getAttribute("role").toString().equalsIgnoreCase("buyer"))
                         {
                    %>
                        <td style="margin: auto;"><a href="deletecar?id=${cr.getId()}" class="btn btn-danger">Delete</a></td>
                        <td style="margin: auto;"><a href="UpdateCar.jsp?id=${cr.getId()}" class="btn btn-success">Update</a></td>
                                          <%   }
                        } catch (Exception e) {
                            request.setAttribute("error", "<script>alert('LogIn First');</script>");
                            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                            rd.forward(request, response);
                        }
                    %>
  
                    </tr>
            </c:forEach>
            </tbody>
        </table>
    </body>
</html>
