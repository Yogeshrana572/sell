
<%@page import="addcategory.AddCategory"%>
<%@page import="addcategory.AddCategoryDaoImpl"%>
<%@page import="addcategory.AddCategoryDao"%>
<%@page import="cars.Cars"%>
<%@page import="cars.CarsDaoImpl"%>
<%@page import="cars.CarsDao"%>
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
        <title>Update Cars</title>
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
    CarsDao crdao=new CarsDaoImpl();
    Cars cr=crdao.getCars(Integer.parseInt(request.getParameter("id")));
    
        CompanyDao cdao=new CompanyDaoImpl();
        List<Company> lis=cdao.getCompany();
        request.setAttribute("compn", lis);
        
AddCategoryDao adao=new AddCategoryDaoImpl();
        List<AddCategory> list=adao.getAddCategory();
        
request.setAttribute("cat", list);
    

    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <h1 style="text-align: center; margin: auto;">Add New Cars</h1>
        <form action="updatenewcars?id=<%=cr.getId()%>" method="post" style="margin: auto; text-align: center; width: 40%;" enctype="multipart/form-data">
 
            <h3 style="text-align: left; margin: auto;">Company Name: </h3>
            
            <select class="form-control" name="comp" required>
                <option selected><%=cr.getCr_comp()%></option>
                <c:forEach items="${compn}" var="c">
                <option>${c.getC_name()}</option>
                </c:forEach>
            </select>
            <br>
            <h3 style="text-align: left; margin: auto;">Car Name: </h3>
            
            <input type="text" name="carn" value="<%=cr.getCr_name()%>" pattern="[A-Za-z0-9_-\s]+" onkeypress="if(this.value.length === 20) {return false;}" class="form-control" required>
            <br>
            <h3 style="text-align: left; margin: auto;">Model: </h3>
            
            <input type="text" name="model" value="<%=cr.getCr_model()%>" pattern="[A-Za-z0-9]+" onkeypress="if(this.value.length === 20) {return false;}"  class="form-control" required>
            <br>
            <h3 style="text-align: left; margin: auto;">Color: </h3>
            
            <input type="text" name="color" value="<%=cr.getCr_color()%>" class="form-control" required>
            <br>
            <h3 style="text-align: left; margin: auto;">Speed: </h3>
            
            <input type="text" name="speed" value="<%=cr.getCr_speed()%>" pattern="[0-9]*" onkeypress="if(this.value.length === 4) {return false;}" class="form-control" required>
            <br>
            <h3 style="text-align: left; margin: auto;">Seat: </h3>
                 <select name="seat" required class="form-control">
                     <option selected><%=cr.getCr_seat()%></option>
                     <option>2</option>
                     <option>5</option>
                     <option>7</option>
             </select>            
            <br>
            <h3 style="text-align: left; margin: auto;">Fuel: </h3>
            
                    <select name="fuel" required class="form-control">
                     <option selected><%=cr.getCr_fuel()%></option>
                     <option>Petrol</option>
                     <option>Diesel</option>
                     <option>Petrol/CNG</option>
                    </select>
                    
            <br>
            <h3 style="text-align: left; margin: auto;">Fuel Capacity:</h3>
            
            <input type="text" name="fuelcap" value="<%=cr.getCr_fuelcap()%>" onkeypress="if(this.value.length === 3) {return false;}" pattern="[0-9.]*" class="form-control" required>
            <br>
            <h3 style="text-align: left; margin: auto;">Transmission: </h3>
            
             <select name="trans" required class="form-control">
                     <option selected><%=cr.getCr_transmission()%></option>
                     <option>Automatic</option>
                     <option>Manual</option>
             </select>
            <br>
            <h3 style="text-align: left; margin: auto;">Price:</h3>
            
            <input type="text" name="price" value="<%=cr.getCr_price()%>" pattern="[0-9]*" onkeypress="if(this.value.length === 9) {return false;}"  class="form-control" required>
            <br>
            <h3 style="text-align: left; margin: auto;">Features:</h3>
            
            <input type="text" name="feature" value="<%=cr.getCr_features()%>" pattern="[A-Za-z]+" onkeypress="if(this.value.length === 20) {return false;}" class="form-control" required>
            
            <br>
            <input type="file" name="img" onchange="readURL(this);" class="form-control">
            <br>
            <img id="blah" src="<%=cr.getCr_img()%>" alt="Your image will deploy here" name="data" style="margin: auto; text-align: center; width: 30%;"/>
            <br>
            <button class="btn btn-primary">update Cars</button>
        </form>
    </body>
</html>
