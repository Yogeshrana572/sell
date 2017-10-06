
<%@page import="cars.Cars"%>
<%@page import="cars.CarsDaoImpl"%>
<%@page import="cars.CarsDao"%>
<%@page import="company.Company"%>
<%@page import="company.CompanyDaoImpl"%>
<%@page import="company.CompanyDao"%>
<%@page import="addcategory.AddCategory"%>
<%@page import="java.util.List"%>
<%@page import="addcategory.AddCategoryDao"%>
<%@page import="addcategory.AddCategoryDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chris Denton</title>
             
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-amber.css">
          
    </head>
    <%
            AddCategoryDao acdao=new AddCategoryDaoImpl();
    
        List<AddCategory> list=acdao.getAddCategory();
        request.setAttribute("categori", list);
//        Company c=new Company();
        CompanyDao cdao=new CompanyDaoImpl();
        List<Company> lis=cdao.getCompany();
        request.setAttribute("compn", lis);
        
        CarsDao crdao=new CarsDaoImpl();
        List<Cars> li=crdao.getCars();
        request.setAttribute("car", li);
    %>
    <body>
   <c:import url="header.jsp"></c:import>

   <div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <% 
        for(int i=1;i<=list.size();i++)
        out.println("<li data-target='#myCarousel' data-slide-to="+i+"></li>");
    %>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="https://res.cloudinary.com/yogesh/image/upload/v1506007413/lvzz0rahzdvfvrekukvd.jpg" alt="BMW" style="width:100%; height: 645px;">
        <div class="carousel-caption">
        <h3>SELL AND BUY CARS </h3>
        <p>Good and best ever</p>
      </div>
      </div>

        <c:forEach items="${categori}" var="ca">
            <div class="item">
                <img src="${ca.getPhoto()}" width="100%" style="height: 640px; margin: auto;">
                <div class="carousel-caption">
                    <h3>${ca.getName()} </h3>
                    <p>${ca.getDescription()}</p>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
    <br>
        <h1 style="text-align: center; background-color: white;"><span class="bdots">&bullet;</span>  C   O   M   P   A   N   I   E   S  &bullet;</h1>
    
    <div class="w3-row-padding w3-theme">
        <c:forEach items="${compn}" var="c">
<div class="w3-third w3-section">
<div class="w3-card-4">
    <a href="CategoryCars.jsp?cr_comp=${c.getC_name()}" style="text-decoration: none;">
<img src="${c.getC_img()}" style="width:100%; height:200px;">
<div class="w3-container w3-white">
<h4>${c.getC_name()}</h4>
<p>${c.getC_desc()}</p>
</div>
    </a>
</div>
</div>
        </c:forEach>
    </div>
    <br>
    <footer style=" text-align: center; background-color: black; color: white;">
        <p style="color: white;">Follow us:-</p><i class="fa fa-facebook" style="font-size: 24px; color: white;"></i> 
        <i class="fa fa-instagram" style="font-size: 24px; color: white;"></i>       
        <i class="fa fa-twitter" style="font-size: 24px; color: white;"></i>       
        <i class="fa fa-google" style="font-size: 24px; color: white;"></i>   
        <br>
    </footer>
    ${error}
    </body>
</html>
