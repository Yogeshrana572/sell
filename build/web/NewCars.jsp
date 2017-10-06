
<%@page import="addcategory.AddCategory"%>
<%@page import="addcategory.AddCategoryDaoImpl"%>
<%@page import="addcategory.AddCategoryDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="company.Company"%>
<%@page import="java.util.List"%>
<%@page import="company.CompanyDaoImpl"%>
<%@page import="company.CompanyDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Cars</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    

<!-- Latest compiled JavaScript -->
    <script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

           
<script>
            function readURL(input) {
                var path;
                var reader = new FileReader();
    		reader.onload = function (e) {
                    path=e.target.result;
                    $('#blah').attr('src', path);
		};
                reader.readAsDataURL(input.files[0]);
            }   
            </script>
            
    </head>
    <% 
        try {
                if(request.getSession().getAttribute("role").toString().equalsIgnoreCase("buyer")){
                    response.sendRedirect("denied.jsp");
                }
            } catch (Exception e) {
                request.setAttribute("error", "<script>alert('LogIn First');</script>");
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
    CompanyDao cdao=new CompanyDaoImpl();
        List<Company> lis=cdao.getCompany();
        request.setAttribute("compn", lis);
        AddCategoryDao adao=new AddCategoryDaoImpl();
        List<AddCategory> list=adao.getAddCategory();
        
request.setAttribute("cat", list);
    
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <h1 style="text-align: center; margin: auto;"><span class="bdots">&bullet;</span> ADD NEW CARS &bullet; </h1>
        <form action="addnewcars" method="post" style="margin: auto; text-align: center; width: 40%;" enctype="multipart/form-data">
            <h3 style="text-align: left; margin: auto;">Category: </h3>
            <select class="form-control" name="cate" required>
                <option value="">--Category--</option>
                <c:forEach items="${cat}" var="cat">
                    <option>${cat.getName()}</option>
                </c:forEach>
            </select>
            
            <br>
            
            <h3 style="text-align: left; margin: auto;">Company Name: </h3>
            
            <select class="form-control" name="comp" required>
                <option value="">--Company Name--</option>
                <c:forEach items="${compn}" var="c">
                <option>${c.getC_name()}</option>
                </c:forEach>
            </select>
            <br>
            <div class="form-group row">
                <div class="col-xs-6">
                    <h3 style="text-align: left; margin: auto;">Car Name: </h3>
            
                    <input type="text" name="carn" placeholder="Car Name" pattern="[A-Za-z0-9_-\s]+" onkeypress="if(this.value.length===16) {return false;}" class="form-control" required>
                </div>
                <div class="col-xs-6">
                    <h3 style="text-align: left; margin: auto;">Model: </h3>
            
            <input type="text" name="model" placeholder="Model" pattern="[A-Za-z0-9\s]+" title="Enter Valid Model Name eg: Lxi 01" onkeypress="if(this.value.length === 20) {return false;}" class="form-control" required>
                </div>
            </div>
           
            <div class="form-group row">
                <div class="col-xs-6">
                    <h3 style="text-align: left; margin: auto;">Color: </h3>
            
                    <input type="text" name="color" placeholder="Color" pattern="[A-Za-z\s]+" title="Valid Color Name , eg: Red" onkeypress="if(this.value.length === 20) {return false;}" class="form-control" required>
                </div>
                <div class="col-xs-6">
                    <h3 style="text-align: left; margin: auto;">Speed: </h3>
            
                    <input type="text" name="speed" placeholder="Speed" class="form-control" pattern="[0-9]*" onkeypress="if(this.value.length === 3) {return false;}" required>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-xs-6">
             <h3 style="text-align: left; margin: auto;">Seat: </h3>
            
                 <select name="seat" required class="form-control">
                     <option value="">--Choose Seat--</option>
                     <option>2</option>
                     <option>5</option>
                     <option>7</option>
             </select>
                </div>
                <div class="col-xs-6">
                    <h3 style="text-align: left; margin: auto;">Fuel: </h3>
            
                    <select name="fuel" required class="form-control">
                     <option value="">--Choose Fuel Type--</option>
                     <option>Petrol</option>
                     <option>Diesel</option>
                     <option>Petrol/CNG</option>
                    </select>
                    
                </div>
            </div>
            
            <div class="form-group row">
                <div class="col-xs-6">
             
            <h3 style="text-align: left; margin: auto;">Fuel Capacity:</h3>
            
            <input type="text" name="fuelcap" placeholder="FuelCap" class="form-control" onkeypress="if(this.value.length === 2) {return false;}" pattern="[0-9]*" required>
                </div>
                <div class="col-xs-6">
                    <h3 style="text-align: left; margin: auto;">Transmission: </h3>
            
            <select name="trans" required class="form-control">
                     <option value="">--Choose Transmission--</option>
                     <option>Automatic</option>
                     <option>Manual</option>
             </select>
                </div>
            </div>
            
            <div class="form-group row">
                <div class="col-xs-6">
             <h3 style="text-align: left; margin: auto;">Price:</h3>
            
             <input type="text" name="price" placeholder="Price" pattern="[0-9]*" onkeypress="if(this.value.length === 9) {return false;}"  class="form-control" required>
                </div>
                <div class="col-xs-6">
                <h3 style="text-align: left; margin: auto;">Features:</h3>
            
                <input type="text" name="feature" placeholder="Features" pattern="[A-Za-z\s]+" onkeypress="if(this.value.length===16) {return false;}" class="form-control" required>
                </div>
            </div>
            
                <h3 style="text-align: left; margin: auto;">Upload Car Image:</h3>
            <input type="file" name="img" onchange="readURL(this);" class="form-control" required>
                

            <img id="blah" src="#" alt="Your image will deploy here" name="data" style="margin: auto; text-align: center; width: 30%;"/>
            <br>
            <button class="btn btn-primary">Add Cars</button>
        </form>
    </body>
</html>
