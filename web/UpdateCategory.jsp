
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="addcategory.AddCategory"%>
<%@page import="addcategory.AddCategoryDao"%>
<%@page import="addcategory.AddCategoryDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Category</title>
        
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
    AddCategoryDao acdao=new AddCategoryDaoImpl();
    AddCategory ac=acdao.getAddCategory(Integer.parseInt(request.getParameter("id")));
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <h1 style="text-align: center; margin: auto;">Add Category</h1>
        <form action="updatecategory?id=<%=ac.getId()%>" method="post" style="text-align: center; width:70%; margin: auto;" enctype="multipart/form-data">
            <input type="text" class="form-control" value="<%=ac.getId()%>" disabled >
            <br>
            <input type="text" class="form-control" name="name" value="<%=ac.getName()%>">
            <br>
            <textarea  name="desc" class="form-control"><%=ac.getDescription()%></textarea>
            <br>
            <input type="file" name="img" onchange="readURL(this);" class="form-control">
            <br>
            <img id="blah" src="<%=ac.getPhoto()%>" alt="Your image will deploy here" style="margin: auto; text-align: center; width: 50%;"/>
            <br>
            <button class="btn btn-success">Update</button>
        </form>
    </body>
</html>
